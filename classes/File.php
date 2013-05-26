<?php

class File {

	/**
	 * Saves a text to file.
	 * @param int $dID
	 * @param string $text
	 * @param string $extension
	 * @return void
	 */
	public static function writeFile($dID, $text, $extension) {
		global $logData;
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true)) {

			$handle = fopen($logData['uploadpath'] . $dID . $extension, 'w+');
			if (fwrite($handle, $text)) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Schnelltest gespeichert.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Snippet kann nicht gespeichert werden.'
				);
			fclose($handle);
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
	 * Copies the uploaded temporary file to the right folder.
	 * @param int $dID
	 * @param array $file
	 * @return void
	 */
	public static function copyTempFile($dID, $file) {
		global $logData;
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true)) {

			if ($file["tmp_name"] != '') {

				$extension = self::getFileExtension($file['name']);

				if (in_array($extension, $logData['extensions'])) {

					if (copy($file["tmp_name"], $logData['uploadpath'] . $dID . $extension)) {

						$checkParsing = self::startFileParsing($dID, $extension);
						if ($checkParsing['state']) {
							$state = true;
						}
						$messages = $checkParsing['messages'];

					} else
						$messages[] = array(
							'type' => 'error',
							'text' => 'Originaldokument konnte nicht gespeichert werden.'
						);
				} else
					$messages[] = array(
						'type' => 'error',
						'text' => 'Ungültiges Dateiformat, erlaubt sind ' . implode($logData['extensions'], ',') . '.'
					);
			}
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
	 * Starts the backend file parsing.
	 * @param int $dID
	 * @param string $extension
	 * @return void
	 */
	public static function startFileParsing($dID, $extension) {
		global $backendUrl;
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true) and Validator::validate(VAL_STRING, $extension, true)) {

			$link = $backendUrl . "ParseServlet?dID=" . $dID . "&dFileEnding=" . $extension;
			$result = file($link);
			if ($result == true) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Dokument wurde erfolgreich gespeichert!'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokumentparsing konnte nicht angestoßen werden!<br />' . $link
				);
		}

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;

	}

	/**
	 * Returns the content from given filename.
	 * @param string $filename
	 * @return string the file content
	 */
	public static function readFile($filename) {
		global $logData;
		$state = false;
		if (file_exists($logData['uploadpath'] . $filename)) {
			$handle = fopen($logData['uploadpath'] . $filename, 'r');
			$file = '';
			while (!feof($handle)) {
				$buffer = fgets($handle);
				$file .= $buffer;
				$state = true;
			}
			fclose($handle);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Dokument wurde nicht gefunden.' . $link
			);

		$return['file'] = $file;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Returns the file extension from the filename.
	 * @param string $fileName
	 * @return string the file extension
	 */
	public static function getFileExtension($fileName) {
		$pos = strripos($fileName, '.');
		return strtolower(substr($fileName, $pos));
	}

}
?>