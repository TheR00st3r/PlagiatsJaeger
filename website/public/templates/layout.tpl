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

		<link rel="stylesheet" href="{$root}thirdparty/jquery-treeview/jquery.treeview.css" />
		<!-- <link rel="stylesheet" href="screen.css" /> -->

		<!-- <script src="../lib/jquery.js" type="text/javascript"></script> -->
		<script type="text/javascript" src="{$root}thirdparty/jquery-treeview/lib/jquery.cookie.js"></script>
		<script type="text/javascript" src="{$root}thirdparty/jquery-treeview/jquery.treeview.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {

				$("#filetree1").treeview({
					animated : "fast",
					persist : "location",
					collapsed : true,
					unique : false
				});

				$("#filetree2").treeview({
					animated : "fast",
					collapsed : false,
					unique : false,
					persist : "cookie"
				});

				// fourth example
				$("#black, #gray").treeview({
					control : "#treecontrol",
					persist : "cookie",
					cookieId : "treeview-black"
				});

				// third example
				$("#test").treeview({
					animated : "fast",
					collapsed : true,
					unique : true,
					persist : "cookie"
				});

			});

			$(document).ready(function() {
				var element;
				$('.create').click(function() {
					element = $(this).attr("href");
				}).fancybox({
					'autoDimensions' : true,
					'titleShow' : false,
					'onStart' : function() {
						//aktuelles UploadForm enzeigen
						$(element).show();
					},
					'onClosed' : function() {
						//alle Uploadforms ausblenden
						$('.uploadforms').hide();
					},
					'autoDimensions' : false,
					'autoScale' : false,
					'width' : 400,
					'height' : 110
				});
			});

		</script>

		<link rel="stylesheet" href="{$root}thirdparty/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
		<script type="text/javascript" src="{$root}thirdparty/fancybox/jquery.fancybox.pack.js"></script>
		<script type="text/javascript" src="{$root}javascript/fancybox.js"></script>

	</head>
	<body>

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
					<li>
						<a href="{$root}schnelltest">Schnelltest</a>
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
				{$body}
			</div>

			<div id="foot">
				Änderungen vorbehalten &copy; Copyright {$smarty.now|date_format: "%Y"} by plagiatsjaeger.info
			</div>
		</div>
	</body>
</html>