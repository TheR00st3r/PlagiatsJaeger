<?php
class Result {

	/**
	 * Returns all results from the given report id.
	 * @param int $rID
	 * @return array
	 */
	public static function getResultsFromReportID($rID) {
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
					rt.rtStartWord ASC");

			return $db -> linesAsArray();
		}
	}
}
?>