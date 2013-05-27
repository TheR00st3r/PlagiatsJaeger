<?php
class Result {

	/**
	 * Returns all results from the given report id.
	 * @param int $rID
	 * @return array all results
	 */
	public static function getAllReportResult($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					rt.rtID, rt.rtSourceText, rt.rtSourceLink, rt.rtSourcedID, rt.rtStartWord, rt.rtEndWord,
					rt.rtSimilarity, rt.rID, rt.rtIsInSources,
					d.dOriginalName, d.dAuthor,
					f.fName,
					u.uName, u.uLastname
				FROM
					result AS rt LEFT JOIN
					document AS d ON rt.rtSourcedID = d.dID LEFT JOIN
					folderpermission AS fp ON fp.fID = d.fID LEFT JOIN
					folder AS f ON fp.fID = f.fID LEFT JOIN
					user AS u ON fp.uID = u.uID
				WHERE
					rt.rID = '$rID' AND rt.rtSourceText !=  ''
				ORDER BY
					rt.rtStartWord ASC, rt.rtEndWord ASC");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

	/**
	 * Returns a short results summary array from the given report id.
	 * @param int $rID
	 * @return array short results
	 */
	public static function getShortReportResult($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					COUNT(rt.rID) as count, rt.rtSourceLink, rt.rtSourcedID, MAX(rt.rtSimilarity) as rtSimilarity, rt.rtIsInSources,
					d.dOriginalName, d.dAuthor,
					f.fName,
					u.uName, u.uLastname
				FROM
					result AS rt LEFT JOIN
					document AS d ON rt.rtSourcedID = d.dID LEFT JOIN
					folderpermission AS fp ON fp.fID = d.fID AND fp.fpPermissionLevel = 900 LEFT JOIN
					folder AS f ON fp.fID = f.fID LEFT JOIN
					user AS u ON fp.uID = u.uID
				WHERE
					rt.rID = '$rID' AND rt.rtSourceText !=  ''
				GROUP BY
					rt.rtSourceLink, rt.rtSourcedID
				ORDER BY
					count DESC");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

	/**
	 * Returns a result array for the graphic report from the given report id.
	 * @param int $rID
	 * @param int $rThreshold
	 * @param int $rtSourceLink
	 * @param int $rtSourcedID
	 * @return array graphic results
	 */
	public static function getGraficReportResult($rID, $rThreshold, $rtSourceLink = '', $rtSourcedID = '') {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {

			if ($rtSourceLink != '') {
				print_array($rtSourceLink);
				$rtSourceLink = urldecode($rtSourceLink);
				$where = "AND rt.rtSourceLink =  '$rtSourceLink'";
			} else if ($rtSourcedID != '')
				$where = "AND rt.rtSourcedID =  '$rtSourcedID'";
			else
				$where = "";

			$db = new db();
			
			// $db -> read("
				// SELECT
					// rt.rtStartWord, rt.rtEndWord, rt.rtSourceText, max(rt.rtSimilarity) as rtSimilarity,
					// rt.rtSourceLink, rt.rtSourcedID, rt.rtIsInSources,
					// d.dOriginalName, d.dAuthor,
					// f.fName,
					// u.uName, u.uLastname
				// FROM
					// result AS rt LEFT JOIN
					// document AS d ON rt.rtSourcedID = d.dID LEFT JOIN
					// folderpermission AS fp ON fp.fID = d.fID LEFT JOIN
					// folder AS f ON fp.fID = f.fID LEFT JOIN
					// user AS u ON fp.uID = u.uID
				// WHERE
					// rt.rID = '$rID' AND rt.rtSourceText !=  '' AND rt.rtSimilarity > '$rThreshold' $where
				// GROUP BY
					// rt.rtStartWord
				// ORDER BY
					// rt.rtStartWord ASC , rt.rtEndWord ASC ");
			
			$db -> read("
				SELECT
					rt.rtStartWord, rt.rtEndWord, rt.rtSourceText, rtSimilarity,
					rt.rtSourceLink, rt.rtSourcedID, rt.rtIsInSources,
					d.dOriginalName, d.dAuthor,
					f.fName,
					u.uName, u.uLastname
				FROM
					result AS rt LEFT JOIN
					document AS d ON rt.rtSourcedID = d.dID LEFT JOIN
					folderpermission AS fp ON fp.fID = d.fID LEFT JOIN
					folder AS f ON fp.fID = f.fID LEFT JOIN
					user AS u ON fp.uID = u.uID
				WHERE
					rt.rID = '$rID' AND rt.rtSourceText !=  '' AND rt.rtSimilarity > '$rThreshold' $where
				ORDER BY
					rt.rtStartWord ASC , rt.rtEndWord ASC ");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

}
?>