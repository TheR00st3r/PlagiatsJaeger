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
					d.dID, d.dOriginalName, d.dAuthor, d.fID
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
	public static function fileUpload($fID, $dAuthor, $file) {

		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			require_once 'Upload.php';
			$db = new db();
			if ($db -> insert('document', array('dOriginalName' => $file["name"], 'dAuthor' => $dAuthor, 'fID' => $fID))) {
				$lastID = $db -> lastInsertId();
				if (Upload::fileUpload($lastID, $file)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Returns the original content from given document id.
	 * @param int $dID
	 * @return string
	 */
	public static function getDocumentOriginalContent($dID) {
		require_once 'File.php';
		return File::readFile($dID . '.txt');
	}

}
?>