<?php
class Mail {

	private $smarty;

	public function __construct() {
		$this -> smarty = new MySmarty();
	}

	/**
	 * Send mail to client administrator after user registration.
	 * @param int $uID
	 * @param string $uName
	 * @param string $uLastname
	 * @param string $uEMailAdress
	 * @return void
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

	/**
	 * Send mail to user after account activating.
	 * @param int $uID
	 * @return void
	 */
	public function activate($uID) {

		global $root;
		$state = false;

		$uIDCheck = User::getUser($uID);
		if ($uIDCheck['state'] == true) {

			$this -> smarty -> assign('user', $uIDCheck['user']);
			$this -> smarty -> assign('root', $root);

			$body = $this -> smarty -> fetch('mail/activated.tpl');
			$this -> smarty -> assign('body', $body);
			$mailContent = $this -> smarty -> fetch('mail/layout.tpl');

			$mail = new MyMailer();
			$mail -> Subject = 'Account activiert';

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
	
	/**
	 * Send mail to user after report with report informations.
	 * @param array $report
	 * @return void
	 */
	public function reportState($report) {

		global $root;
		$state = false;

		$this -> smarty -> assign('r', $report);
		$this -> smarty -> assign('root', $root);

		$body = $this -> smarty -> fetch('mail/reportState.tpl');
		$this -> smarty -> assign('body', $body);
		$mailContent = $this -> smarty -> fetch('mail/layout.tpl');

		$mail = new MyMailer();
		$mail -> Subject = $report['eName'] . ' - ' . $report['dOriginalName'];

		$mail -> AddAddress($report['uEMailAdress']);

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

		$return['state'] = $state;
		$return['messages'] = $messages;

		return $return;
	}

	/**
	 * Send mail with forgot reset key to user.
	 * @param string $key
	 * @param int $uID
	 * @return void
	 */
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