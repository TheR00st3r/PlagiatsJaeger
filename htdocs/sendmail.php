<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Report.php';
$userCheck = Report::getReportInformationForMail($_GET['rID']);
if ($userCheck['state']) {

	$r = $userCheck['report'];

	if ($r['rSimilarity'] > $r['rThreshold'] or $r['rErrorCode'] != 300) {
		require_once '../classes/Mail.php';
		$mail = new Mail();
		$mailCheck = $mail -> reportState($r);
		if ($mailCheck['state'] == true) {
			echo 'true';
		} else
			print_array($mailCheck['messages']);
	} else
		echo 'true';
} else
	print_array($userCheck['messages']);

$smarty -> display('_maske.tpl');
?>
