<?php
class Report {

	/**
	 * Saves a new report and starts the backend functionality.
	 * @param int $dID
	 * @param int $rTreshold
	 * @param int $rLevel
	 * @return boolean
	 */
	public static function createReport($dID, $rTreshold = 0, $rLevel = 0) {
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$db = new db();
			if($db -> insert('report', array('dID' => $dID, 'rTreshold' => $rTreshold, 'rLevel' => $rLevel))) {
				$lastReportID = $db -> lastInsertId();
				$result = file("http://192.168.4.28:8080/PlagiatsSoftware/TestServlet?rID=".$lastReportID);
				print_array($result);
				if($result) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Returns all reports from given document id.
	 * @param int $dID
	 * @return array
	 */
	public static function getReportsFromDocumentID($dID) {
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					r.rID, r.rDate, r.rTreshold, r.rLevel, r.dID
				FROM
					report AS r
				WHERE
					r.dID = '$dID'
				ORDER BY
					r.rDate DESC");

			return $db -> linesAsArray();
		}
	}
}
?>