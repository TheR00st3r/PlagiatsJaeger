<div class="report">
{foreach from=$messages item=message}
<div class="{$message.type}">
	{$message.text}
</div>
{/foreach}
	<h1>Report</h1>
	<table>
		<tr>
			<th>Dokumentname</th>
			<td>{$report.dOriginalName}</td>
			<th>Author</td>
			<td>{$report.dAuthor}</th>

		</tr>
		<tr>
			<th>Datum</th>
			<td>{$report.rDatetime|date_format:'%d.%m.%Y %H:%M'}</td>
			<th>Datei geparsed?</th>
			<td>{if $report.dIsParsed == '1'}ja{else}nein{/if}</td>
		</tr>
		<tr>
			<th>Schwellenwert</th>
			<td>{$report.rThreshold} %</td>
			<th>Detailgrad</th>
			<td>{$report.slTitle}</td>
		</tr>
		<tr>
			<th>Internetquellen prüfen?</th>
			<td>{if $report.rCheckWWW == '1'}ja{else}nein{/if}</td>
			<th>Status der Prüfung</th>
			<td>{$report.eName} ({$report.eDescription})</td>
		</tr>

	</table>

	{if $results|count > 0}
	<table class"reports">
		{$color = ''}
		{foreach from=$results item=item}
		<tr class="{$color}">
			<td>{$item.rtQuellText}</td>
			<td>{$item.rtSourceText}</td>
			<td> {if $item.rtSourceLink} <a target="_blank" href="{$item.rtSourceLink}"><img width="15" src="{$root}thirdparty/icons/152_new_window.png" alt="{$item.rtSourceLink}" title="{$item.rtSourceLink}" /></a> {/if} </td>
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
	</table>
	{/if}
</div>
