<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>plagiatsjaeger.info</title>

		<base href="{$root}" />

		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="{$root}stylesheets/css/main.css" type="text/css" media="all" />
		<link rel="stylesheet" href="{$root}stylesheets/css/print.css" type="text/css" media="print" />
		<!-- <link rel="stylesheet/less" type="text/css" href="{$root}stylesheets/main/less/main.less"> -->

		<script type="text/javascript" src="{$root}thirdparty/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="{$root}thirdparty/less-1.3.3.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

		<script type="text/javascript" src="{$root}thirdparty/jquery-treeview/lib/jquery.cookie.js"></script>
		<script type="text/javascript" src="{$root}thirdparty/jquery-treeview/jquery.treeview.js"></script>
		<script type="text/javascript" src="{$root}thirdparty/jeditable/jquery.jeditable.mini.js"></script>

		<script type="text/javascript" src="{$root}thirdparty/checkboxtree/jquery.checkboxtree.js"></script>
		<link rel="stylesheet" type="text/css" href="{$root}thirdparty/checkboxtree/jquery.checkboxtree.css"/>

		<link rel="stylesheet" href="{$root}thirdparty/anytime/anytime.min.css" />
		<script type="text/javascript" src="{$root}thirdparty/anytime/anytime.min.js"></script>

		<link rel="stylesheet" href="{$root}thirdparty/jquery-treeview/jquery.treeview.css" />

		<link rel="stylesheet" href="{$root}thirdparty/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
		<script type="text/javascript" src="{$root}thirdparty/fancybox/jquery.fancybox.pack.js"></script>

		<script type="text/javascript" src="{$root}js/jeditable.js"></script>
		<script type="text/javascript" src="{$root}js/fancybox.js"></script>
		<script type="text/javascript" src="{$root}js/treeview.js"></script>
		<script type="text/javascript" src="{$root}js/anytime.js"></script>

	</head>
	<body {if $smarty.get.print}onLoad="javascript:window.print()"{/if}>
		{$body}
	</body>
</html>