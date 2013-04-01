<?php
class Document {

	const path = '../uploads/';
	/**
	 * Returns all documents from given folder id.
	 * @param int $fID
	 * @return Array documents
	 */
	public static function getDocumentsFromFolderID($fID) {

		$db = new db();
		$db -> read("
				SELECT
					d.dID, d.dOriginalName, d.dAuthor, d.uID, d.fID
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
	 * Returns the original content from given document id.
	 * @param int $dID
	 * @return string
	 */
	public static function getDocumentOriginalContent($dID) {
		$handle = fopen(self::path . $dID . '.txt', 'r');

		while (!feof($handle)) {
			$buffer = fgets($handle);
			echo $buffer;
		}
		fclose($handle);

	}

}
?>
