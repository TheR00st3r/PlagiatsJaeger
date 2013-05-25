<div class="report">
	{foreach from=$messages item=message}
	<div class="{$message.type}">
		{$message.text}
	</div>
	{/foreach}

	<div class="reportNav noprint">
		<div class="frame">
			<div class="floatright">
				<a target="_blank" href="report.php?rID={$smarty.get.rID}&amp;type={$smarty.get.type}&amp;print=1"><img src="{$root}images/print.png" alt="{$title} drucken" title="{$title} drucken" /></a>
			</div>
			<a href="report.php?rID={$smarty.get.rID}&amp;type=short">Schnellbericht</a>
			<a href="report.php?rID={$smarty.get.rID}&amp;type=all">Komplettbericht</a>
			{*<a href="report.php?rID={$smarty.get.rID}&amp;type=grafic">Grafikbericht</a>*}
		</div>
	</div>

	<h1>{$title}</h1>
	<table class="overview">
		<tr>
			<th>Dokumentname:</th>
			<td>
				{$report.dOriginalName}
			</td>
			<th>Author:</th>
			<td>
				{$report.dAuthor}
			</td>
		</tr>
		<tr>
			<th>Schwellenwert:</th>
			<td>
				{$report.rThreshold} %
			</td>
			<th>Detailgrad:</th>
			<td>
				{$report.slTitle}
			</td>
		</tr>
		<tr>
			<th>Internetquellen prüfen?</th>
			<td>
				{if $report.rCheckWWW == '1'}ja{else}nein{/if}
			</td>
			<th>Plagiatsverdacht zu:</th>
			<td>
				{$report.rSimilarity} %
			</td>
		</tr>
		<tr>
			<th>Start:</th>
			<td>
				{$report.rDatetime|date_format:'%d.%m.%Y %H:%M'} Uhr
			</td>
			<th>Stop:</th>
			<td>
				{$report.rEndTime|date_format:'%d.%m.%Y %H:%M'} Uhr
			</td>
		</tr>
		<tr>
			<th>Status der Prüfung:</th>
			<td colspan="3">
				{$report.eName} ({$report.eDescription})
			</td>
		</tr>

	</table>

	{$reportContent}
</div>
