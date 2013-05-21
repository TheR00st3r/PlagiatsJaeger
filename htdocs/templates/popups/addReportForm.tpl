<div id="addReportForm{$item.dID}" style="display: none">
	<h2>Prüfung starten</h2>
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<div class="floatleft">
			<h3>Einstellungen</h3>
			<input type="hidden" name="dID" value="{$item.dID}" />
			<label>Detailgrad der Prüfung:</label>
			{foreach $settings as $setting}
			<input {if $userSettings.slID == $setting.slID}checked="checked"{/if} type="radio" name="slID" value="{$setting.slID}" />
			{$setting.slTitle}
			<br />
			{/foreach}
			<br />
			<label>Suchmaschine:</label>
			{foreach $searchengines as $engine}
			<input {if $userSettings.seID == $engine.seID}checked="checked"{/if} type="radio" name="seID" value="{$engine.seID}" />{$engine.seName}
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

		</div>
		<div class="floatright">
			<h3>Mit folgenden Ordnern gegenprüfen</h3>
			<script lang="text/javascript">
				$('#tree{$item.dID}').checkboxTree();
			</script>
			<ul class="filetree2">
				<li>
					<span class="folder">Meine Ordner</span>
					<ul>
						{call name=checkFolders items=$folderNav level=0 type='folder'}
				</li>
				<li>
					<span class="folder">Freigegebene Ordner</span>
					<ul>
						{call name=checkFolders items=$sharedFolders level=0 type='shared'}
				</li>
			</ul>
		</div>
		<div class="floatclear">
			<br />
			<br />
			<input type="submit" name="button[addReport]" value="prüfen" />

		</div>
	</form>
</div>