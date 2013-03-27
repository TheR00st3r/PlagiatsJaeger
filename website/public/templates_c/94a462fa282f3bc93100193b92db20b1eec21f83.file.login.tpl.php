<?php /* Smarty version Smarty-3.1.12, created on 2013-03-27 00:28:04
         compiled from "templates/pages/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5168836925151f24714f894-66997800%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '94a462fa282f3bc93100193b92db20b1eec21f83' => 
    array (
      0 => 'templates/pages/login.tpl',
      1 => 1364340465,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5168836925151f24714f894-66997800',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5151f2471b75c1_51868080',
  'variables' => 
  array (
    'root' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5151f2471b75c1_51868080')) {function content_5151f2471b75c1_51868080($_smarty_tpl) {?><form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
" enctype="multipart/form-data">
	<fieldset class="loginform">
		<legend>
			Login Form
		</legend>
		<table>
			<tr>
				<td>eMail:</td>
				<td>
				<input type="text" name="lEMailAdress" value="" />
				</td>
			</tr>
			<tr>
				<td>Passwort:</td>
				<td>
				<input type="password" name="lPassword" value="" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="submit" name="lSubmit" value="login" />
				</td>
			</tr>
		</table>
	</fieldset>
</form><?php }} ?>