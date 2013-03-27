<?php
class LoginAccess {
	
	const suffix = 'plagiat';

	public static function login($email, $password) {

		if (Validator::validate(VAL_EMAIL, $email)) {

			$password = md5($password);

			$dbLogin = new db();
			$dbLogin -> read("SELECT
								uID, uName, uLastname, uEMailAdress, uPassword, uPermissonLevel
							FROM 
								user
							WHERE
								uEMailAdress = '$email' AND uPassword = '$password' AND uEMailAdress != '' AND uPassword != ''
							");

			if ($dbLogin -> valueCount() == 1) {

				$row = $dbLogin -> lines();

				$_SESSION[self::suffix . '_id'] = $row['uID'];
				$_SESSION[self::suffix . '_name'] = $row['uLastname'] . ', ' . $row['uName'];
				$_SESSION[self::suffix . '_email'] = $row['uEMailAdress'];
				$_SESSION[self::suffix . '_level'] = $row['uPermissonLevel'];

				return true;
			} else
				return false;
		} else
			return false;
	}

	public static function logout() {

		unset($_SESSION[self::suffix . '_id']);
		unset($_SESSION[self::suffix . '_name']);
		unset($_SESSION[self::suffix . '_email']);
		unset($_SESSION[self::suffix . '_level']);
	}

	public static function check($level = 100) {
		if (isset($_SESSION[self::suffix . '_id']) AND isset($_SESSION[self::suffix . '_name']) AND isset($_SESSION[self::suffix . '_email']) AND $_SESSION[self::suffix . '_level'] >= $level) {
			return true;
		}
		return false;
	}

	public static function userInfo() {
		return $_SESSION[self::suffix . '_name'] . ' (' . $_SESSION[self::suffix . '_id'] . ')';
	}
	
	public static function userID() {
		return $_SESSION[self::suffix . '_id'];
	}

}
?>