<?php
class Report {

	/**
	 * Saves a new report and starts the backend functionality.
	 * @param int $dID
	 * @param int $rLevel
	 * @return boolean
	 */
	public static function createReport($dID, $slID, $rThreshold, $rCheckWWW, $rCheckIDs = array()) {
		global $backendUrl;
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true) and Validator::validate(VAL_INTEGER, $slID, true) and Validator::validate(VAL_INTEGER, $rThreshold, true) and Validator::validate(VAL_INTEGER, $rCheckWWW)) {
			$db = new db();
			if ($db -> insert('report', array(
				'rDatetime' => date('Y-m-d H:i:s'),
				'rErrorCode' => 100,
				'dID' => $dID,
				'slID' => $slID,
				'rThreshold' => $rThreshold,
				'rCheckWWW' => $rCheckWWW,
				'rCheckIDs' => $rCheckIDs
			))) {
				$lastReportID = $db -> lastInsertId();
				$link = $backendUrl . "ReportServlet?rID=" . $lastReportID;
				$result = file($link);
				if ($result == true) {
					$state = true;
					$messages[] = array(
						'type' => 'save',
						'text' => 'Report wurde erfolgreich angelegt!'
					);
				} else {
					$messages[] = array(
						'type' => 'error',
						'text' => 'Report konnte nicht angestoßen werden!<br />' . $link
					);
				}
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Report wurde nicht angelegt!'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter haben kein gültiges Format!'
			);

		$db -> disconnect();

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
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
					r.rID, r.rDatetime, r.rtSimilarity, e.eName, e.eDescription
				FROM
					report AS r LEFT JOIN errorcode AS e ON r.rErrorCode = e.eID
				WHERE
					r.dID = '$dID'
				ORDER BY
					r.rDatetime DESC");

			return $db -> linesAsArray();
		}
	}

	/**
	 * Returns report informations from given report id.
	 * @param int $rID
	 * @return array
	 */
	public static function getReportInfos($rID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					r.rID, r.rDatetime, r.rErrorCode, r.dID, r.rtSimilarity,
					d.dOriginalName, d.dAuthor, 
					e.eName, e.eDescription,
					r.rThreshold, r.rCheckWWW,
					sl.slTitle
				FROM
					report AS r
					LEFT JOIN document AS d			ON r.dID = d.dID
					LEFT JOIN errorcode as e		ON r.rErrorCode = e.eID
					LEFT JOIN settinglevel AS sl	ON r.slID = sl.slID
				WHERE
					r.rID = '$rID'
				");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['rID'])) {
				$report = $row;
				$state = true;
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'rID ist nicht gültig.'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'rID hat kein gültiges Format.'
			);

		$db -> disconnect();

		$return['report'] = $report;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}
}
?>