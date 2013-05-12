<?php
class Folder {
	/**
	 * Returns the recursive folder navigation as multidimensional array.
	 * @param int $fParentID
	 * @param int $depth
	 * @param int $level
	 * @param string $path
	 * @param string $pathName
	 * @return array
	 */
	public static function getFolderArray($fParentID = null, $depth = 999, $level = 0, $path = '', $pathName = '') {

		if (!isset($fParentID) or $fParentID == '') {
			$fParentID = null;
		}

		$uID = LoginAccess::getUserID();

		if ($level > $depth)
			return;

		if ($fParentID == null) {
			$checkParent = "f.fParentID IS NULL";
		} else {
			$checkParent = "f.fParentID = '$fParentID'";
		}

		$db = new db();
		$db -> read("
			SELECT
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime
			FROM
				folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
			WHERE
				$checkParent and p.uID = '$uID' and p.fpPermissionLevel = 900
			ORDER BY
				f.fName ASC");

		if ($db -> valueCount() == 0) {
			return;
		}
		while ($row = $db -> lines()) {

			$alias = Helper::urlString($row['fName']);

			$folder[$row['fID']]['root'] = $path;
			$folder[$row['fID']]['alias'] = $alias;
			$folder[$row['fID']]['path'] = $path . $alias;
			$folder[$row['fID']]['pathName'] = $pathName . $row['fName'];
			$folder[$row['fID']]['fParentID'] = $fParentID;
			$folder[$row['fID']]['fID'] = $row['fID'];
			$folder[$row['fID']]['fName'] = $row['fName'];
			$folder[$row['fID']]['fHashLink'] = $row['fHashLink'];
			$folder[$row['fID']]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];
			$folder[$row['fID']]['user'] = self::getFolderPermissions($row['fID']);

			$back = self::getFolderArray($row['fID'], $depth, $level + 1, $path . $alias . '/', $pathName . $row['fName'] . ' / ');
			if (count($back) > 0) {
				$folder[$row['fID']]['sub'] = $back;
			}

			//print_array($back);

		}
		return $folder;
	}

	/**
	 * Returns the recursive folder navigation as array.
	 * @param int $fParentID
	 * @param int $depth
	 * @param int $level
	 * @param string $path
	 * @param string $pathName
	 * @return array
	 */
	public static function getFolder($fParentID = null, $depth = 999, $level = 0, $path = '', $pathName = '') {

		$uID = LoginAccess::getUserID();

		if ($fParentID == null) {
			$checkParent = "f.fParentID IS NULL";
		} else {
			$checkParent = "f.fParentID = '$fParentID'";
		}

		// self::recursive($uID, $fParentID);

		$db = new db();
		$db -> read("
			SELECT
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime
			FROM
				folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
			WHERE
				$checkParent and p.uID = '$uID' and p.fpPermissionLevel = 900
			ORDER BY
				f.fName ASC");

		if ($db -> valueCount() == 0) {
			return;
		}
		while ($row = $db -> lines()) {

			$alias = Helper::urlString($row['fName']);

			$folder[$path . $alias]['root'] = $path;
			$folder[$path . $alias]['alias'] = $alias;
			$folder[$path . $alias]['path'] = $path . $alias;
			$folder[$path . $alias]['pathName'] = $pathName . $row['fName'];
			$folder[$path . $alias]['fParentID'] = $fParentID;
			$folder[$path . $alias]['fID'] = $row['fID'];
			$folder[$path . $alias]['fName'] = $row['fName'];
			$folder[$path . $alias]['fHashLink'] = $row['fHashLink'];
			$folder[$path . $alias]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];
			$folder[$path . $alias]['user'] = self::getFolderPermissions($row['fID']);

			if ($row['fID'] > 1) {
				$back = self::getFolder($row['fID'], $depth, $level + 1, $path . $alias . '/', $pathName . $row['fName'] . ' / ');
				if (count($back) > 0) {
					$folder = array_merge($folder, $back);
				}
			}
		}
		return $folder;
	}

