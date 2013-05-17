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
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true)) {

			$handle = fopen(self::path . $dID . $extension, 'w+');
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
	 * @param file $file
	 * @param string $extension
	 * @return boolean
	 */
	public static function copyTempFile($dID, $file) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $dID, true)) {

			$allowedExtensions = array(
				'.pdf',
				'.doc',
				'.docx',
				'.txt',
				'.html'
			);

			if ($file["tmp_name"] != '') {

				$pos = strripos($file["name"], '.');
				$extension = strtolower(substr($file["name"], $pos));

				if (in_array($extension, $allowedExtensions)) {

					if (copy($file["tmp_name"], self::path . $dID . $extension)) {

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
						'text' => 'Ungültiges Dateiformat (' . implode($allowedExtensions, ',') . ')'
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
			} else {
				//TODO: print errors
				// print_array($result);
				$messages[] = array(
					'type' => 'error',
					'text' => 'Dokumentparsing konnte nicht angestoßen werden!<br />' . $link
				);
			}
		}

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;

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
