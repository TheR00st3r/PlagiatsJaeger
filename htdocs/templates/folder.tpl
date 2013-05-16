<div class="floatleft folders">
	{function name=printFolders}
	{if $level!=0}
	<ul>
		{/if}
		{foreach $items as $item}
		<li id="foo_{$item.fID}" {if $item.fID == $folder.fID}class="open"{/if} >
			<span class="folder"> <a href="{$root}{$type}/{$item.root}{$item.alias}">{$item.fName}</a> {if $type == 'shared'}({$item.uName}){/if} </span>
			{if $item['sub']}
			{call name=printFolders items=$item.sub level=$level+1 type=$type}
			{/if}
		</li>
		{/foreach}
	</ul>
	{/function}
	<ul id="filetree1" class="filetree">
		<li class="open">
			<span class="folder"><a href="{$root}folder">Meine Ordner</a></span>
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
		{include 'popups/newFolderForm.tpl'}
		<a class="create button" href="#newFolderForm"><img src="{$root}images/folder-closed.gif" alt="" /> Neuer Ordner</a>
		{if $folder.fID}
		{include 'popups/newFileForm.tpl'}
		<a class="create button" href="#newFileForm"><img src="{$root}images/file.gif" alt="" /> Datei upload</a>
		{include 'popups/newShortTestForm.tpl'}
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
			<td class="image"><img src="{$root}images/folder-closed.gif" alt="" />
			</td>
			<td class="borderright">
				<div class="jeditable" id="fName_{$item.fID}">{strip}
					{$item.fName}
				{/strip}</div>
			</td>
			<td class="borderright">
				&nbsp;
			</td>
			{if $fpLevel == 900}
			<td class="edit">
				{include 'popups/shareFolderForm.tpl'}
				<a class="create" href="#shareFolderForm{$item.fID}">[Teilen]</a>
				{if $item.fHashLink != ''}
				<a target="_blank" href="{$root}public?id={$item.fHashLink}">[Link] bis {$item.fLinkExpireDatetime}</a>
				{else}
				{include 'popups/createLinkForm.tpl'}
				<a class="create" href="#createLinkForm{$item.fID}">[Link]</a>
				{/if}
				{include 'popups/deleteFolderForm.tpl'}
				<a class="create" href="#deleteFolderForm{$item.fID}">[Löschen]</a>
			</td>
			{/if}
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
		{foreach from=$documents item=item}
		<tr class="{$color}">
			<td class="image"><img src="{$root}images/file.gif" alt="" />
			</td>
			<td class="borderright">
				<a href="document.php?dID={$item.dID}" class="iframeviewer fancybox.iframe">{$item.dOriginalName}</a>
				{foreach from=$item.reports item=report}
				<li>
					<a href="report.php?rID={$report.rID}" class="iframeviewer fancybox.iframe">{$report.rDatetime}</a> rID={$report.rID}
				</li>
				{/foreach}
			</td>
			<td class="borderright">
				{$item.dAuthor}
			</td>
			<td class="edit">
			{if $fpLevel == 900}
				{include 'popups/addReportForm.tpl'}
				<a class="create" href="#addReportForm{$item.dID}">[Prüfen]</a>
				{include 'popups/deleteDocumentForm.tpl'}
				<a class="create" href="#deleteDocumentForm{$item.dID}">[Löschen]</a>
			</td>
			{/if}
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
