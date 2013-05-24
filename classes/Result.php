<?php
class Result {

	/**
	 * Returns all results from the given report id.
	 * @param int $rID
	 * @return array
	 */
	public static function getAllReportResult($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					rt.rtID, rt.rtSourceText, rt.rtSourceLink, rt.rtSourcedID, rt.rtStartWord, rt.rtEndWord, rt.rtSimilarity, rt.rID,
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
					rt.rID = '$rID'
				ORDER BY
					rt.rtStartWord ASC, rt.rtEndWord ASC");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

	/**
	 * Returns s short results summary from the given report id.
	 * @param int $rID
	 * @return array
	 */
	public static function getShortReportResult($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					COUNT(*) as count, rt.rtSourceLink, rt.rtSourcedID, AVG(rt.rtSimilarity) as rtSimilarity,
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
					rt.rID = '$rID'
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
	 * Returns s short results summary from the given report id.
	 * @param int $rID
	 * @return array
	 */
	public static function getGraficReportResult($rID, $rThreshold, $rtSourceLink = '', $rtSourcedID = '') {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {

			if ($rtSourceLink != '') {
				$rtSourceLink = urldecode($rtSourceLink);
				$where = "AND rt.rtSourceLink =  '$rtSourceLink'";
			} else if ($rtSourcedID != '')
				$where = "AND rt.rtSourcedID =  '$rtSourcedID'";
			else
				$where = "";

			$db = new db();
			$db -> read("
				SELECT
					rt.rtStartWord, rt.rtEndWord, rt.rtSourceText, max(rt.rtSimilarity) as rtSimilarity, rt.rtSourceLink, rt.rtSourcedID,
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
				GROUP BY
					rt.rtStartWord
				ORDER BY
					rt.rtStartWord ASC , rt.rtEndWord ASC ");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

}
?>