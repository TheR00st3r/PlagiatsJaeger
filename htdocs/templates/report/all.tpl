{if $results|count > 0}
{foreach from=$results item=result}
<h2>{$result.rtQuellText}</h2>
Start: {$result.rtStartWord}, Stop: {$result.rtEndWord}
<div class="plags">
	{foreach from=$result.source item=source}
	<!-- rtSourcedID -->
	<p>
		<h3>zu {$source.rtSimilarity} %</h3>
		{$source.rtSourceText}
	</p>
	<div class="link">
		<a target="_blank" href="{$source.rtSourceLink}">{$source.rtSourceLink}</a>
	</div>
	{/foreach}
</div>
{/foreach}
{/if}
