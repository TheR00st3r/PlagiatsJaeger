<?php
class Setting {

	/**
	 * Returns all standard settings.
	 * @return array
	 */
	public static function getAllSettings() {
		$db = new db();
		$db -> read("
				SELECT
					sl.slID, sl.slTitle
				FROM
					settinglevel AS sl
				ORDER BY
					 sl.slTitle ASC");

		$settings = $db -> linesAsArray();
		$db -> disconnect();
		return $settings;
	}

	/**
	 * Returns all search engines.
	 * @return array
	 */
	public static function getAllSearchengines() {
		$db = new db();
		$db -> read("
				SELECT
					seID, seName
				FROM
					searchengine
				ORDER BY
					 seName ASC");

		$settings = $db -> linesAsArray();
		$db -> disconnect();
		return $settings;
	}

}
?>