<?php

class Validator {
	static $checkTypes = array(
		VAL_STRING => '/^[-a-zàáâãäåæçèéêëìíîïðñòóôõöøùúûüý€0-9\s*\.\'\/",_()|& ]*$/i',
		// VAL_TEXT => '/^[-a-zàáâãäåæçèéêëìíîïðñòóôõöøùúûüý€0-9:\)\(\s*\.\'\/"_,?#@^*!&() ]*$/i',
		// VAL_NUMERIC => '/^[0-9,\.]*$/i',
		VAL_ALPHANUMERIC => '/^[a-zA-Z0-9]*$/i',
		VAL_INTEGER => '/^[0-9]*$/i',
		VAL_WORD => '/^[-a-zàáâãäåæçèéêëìíîïðñòóôõöøùúûüý€0-9_]*$/i',
		VAL_EMAIL => '/^[\w-.]+[@][a-zA-Z0-9-.äöüÄÖÜ]{3,}\.[a-z.]{2,4}$/',
		// VAL_EMAIL => '/^[^@\s]+@([-a-z0-9]+\.)+[a-z]{2,}$/i', //old
		VAL_PASSWORD => '/^[-A-Z0-9\.\'"_!@#()$%^&*?]*$/i',
		// VAL_SIMPLEURL => '/^[-A-Z0-9]+\.[-A-Z0-9]+/i',
		// VAL_FILE => '/^[-a-zàáâãäåæçèéêëìíîïðñòóôõöøùúûüý0-9\.\':"\\_\/ ]*$/i',
		// VAL_BOOLEAN => '/^[on]*$/i',
		// VAL_CAPTCHA => '/^[-a-z]*$/i',
		// VAL_DATE => '/^(\d{2}\/\d{2}\/\d{4})$/i'
	);
	
	public static function validate($checkType, $value, $notNull = false) {
		$blnReturn = false;
		
		if($notNull) {
			if($value == '' or $value == null) {
				return false;
			}
		}

		if (array_key_exists($checkType, self::$checkTypes)) {
				$return = preg_match(self::$checkTypes[$checkType], $value);
		} else {
			$return = preg_match($checkType, $value);
		}

		return $return;
	}
	
	public static function validFormat($checkType, $value) {
		return (Validator::validate($checkType, $value)) ? $value : '';
	}
	
	// public static function getCheck($checkType) {
		// $strReturn = "";
// 		
		// if (array_key_exists($checkType, self::$checks)) {
			// $strReturn = self::$checks[$checkType];
		// }
// 		
		// return $strReturn;
	// }
}

?>
