<?php /* Smarty version Smarty-3.1.12, created on 2013-03-27 11:37:00
         compiled from "templates/pages/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18187308485152cbccbc6598-07952445%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '94a462fa282f3bc93100193b92db20b1eec21f83' => 
    array (
      0 => 'templates/pages/login.tpl',
      1 => 1364380280,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18187308485152cbccbc6598-07952445',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'root' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5152cbccbe7575_61714536',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5152cbccbe7575_61714536')) {function content_5152cbccbe7575_61714536($_smarty_tpl) {?><form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
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