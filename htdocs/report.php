<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

$smarty -> assign('root', $root);

require_once '../classes/Report.php';
require_once '../classes/Result.php';
require_once '../classes/Document.php';

$reportCheck = Report::getReportInfos($_GET['rID']);
if ($reportCheck['state']) {
	$smarty -> assign('report', $reportCheck['report']);
}
$messages[] = $reportCheck['messages'];

switch ($_GET['type']) {
	case 'grafic' :
		$reportContent = 'report/grafic.tpl';
		break;
	case 'all' :
		$results = Result::getAllReportResult($_GET['rID']);

		$orgDocument = Document::getDocumentOriginalContent($reportCheck['report']['dID']);
		$split = explode(" ", $orgDocument);

		$resultsNew = array();

		$output = array();

		foreach ($results as $result) {

			$key = $result['rtStartWord'];

			if (array_key_exists($key, $output)) {

				$source['rtSourceText'] = $result['rtSourceText'];
				$source['rtSourcedID'] = $result['rtSourcedID'];
				$source['rtSourceLink'] = $result['rtSourceLink'];
				$source['rtSimilarity'] = $result['rtSimilarity'];
				$output[$key]['source'][] = $source;

			} else {

				$string = '';
				for ($i = $result['rtStartWord']; $i < $result['rtEndWord']; $i++) {
					$string = $string . $split[$i] . ' ';
				}

				$item['rtStartWord'] = $result['rtStartWord'];
				$item['rtEndWord'] = $result['rtEndWord'];
				$item['rtQuellText'] = $string;
				$source['rtSourceText'] = $result['rtSourceText'];
				$source['rtSourcedID'] = $result['rtSourcedID'];
				$source['rtSourceLink'] = $result['rtSourceLink'];
				$source['rtSimilarity'] = $result['rtSimilarity'];
				$item['source'][] = $source;

				$output[$key] = $item;
			}
		}
		$reportContent = 'report/all.tpl';
		break;
	default :
		//short
		$output = Result::getShortReportResult($_GET['rID']);
		// print_array($output);
		$reportContent = 'report/short.tpl'; 
		break;
}

$smarty -> assign('results', $output);
// $temp = $smarty -> fetch($reportContent);
$smarty -> assign('reportContent', $smarty -> fetch($reportContent));

$smarty -> assign('messages', $messages);
$bodyTpl = $smarty -> fetch('report.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
