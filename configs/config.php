<?php

if ($_SERVER['SERVER_NAME'] == 'localhost') {
	$logData['host'] = 'localhost';
	$logData['user'] = 'root';
	$logData['pass'] = 'p4EHd4qL2pvy8';
	$logData['database'] = 'plagiatsjaeger';
	$logData['uploadpath'] = '../uploads/';
	$logData['debug'] = true;
	// require_once '../../database.php';
	require_once '../../mail.php';
	
	$backendUrl = 'http://localhost:8080/PlagiatsJaeger/';
	$root = 'http://localhost:8888/webseiten/plagiatsjaeger-app/htdocs/';

} else {
	require_once '../../database.php';
	require_once '../../mail.php';
	
	$logData['uploadpath'] = '../uploads/';
	$logData['debug'] = true;
	
	$backendUrl = 'http://localhost:8080/PlagiatsJaeger/';
	$root = 'http://192.168.4.28/';
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