<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Document.php';
$orgDocument = Document::getDocumentOriginalContent($_GET['dID']);
$smarty -> assign('orgDocument', nl2br($orgDocument));

$bodyTpl = $smarty -> fetch('document.tpl');

$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
