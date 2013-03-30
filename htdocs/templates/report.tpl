{if $results|count > 0}
<div class="report">
	<table>
		{$color = ''}
		{foreach from=$results item=item}
		<tr class="{$color}">
			<td>{$item.rtText}</td>
			<td>{$item.rtSourceText}</td>
			<td>
				{if $item.rtSourceLink}
				<a target="_blank" href="{$item.rtSourceLink}"><img width="15" src="{$root}thirdparty/icons/152_new_window.png" alt="{$item.rtSourceLink}" title="{$item.rtSourceLink}" /></a>
				{/if}
			</td>
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
	</table>
</div>
{else}
Es sind (noch) keine Ergebnisse vorhanden.
{/if}
