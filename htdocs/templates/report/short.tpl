{if $results|count > 0} <h2>Plagiatsfunde</h2>
<br />
<table class="short">
	<tr>
		<th>Anzahl Textstellen</th>
		<th>Quelle</th>
		<th>Average</th>
		<th>Details</th>
	</tr>
	{foreach from=$results item=result}
	<tr>
		<td>
			{$result.count}
		</td>
		<td>
			{if $result.rtSourcedID}
			<b>Dokument:</b> {$result.dOriginalName} <b>Autor:</b> {$result.dAuthor} <b>Besitzer:</b> {$result.uName} {$result.uLastname} <b>Ordner:</b> {$result.fName}
			{else}
			<a target="_blank" href="{$result.rtSourceLink}">{$result.rtSourceLink}</a>
			{/if}
		</td>
		<td>{$result.rtSimilarity|money_format} %</td>
		<td><a href="report.php?rID={$smarty.get.rID}&amp;type=grafic&amp;rtSourceLink={$result.rtSourceLink|urlencode}&amp;rtSourcedID={$result.rtSourcedID}">Details</a></td>
	</tr>
	{/foreach}
</table>
{else}
<div class="info">
	Es wurde (noch) kein Plagiatsverdacht gefunden.
</div>
{/if}