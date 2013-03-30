<?php /* Smarty version Smarty-3.1.12, created on 2013-03-29 10:15:42
         compiled from "templates/admin.tpl" */ ?>
<?php /*%%SmartyHeaderCode:128589649551545cfbab30b8-00185317%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cdbc753ec07d8d57d926d816f0e718758e490a1b' => 
    array (
      0 => 'templates/admin.tpl',
      1 => 1364548526,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '128589649551545cfbab30b8-00185317',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_51545cfbad67a7_01828041',
  'variables' => 
  array (
    'user' => 0,
    'color' => 0,
    'item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_51545cfbad67a7_01828041')) {function content_51545cfbad67a7_01828041($_smarty_tpl) {?><div class="admin">
	<h2>Benutzer</h2>
	<table class="user">
		<tr>
			<th>Nachname</th>
			<th>Vorname</th>
			<th>eMail</th>
			<th>Rechte</th>
			<th>uSentenceLength</th>
			<th>uJumpLength</th>
			<th>uTreshold</th>
		</tr>
		<?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['user']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr class="<?php echo $_smarty_tpl->tpl_vars['color']->value;?>
">
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uLastname'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uName'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uEMailAdress'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uPermissonLevel'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uSentenceLength'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uJumpLength'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['uTreshold'];?>
</td>
		</tr>
		<?php if ($_smarty_tpl->tpl_vars['color']->value==''){?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('bgcolor', null, 0);?><?php }else{ ?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?><?php }?>
		<?php } ?>
	</table>

	<h2>New User Form</h2>
	<form method="post" action="" enctype="multipart/form-data">
		<table>
			<tr>
				<td>Vorname:</td>
				<td>
				<input type="text" name="uName" value="" />
				</td>
			</tr>
			<tr>
				<td>Nachname:</td>
				<td>
				<input type="text" name="uLastname" value="" />
				</td>
			</tr>
			<tr>
				<td>eMail:</td>
				<td>
				<input type="text" name="uEMailAdress" value="" />
				</td>
			</tr>
			<tr>
				<td>Passwort:</td>
				<td>
				<input type="password" name="uPassword" value="" />
				</td>
			</tr>
			<tr>
				<td>Berechtigung:</td>
				<td>
				<select name="uPermissonLevel">
					<option value="100">User</option>
					<option value="500">Admin</option>
					<!-- <option value="900">SuperAdmin</option> -->
				</select></td>
			</tr>

			<tr>
				<td></td>
				<td>
				<input type="submit" name="uAddSubmit" value="speichern" />
				</td>
			</tr>
		</table>
	</form>
</div><?php }} ?>