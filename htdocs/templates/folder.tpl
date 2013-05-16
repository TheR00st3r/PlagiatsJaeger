<div class="floatleft folders">
	{function name=printFolders}
	{if $level!=0}
	<ul>
		{/if}
		{foreach $items as $item}
		<li id="foo_{$item.fID}" {if $item.fID == $folder.fID}class="open"{/if} >
			<span class="folder">
				<a href="{$root}{$type}/{$item.root}{$item.alias}">{$item.fName}</a> 
				{if $type == 'shared'}({$item.uName}){/if}
			</span>
			{if $item['sub']}
			{call name=printFolders items=$item.sub level=$level+1 type=$type}
			{/if}
		</li>
		{/foreach}
	</ul>
	{/function}
	<ul id="filetree1" class="filetree">
		<li class="open">
			<span class="folder"><a href="{$root}folder">Meine Dateien</a></span>
			<ul>
				{call name=printFolders items=$folderNav level=0 type='folder'}
		</li>
		<li class="open">
			<span class="folder"><a href="{$root}shared">Freigegebene Ordner</a></span>
			<ul>
				{call name=printFolders items=$sharedFolders level=0 type='shared'}
		</li>
	</ul>

</div>
<div class="floatright files">
	<div class="folderMenue">

		{if $fpLevel == 900}
		<div id="newFolderForm" style="display: none">
			<form method="post" action="{$root}{$page}">
				<h2>Neuer Ordner</h2>
				<input type="text" name="fAddName" value="" />
				<input type="hidden" name="fAddParent" value="{$folder.fID}" />
				<input type="submit" name="button[fAddSubmit]" value="speichern" />
			</form>
		</div>
		<a class="create button" href="#newFolderForm"><img src="{$root}images/folder-closed.gif" alt="" /> Neuer Ordner</a>

		{if $folder.fID}
		<div id="newFileForm" style="display: none">
			<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
				<h2>File Upload</h2>
				<label for="dAddFile">Wählen Sie die zu prüfende Datei:</label>
				<input type="file" name="dAddFile" id="dAddFile" multiple="multiple" />
				<br />
				<br />
				<label for="dAddAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
				<input type="text" name="dAddAutor" id="dAddAutor" />
				<br />
				<br />
				<input type="submit" name="button[dAddSubmit]" value="upload" />
			</form>
		</div>
		<a class="create button" href="#newFileForm"><img src="{$root}images/file.gif" alt="" /> Datei upload</a>

		<div id="newShortTestForm" style="display: none">
			<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
				<h2>Text Upload</h2>
				<label for="dAddShortText">Fügen Sie Ihren zu prüfenden Text ein:</label>
				<textarea name="dAddShortText" id="dAddShortText"></textarea>
				<br />
				<br />
				<label for="dAddShortAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
				<input type="text" name="dAddAutor" id="dAddShortAutor" />
				<br />
				<br />
				<input type="submit" name="button[dAddShortSubmit]" value="upload" />
			</form>
		</div>
		<a class="create button" href="#newShortTestForm"><img src="{$root}images/file.gif" alt="" /> Schnelltest</a>
		{/if}
		{/if}
	</div>
	{$folder.pathName}
	<br />
	<br />
	<table class="documents">
		<tr>
			<th colspan="2">Filename</th>
			<th>Autor</th>
		</tr>
		{$color = ''}
		{foreach from=$folders item=item}
		<tr class="{$color}">
			<td class="image"><img src="{$root}images/folder-closed.gif" alt="" /></td>
			<td class="borderright">
			<div class="jeditable" id="fName_{$item.fID}">{$item.fName}</div></td>
			<td class="borderright">&nbsp;</td>
			{if $fpLevel == 900}
			<td class="smal">
			<div id="shareFolderForm{$item.fID}" style="display: none">
				<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
					<input type="hidden" name="fID" value="{$item.fID}" />
					<h2>Ordner Kollegen freigeben</h2>
					Kollege auswählen:
					{foreach $users as $user}
						<label for="user{$item.fID}{$user.uID}">
						<input {if {$user.uID}|in_array:$item.user}checked="checked"{/if} type="checkbox" name="uIDs[]" value="{$user.uID}" id="user{$item.fID}{$user.uID}" />
						{$user.uName} {$user.uLastname}</label>
					{/foreach}
					
					<br />
					<input type="submit" name="button[dAddFolderShareSubmit]" value="teilen" />
				</form>
			</div><a class="create" href="#shareFolderForm{$item.fID}">[teilen]</a></td>
			<td class="smal"> {if $item.fHashLink != ''} <a target="_blank" href="{$root}public?id={$item.fHashLink}">[Link] bis {$item.fLinkExpireDatetime}</a> {else}
			<div id="createLinkForm{$item.fID}" style="display: none">
				<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
					<input type="hidden" name="fID" value="{$item.fID}" />
					<h2>Link für Studenten freigeben</h2>
					<label for="fLinkExpireDatetime">Link freigeben bis:</label>
					<input type="text" name="fLinkExpireDatetime" id="fLinkExpireDatetime" value="2013-12-12 23:59:59" />
					<br />
					<br />
					<label for="">Settings:</label>
					<br />
					<br />
					<input type="submit" name="button[dAddFolderLinkSubmit]" value="freigeben" />
				</form>
			</div><a class="create" href="#createLinkForm{$item.fID}">[hash]</a> {/if} </td>
			<td class="smal"><a href="{$root}{$page}?action=deleteFolder&amp;fID={$item.fID}">[delete]</a></td>
			{/if}
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
		{foreach from=$documents item=item}
		<tr class="{$color}">
			<td class="image"><img src="{$root}images/file.gif" alt="" /></td>
			<td class="borderright"><a href="document.php?dID={$item.dID}" class="iframeviewer fancybox.iframe">{$item.dOriginalName}</a> {foreach from=$item.reports item=report}
			<li>
				<a href="report.php?rID={$report.rID}" class="iframeviewer fancybox.iframe">{$report.rDatetime}</a> rID={$report.rID}
			</li> {/foreach} </td>
			<td class="borderright">{$item.dAuthor}</td>
			{if $fpLevel == 900}
			<td class="smal">
			<div id="addReport{$item.dID}" style="display: none">
				<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
					<input type="hidden" name="dID" value="{$item.dID}" />
					<h2>Prüfung starten</h2>
					<label>Detailgrad der Prüfung:</label>
					{foreach $settings as $setting}
						<input {if $userSettings.slID == $setting.slID}checked="checked"{/if} type="radio" name="slID" value="{$setting.slID}" /> {$setting.slTitle}<br />
					{/foreach}
					<br />
					<label for="rThreshold">Schwellenwert einstellen:</label>
					<input type="text" name="rThreshold" id="rThreshold" value="{$userSettings.uThreshold}" /> %<br />
					<br />
					<label for="rCheckWWW">Internetquellen ein-/ausschalten:</label>
					<input {if $userSettings.uCheckWWW == '1'}checked="checked"{/if} type="checkbox" name="rCheckWWW" id="rCheckWWW" value="1" /> einschalten
					<br />
					<br />
					<input type="submit" name="button[rAdd]" value="prüfen" />
				</form>
			</div><a class="create" href="#addReport{$item.dID}">[prüfen]</a></td>
			<td class="smal">[delete]</td>
			{/if}
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
