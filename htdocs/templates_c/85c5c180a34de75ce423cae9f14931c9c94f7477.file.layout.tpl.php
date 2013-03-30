<?php /* Smarty version Smarty-3.1.12, created on 2013-03-29 09:21:54
         compiled from "templates/layout.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2438858375152cbccbeb370-02031740%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '85c5c180a34de75ce423cae9f14931c9c94f7477' => 
    array (
      0 => 'templates/layout.tpl',
      1 => 1364545154,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2438858375152cbccbeb370-02031740',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5152cbccc7df45_37750218',
  'variables' => 
  array (
    'titel' => 0,
    'root' => 0,
    'userinfo' => 0,
    'isLogin' => 0,
    'userLevel' => 0,
    'body' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5152cbccc7df45_37750218')) {function content_5152cbccc7df45_37750218($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Users/timo/Dropbox/fruitofart/server/webseiten/plagiatsjaeger-app/smarty/libs/plugins/modifier.date_format.php';
?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><?php echo $_smarty_tpl->tpl_vars['titel']->value['name'];?>
 - plagiatsjaeger.info</title>

		<base href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
" />

		<!-- <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> -->
		<!-- <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
stylesheets/main/css/main.css" type="text/css" media="all" /> -->
		<link rel="stylesheet/less" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
stylesheets/main/less/main.less">

		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/less-1.3.3.min.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/jquery-treeview/lib/jquery.cookie.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/jquery-treeview/jquery.treeview.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/jeditable/jquery.jeditable.mini.js"></script>

		<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/jquery-treeview/jquery.treeview.css" />

		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
javascript/jeditable.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
javascript/fancybox.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
javascript/treeview.js"></script>

		<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/fancybox/jquery.fancybox.pack.js"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
javascript/fancybox.js"></script>

	</head>
	<body>

		<div id="container">
			<div id="header">
				<h1><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
">PLAGIATSJÄGER</a></h1>
				<?php if ($_smarty_tpl->tpl_vars['userinfo']->value){?>
				<div id="userinfo">
					<?php echo $_smarty_tpl->tpl_vars['userinfo']->value;?>
 <a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
logout">logout</a>
				</div>
				<?php }?>
			</div>
			<?php if ($_smarty_tpl->tpl_vars['isLogin']->value){?>
			<div id="nav" id="nav">
				<ul>
					<li>
						<a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
folder">Folder</a>
					</li>
					<?php if ($_smarty_tpl->tpl_vars['userLevel']->value>=500){?>
					<li>
						<a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
admin">Admin</a>
					</li>
					<?php }?>
					<li>
						<a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
logout">logout</a>
					</li>
				</ul>
				<div class="floatclear">
					&nbsp;
				</div>
			</div>
			<?php }?>

			<div id="content" id="content">
				<?php echo $_smarty_tpl->tpl_vars['body']->value;?>

			</div>

			<div id="foot">
				Änderungen vorbehalten &copy; Copyright <?php echo smarty_modifier_date_format(time(),"%Y");?>
 by plagiatsjaeger.info
			</div>
		</div>
	</body>
</html><?php }} ?>