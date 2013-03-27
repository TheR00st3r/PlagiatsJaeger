<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>{$titel.name} - plagiatsjaeger.info</title>

		<base href="{$root}" />

		<!-- <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> -->
		<!-- <link rel="stylesheet" href="{$root}stylesheets/main/css/main.css" type="text/css" media="all" /> -->
		<link rel="stylesheet/less" type="text/css" href="{$root}stylesheets/main/less/main.less">

		<script type="text/javascript" src="{$root}thirdparty/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="{$root}thirdparty/less-1.3.3.min.js"></script>

		<!-- <link rel="stylesheet" href="thirdparty/fancybox/jquery.fancybox.css" type="text/css" media="screen" /> -->
		<!-- <script type="text/javascript" src="thirdparty/fancybox/jquery.fancybox.pack.js"></script> -->
		<!-- <script type="text/javascript" src="javascript/fancybox.js"></script> -->

	</head>
	<body>

		<div id="container">
			<div id="header">
			<h1><a href="{$root}">PLAGIATSJÄGER</a></h1>
			{if $userinfo}
				<div id="userinfo">{$userinfo} <a href="{$root}logout">logout</a></div>
			{/if}
			</div>
			<div id="nav" id="nav">
				<ul>
					{foreach from=$nav key=key item=item}
					<li>
						<a href="{$lang}/{$item.alias}" {if $item.id == $navComplete[$url[0]]['id']}class="active"{/if}>{$item.name}</a>
					</li>
					{/foreach}
				</ul>
			</div>

			<div id="content" id="content">
				{$body}
			</div>

			<div id="foot">
				Änderungen vorbehalten &copy; Copyright {$smarty.now|date_format: "%Y"} by plagiatsjaeger.info
			</div>
		</div>
	</body>
</html>