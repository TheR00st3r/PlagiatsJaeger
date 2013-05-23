{if $results|count > 0}
{foreach from=$results item=result}
<h2>{$result.rtQuellText}</h2>
{*Start: {$result.rtStartWord}, Stop: {$result.rtEndWord}*}
<div class="plags">
	{foreach from=$result.source item=source}
	<!-- rtSourcedID -->
	<p>
		<h3>zu {$source.rtSimilarity} %</h3>
		{$source.rtSourceText}
	</p>
	<div class="link">
		{if $source.rtSourcedID}
		<b>Dokument:</b> {$source.dOriginalName} <b>Autor:</b> {$source.dAuthor} <b>Besitzer:</b> {$source.uName}  {$source.uLastname} <b>Ordner:</b> {$source.fName}
		{else}
		<a target="_blank" href="{$source.rtSourceLink}">{$source.rtSourceLink}</a>
		{/if}
	</div>
	{/foreach}
</div>
{/foreach}
{else}
<div class="info">
	Es wurde (noch) kein Plagiatsverdacht gefunden.
</div>
{/if}
