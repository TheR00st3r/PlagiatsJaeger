{function name=checkFolders}
{if $level!=0}
<ul>
	{/if}
	{foreach $items as $item}
	<li>
		<input type="checkbox" name="rCheckIDs[]" value="{$item.fID}" /><span class="folder"> {$item.fName} {if $type == 'shared' and $level == 0}({$item.uName}){/if} </span>
		{if $item['sub']}
		{call name=checkFolders items=$item.sub level=$level+1 type=$type}
		{/if}
	</li>
	{/foreach}
</ul>
{/function}