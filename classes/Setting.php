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

}
?>