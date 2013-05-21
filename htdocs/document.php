<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Document.php';
$dokumentCheck = Document::getDocumentOriginalContent($_GET['dID']);
if ($dokumentCheck['state']) {
	$smarty -> assign('orgDocument', nl2br($dokumentCheck['file']));
} else
	$smarty -> assign('messages', $dokumentCheck['messages']);

$bodyTpl = $smarty -> fetch('document.tpl');

$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
