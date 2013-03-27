<?php /* Smarty version Smarty-3.1.12, created on 2013-03-27 10:35:31
         compiled from "templates/layout.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1388999535151ed1cd4de56-77344973%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '85c5c180a34de75ce423cae9f14931c9c94f7477' => 
    array (
      0 => 'templates/layout.tpl',
      1 => 1364376929,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1388999535151ed1cd4de56-77344973',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5151ed1cee9813_16968743',
  'variables' => 
  array (
    'titel' => 0,
    'root' => 0,
    'userinfo' => 0,
    'nav' => 0,
    'lang' => 0,
    'item' => 0,
    'url' => 0,
    'navComplete' => 0,
    'body' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5151ed1cee9813_16968743')) {function content_5151ed1cee9813_16968743($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/Users/timo/Dropbox/fruitofart/server/webseiten/plagiatsjaeger-app/smarty/libs/plugins/modifier.date_format.php';
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

		<!-- <link rel="stylesheet" href="thirdparty/fancybox/jquery.fancybox.css" type="text/css" media="screen" /> -->
		<!-- <script type="text/javascript" src="thirdparty/fancybox/jquery.fancybox.pack.js"></script> -->
		<!-- <script type="text/javascript" src="javascript/fancybox.js"></script> -->

	</head>
	<body>

		<div id="container">
			<div id="header">
			<h1><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
">PLAGIATSJÄGER</a></h1>
			<?php if ($_smarty_tpl->tpl_vars['userinfo']->value){?>
				<div id="userinfo"><?php echo $_smarty_tpl->tpl_vars['userinfo']->value;?>
 <a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
logout">logout</a></div>
			<?php }?>
			</div>
			<div id="nav" id="nav">
				<ul>
					<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_smarty_tpl->tpl_vars['key'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['nav']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
 $_smarty_tpl->tpl_vars['key']->value = $_smarty_tpl->tpl_vars['item']->key;
?>
					<li>
						<a href="<?php echo $_smarty_tpl->tpl_vars['lang']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['item']->value['alias'];?>
" <?php if ($_smarty_tpl->tpl_vars['item']->value['id']==$_smarty_tpl->tpl_vars['navComplete']->value[$_smarty_tpl->tpl_vars['url']->value[0]]['id']){?>class="active"<?php }?>><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a>
					</li>
					<?php } ?>
				</ul>
			</div>

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