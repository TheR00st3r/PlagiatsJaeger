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
					d.dID, d.dOriginalName, d.dFileExtension, d.dAuthor, d.fID, d.dIsParsed
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

		$db -> disconnect();

		return $docs;
	}

	/**
	 * Uploads a given file and creates a database entry.
	 * @param int $dID
	 * @return string
	 */
	public static function addDocument($fID, $dAuthor, $files, $slID, $seID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();

		for ($i = 0; $i < count($files['name']); $i++) {

			$file['name'] = $files['name'][$i];
			$file['tmp_name'] = $files['tmp_name'][$i];
			$file['error'] = $files['error'][$i];
			$file['error'] = $files['error'][$i];
			$file['error'] = $files['error'][$i];

			if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
				require_once '../classes/File.php';
				$db = new db();
				if ($db -> insert('document', array(
					'dOriginalName' => $file["name"],
					'dFileExtension' => File::getFileExtension($file["name"]),
					'dAuthor' => $dAuthor,
					'fID' => $fID
				))) {
					$lastID = $db -> lastInsertId();
					$uploadCheck = File::copyTempFile($lastID, $file);
					if ($uploadCheck['state']) {
						require_once '../classes/Report.php';
						$checkReport = Report::createReport($lastID, $slID, $seID, $uThreshold, $uCheckWWW);
						if ($checkReport['state']) {
							$state = true;
						}
						$messages = array_merge($messages, $checkReport['messages']);
					}
					$messages = array_merge($messages, $uploadCheck['messages']);
				} else
					$messages[] = array(
						'type' => 'error',
						'text' => 'Dokument wurde nicht angelegt!'
					);
				$db -> disconnect();
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Parameter haben kein gültiges Format!'
				);
		}

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
	public static function addSnipped($fID, $dAuthor, $text, $slID, $seID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			$db = new db();
			if ($db -> insert('document', array(
				'dOriginalName' => 'Schnelltest Upload',
				'dFileExtension' => '.txt',
				'dAuthor' => $dAuthor,
				'fID' => $fID,
				'dIsParsed' => 1
			))) {
				$lastID = $db -> lastInsertId();

				require_once '../classes/File.php';
				$checkWrite = File::writeFile($lastID, nl2br($text), '.txt');
				if ($checkWrite['state']) {
					$checkReport = Report::createReport($lastID, $slID, $seID, $uThreshold, $uCheckWWW);
					if ($checkReport['state']) {
						$state = true;
					}
					$messages = $checkReport['messages'];
				}
				$messages = array_merge($messages, $checkWrite['messages']);

			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokument wurde nicht angelegt!'
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
	 * Uploads a given file and creates a database entry.
	 * @param int $dID
	 * @return string
	 */
	public static function addUrl($fID, $dAuthor, $dOriginalName, $slID, $seID, $uThreshold, $uCheckWWW) {
		$state = false;
		$messages = array();
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			$db = new db();
			if ($db -> insert('document', array(
				'dOriginalName' => $dOriginalName,
				'dFileExtension' => '.html',
				'dAuthor' => $dAuthor,
				'fID' => $fID
			))) {
				$lastID = $db -> lastInsertId();

				require_once '../classes/File.php';
				$checkParsing = File::startFileParsing($lastID, '.html');

				if ($checkParsing['state']) {
					require_once '../classes/Report.php';
					$checkReport = Report::createReport($lastID, $slID, $seID, $uThreshold, $uCheckWWW);
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
			$db -> disconnect();
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
		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			$state = false;
			$db = new db();
			$db -> read("
					SELECT
						d.dID, d.dOriginalName, d.dFileExtension, d.dAuthor, d.fID, d.dIsParsed
					FROM
						document AS d
					WHERE
						d.dID = '$dID'
				");

			$row = $db -> lines();

			$db -> disconnect();

			if ($row['dIsParsed']) {
				require_once '../classes/File.php';

				$checkFile = File::readFile($dID . '.txt');
				if ($checkFile['state']) {
					$file = $checkFile['file'];
					$state = true;
				} else
					$messages = $checkFile['messages'];

			} else
				$messages[] = array(
					'type' => 'info',
					'text' => 'Datei wurde noch nicht geparsed.'
				);
		} else
			$messages[] = array(
				'type' => 'info',
				'text' => 'Dokument ID ist nicht korrekt.'
			);

		$return['file'] = $file;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Edit the Autor name from the given document id.
	 * @param int $fID
	 * @param string $fName
	 * @return boolean
	 */
	public static function editAutor($dID, $dAuthor) {
		$db = new db();
		$state = $db -> update('document', array('dAuthor' => $dAuthor), array('dID' => $dID));
		$db -> disconnect();
		return $state;
	}

}
?>
