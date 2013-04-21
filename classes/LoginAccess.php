<?php
class LoginAccess {
	
	const suffix = 'plagiat';

	/**
	 * Check the given email and password values and set session vaiables.
	 * @param string $email
	 * @param string $password
	 * @return boolean
	 */
	public static function login($email, $password) {

		if (Validator::validate(VAL_EMAIL, $email)) {

			$password = md5($password);

			$dbLogin = new db();
			$dbLogin -> read("SELECT
								uID, uName, uLastname, uEMailAdress, uPassword, uPermissonLevel, cID
							FROM 
								user
							WHERE
								uEMailAdress = '$email' AND uPassword = '$password' AND uEMailAdress != '' AND uPassword != ''
							");

			if ($dbLogin -> valueCount() == 1) {

				$row = $dbLogin -> lines();

				$_SESSION[self::suffix . '_id'] = $row['uID'];
				$_SESSION[self::suffix . '_client'] = $row['cID'];
				$_SESSION[self::suffix . '_name'] = $row['uLastname'] . ', ' . $row['uName'];
				$_SESSION[self::suffix . '_email'] = $row['uEMailAdress'];
				$_SESSION[self::suffix . '_level'] = $row['uPermissonLevel'];

				return true;
			} else
				return false;
		} else
			return false;
	}

	/**
	 * Delete the login session valiables.
	 */
	public static function logout() {

		unset($_SESSION[self::suffix . '_id']);
		unset($_SESSION[self::suffix . '_client']);
		unset($_SESSION[self::suffix . '_name']);
		unset($_SESSION[self::suffix . '_email']);
		unset($_SESSION[self::suffix . '_level']);
	}

	/**
	 * Check if user logged in an hash the right permissions.
	 * @param int $level
	 * @return boolean
	 */
	public static function check($level = 100) {
		if (isset($_SESSION[self::suffix . '_id']) AND isset($_SESSION[self::suffix . '_name']) AND isset($_SESSION[self::suffix . '_email']) AND $_SESSION[self::suffix . '_level'] >= $level) {
			return true;
		}
		return false;
	}

	/**
	 * Returns the user informations from the set sessions.
	 * @return string
	 */
	public static function getUserInfo() {
		return $_SESSION[self::suffix . '_name'];
		// (' . $_SESSION[self::suffix . '_id'] . ')';
	}
	
	/**
	 * Returns the user id from the set sessions.
	 * @return int
	 */
	public static function getUserID() {
		return $_SESSION[self::suffix . '_id'];
	}

	/**
	 * Returns the client id from the set sessions.
	 * @return int
	 */
	public static function getClientID() {
		return $_SESSION[self::suffix . '_client'];
	}

	/**
	 * Returns the user permissions from the set sessions.
	 * @return int
	 */
	public static function getUserLevel() {
		return $_SESSION[self::suffix . '_level'];
	}

}
?>