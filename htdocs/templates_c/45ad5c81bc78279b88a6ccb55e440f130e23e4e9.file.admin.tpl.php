<?php /* Smarty version Smarty-3.1.12, created on 2013-03-27 15:30:03
         compiled from "templates/pages/admin.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6938502765153026bc43e43-50396204%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '45ad5c81bc78279b88a6ccb55e440f130e23e4e9' => 
    array (
      0 => 'templates/pages/admin.tpl',
      1 => 1364394601,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6938502765153026bc43e43-50396204',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5153026bc56d93_84728510',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5153026bc56d93_84728510')) {function content_5153026bc56d93_84728510($_smarty_tpl) {?>	<h2>New User Form</h2>
	<form method="post" action="" enctype="multipart/form-data">
		<table>
			<tr>
				<td>Vorname:</td>
				<td><input type="text" name="" value="" /></td>
			</tr>
			<tr>
				<td>Nachname:</td>
				<td><input type="text" name="" value="" /></td>
			</tr>
			<tr>
				<td>eMail:</td>
				<td><input type="text" name="" value="" /></td>
			</tr>
			<tr>
				<td>Passwort:</td>
				<td><input type="password" name="" value="" /></td>
			</tr>
			<tr>
				<td>Berechtigung:</td>
				<td><select name="">
						<option value="100">User</option>
						<option value="500">Admin</option>
						<option value="900">SuperAdmin</option>
				</select></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" name="" value="speichern" /></td>
			</tr>
		</table>
	</form><?php }} ?>