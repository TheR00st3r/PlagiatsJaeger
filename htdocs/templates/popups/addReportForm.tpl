<div id="addReportForm{$item.dID}" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<input type="hidden" name="dID" value="{$item.dID}" />
		<h2>Prüfung starten</h2>
		<label>Detailgrad der Prüfung:</label>
		{foreach $settings as $setting}
		<input {if $userSettings.slID == $setting.slID}checked="checked"{/if} type="radio" name="slID" value="{$setting.slID}" />
		{$setting.slTitle}
		<br />
		{/foreach}
		<br />
		<label for="rThreshold">Schwellenwert einstellen:</label>
		<input type="text" name="rThreshold" id="rThreshold" value="{$userSettings.uThreshold}" />
		%
		<br />
		<br />
		<label for="rCheckWWW">Internetquellen ein-/ausschalten:</label>
		<input {if $userSettings.uCheckWWW == '1'}checked="checked"{/if} type="checkbox" name="rCheckWWW" id="rCheckWWW" value="1" />
		einschalten
		<br />
		<br />
		<input type="submit" name="button[addReport]" value="prüfen" />
	</form>
</div>