<?php
function print_array($array) {
	echo "<pre>";
	print_r($array);
	echo "</pre>";
}

function deleteItem($array, $i) {
	unset($array[$i]);
	return array_values($array);
}

function emptyItems($var) {
	return(!empty($var));
} 

function deleteEmptyItems($array) {
	$array = array_filter($array, "emptyItems");
	return $array;
}

function lastItem($array) {
	return end($array);
}

function firstItem($array) {
	return reset($array);
}

function trimArray($input){
	if (!is_array($input))
		return trim($input);
	return array_map('trimArray', $input);
}
?>