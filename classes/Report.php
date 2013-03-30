<?php
class Report {

	public static function createReport($dID, $rTreshold = 0, $rLevel = 0) {
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$db = new db();
			return $db -> insert('report', array('dID' => $dID, 'rTreshold' => $rTreshold, 'rLevel' => $rLevel));
		}

	}

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
	
	public static function getReportFromID($rID) {
		if (Validator::validate(VAL_INTEGER, $rID, true)) {

		}
	}

}
?>