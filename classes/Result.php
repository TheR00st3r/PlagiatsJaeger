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
					rt.rtID, rt.rtSourceText, rt.rtSourceLink, rt.rtSourcedID, rt.rtStartWord, rt.rtEndWord, rt.rtSimilarity, rt.rID
				FROM
					result AS rt
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
					COUNT(rt.rtSourceLink) as count, rt.rtSourceLink
				FROM
					result AS rt
				WHERE
					rt.rID = '$rID'
				GROUP BY
					rt.rtSourceLink
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
	public static function getGraficReportResult($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					rtStartWord, rtEndWord, rtSourceText, max(rtSimilarity) as rtSimilarity, rtSourceLink, rtSourcedID
				FROM
					result
				WHERE
					rID = '$rID'
				GROUP BY
					rtStartWord
				ORDER BY
					rtStartWord ASC");

			$results = $db -> linesAsArray();
			$db -> disconnect();
			return $results;
		}
	}

}
?>