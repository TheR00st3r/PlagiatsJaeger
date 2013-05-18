{function name=checkFolders}
{if $level!=0}
<ul>
	{/if}
	{foreach $items as $item}
	<li>
		<input type="checkbox" value="{$item.fID}" name="rCheckIDs[]" /><span class="folder"> {$item.fName} {if $type == 'shared'}({$item.uName}){/if} </span>
		{if $item['sub']}
		{call name=checkFolders items=$item.sub level=$level+1 type=$type}
		{/if}
	</li>
	{/foreach}
</ul>
{/function}