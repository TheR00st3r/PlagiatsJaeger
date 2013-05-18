<?php
class Mail {

	private $smarty;

	public function __construct() {
		$this -> smarty = new MySmarty();
	}

	/**
	 * Send mail to client administrator after user registration.
	 * @param string $uEMailAdress
	 * @param int $cID
	 * @return boolean
	 */
	public function registrate($uID, $uName, $uLastname, $uEMailAdress) {

		global $root;
		$state = false;

		$uIDCheck = User::getUser($uID);
		if ($uIDCheck['state'] == true) {

			$this -> smarty -> assign('user', $uIDCheck['user']);
			$this -> smarty -> assign('newUser', $uName . ' ' . $uLastname . ' (' . $uEMailAdress . ')');
			$this -> smarty -> assign('root', $root);

			$body = $this -> smarty -> fetch('mail/registrate.tpl');
			$this -> smarty -> assign('body', $body);
			$mailContent = $this -> smarty -> fetch('mail/layout.tpl');

			$mail = new MyMailer();
			$mail -> Subject = 'Neue Registrierung';

			$mail -> AddAddress($uIDCheck['user']['uEMailAdress']);

			$mail -> Body = $mailContent;

			if ($mail -> Send()) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Mail versendet.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => $mail -> ErrorInfo
				);

		} else
			$messages = $uIDCheck['messages'];

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	public function forgotPasswordMailSend($key, $uID) {

		global $root;

		require_once '../classes/User.php';
		$state = false;
		$uIDCheck = User::getUser($uID);
		if ($uIDCheck['state'] == true) {

			$this -> smarty -> assign('user', $uIDCheck['user']);
			$this -> smarty -> assign('root', $root);
			$this -> smarty -> assign('key', $key);

			$body = $this -> smarty -> fetch('mail/forgot-password.tpl');
			$this -> smarty -> assign('body', $body);
			$mailContent = $this -> smarty -> fetch('mail/layout.tpl');

			$mail = new MyMailer();
			$mail -> Subject = 'Passwortanfrage bestätigen';

			$mail -> AddAddress($uIDCheck['user']['uEMailAdress'], $uIDCheck['user']['uName'] . ' ' . $uIDCheck['user']['uLastname']);

			$mail -> Body = $mailContent;

			if ($mail -> Send()) {
				$state = true;
				$messages[] = array(
					'type' => 'save',
					'text' => 'Mail versendet.'
				);
			} else
				$messages[] = array(
					'type' => 'error',
					'text' => $mail -> ErrorInfo
				);
		} else
			$messages = $uIDCheck['messages'];

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;

	}

}
?>