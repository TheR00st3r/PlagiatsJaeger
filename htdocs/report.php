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

// load original document
$documentCheck = Document::getDocumentOriginalContent($reportCheck['report']['dID']);
if ($documentCheck['state']) {
	$split = explode(" ", $documentCheck['file']);
} else {
	$split = '';
	$messages = array_merge($messages, $documentCheck['messages']);
}

switch ($_GET['type']) {
	case 'grafic' :
		$title = 'Grafikbericht';

		$results = Result::getGraficReportResult($_GET['rID'], $reportCheck['report']['rThreshold'], $_GET['rtSourceLink'], $_GET['rtSourcedID']);
		$sim = $reportCheck['report']['rThreshold'];

		$color[0]['value'] = 'Zitiert';
		$color[0]['color'] = '#00FF00';
		$color[1]['value'] = $sim;
		$color[1]['color'] = '#ffff00';
		$color[2]['value'] = $sim + (100 - $sim) * 1 / 3;
		$color[2]['color'] = '#FF7722';
		$color[3]['value'] = $sim + (100 - $sim) * 2 / 3;
		$color[3]['color'] = '#CA8989';

		//
		// echo $sim.'<br />';
		// echo $color1.'<br />';
		// echo $color2.'<br />';
		// echo $color3.'<br />';

		// echo count($split);

		$start = 0;
		$array = array();

		foreach ($results as $result) {

			if ($start < $result['rtEndWord'] - 5) {// and ($result['rtEndWord'] - $result['rtStartWord']) > 10) {

				if ($start > $result['rtStartWord']) {
					//$start = $result['rtStartWord'];
					$result['rtStartWord'] = $start;
				} else {

					// TYP 0 - kein Plagiat
					$string = '';
					for ($i = $start; $i < $result['rtStartWord']; $i++) {
						$string .= $split[$i] . ' ';
					}

					$out = array();

					$out['type'] = 0;
					$out['rtStartWord'] = $start;
					$out['rtEndWord'] = $result['rtStartWord'];
					$out['rtQuellText'] = $string;
					$out['start'] = $start;
					$out['stop'] = $result['rtStartWord'];

					$array[] = $out;

				}

				// TYP 1 - Plagiat
				$string = '';
				for ($i = $result['rtStartWord']; $i < $result['rtEndWord']; $i++) {
					$string .= $split[$i] . ' ';
				}

				$out = array();

				$out = $result;
				$out['type'] = 1;
				$out['rtQuellText'] = $string;
				$out['start'] = $result['rtStartWord'];
				$out['stop'] = $result['rtEndWord'];

				$array[] = $out;

				$start = $result['rtEndWord'];

				// $output = $string;
			}

		}

		if ($start < count($split)) {
			$string = '';
			for ($i = $start; $i < count($split); $i++) {
				$string .= $split[$i] . ' ';
			}

			$out = array();
			$out['type'] = 0;
			$out['rtStartWord'] = $start;
			$out['rtEndWord'] = $result['rtStartWord'];
			$out['rtQuellText'] = $string;
			$out['start'] = $start;
			$out['stop'] = count($split);

			$array[] = $out;
		}

		foreach ($array as $a) {
			//TODO DEBUG [xx-xx]
			// $output .= '|' . $a['start'] . '-' . $a['stop'] . '|';
			if ($a['type'] != 0) {

				if($a['rtIsInSources'] == 1)
					$background = $color[0]['color'];
				else if ($a['rtSimilarity'] >= $color[2]['value'])
					$background = $color[3]['color'];
				else if ($a['rtSimilarity'] >= $color[1]['value'])
					$background = $color[2]['color'];
				else if ($a['rtSimilarity'])
					$background = $color[1]['color'];

				//TODO DEBUG [xx-xx] //[' . $a['rtStartWord'] . '-' . $a['rtEndWord'] . ']
				$source = '';
				if($a['rtSourcedID']) {
					$source = '<b>(' . $a['dOriginalName'] . ' zu ' . $a['rtSimilarity'] . ' %)</b>';
				}
				else {
					$source = '<b>(<a target="_blank" href="' . $a['rtSourceLink'] . '" title="' . $a['rtSourceLink'] . '" />' . $a['rtSimilarity'] . ' %</a>)</b>';
				}
				
				$output .= '<div class="rtSourceText">' . nl2br($a['rtSourceText']) . ' '.$source.'</div>';
				$output .= '<span style="background: ' . $background . ';">' . nl2br($a['rtQuellText']) . '</span>';

			} else {
				$output .= nl2br($a['rtQuellText']);
			}
		}

		// print_array($output);
		$reportContent = 'report/grafic.tpl';
		break;
	case 'all' :
		$title = 'Resultatbericht';
		$results = Result::getAllReportResult($_GET['rID']);

		$resultsNew = array();

		$output = array();

		foreach ($results as $result) {

			$item = array();
			$source = array();
			$string = '';

			$key = $result['rtStartWord'];

			if (array_key_exists($key, $output)) {

				$output[$key]['source'][] = $result;

			} else {

				for ($i = $result['rtStartWord']; $i < $result['rtEndWord']; $i++) {
					$string .= $split[$i] . ' ';
				}

				$item['rtStartWord'] = $result['rtStartWord'];
				$item['rtEndWord'] = $result['rtEndWord'];
				$item['rtQuellText'] = $string;

				$item['source'][] = $result;

				$output[$key] = $item;
			}
		}
		$reportContent = 'report/all.tpl';
		// print_array($output);
		break;
	default :
		$title = 'Schnellbericht';
		//short
		$output = Result::getShortReportResult($_GET['rID']);
		// print_array($output);
		$reportContent = 'report/short.tpl';
		break;
}

$smarty -> assign('color', $color);
$smarty -> assign('results', $output);
$smarty -> assign('title', $title);
// $temp = $smarty -> fetch($reportContent);
$smarty -> assign('reportContent', $smarty -> fetch($reportContent));

$smarty -> assign('messages', $messages);
$bodyTpl = $smarty -> fetch('report.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
