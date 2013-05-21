{if $results|count > 0}
<h2>Plagiatsfunde</h2>
<br />
<table class="short">
	<tr>
		<th>Anzahl Textstellen</th>
		<th>Quelle</th>
	</tr>
	{foreach from=$results item=result}
	<tr>
		<td>
			{$result.count}
		</td>
		<td>
			<a target="_blank" href="{$result.rtSourceLink}">{$result.rtSourceLink}</a>
		</td>
	</tr>
	{/foreach}
</table>
{else}
	<div class="info">Es wurde (noch) kein Plagiatsverdacht gefunden.</div>
{/if}