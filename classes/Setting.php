<?php
class Setting {

	/**
	 * Saves the given Properties to the individual tables.
	 * @param ???
	 * @return boolean
	 */
	public static function saveProperties() {
		// TODO: Not imp.
		// Schwellenwert einstellen
		// Internetquellen ein/aus
		// Lokale Quellen ja/nein/array
		// Deitailgrad der Prüfung
		throw new Exception('Not implemented');
	}

	public static function getAllSettings() {
		$db = new db();
		$db -> read("
				SELECT
					sl.slID, sl.slTitle
				FROM
					settinglevel AS sl
				ORDER BY
					 sl.slTitle ASC");

		return $db -> linesAsArray();
	}

}
?>