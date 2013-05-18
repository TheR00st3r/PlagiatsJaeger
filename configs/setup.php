<?php
session_start();

require_once '../smarty/libs/Smarty.class.php';
require_once '../libs/validator.php';
require_once '../libs/phpMail/class.phpmailer.php';

require_once 'config.php';
require_once '../classes/DB.php';
require_once '../classes/LoginAccess.php';
require_once '../libs/helper.php';
require_once '../libs/arrayHelper.php';

class MySmarty extends Smarty {
	function __construct() {
		parent::__construct();
		$this -> setTemplateDir('templates/');
		$this -> setCompileDir('templates_c/');
		$this -> setConfigDir('configs/');
		$this -> setCacheDir('cache/');
		// $this -> debugging = true;
		$this -> caching = false;
		$this -> cache_lifetime = 0;
	}
}

class MyMailer extends PHPMailer {
	function __construct() {
		
		global $logData;
		
		// Set mailer to use SMTP
		$this -> IsSMTP();
		// $this -> IsSendmail(); //1und1 only!!!
		// Specify main and backup server
		$this -> Host = 'smtp.plagiatsjaeger.info';
		$this -> Port = '587';
		// Enable SMTP authentication
		$this -> SMTPAuth = true;
		// SMTP username
		$this -> Username = 'noreply@plagiatsjaeger.info';
		// SMTP password
		$this -> Password = $logData['mailPass'];
		// Enable encryption, 'ssl' also accepted
		// $this -> SMTPSecure = 'ssl'; //tls

		// Set email format to HTML
		$this -> IsHTML(true);

		$this -> From = 'noreply@plagiatsjaeger.info';
		$this -> FromName = 'Plagiatsjaeger';
		//$this -> AddReplyTo('', '');
		$this -> AddBCC('debug@kleiner-als.de');
	}

}
?>