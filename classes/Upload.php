<?php

class Upload {

	/**
	 * Saves the short upload text fragments to a file and the informations into the database.
	 * @param int $uID
	 * @param int $fID
	 * @param string $dAuthor
	 * @param string $text
	 * @return boolean
	 */
	public static function shortTextUpload($fID, $dAuthor, $text) {
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_STRING, $dAuthor)) {
			$db = new db();
			if ($db -> insert('document', array('dOriginalName' => 'Schnelltest Upload', 'dAuthor' => $dAuthor, 'fID' => $fID))) {
				$lastID = $db -> lastInsertId();
				require_once 'File.php';
				if (File::writeFile($lastID, nl2br($text), '.txt')) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Add the uploaded file infos to the database and starts the file copy.
	 * @param int $uID
	 * @param int $fID
	 * @param string $dAuthor
	 * @param file $file
	 * @return boolean
	 */
	public static function fileUpload($dID, $file) {

		if (Validator::validate(VAL_INTEGER, $dID, true)) {
			require_once 'File.php';
			echo 'ok2';
			if (File::copyTempFile($dID, $file)) {
				echo 'ok1';
				return true;
			}
		}
		return false;
	}

	/**
	 * Copy a website content to an txt file and store the informations into the database.
	 * @param ???
	 * @return boolean
	 */
	public static function webPageUpload() {
		throw new Exception('Not implemented');
	}

}
