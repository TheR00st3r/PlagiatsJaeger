<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * Smarty money_format modifier plugin
 *
 * Type:     modifier<br>
 * Name:     money_format<br>
 * Purpose:  Formats a number with prefixed zeros
 * @param float
 * @param integer (default 0)
 * @return string (html-encoded)
 */
function smarty_modifier_number_format($number, $count = 1) {
	if(strlen($number) < $count) {
		$string = '';
		$anzNullen = $count - strlen($number);
		for($i; $i<$anzNullen; $i++) {
			$string .= '0';
		}
		return $string.$number;
	}
	return $number;
}
?>