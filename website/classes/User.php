<?php
class User {

	public static function getAllUser() {

		$db = new db();
		$db -> read("
				SELECT
					u.uID, u.uName, u.uLastname, u.uEMailAdress, u.uPassword, u.uPermissonLevel, u.uSentenceLength, u.uJumpLength, u.uTreshold
				FROM
					user AS u
				ORDER BY
					 u.uLastname ASC, u.uName ASC");

		return $db -> linesAsArray();
	}

	public static function newUser($uName, $uLastname, $uEMailAdress, $uPassword, $uPermissonLevel) {
		if (Validator::validate(VAL_STRING, $uName, true) and Validator::validate(VAL_STRING, $uLastname, true) and
			Validator::validate(VAL_EMAIL, $uEMailAdress, true) and Validator::validate(VAL_PASSWORD, $uPassword, true) and Validator::validate(VAL_INTEGER, $uPermissonLevel, true)) {
			$db = new db();
			return $db -> insert('user', array(
												'uName' => $uName,
												'uLastname' => $uLastname,
												'uEMailAdress' => $uEMailAdress,
												'uPassword' => md5($uPassword),
												'uPermissonLevel' => $uPermissonLevel,
												'uSentenceLength' => '0',
												'uJumpLength' => '0',
												'uTreshold' => '0'
												)
								);
		}

	}

}
?>