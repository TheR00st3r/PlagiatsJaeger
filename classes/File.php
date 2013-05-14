<?php

class File {

	// TODO: Path in configs auslagern
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
	public static function copyTempFile($dID, $file) {

		$db = new db();
		$allowedExtensions = array('.pdf', '.doc', '.docx', '.txt', '.html');

		if ($file["tmp_name"] != '') {

			$pos = strripos($file["name"], '.');
			$extension = strtolower(substr($file["name"], $pos));
			echo '--'.$extension.'--';

			if (in_array($extension, $allowedExtensions)) {

				if (copy($file["tmp_name"], self::path . $dID . $extension)) {
					$result = file("http://localhost:8080/PlagiatsJaeger/ParseServlet?dID=" . $dID."&dFileEndling=".$extension);
					if ($result == true) {
						// $messages[] = array('type' => 'save', 'text' => 'Report wurde erfolgreich angelegt!');
					}
					return true;
				}
				// else $messages[] = array('type' => 'error', 'text' => 'PDF ' . $file["name"] . ' nicht gesichert.');
			}
			//else $messages[] = array('type' => 'error', 'text' => 'Es sind nur pdf Dateien erlaubt!');
		}
		// else $messages[] = array('type' => 'error', 'text' => 'ID und/oder Datei leer!');
		return false;
	}

	/**
	 * Returns the content from given filename.
	 * @param string $filename
	 * @return string
	 */
	public static function readFile($filename) {
		$handle = fopen(self::path . $filename, 'r');

		while (!feof($handle)) {
			$buffer = fgets($handle);
			$return .= $buffer;
		}
		fclose($handle);

		return $return;
	}

}
