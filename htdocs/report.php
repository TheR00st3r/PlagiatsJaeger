<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Result.php';
$smarty -> assign('results', Result::getResultsFromReportID($_GET['rID']));
$bodyTpl = $smarty -> fetch('report.tpl');

// $smarty -> assign('content', $contentTpl);
// $bodyTpl = $smarty -> fetch('layout.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
