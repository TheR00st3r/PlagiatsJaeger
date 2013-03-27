<div class="floatleft folders">
	{function name=printFolders}
	{if $level==0}
	<ul>
		{else}
		<ul>
			{/if}
			{foreach $items as $item}
			<li id="foo_{$item.fID}">
				<a href="{$root}folder/{$item.root}{$item.alias}">{$item.fName}</a>
				{if $item['sub']}
				{call name=printFolders items=$item.sub level=$level+1}
				{/if}
			</li>
			{/foreach}
		</ul>
		{/function}

		{call name=printFolders items=$folderNav level=0}
</div>
<div class="floatright files">
	<div class="">
		<form method="post" action="{$root}/{$page}">
			Neuer Ordner:
			<input type="text" name="fAddName" value="" />
			<input type="hidden" name="fAddParent" value="{$folder.fID}" />
			<input type="submit" name="fAddSubmit" value="speichern" />
		</form>
	</div>

	<table class="documents">
		{foreach from=$folders item=item}
		<tr>
			<td></td>
			<td>{$item.fName}</td>
			<td></td>
			<td>[hash]</td>
			<td><a href="{$root}/{$page}?delete&amp;fID={$item.fID}">[delete]</a></td>
		</tr>
		{/foreach}
		{foreach from=$documents item=item}
		<tr>
			<td></td>
			<td>{$item.dOriginalName}</td>
			<td>{$item.dAuthor}</td>
			<td>[prüfen]</td>
			<td>[delete]</td>
		</tr>
		{/foreach}
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
