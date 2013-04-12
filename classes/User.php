<?php
class User {

	/**
	 * Returns all users from database.
	 * @return array
	 */
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

	/**
	 * Add a new user from the given informations.
	 * @param string $uName
	 * @param string $uLastname
	 * @param string $uEMailAdress
	 * @param string $uPassword
	 * @param int $uPermissonLevel
	 * @return boolean
	 */
	public static function newUser($uName, $uLastname, $uEMailAdress, $uPassword, $uPermissonLevel) {
		if (Validator::validate(VAL_STRING, $uName, true) and Validator::validate(VAL_STRING, $uLastname, true) and Validator::validate(VAL_EMAIL, $uEMailAdress, true) and Validator::validate(VAL_PASSWORD, $uPassword, true) and Validator::validate(VAL_INTEGER, $uPermissonLevel, true)) {
			$db = new db();
			return $db -> insert('user', array('uName' => $uName, 'uLastname' => $uLastname, 'uEMailAdress' => $uEMailAdress, 'uPassword' => md5($uPassword), 'uPermissonLevel' => $uPermissonLevel, 'uSentenceLength' => '0', 'uJumpLength' => '0', 'uTreshold' => '0'));
		}
		return false;
	}

	/**
	 * Adds a new user to the database an sends a mail to the client administrator.
	 * @param string $uName
	 * @param string $uLastname
	 * @param string $uEMailAdress
	 * @param string $uPassword
	 * @param int $cID
	 * @return boolean
	 */
	public static function registrateUser($uName, $uLastname, $uEMailAdress, $uPassword, $cID) {
		throw new Exception('Not implemented');
	}

	private static function getIdFromEmail($uEMailAdress) {
		if (Validator::validate(VAL_EMAIL, $uEMailAdress)) {
			$db = new db();
			$db -> read("SELECT uID FROM user WHERE uEMailAdress = '$uEMailAdress' and uEMailAdress != ''");
			return $db -> lines();
		}
		return false;
	}

	/**
	 * Add the uploaded file infos to the database and starts the file copy.
	 * @param int $uID
	 * @param int $fID
	 * @param string $dAuthor
	 * @param file $file
	 * @return boolean
	 */
	public static function setRestoreKey($uEMailAdress) {
		//global $root;

		$uID = self::getIdFromEmail($uEMailAdress);

		if (Validator::validate(VAL_INTEGER, $uID)) {
			$key = uniqid();
			$db = new db();
			//TODO: uRestoreEndDate berechnen
			if ($db -> insertUpdate('user', array('uRestoreKey' => md5($key), 'uRestoreEndDate' => '9999-99-99'), array('uID' => $uID))) {
				//$mails = new Mails();
				// send mail
				//if ($mails -> resetPasswordMailSend($key, $dealerID, $root)) {
				return true;
				// }
			}
		}
		return false;
	}

	public static function checkRestoreKey($uRestoreKey) {
		if (Validator::validate(VAL_ALPHANUMERIC, $uRestoreKey)) {
			$key = md5($key);
			$today = date("Y-m-d");
			$db = new db();
			$db -> read("SELECT uID FROM user WHERE `uRestoreKey` = '$uRestoreKey' and uRestoreEndDate <= '$today' LIMIT 1");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['id'])) {
				$id = $row['id'];
			} else
				$messages[] = array('type' => 'error', 'text' => 'Der Key ist falsch oder nicht mehr gültig, Bitte fordnern Sie einen neuen Key an!');
		} else
			$messages[] = array('type' => 'error', 'text' => 'Der Key hat kein gültiges Format. Bitte fordnern Sie einen neuen Key an!');

		$return['id'] = $id;
		$return['messages'] = $messages;

		return $return;
	}

	public static function setUserPassword($password1, $password2, $uID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $uID)) {

			$return = self::checkNewPassword($password1, $password2);

			if ($return == true) {
				$db = new db();
				// TODO: Use self::setUserPassword function
				if ($db -> insertUpdate('user', array('uPassword' => md5($password1), 'uRestoreKey' => '', 'uRestoreEndDate' => '0000-00-00'), array('uID' => $uID))) {
					$message[] = array('type' => 'save', 'text' => 'Neues Passwort wurde gespeichert, bitte loggen Sie sich nun mit Ihrem neuen Passwort ein.');
					$state = true;
					// TODO: Need Logout
					// LoginAccess::logout();
				} else {
					$message[] = array('type' => 'error', 'text' => 'Passwort konnte nicht gespeichert werden!');
				}
			} else {
				$message = $return;
			}
		} else {
			$message[] = array('type' => 'error', 'text' => 'uID fehlt.');
		}
		$return['state'] = $state;
		$return['messages'] = $message;
		return $return;
	}

	public static function setUserPassword($password1) {
		// TODO: Not imp.
		throw new Exception('Not implemented');
	}

	public static function setMailNotofication() {
		// TODO: Not imp.
		throw new Exception('Not implemented');
	}

	private static function checkNewPassword($password1, $password2) {
		if (Validator::validate(VAL_PASSWORD, $password1) and Validator::validate(VAL_PASSWORD, $password2)) {
			if ($pw1 != '' and $pw1 == $pw2) {
				if (strlen($pw1) >= 8) {
					return true;
				} else {
					$message[] = array('type' => 'error', 'text' => 'Passwort ist zu kurz, min 8 Zeichen!');
				}
			} else {
				$message[] = array('type' => 'error', 'text' => 'Passwörter sind nicht gleich!');
			}
		}
		return $message;
	}

}
?>