<div class="report">
{foreach from=$messages item=message}
<div class="{$message.type}">
	{$message.text}
</div>
{/foreach}
	<h1>Report</h1>
	<table>
		<tr>
			<th>dOriginalName</th>
			<td>{$report.dOriginalName}</td>
			<th>dAuthor</td>
			<td>{$report.dAuthor}</th>
			<th>rDatetime</th>
			<td>{$report.rDatetime}</td>
		</tr>
		<tr>
			<th>dIsParsed</th>
			<td>{$report.dIsParsed}</td>
		</tr>
		<tr>
			<th>sThreshold</th>
			<td>{$report.sThreshold}</td>
			<th>slTitle</th>
			<td>{$report.slTitle}</td>
			<th>sCheckWWW</th>
			<td>{$report.sCheckWWW}</td>
		</tr>
		<tr>
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
