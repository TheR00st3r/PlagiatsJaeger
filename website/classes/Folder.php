<?php
class Folder {

	public static function getFolderArray($fParentID = 1, $depth = 999, $level = 0, $root = '') {

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

			$folder[$row['fID']]['root'] = $root;
			$folder[$row['fID']]['alias'] = $alias;
			$folder[$row['fID']]['path'] = $root . $alias;
			$folder[$row['fID']]['fParentID'] = $fParentID;
			$folder[$row['fID']]['fID'] = $row['fID'];
			$folder[$row['fID']]['fName'] = $row['fName'];
			$folder[$row['fID']]['fHashLink'] = $row['fHashLink'];

			$back = self::getFolderArray($row['fID'], $depth, $level + 1, $root . $alias . '/');
			if (count($back) > 0) {
				$folder[$row['fID']]['sub'] = $back;
			}

		}
		return $folder;
	}

	public static function getFolder($fParentID = 1, $depth = 999, $level = 0, $root = '') {

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

			$folder[$root . $alias]['root'] = $root;
			$folder[$root . $alias]['alias'] = $alias;
			$folder[$root . $alias]['path'] = $root . $alias;
			$folder[$root . $alias]['fParentID'] = $fParentID;
			$folder[$root . $alias]['fID'] = $row['fID'];
			$folder[$root . $alias]['fName'] = $row['fName'];
			$folder[$root . $alias]['fHashLink'] = $row['fHashLink'];

			if ($row['fID'] > 1) {
				$back = self::getFolder($row['fID'], $depth, $level + 1, $root . $alias . '/');
				if (count($back) > 0) {
					$folder = array_merge($folder, $back);
				}
			}
		}
		return $folder;
	}

	public static function getFolderParents($fParentID = 1) {
		$parents = self::getFolder($fParentID);
		$tempParents = null;
		foreach ($parents as $parent) {
			$tempParents[$parent['fID']] = $parent['root'] . $parent['alias'];
		}
		return $tempParents;
	}

	public static function addFolder($fName, $fParentID, $uID) {

		if (!isset($fParentID) or $fParentID == '') {
			$fParentID = 1;
		}

		if (Validator::validate(VAL_STRING, $fName, true) and Validator::validate(VAL_INTEGER, $fParentID, true) and Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			if ($db -> insert('folder', array('fName' => $fName, 'fParentID' => $fParentID))) {
				$lastID = $db -> lastInsertId();
				if ($db -> insert('folderpermission', array('fpPermissionLevel' => '900', 'fID' => $lastID, 'uID' => $uID))) {
					return true;
				}
			}
			return false;
		}
	}

	public static function deleteFolder($fID) {
		$db = new db();
		return $db -> deleteWithWhereArray('folder', array('fID' => $fID));
	}
	
	public static function addFolderLink($fID) {
		$hash = md5(uniqid());
		$db = new db();
		if($db -> update('folder', array('fHashLink' => $hash), array('fID' => $fID))) {
			return $hash;
		}
		return false;
	}
	
	public static function getFolderFromHash($hash) {
		$db = new db();
		$db -> read("
				SELECT
					f.fID, f.fName
				FROM
					folder AS f
				WHERE
					f.fHashLink = '$hash'
				ORDER BY
					f.fName ASC");
		return $db -> lines();
	}

}
?>