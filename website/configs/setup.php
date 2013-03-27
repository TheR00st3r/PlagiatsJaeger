<?php
session_start();

ini_set("display_errors", 1);
error_reporting(1);

// Smarty Library Dateien laden
require_once '../../smarty/libs/Smarty.class.php';
require_once '../../libs/validator.php';
// require_once '../../libs/phpMail/class.phpmailer.php';

// require_once '../../libs/bbcode/src/stringparser_bbcode.class.php';
// $bbcode = new StringParser_BBCode();
// $bbcode -> addCode('h2', 'simple_replace', null, array('start_tag' => '<h2>', 'end_tag' => '</h2>'), 'inline', array('block', 'inline'), array());
// $bbcode -> addCode('h3', 'simple_replace', null, array('start_tag' => '<h3>', 'end_tag' => '</h3>'), 'inline', array('block', 'inline'), array());
// $bbcode -> addCode('b', 'simple_replace', null, array('start_tag' => '<b>', 'end_tag' => '</b>'), 'inline', array('block', 'inline'), array());
// $bbcode -> addCode('i', 'simple_replace', null, array('start_tag' => '<i>', 'end_tag' => '</i>'), 'inline', array('block', 'inline'), array());

// ein guter Platz um Applikations spezifische Libraries zu laden
// require('guestbook/guestbook.lib.php');

require_once 'config.php';
require_once '../classes/DB.php';
require_once '../classes/LoginAccess.php';
// require_once 'classes/search.php';
require_once '../../libs/helper.php';
require_once '../../libs/arrayHelper.php';
// require_once 'classes/navigation.php';
// require_once 'functions/_all.php';
// require_once("../libs/validformbuilder_v.1.0.1/libraries/ValidForm/class.validform.php");

// require_once 'functions/fontsize/fontsize.inc.php';
// require_once 'functions/invert/invert.inc.php';

class MySmarty extends Smarty {
	function __construct() {
		// Konstruktor. Diese Werte werden f&uuml;r jede Instanz automatisch gesetzt
		// $this -> Smarty();

		parent::__construct();

		$this -> setTemplateDir('templates/');
		$this -> setCompileDir('templates_c/');
		$this -> setConfigDir('configs/');
		$this -> setCacheDir('cache/');

		// $this -> debugging = true;
		$this -> caching = false;
		$this -> cache_lifetime = 0;
		//$this -> assign('app_name', 'Guest Book');

		//$this->display('main.tpl');

		//echo 'konstruktor';
	}

}

// class MyMailer extends PHPMailer {
	// function __construct() {
// 		
		// // Set mailer to use SMTP
		// //$this -> IsSMTP();
		// $this -> IsSendmail(); //1und1 only!!!
		// // Specify main and backup server
		// $this -> Host = 'smtp.1und1.de';
		// // Enable SMTP authentication
		// $this -> SMTPAuth = true;
		// // SMTP username
		// $this -> Username = 'auftrag@helptech.de';
		// // SMTP password
		// $this -> Password = 'Xob7RmZs9IPx';
		// // Enable encryption, 'ssl' also accepted
		// $this -> SMTPSecure = 'tls';
// 
		// // Set email format to HTML
		// $this -> IsHTML(true);
// 
		// $this -> From = 'auftrag@helptech.de';
		// $this -> FromName = 'HelpTech.de';
		// $this -> AddReplyTo('auftrag@helptech.de', 'Help Tech');
		// $this -> AddBCC('debug@kleiner-als.de');
	// }
// 
// }
?>