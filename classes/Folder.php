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
	public static function getFolderArray($fParentID = 1, $depth = 999, $level = 0, $path = '', $pathName = '') {

		if (!isset($fParentID) or $fParentID == '') {
			$fParentID = 1;
		}

		$uID = LoginAccess::userID();

		if ($level > $depth)
			return;

		$db = new db();
		$db -> read("
				SELECT
					f.fID, f.fName, f.fParentID, f.fHashLink
				FROM
					folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
				WHERE
					f.fParentID = '$fParentID' and p.uID = '$uID'
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
	public static function getFolder($fParentID = 1, $depth = 999, $level = 0, $path = '', $pathName = '') {

		$uID = LoginAccess::userId();

		$db = new db();
		$db -> read("
				SELECT
					f.fID, f.fName, f.fParentID, f.fHashLink
				FROM
					folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
				WHERE
					f.fParentID = '$fParentID' and p.uID = '$uID'
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

			if ($row['fID'] > 1) {
				$back = self::getFolder($row['fID'], $depth, $level + 1, $path . $alias . '/', $pathName . $row['fName'] . ' / ');
				if (count($back) > 0) {
					$folder = array_merge($folder, $back);
				}
			}
		}
		return $folder;
	}

	/**
	 * Returns folders from given folder id as single array for example dropdowns (old)
	 * @deprecated
	 * @param id $fParentID
	 * @return array
	 */
	public static function getFolderParents($fParentID = 1) {
		$parents = self::getFolder($fParentID);
		$tempParents = null;
		foreach ($parents as $parent) {
			$tempParents[$parent['fID']] = $parent['root'] . $parent['alias'];
		}
		return $tempParents;
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
			$fParentID = 1;
		}

		if (Validator::validate(VAL_STRING, $fName, true) and Validator::validate(VAL_INTEGER, $fParentID, true) and Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			if ($db -> insert('folder', array('fName' => $fName, 'fParentID' => $fParentID))) {
				$lastID = $db -> lastInsertId();
				if (self::saveFolderPermission('900', $lastID, $uID)) {
					// if ($db -> insert('folderpermission', array('fpPermissionLevel' => '900', 'fID' => $lastID, 'uID' => $uID))) {
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
	public static function addFolderLink($fID) {
		$hash = md5(uniqid());
		$db = new db();
		// TODO: add expire date
		if ($db -> update('folder', array('fHashLink' => $hash, 'fLinkExpireDatetime' => '9999-99-99 99:99:99'), array('fID' => $fID))) {
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
					f.fID, f.fName
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
	public static function saveFolderPermission($fpPermissionLevel, $fID, $uID) {
		//TODO Check Values;
		$db = new db();
		return $db -> insert('folderpermission', array('fpPermissionLevel' => $fpPermissionLevel, 'fID' => $fID, 'uID' => $uID));
	}

}
?>