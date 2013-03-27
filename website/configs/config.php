<?php

if ($_SERVER['SERVER_NAME'] == 'localhost') {
	$logData['host'] = 'localhost';
	$logData['user'] = 'root';
	$logData['pass'] = 'root';
	$logData['database'] = 'plagiatsjaeger';
	$logData['debug'] = true;

	$root = 'http://localhost:8888/webseiten/plagiatsjaeger-app/website/public/';

} else {
	require_once '../../../database.php';
	
	$logData['debug'] = true;
	
	$root = 'http://192.168.4.28/app/website/public/';
}

//DEBUG
if($logData['debug'] == true) {
	ini_set("display_errors", 1);
	error_reporting(1);
}
else {

	ini_set("display_errors", 0);
	error_reporting(0);
}
?>