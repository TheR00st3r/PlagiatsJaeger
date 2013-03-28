<?php

class Upload {

	public static function fileUpload($uID, $fID, $dAuthor, $file) {

		if (Validator::validate(VAL_INTEGER, $uID, true) and Validator::validate(VAL_INTEGER, $fID, true)) {
			$db = new db();
			if ($db -> insert('document', array('dOriginalName' => $file["name"], 'dAuthor' => $dAuthor, 'uID' => $uID, 'fID' => $fID))) {
				$lastID = $db -> lastInsertId();
				if (self::saveFile($lastID, $file, '.txt')) {
					return true;
				}
			}
		}
		return false;
	}

	private static function saveFile($dID, $file, $extension) {

		$path = '../uploads/';
		$db = new db();

		if ($file["tmp_name"] != '') {

			if (strtolower(substr($file["name"], -4)) == $extension) {

				if (copy($file["tmp_name"], $path . $dID . $extension)) {
					return true;
				}
				// else $messages[] = array('type' => 'error', 'text' => 'PDF ' . $file["name"] . ' nicht gesichert.');
			}
			//else $messages[] = array('type' => 'error', 'text' => 'Es sind nur pdf Dateien erlaubt!');
		}
		// else $messages[] = array('type' => 'error', 'text' => 'ID und/oder Datei leer!');
		return false;
	}

}
