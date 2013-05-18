<h2>Einstellungen</h2>
<div class="floatleft">
	<h3>Sucheinstellungen</h3>
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
</div>
<div class="floatright" style="width: 50%">
	<h3>Passwort ändern</h3>
	<form method="post" action="{$root}{$page}">
		<label for="uPassword">Aktuelles Passwort:</label>
		<input id="uPassword" class="text" type="password" name="uPassword" value="" />
		<br />
		<br />

		<label for="uPassword1">Neues Passwort:</label>
		<input id="uPassword1" class="text" type="password" name="uPassword1" value="" />
		<br />
		<br />
		<label for="uPassword2">Neues Passwort bestätigen:</label>
		<input id="uPassword2" class="text" type="password" name="uPassword2" value="" />
		<br />
		<br />
		<input name="button[uChangePassword]" type="submit" value="Passwort speichern" />
	</form>
</div>
