<?php
class Document {

	/**
	 * Returns all documents from given folder id.
	 * @param int $fID
	 * @return Array documents
	 */
	public static function getDocumentsFromFolderID($fID) {

		$db = new db();
		$db -> read("
				SELECT
					d.dID, d.dOriginalName, d.dAuthor, d.fID, d.dIsParsed
				FROM
					document AS d
				WHERE
					d.fID = '$fID'
				ORDER BY
					d.dOriginalName ASC");

		$docs = array();

		require_once '../classes/Report.php';

		while ($row = $db -> lines()) {
			$row['reports'] = Report::getReportsFromDocumentID($row['dID']);
			$docs[] = $row;
		}

		return $docs;
	}

	/**
	 * Uploads a given file and creates a database entry.
	 * @param int $dID
	 * @return string
	 */
	public static function addDocument($fID, $dAuthor, $file, $slID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			require_once 'Upload.php';
			$db = new db();
			if ($db -> insert('document', array(
				'dOriginalName' => $file["name"],
				'dAuthor' => $dAuthor,
				'fID' => $fID
			))) {
				$lastID = $db -> lastInsertId();
				$uploadCheck = Upload::fileUpload($lastID, $file);
				if ($uploadCheck['state']) {
					require_once 'Report.php';
					$checkReport = Report::createReport($lastID, $slID, $uThreshold, $uCheckWWW);
					if ($checkReport['state']) {
						$state = true;
					}
					$messages = $checkReport['messages'];
				}
				$messages = array_merge($messages, $uploadCheck['messages']);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokument wurde nicht angelegt!'
				);
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
	 * Saves the short upload text fragments to a file and the informations into the database.
	 * @param int $uID
	 * @param int $fID
	 * @param string $dAuthor
	 * @param string $text
	 * @return boolean
	 */
	public static function addSnipped($fID, $dAuthor, $text, $slID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			$db = new db();
			if ($db -> insert('document', array(
				'dOriginalName' => 'Schnelltest Upload',
				'dAuthor' => $dAuthor,
				'fID' => $fID,
				'dIsParsed' => 1
			))) {
				$lastID = $db -> lastInsertId();

				require_once 'File.php';
				$checkWrite = File::writeFile($lastID, nl2br($text), '.txt');
				if ($checkWrite['state']) {
					// require_once 'Report.php';
					$checkReport = Report::createReport($lastID, $slID, $uThreshold, $uCheckWWW);
					if ($checkReport['state']) {
						$state = true;
					}
					print_array($checkReport);
					$messages = $checkReport['messages'];
				}
				$messages = array_merge($messages, $checkWrite['messages']);
print_array($checkWrite);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokument wurde nicht angelegt!'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter haben kein gültiges Format!'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;
		print_array($return);
		return $return;
	}

	/**
	 * Uploads a given file and creates a database entry.
	 * @param int $dID
	 * @return string
	 */
	public static function addUrl($fID, $dAuthor, $dOriginalName, $slID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			$db = new db();
			if ($db -> insert('document', array(
				'dOriginalName' => $dOriginalName,
				'dAuthor' => $dAuthor,
				'fID' => $fID
			))) {
				$lastID = $db -> lastInsertId();

				require_once 'File.php';
				$checkParsing = File::startFileParsing($lastID, '.html');

				if ($checkParsing['state']) {
					require_once '../classes/Report.php';
					$checkReport = Report::createReport($lastID, $slID, $uThreshold, $uCheckWWW);
					if ($checkReport['state']) {
						$state = true;
					}
					$messages = $checkReport['messages'];
				}
				$messages = array_merge($messages, $checkParsing['messages']);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokument wurde nicht angelegt!'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter haben kein gültiges Format!'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
	}

	public static function deleteDocument($dID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$db = new db();
			if ($db -> deleteWithWhereArray('document', array('dID' => $dID))) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Dokument erfolgreich gelöscht.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokument konnte nicht gelöscht werden.'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Die Dokument Id ist nicht gültig.'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Returns the original content from given document id.
	 * @param int $dID
	 * @return string
	 */
	public static function getDocumentOriginalContent($dID) {

		$db = new db();
		$db -> read("
					SELECT
						d.dID, d.dOriginalName, d.dAuthor, d.fID, d.dIsParsed
					FROM
						document AS d
					WHERE
						d.dID = '$dID'
		");

		$row = $db -> lines();

		if ($row['dIsParsed']) {
			require_once 'File.php';
			return File::readFile($dID . '.txt');
		} else
			return 'Datei wurde noch nicht geparsed....';
	}

}
?>
