<div class="document">
	{foreach from=$messages item=message}
	<div class="{$message.type}">
		{$message.text}
	</div>
	{/foreach}
	{$orgDocument}
</div>