	public static function getSharedFolders($uID) {
		$db = new db();
		$db -> read("
				SELECT
					f.fID, f.fName
				FROM
					folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
				WHERE
					p.uID = '$uID' and p.fpPermissionLevel = 700
				ORDER BY
					f.fName ASC");
		return $db -> linesAsArray();
	}

	/**
	 * Add new folder
	 * @param int $fName
	 * @param int $fParentID
	 * @param int $uID
	 * @return boolean
	 */
	public static function addFolder($fName, $fParentID, $uID) {

		if (!isset($fParentID) or $fParentID == '') {
			$fParentID = NULL;
		}

		if (Validator::validate(VAL_STRING, $fName, true) and Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			if ($db -> insert('folder', array('fName' => $fName, 'fParentID' => $fParentID))) {
				$lastID = $db -> lastInsertId();
				if (self::saveFolderPermission('900', $lastID, $uID)) {
					return true;
				}
			}
			return false;
		}
	}

	/**
	 * Delete folder with given folder id.
	 * @param int $fID
	 * @return boolean
	 */
	public static function deleteFolder($fID) {
		$db = new db();
		return $db -> deleteWithWhereArray('folder', array('fID' => $fID));
	}

	/**
	 * Add hash link for given folder id.
	 * @param int $fID
	 * @return string (Hash value)
	 */
	public static function addFolderLink($fID, $fLinkExpireDatetime) {
		$hash = md5(uniqid());
		$db = new db();
		// TODO: add expire date
		if ($db -> update('folder', array('fHashLink' => $hash, 'fLinkExpireDatetime' => $fLinkExpireDatetime), array('fID' => $fID))) {
			return $hash;
		}
		return false;
	}

	/**
	 * Returns the folder from the given hash value.
	 * @param string $hash
	 * @return array
	 */
	public static function getFolderFromHash($hash) {
		$db = new db();
		$db -> read("
				SELECT
					f.fID, f.fName, f.fLinkExpireDatetime
				FROM
					folder AS f
				WHERE
					f.fHashLink = '$hash' and f.fHashLink != ''
				ORDER BY
					f.fName ASC");
		return $db -> lines();
	}

	/**
	 * Edit the foler name from the given folder id.
	 * @param int $fID
	 * @param string $fName
	 * @return boolean
	 */
	public static function editFolderName($fID, $fName) {
		$db = new db();
		return $db -> update('folder', array('fName' => $fName), array('fID' => $fID));
	}

	/**
	 * Saves the folder permission for the given folder id.
	 * @param int $fpPermissionLevel
	 * @param int $fID
	 * @param int $uID
	 * @return boolean
	 */
	private static function saveFolderPermission($fpPermissionLevel, $fID, $uID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $fpPermissionLevel, true) and Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			if ($db -> insert('folderpermission', array('fpPermissionLevel' => $fpPermissionLevel, 'fID' => $fID, 'uID' => $uID), true)) {
				$state = true;
				$messages[] = array('type' => 'save', 'text' => 'Ordner Einstellung gespeichert.');
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Ordner Einstellung konnte nicht gespeichert werden.');
			}
		} else
			$messages[] = array('type' => 'error', 'text' => 'Parameter nicht korrekt.');

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Saves the folder permission for the given folder id und user ids.
	 * @param int $fpPermissionLevel
	 * @param int $fID
	 * @param int array $uIDs
	 * @return boolean
	 */
	public static function saveMultibleFolderPermissions($fpPermissionLevel, $fID, $uIDs) {
		self::deleteFolderPermissionsFromFolderId($fID);
		$state = true;
		foreach ($uIDs as $uID) {
			$saveCheck = self::saveFolderPermission($fpPermissionLevel, $fID, $uID);
			if (!$saveCheck['state']) {
				$state = false;
				$messages = $saveCheck['messages'];
			}
		}

		if ($state)
			$messages[] = array('type' => 'save', 'text' => 'Einstellungen gespeichert.');

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	private static function getFolderPermissions($fID) {
		$db = new db();
		$db -> read("
				SELECT
					fp.fpPermissionLevel, fp.uID
				FROM
					folderpermission AS fp
				WHERE
					fp.fpPermissionLevel <= 700 and fp.fID = $fID
				");
		$return = array();
		while ($row = $db -> lines()) {
			$return[] = $row['uID'];
		}
		return $return;
		// return $db -> linesAsArray();
	}

	private static function deleteFolderPermissionsFromFolderId($fID) {
		$db = new db();
		$db -> deleteWithWhereArray('folderpermission', array('fID' => $fID, 'fpPermissionLevel' => '700'), 99);
	}

}
?>