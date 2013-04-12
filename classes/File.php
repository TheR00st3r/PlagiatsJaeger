<?php

class File {

	const path = '../uploads/';

	/**
	 * Saves a text to file.
	 * @param int $dID
	 * @param string $text
	 * @param string $extension
	 * @return boolean
	 */
	public static function writeFile($dID, $text, $extension) {

		$handle = fopen(self::path . $dID . $extension, 'w+');
		$return = true;
		if (!fwrite($handle, $text)) {
			$return = false;
		}
		fclose($handle);
		return $return;
	}

	/**
	 * Copies the uploaded temporary file to the right folder.
	 * @param int $dID
	 * @param file $file
	 * @param string $extension
	 * @return boolean
	 */
	private static function copyTempFile($dID, $file) {

		$db = new db();
		$allowedExtensions = array('.pdf', '.doc', '.docx', '.txt', '.html');

		if ($file["tmp_name"] != '') {

			$pos = strripos($file["name"], '.');
			$extension = strtolower(substr($file["name"], $pos));

			if (in_array($extension, $allowedExtensions)) {

				if (copy($file["tmp_name"], self::path . $dID . $extension)) {
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
