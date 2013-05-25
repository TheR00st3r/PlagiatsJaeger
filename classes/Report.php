<?php
class Report {

	/**
	 * Saves a new report and starts the backend functionality.
	 * @param int $dID
	 * @param int $slID
	 * @param int $seID
	 * @param double $rThreshold
	 * @param boolean $rCheckWWW
	 * @param array $rCheckIDs
	 * @return void
	 */
	public static function createReport($dID, $slID, $seID, $rThreshold, $rCheckWWW, $rCheckIDs = array()) {
		global $backendUrl;
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true) and Validator::validate(VAL_INTEGER, $slID, true) and
		Validator::validate(VAL_INTEGER, $rThreshold, true) and Validator::validate(VAL_INTEGER, $rCheckWWW) and Validator::validate(VAL_INTEGER, $seID)) {
			$db = new db();
			if ($db -> insert('report', array(
				'rDatetime' => date('Y-m-d H:i:s'),
				'rErrorCode' => 100,
				'dID' => $dID,
				'slID' => $slID,
				'rThreshold' => $rThreshold,
				'rCheckWWW' => $rCheckWWW,
				'rCheckIDs' => $rCheckIDs,
				'seID' => $seID
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
			$db -> disconnect();
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter haben kein gültiges Format!'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
	}

	/**
	 * Returns all reports from given document id.
	 * @param int $dID
	 * @return array reports from folder
	 */
	public static function getReportsFromDocumentID($dID) {
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					r.rID, r.rDatetime, r.rSimilarity, e.eName, e.eDescription
				FROM
					report AS r LEFT JOIN errorcode AS e ON r.rErrorCode = e.eID
				WHERE
					r.dID = '$dID'
				ORDER BY
					r.rDatetime DESC");

			$reports = $db -> linesAsArray();
			$db -> disconnect();
			return $reports;
		}
	}

	/**
	 * Returns report informations from given report id.
	 * @param int $rID
	 * @return array report informations
	 */
	public static function getReportInfos($rID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					r.rID, r.rDatetime, r.rErrorCode, r.dID, r.rSimilarity, r.rEndTime,
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
			$db -> disconnect();
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'rID hat kein gültiges Format.'
			);

		$return['report'] = $report;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Returns the report informations for information mail from the given report id.
	 * @param int $rID
	 * @return array report informations
	 */
	public static function getReportInformationForMail($rID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $rID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					u.uID, u.uName, u.uLastname, u.uEMailAdress,
					r.rThreshold, r.rSimilarity, r.rDatetime, r.rEndTime, r.rErrorCode,
					d.dOriginalName, d.dAuthor,
					e.eName, e.eDescription
				FROM
					report AS r LEFT JOIN document AS d ON r.dID = d.dID
					LEFT JOIN folder AS f ON d.fID = f.fID
					LEFT JOIN folderpermission AS fp ON f.fID = fp.fID
					LEFT JOIN user AS u ON fp.uID = u.uID
					LEFT JOIN errorcode AS e ON r.rErrorCode = e.eID
				WHERE 
					 r.rID = $rID and fp.fpPermissionLevel = 900
				");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['uID'])) {
				$report = $row;
				$state = true;
			} else {
				$messages[] = array(
					'type' => 'error',
					'text' => 'Report ID ist nicht gültig.'
				);
			}
			$db -> disconnect();
		} else {
			$messages[] = array(
				'type' => 'error',
				'text' => 'Report ID hat kein gültiges Format.'
			);
		}

		$return['report'] = $report;
		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;

	}
}
?>