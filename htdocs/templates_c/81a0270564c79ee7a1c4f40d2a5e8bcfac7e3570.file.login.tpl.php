<?php /* Smarty version Smarty-3.1.12, created on 2013-03-28 16:08:44
         compiled from "templates/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:96136930651545cfcd6ee94-34301028%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '81a0270564c79ee7a1c4f40d2a5e8bcfac7e3570' => 
    array (
      0 => 'templates/login.tpl',
      1 => 1364380280,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '96136930651545cfcd6ee94-34301028',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'root' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_51545cfcd96b43_30983952',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_51545cfcd96b43_30983952')) {function content_51545cfcd96b43_30983952($_smarty_tpl) {?><form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
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