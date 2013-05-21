{function name=printFolders}
{if $level!=0}
<ul>
	{/if}
	{foreach $items as $item}
	<li id="foo_{$item.fID}" {if $item.fID == $folder.fID}class="open"{/if} >
		<span class="folder"> <a href="{$root}{$type}/{$item.root}{$item.alias}">{$item.fName}</a> {if $type == 'shared' and $level == 0}({$item.uName}){/if} </span>
		{if $item['sub']}
		{call name=printFolders items=$item.sub level=$level+1 type=$type}
		{/if}
	</li>
	{/foreach}
</ul>
{/function}