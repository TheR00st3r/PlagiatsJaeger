<?php

class Upload {

	/**
	 * Add the uploaded file infos to the database and starts the file copy.
	 * @param int $uID
	 * @param int $fID
	 * @param string $dAuthor
	 * @param file $file
	 * @return boolean
	 */
	public static function fileUpload($dID, $file) {
		//TODO LÖSCHEN
		require_once 'File.php';
		return File::copyTempFile($dID, $file);
	}

}
