<div id="container">
	<div id="header">
		<h1><a href="{$root}">PLAGIATSJÄGER</a></h1>
		{if $userinfo}
		<div id="userinfo">
			{$userinfo} <a href="{$root}logout">logout</a>
		</div>
		{/if}
	</div>
	{if $isLogin}
	<div id="nav" id="nav">
		<ul>
			<li>
				<a href="{$root}folder">Folder</a>
			</li>
			{if $userLevel >= 500}
			<li>
				<a href="{$root}admin">Admin</a>
			</li>
			{/if}
			<li>
				<a href="{$root}logout">logout</a>
			</li>
		</ul>
		<div class="floatclear">
			&nbsp;
		</div>
	</div>
	{/if}

	<div id="content" id="content">
		{$content}
	</div>

	<div id="foot">
		Änderungen vorbehalten &copy; Copyright {$smarty.now|date_format: "%Y"} by plagiatsjaeger.info
	</div>
</div>
