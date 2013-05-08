<?php
require_once '../classes/Mail.php';
class User {

	/**
	 * Returns all users from database.
	 * @return array
	 */
	public static function getAllUser() {
		
		$cID = LoginAccess::getClientID();
		$uID = LoginAccess::getUserID();

		$db = new db();
		$db -> read("
				SELECT
					u.uID, u.uName, u.uLastname, u.uEMailAdress, u.uPermissonLevel, u.cID, c.cName,
					u.uThreshold, u.uCheckWWW, sl.slTitle, sl.slSearchSentenceLength, sl.slSearchJumpLength, sl.slCompareSentenceLength, sl.slCompareJumpLength
				FROM
					user AS u LEFT JOIN settinglevel AS sl ON u.slID = sl.slID
					LEFT JOIN client AS c ON u.cID = c.cID
				WHERE
					u.cID = '$cID' and u.uID != '$uID'
				ORDER BY
					 u.uLastname ASC, u.uName ASC");

		return $db -> linesAsArray();
	}

	/**
	 * Returns the user infos from the given user id.
	 * @return array
	 */
	public static function getUser($uID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			$db -> read("
				SELECT
					u.uID, u.uName, u.uLastname, u.uEMailAdress, u.uPassword, u.uPermissonLevel, u.uSentenceLength, u.uJumpLength, u.uTreshold
				FROM
					user AS u
				WHERE 
					 u.uID = $uID
				LIMIT
					1
				");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['uID'])) {
				$user = $row;
				$state = true;
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Id ist nicht gültig.');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'ID hat kein gültiges Format.');
		}
		$return['user'] = $user;
		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;

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
	public static function newUser($uName, $uLastname, $uEMailAdress, $uPassword, $uPermissonLevel, $cID = null) {
		$state = false;
		if (!Validator::validate(VAL_INTEGER, $cID, true)) {
			$cID = LoginAccess::getClientID();
		}
		if (Validator::validate(VAL_STRING, $uName, true) and Validator::validate(VAL_STRING, $uLastname, true) and Validator::validate(VAL_EMAIL, $uEMailAdress, true) and Validator::validate(VAL_PASSWORD, $uPassword, true) and Validator::validate(VAL_INTEGER, $uPermissonLevel, true) and Validator::validate(VAL_INTEGER, $cID, true)) {
			$db = new db();
			if ($db -> insert('user', array('uName' => $uName, 'uLastname' => $uLastname, 'uEMailAdress' => $uEMailAdress, 'uPassword' => md5($uPassword), 'uPermissonLevel' => $uPermissonLevel, 'uSentenceLength' => '0', 'uJumpLength' => '0', 'uTreshold' => '0', 'cID' => $cID))) {
				$state = true;
				$messages[] = array('type' => 'save', 'text' => 'Benutzer erfolgreich angelegt.');
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Benuter konnte nicht gespeichert werden.');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'Bitte füllen Sie alle Felder aus.');
		}
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;

	}

	/**
	 * Adds a new user to the database an sends a mail to the client administrator.
	 * @param string $uName
	 * @param string $uLastname
	 * @param string $uEMailAdress
	 * @param string $uPassword
	 * @param string $uPassword2
	 * @param int $cID
	 * @return boolean
	 */
	public static function registrateUser($uName, $uLastname, $uEMailAdress, $uPassword, $uPassword2, $cNumber) {
		$state = true;
		$pwCheck = self::checkNewPassword($uPassword, $uPassword2);
		if ($pwCheck['state'] == true) {
			$cIDCheck = self::getClientIDfromClientNumber($cNumber);
			if ($cIDCheck['state'] == true) {
				$userCheck = self::newUser($uName, $uLastname, $uEMailAdress, $uPassword, 1, $cIDCheck['cID']);
				if ($userCheck['state']) {
					$state = true;
					$mail = new Mail();
					$mailCheck = $mail -> registrate($cIDCheck['cAdmin'], $uName, $uLastname, $uEMailAdress);
					if ($mailCheck['state'] == true) {
						$state = true;
					}
					$messages = $mailCheck['messages'];
					$messages[] = array('type' => 'save', 'text' => 'Erfolgreich registiertier, sie werden nach der Freischaltung durch Ihren Administrator benachrichtigt.');
				} else
					$messages = $userCheck['messages'];
			} else
				$messages = $cIDCheck['messages'];
		} else
			$messages = $pwCheck['messages'];

		$return['uID'] = $uID;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Add the uploaded file infos to the database and starts the file copy.
	 * @param int $uEMailAdress
	 * @param int $fID
	 * @param string $dAuthor
	 * @param file $file
	 * @return boolean
	 */
	public static function setRestoreKey($uEMailAdress) {

		$uIDCheck = self::getIdFromEmail($uEMailAdress);

		if ($uIDCheck['state'] == true) {
			$uRestoreKey = uniqid();
			$uRestoreEndDate = date("Y-m-d", mktime(0, 0, 0, date("m"), date("d") + 1, date("Y")));
			$db = new db();
			if ($db -> update('user', array('uRestoreKey' => md5($uRestoreKey), 'uRestoreEndDate' => $uRestoreEndDate), array('uID' => $uIDCheck['uID']))) {
				$mail = new Mail();
				$mailCheck = $mail -> forgotPasswordMailSend($uRestoreKey, $uIDCheck['uID']);
				if ($mailCheck['state'] == true) {
					$state = true;
				}
				$messages = $mailCheck['messages'];
			}
		} else
			$messages = $uIDCheck['messages'];

		$return['uID'] = $uID;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;

	}

	/**
	 * Checks if the given restore key is valide and returns the usere id.
	 * @param string $uRestoreKey
	 * @return int $uID
	 */
	public static function checkRestoreKey($uRestoreKey) {
		$state = false;
		if (Validator::validate(VAL_ALPHANUMERIC, $uRestoreKey)) {
			$uRestoreKey = md5($uRestoreKey);
			$today = date("Y-m-d");
			$db = new db();
			$db -> read("SELECT uID FROM user WHERE `uRestoreKey` = '$uRestoreKey' and uRestoreEndDate >= '$today' LIMIT 1");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['uID'], true)) {
				$uID = $row['uID'];
				$state = true;
			} else
				$messages[] = array('type' => 'error', 'text' => 'Der Key ist falsch oder nicht mehr gültig, Bitte fordnern Sie einen neuen Key an!');
		} else
			$messages[] = array('type' => 'error', 'text' => 'Der Key hat kein gültiges Format. Bitte fordnern Sie einen neuen Key an!');

		$return['uID'] = $uID;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Saves a new password for the given user id.
	 * @param string $password1
	 * @param string $password2
	 * @param int $uID
	 * @return int $uID
	 */
	public static function setUserPassword($password1, $password2, $uID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $uID)) {
			$pwCheck = self::checkNewPassword($password1, $password2);
			if ($pwCheck['state'] == true) {
				$db = new db();
				if ($db -> insertUpdate('user', array('uPassword' => md5($password1), 'uRestoreKey' => '', 'uRestoreEndDate' => '0000-00-00'), array('uID' => $uID))) {
					$messages[] = array('type' => 'save', 'text' => 'Neues Passwort wurde gespeichert, bitte loggen Sie sich nun mit Ihrem neuen Passwort ein.');
					$state = true;
					// TODO: Need Logout?
					LoginAccess::logout();
				} else {
					$messages[] = array('type' => 'error', 'text' => 'Passwort konnte nicht gespeichert werden!');
				}
			} else {
				$messages = $pwCheck['messages'];
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'uID fehlt.');
		}
		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
	}

	public static function setMailNotofication() {
		// TODO: setMailNotofication not imp.
		throw new Exception('Not implemented');
	}

	public static function activateUser($uID, $uPermissonLevel) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $uPermissonLevel, true) and Validator::validate(VAL_INTEGER, $uID, true)) {
			$db = new db();
			if ($db -> ifExist('user', array('uID' => $uID))) {
				if ($db -> update('user', array('uPermissonLevel' => $uPermissonLevel), array('uID' => $uID))) {
					$state = true;
					$messages[] = array('type' => 'save', 'text' => 'Benutzer erfolgreich freigeschlaten.');
				} else {
					$messages[] = array('type' => 'error', 'text' => 'Benuter konnte nicht freigeschlaten werden.');
				}
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Benutzer existiert nicht.');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'Berechtigung oder Benutzer ID ungültig.');
		}
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	public static function deleteUser($uID) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $uID, true)) {
			if ($uID != LoginAccess::getUserID()) {
				$db = new db();
				if ($db -> deleteWithWhereArray('user', array('uID' => $uID))) {
					$state = true;
					$messages[] = array('type' => 'save', 'text' => 'Benutzer erfolgreich gelöscht.');
				} else {
					$messages[] = array('type' => 'error', 'text' => 'Benuter konnte nicht gelöscht werden.');
				}
			} else {
				$messages[] = array('type' => 'info', 'text' => 'Sie haben versucht sich selber zu löschen :-).');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'Benutzer ID ungültig.');
		}
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	private static function checkNewPassword($password1, $password2) {
		$state = false;
		if (Validator::validate(VAL_PASSWORD, $password1, true) and Validator::validate(VAL_PASSWORD, $password2, true)) {
			if ($password1 == $password2) {
				if (strlen($password1) >= 8) {
					$state = true;
					$messages[] = array('type' => 'save', 'text' => 'Passwörter sind ok.');
				} else {
					$messages[] = array('type' => 'error', 'text' => 'Passwort ist zu kurz, min 8 Zeichen!');
				}
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Passwörter sind nicht gleich!');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'Passwörter haben kein gültiges Format.');
		}

		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
	}

	private static function getClientIDfromClientNumber($cNumber) {
		$state = false;
		if (Validator::validate(VAL_INTEGER, $cNumber, true)) {
			$db = new DB();
			$db -> read("SELECT c.cID, c.cAdmin FROM client AS c WHERE c.cNumber = '$cNumber'");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['cID'], true)) {
				$cID = $row['cID'];
				$cAdmin = $row['cAdmin'];
				$state = true;
				$messages[] = array('type' => 'save', 'text' => 'Mandantenummer ist gültig.');
			} else {
				$messages[] = array('type' => 'error', 'text' => 'Mandantenummer ist nicht gültig.');
			}
		} else {
			$messages[] = array('type' => 'error', 'text' => 'Mandantenummer hat kein gültiges Format.');
		}

		$return['cID'] = $cID;
		$return['cAdmin'] = $cAdmin;
		$return['state'] = $state;
		$return['messages'] = $messages;
		return $return;
	}

	/**
	 * Returns the user id from the given emailaddress

	 * @param string $uEMailAdress
	 * @return int $cID
	 */
	private static function getIdFromEmail($uEMailAdress) {
		$state = false;
		if (Validator::validate(VAL_EMAIL, $uEMailAdress, true)) {
			$db = new db();
			$db -> read("SELECT uID FROM user WHERE uEMailAdress = '$uEMailAdress' and uEMailAdress != ''");
			$row = $db -> lines();
			if (Validator::validate(VAL_INTEGER, $row['uID'])) {
				$uID = $row['uID'];
				$state = true;
			} else
				$messages[] = array('type' => 'error', 'text' => 'eMail-Adresse ist falsch.');
		} else
			$messages[] = array('type' => 'error', 'text' => 'Die eMail-Adresse hat kein gültiges Format.');

		$return['uID'] = $uID;
		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

}
?>