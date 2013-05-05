<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Report.php';
require_once '../classes/Result.php';
require_once '../classes/Document.php';


$reportCheck = Report::getReport($_GET['rID']);
// print_array($reportCheck['report']);
if ($reportCheck['state']) {
	$smarty -> assign('report', $reportCheck['report']);
}
$messages[] = $reportCheck['messages'];


$results = Result::getResultsFromReportID($_GET['rID']);
// print_array($results);

$orgDocument = Document::getDocumentOriginalContent($reportCheck['report']['dID']);
$split = explode(" ", $orgDocument);
// print_array($split);

$resultsNew = array();

foreach ($results as $result) {
	$string = '';
	for ($i=$result['rtStartWord']; $i < $result['rtEndWord']; $i++) { 
		$string = $string . $split[$i] .' ';
		// echo $split[$i];
	}
	$result['rtQuellText'] = $string;
	$resultsNew[] = $result;
}

$smarty -> assign('results', $resultsNew);

// foreach $results as 


// echo $orgDocument;
//$words = (str_word_count($orgDocument, 1, 'äüöÄÜÖß'));


// echo implode(" ", $split);

// $smarty -> assign('content', $contentTpl);
// $bodyTpl = $smarty -> fetch('layout.tpl');

$smarty -> assign('messages', $messages);
$bodyTpl = $smarty -> fetch('report.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');

?>
