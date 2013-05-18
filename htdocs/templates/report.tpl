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
			<td>
				{$report.dOriginalName}
			</td>
			<th>Author</td>
			<td>
				{$report.dAuthor}
			</th>

		</tr>
		<tr>
			<th>Datum</th>
			<td>
				{$report.rDatetime|date_format:'%d.%m.%Y %H:%M'}
			</td>
			<th>Datei geparsed?</th>
			<td>
				{if $report.dIsParsed == '1'}ja{else}nein{/if}
			</td>
		</tr>
		<tr>
			<th>Schwellenwert</th>
			<td>
				{$report.rThreshold} %
			</td>
			<th>Detailgrad</th>
			<td>
				{$report.slTitle}
			</td>
		</tr>
		<tr>
			<th>Internetquellen prüfen?</th>
			<td>
				{if $report.rCheckWWW == '1'}ja{else}nein{/if}
			</td>
			<th>Status der Prüfung</th>
			<td>
				{$report.eName} ({$report.eDescription})
			</td>
		</tr>

	</table>

	{if $results|count > 0}
	{foreach from=$results item=result}
	<p>
		{$result.rtQuellText}
	</p>
	<div>
		{foreach from=$result.source item=source}
		<p>
			{$source.rtSourceText}
		</p>
		{$source.rtSourceLink}
		{/foreach}
	</div>
	{/foreach}
	{/if}

</div>
