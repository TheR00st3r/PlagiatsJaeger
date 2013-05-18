<?php

class Helper {

	public static function print_array($array) {
		echo "<pre>";
		print_r($array);
		echo "</pre>";
	}

	public static function timenow($eins = '-', $zwei = ' ', $drei = ':') {
		return date(Y . $eins . m . $eins . d . $zwei . H . $drei . i . $drei . s);
	}

	public static function nl2p($text) {

		// global $bbcode;

		//$text = $bbcode->parse($text);

		$text = '<p>' . $text . '</p>';
		$text = str_replace("\r\n\r\n", "</p><p>", $text);
		$text = str_replace("\n\n", "</p><p>", $text);
		$text = str_replace("\r\n", "<br />", $text);
		$text = str_replace("\n", "<br />", $text);
		return $text;
	}

	public static function urlString($string) {

		$string = strtolower($string);

		$d1 = array("ä", "ö", "ü", "ß", " ", ".", ",", "&");
		$d2 = array("ae", "oe", "ue", "ss", "-", "-", "-", "-");

		$string = str_replace($d1, $d2, $string);

		$string = preg_replace("/([^0-9a-zA-Z-])/", "_", $string);
		while (stristr($string, "__")) {
			$string = preg_replace("/_/", "", $string);
		}
		return $string;
	}

}
?>