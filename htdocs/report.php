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
		$orgDocument = Document::getDocumentOriginalContent($reportCheck['report']['dID']);
		$split = explode(" ", $orgDocument);

		$results = Result::getGraficReportResult($_GET['rID']);
		$sim = $reportCheck['report']['rThreshold'];
		$color1 = $sim;
		$color2 = $sim + (100 - $sim) * 1 / 3;
		$color3 = $sim + (100 - $sim) * 2 / 3;
		//
		// echo $sim.'<br />';
		// echo $color1.'<br />';
		// echo $color2.'<br />';
		// echo $color3.'<br />';

		// echo count($split);

		$start = 0;
		$array = array();

		foreach ($results as $result) {

			if ($start > $result['rtStartWord']) {
				//$start = $result['rtStartWord'];
				$result['rtStartWord'] = $start;
			} else {

				$string = '';
				for ($i = $start; $i < $result['rtStartWord']; $i++) {
					$string = $string . $split[$i] . ' ';
				}

				$out = array();

				$out['type'] = 0;
				$out['rtStartWord'] = $start;
				$out['rtEndWord'] = $result['rtStartWord'];
				$out['rtQuellText'] = $string;

				$array[] = $out;

			}

			$string = '';
			for ($i = $result['rtStartWord']; $i < $result['rtEndWord']; $i++) {
				$string = $string . $split[$i] . ' ';
			}

			$out = array();

			$out = $result;
			$out['type'] = 1;
			$out['rtQuellText'] = $string;

			$array[] = $out;

			$start = $result['rtEndWord'];

			// $output = $string;

		}

		if ($start < count($split)) {
			$string = '';
			for ($i = $start; $i < count($split); $i++) {
				$string = $string . $split[$i] . ' ';
			}

			$out = array();
			$out['type'] = 0;
			$out['rtStartWord'] = $start;
			$out['rtEndWord'] = $result['rtStartWord'];
			$out['rtQuellText'] = $string;

			$array[] = $out;
		}

		foreach ($array as $a) {
			$output .= '|||';
			if ($a['type'] != 0) {

				if ($a['rtSimilarity'] >= $color3)
					$background = '#f00';
				else if ($a['rtSimilarity'] >= $color2)
					$background = '#FF7722';
				else if ($a['rtSimilarity'])
					$background = '#ff0';

				// $background = ($a['rtSimilarity'] > $red) ? '#F00' : '#FAFB00';
				$output .= '<div class="rtSourceText">' . $a['rtSourceText'] . ' <b> [' . $a['rtStartWord'] . '-' . $a['rtEndWord'] . '](<a target="_blank" href="' . $a['rtSourceLink'] . '">' . $a['rtSimilarity'] . ' %</a>)</b></div>';
				$output .= '<span style="background: ' . $background . ';">' . nl2br($a['rtQuellText']) . '</span>';
				
			} else {
				$output .= nl2br($a['rtQuellText']);
			}
		}

		// print_array($output);
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
