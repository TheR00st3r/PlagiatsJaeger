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
		$state = false;
		if (Validator::validate(VAL_EMAIL, $email, true) and Validator::validate(VAL_PASSWORD, $password, true)) {

			$password = md5($password);

			$db = new db();
			$db -> read("SELECT
								uID, uName, uLastname, uEMailAdress, uPassword, uPermissonLevel, cID, uThreshold, uCheckWWW, slID
							FROM 
								user
							WHERE
								uEMailAdress = '$email' AND uPassword = '$password' AND uEMailAdress != '' AND uPassword != ''
							");

			if ($db -> valueCount() == 1) {

				$row = $db -> lines();

				$_SESSION[self::suffix . '_id'] = $row['uID'];
				$_SESSION[self::suffix . '_client'] = $row['cID'];
				$_SESSION[self::suffix . '_name'] = $row['uName'] . ' ' . $row['uLastname'];
				$_SESSION[self::suffix . '_email'] = $row['uEMailAdress'];
				$_SESSION[self::suffix . '_level'] = $row['uPermissonLevel'];

				self::saveSettingsSession($row['slID'], $row['uThreshold'], $row['uCheckWWW']);

				$db -> disconnect();

				$state = true;
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => 'Passwort und/oder eMail-Adresse sind nicht gültig.'
				);
		} else
			$messages[] = array(
				'type' => 'error',
				'text' => 'Passwort und/oder eMail-Adresse haben kein gültiges Format.'
			);

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
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
		unset($_SESSION[self::suffix . '_settings']);
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

	/**
	 * Returns the user settings from the set sessions.
	 * @return int
	 */
	public static function getUserSettings() {
		return $_SESSION[self::suffix . '_settings'];
	}

	/**
	 * Saves the Sessions
	 * @param int $uThreshold
	 * @param int $uCheckWWW
	 * @param int $slID
	 * @return void
	 */
	public static function saveSettingsSession($slID, $uThreshold, $uCheckWWW) {
		$settings['uThreshold'] = $uThreshold;
		$settings['uCheckWWW'] = $uCheckWWW;
		$settings['slID'] = $slID;
		$_SESSION[self::suffix . '_settings'] = $settings;
	}

}
?>
