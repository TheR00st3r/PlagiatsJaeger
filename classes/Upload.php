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
	public static function shortTextUpload($uID, $fID, $dAuthor, $text) {
		if (Validator::validate(VAL_INTEGER, $uID, true) and Validator::validate(VAL_INTEGER, $fID, true)) {

			$db = new db();
			if ($db -> insert('document', array('dOriginalName' => 'Schnelltest Upload', 'dAuthor' => $dAuthor, 'uID' => $uID, 'fID' => $fID))) {
				$lastID = $db -> lastInsertId();
				if (File::writeFile($lastID, $text, '.txt')) {
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
	public static function fileUpload($uID, $fID, $dAuthor, $file) {

		if (Validator::validate(VAL_INTEGER, $uID, true) and Validator::validate(VAL_INTEGER, $fID, true)) {
			$db = new db();
			if ($db -> insert('document', array('dOriginalName' => $file["name"], 'dAuthor' => $dAuthor, 'uID' => $uID, 'fID' => $fID))) {
				$lastID = $db -> lastInsertId();
				require_once 'File.php';
				if (File::copyTempFile($lastID, $file)) {
					return true;
				}
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
