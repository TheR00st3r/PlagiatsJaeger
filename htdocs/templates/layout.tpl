<div id="container">
	<div id="header">
		<a href="{$root}"><img src="{$root}images/plagiatsjaeger-logo.png" alt="Plagiatsjaeger Logo" /></a>
		<h1><a href="{$root}">PLAGIATSJÄGER</a></h1>
		{if $userinfo}
		<div id="userinfo">
			Hallo {$userinfo} | <a href="{$root}logout">logout</a>
		</div>
		{/if}
	</div>
	{if $isLogin}
	<div id="nav" id="nav">
		<ul>
			<li>
				<a href="{$root}folder">Ordnerübersicht</a>
			</li>
			<li>
				<a href="{$root}settings">Einstellungen</a>
			</li>
			{if $userLevel >= 500}
			<li>
				<a href="{$root}admin">Administration</a>
			</li>
			{/if}
			<li>
				<a href="{$root}logout">Abmelden</a>
			</li>
		</ul>
		<div class="floatclear">
			&nbsp;
		</div>
	</div>
	{/if}

	<div id="content" id="content">
		{foreach from=$messages item=message}
		<div class="{$message.type}">
			{$message.text}
		</div>
		{/foreach}
		{$content}
	</div>

	<div id="foot">
		Änderungen vorbehalten &copy; Copyright {$smarty.now|date_format: "%Y"} by plagiatsjaeger.info | mySQL {$mySQL} | v{$verion}
	</div>
</div>
