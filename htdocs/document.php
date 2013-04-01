<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Document.php';
$bodyTpl = Document::getDocumentOriginalContent($_GET['dID']);

$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
