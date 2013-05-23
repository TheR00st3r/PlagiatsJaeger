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
	public static function getFolderArray($fParentID, $depth = 999, $level = 0, $path = '', $pathName = '') {

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
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime,
				(SELECT CONCAT(u.uName, ' ', u.uLastname) FROM folderpermission AS fp LEFT JOIN user AS u ON fp.uID = u.uID WHERE fp.fpPermissionLevel = 900 and fp.fID = f.fID) AS uName
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
			$folder[$row['fID']]['uName'] = $row['uName'];
			$folder[$row['fID']]['fHashLink'] = $row['fHashLink'];
			$folder[$row['fID']]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];
			$folder[$row['fID']]['user'] = self::getFolderPermissions($row['fID']);

			$back = self::getFolderArray($row['fID'], $depth, $level + 1, $path . $alias . '/', $pathName . $row['fName'] . ' / ');
			if (count($back) > 0) {
				$folder[$row['fID']]['sub'] = $back;
			}
		}
		$db -> disconnect();
		return $folder;
	}

	public static function getSharedFolderArray($fParentID, $status = 0, $path = '', $pathName = '') {

		$uID = LoginAccess::getUserID();

		if ($fParentID == null) {
			$checkParent = "f.fParentID IS NULL";
		} else {
			$checkParent = "f.fParentID = '$fParentID'";
		}

		$db = new db();
		$db -> read("
			SELECT
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime,
				(SELECT CONCAT(u.uName, ' ', u.uLastname) FROM folderpermission AS fp LEFT JOIN user AS u ON fp.uID = u.uID WHERE fp.fpPermissionLevel = 900 and fp.fID = f.fID) AS uName
			FROM
				folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
			WHERE
				$checkParent and (p.fpPermissionLevel = 900 and p.uID != '$uID')
			ORDER BY
				f.fName ASC");

		if ($db -> valueCount() == 0) {
			return;
		}
		while ($row = $db -> lines()) {

			$tempStatus = $status;

			$alias = Helper::urlString($row['fName']);
			$users = Folder::getFolderPermissions($row['fID']);

			if (in_array($uID, $users)) {
				$tempStatus = 2;
			}

			$back = self::getSharedFolderArray($row['fID'], $tempStatus, $path . $alias . '/', $pathName . $row['fName'] . ' / ');

			if ($tempStatus != 2) {
				foreach ($back as $b) {
					if (in_array($uID, $b['user']) or $b['show'] > 0) {
						$tempStatus = 1;
					}
				}
			}

			if ($tempStatus > 0) {
				$folder[$row['fID']]['root'] = $path;
				$folder[$row['fID']]['alias'] = $alias;
				$folder[$row['fID']]['path'] = $path . $alias;
				$folder[$row['fID']]['pathName'] = $pathName . $row['fName'];
				$folder[$row['fID']]['fParentID'] = $fParentID;
				$folder[$row['fID']]['fID'] = $row['fID'];
				$folder[$row['fID']]['fName'] = $row['fName'];
				$folder[$row['fID']]['uName'] = $row['uName'];
				$folder[$row['fID']]['fHashLink'] = $row['fHashLink'];
				$folder[$row['fID']]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];

				$folder[$row['fID']]['user'] = $users;
				if (count($back) > 0) {
					$folder[$row['fID']]['sub'] = $back;
				}
				$folder[$row['fID']]['show'] = $tempStatus;
			}

		}
		$db -> disconnect();
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
	public static function getFolders($fParentID, $depth = 999, $level = 0, $path = '', $pathName = '') {

		$uID = LoginAccess::getUserID();

		if ($fParentID == null) {
			$checkParent = "f.fParentID IS NULL";
		} else {
			$checkParent = "f.fParentID = '$fParentID'";
		}

		$db = new db();
		$db -> read("
			SELECT
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime,
				(SELECT u.uName FROM folderpermission AS fp LEFT JOIN user AS u ON fp.uID = u.uID WHERE fp.fpPermissionLevel = 900 and fp.fID = f.fID) AS uName
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
			$folder[$path . $alias]['uName'] = $row['uName'];
			$folder[$path . $alias]['fHashLink'] = $row['fHashLink'];
			$folder[$path . $alias]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];
			$folder[$path . $alias]['user'] = self::getFolderPermissions($row['fID']);

			$back = self::getFolders($row['fID'], $depth, $level + 1, $path . $alias . '/', $pathName . $row['fName'] . ' / ');
			if (count($back) > 0) {
				$folder = array_merge($folder, $back);
			}
		}
		$db -> disconnect();
		return $folder;
	}

	public static function getSharedFolders($fParentID, $status = 0, $path = '', $pathName = '') {

		$uID = LoginAccess::getUserID();

		if ($fParentID == null) {
			$checkParent = "f.fParentID IS NULL";
		} else {
			$checkParent = "f.fParentID = '$fParentID'";
		}

		$db = new db();
		$db -> read("
			SELECT
				f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime,
				(SELECT CONCAT(u.uName, ' ', u.uLastname) FROM folderpermission AS fp LEFT JOIN user AS u ON fp.uID = u.uID WHERE fp.fpPermissionLevel = 900 and fp.fID = f.fID) AS uName
			FROM
				folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
			WHERE
				$checkParent and (p.fpPermissionLevel = 900 and p.uID != '$uID')
			ORDER BY
				f.fName ASC");

		if ($db -> valueCount() == 0) {
			return;
		}
		while ($row = $db -> lines()) {

			$tempStatus = $status;

			$alias = Helper::urlString($row['fName']);
			$users = Folder::getFolderPermissions($row['fID']);

			if (in_array($uID, $users)) {
				$tempStatus = 2;
			}

			$back = self::getSharedFolders($row['fID'], $tempStatus, $path . $alias . '/', $pathName . $row['fName'] . ' / ');

			if ($tempStatus != 2) {
				foreach ($back as $b) {
					if (in_array($uID, $b['user']) or $b['show'] > 0) {
						$tempStatus = 1;
					}
				}
			}

			if ($tempStatus > 0) {
				$folder[$path . $alias]['root'] = $path;
				$folder[$path . $alias]['alias'] = $alias;
				$folder[$path . $alias]['path'] = $path . $alias;
				$folder[$path . $alias]['pathName'] = $pathName . $row['fName'];
				$folder[$path . $alias]['fParentID'] = $fParentID;
				$folder[$path . $alias]['fID'] = $row['fID'];
				$folder[$path . $alias]['fName'] = $row['fName'];
				$folder[$path . $alias]['uName'] = $row['uName'];
				$folder[$path . $alias]['fHashLink'] = $row['fHashLink'];
				$folder[$path . $alias]['fLinkExpireDatetime'] = $row['fLinkExpireDatetime'];

				$folder[$path . $alias]['user'] = $users;
				if (count($back) > 0) {
					$folder = array_merge($folder, $back);
					// $folder[$row['fID']]['sub'] = $back;
				}
				$folder[$path . $alias]['show'] = $tempStatus;
			}

		}
		$db -> disconnect();
		return $folder;
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
			if ($db -> insert('folder', array(
				'fName' => $fName,
				'fParentID' => $fParentID
			))) {
				$lastID = $db -> lastInsertId();
				if (self::saveFolderPermission('900', $lastID, $uID)) {
					return true;
				}
			}
			$db -> disconnect();
			return false;
		}
	}

	/**
	 * Delete folder with given folder id.
	 * @param int $fID
	 * @return boolean
	 */
	public static function deleteFolder($fID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $fID, true)) {
			$db = new db();
			if ($db -> deleteWithWhereArray('folder', array('fID' => $fID))) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Ordner erfolgreich gelöscht.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Ordner konnte nicht gelöscht werden.'
				);
			$db -> disconnect();
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Die Ordner Id ist nicht gültig.'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Add hash link for given folder id.
	 * @param int $fID
	 * @return string (Hash value)
	 */
	public static function addFolderLink($fID, $fLinkExpireDatetime) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $fID, true) and Validator::validate(VAL_INTEGER, $fID, true)) {
			$hash = md5(uniqid());
			$db = new db();
			if ($db -> update('folder', array(
				'fHashLink' => $hash,
				'fLinkExpireDatetime' => $fLinkExpireDatetime
			), array('fID' => $fID))) {
				$db -> disconnect();
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Freigabelink gespeichert.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Freigabelink konnte nicht gespeichert werden.'
				);
			$db -> disconnect();
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter nicht korrekt.'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
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
					f.fID, f.fName, f.fLinkExpireDatetime, u.uThreshold, u.uCheckWWW, u.slID, u.seID
				FROM
					folder AS f LEFT JOIN folderpermission AS fp ON f.fID = fp.fID LEFT JOIN user AS u ON fp.uID = u.uID
				WHERE
					f.fHashLink = '$hash' and f.fHashLink != '' and fp.fpPermissionLevel = 900
				ORDER BY
					f.fName ASC");
		$folder = $db -> lines();
		$db -> disconnect();
		return $folder;
	}

	/**
	 * Edit the foler name from the given folder id.
	 * @param int $fID
	 * @param string $fName
	 * @return boolean
	 */
	public static function editFolderName($fID, $fName) {
		$db = new db();
		$state = $db -> update('folder', array('fName' => $fName), array('fID' => $fID));
		$db -> disconnect();
		return $state;
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
			if ($db -> insert('folderpermission', array(
				'fpPermissionLevel' => $fpPermissionLevel,
				'fID' => $fID,
				'uID' => $uID
			), true)) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Ordner Einstellung gespeichert.'
				);
			} else {
				$messages[] = array(
					'type' => 'error',
					'text' => 'Ordner Einstellung konnte nicht gespeichert werden.'
				);
			}
			$db -> disconnect();
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Parameter nicht korrekt.'
			);

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
			$messages[] = array(
				'type' => 'save',
				'text' => 'Einstellungen gespeichert.'
			);

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

		$db -> disconnect();

		return $return;
	}

	private static function deleteFolderPermissionsFromFolderId($fID) {
		$db = new db();
		$db -> deleteWithWhereArray('folderpermission', array(
			'fID' => $fID,
			'fpPermissionLevel' => '700'
		), 99);
		$db -> disconnect();
	}

}
?>