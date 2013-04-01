<?php
class Document {

	const path = '../uploads/';

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

	public static function getDocumentOriginalContent($dID) {
		$handle = fopen(self::path . $dID . '.txt', 'r');
		// fclose($handle);
		// readfile(this::path . $dID . '.txt');

		while (!feof($handle)) {
			$buffer = fgets($handle);
			echo $buffer;
		}
		fclose($handle);

		// return $return;

	}

}
?>
