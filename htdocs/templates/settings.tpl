<h2>Einstellungen</h2>

<form method="post" action="{$root}{$page}">
	<label>Detailgrad der Prüfung:</label>
	{foreach $settings as $setting}
	<input {if $userSettings.slID == $setting.slID}checked="checked"{/if} type="radio" name="slID" value="{$setting.slID}" />
	{$setting.slTitle}
	<br />
	{/foreach}
	<br />
	<label for="uThreshold">Schwellenwert einstellen:</label>
	<input type="text" name="uThreshold" id="uThreshold" value="{$userSettings.uThreshold}" /> %
	<br />
	<br />
	<label for="uCheckWWW">Internetquellen ein-/ausschalten:</label>
	<input {if $userSettings.uCheckWWW == '1'}checked="checked"{/if} type="checkbox" name="uCheckWWW" id="uCheckWWW" value="1" /> einschalten
	<br />
	<br />
	<input type="submit" name="button[uChangeSettings]" value="speichern" />
</form>