<?php /* Smarty version Smarty-3.1.12, created on 2013-03-27 11:02:03
         compiled from "templates/pages/fileManager.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19647083805151fd0d1e87d3-31906301%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7845d11cf9a9a3959963973b01c6460b79d50d98' => 
    array (
      0 => 'templates/pages/fileManager.tpl',
      1 => 1364378518,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19647083805151fd0d1e87d3-31906301',
  'function' => 
  array (
    'printFolders' => 
    array (
      'parameter' => 
      array (
      ),
      'compiled' => '',
    ),
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5151fd0d20e9c3_11551735',
  'variables' => 
  array (
    'level' => 0,
    'items' => 0,
    'item' => 0,
    'root' => 0,
    'folderNav' => 0,
    'page' => 0,
    'folder' => 0,
    'folders' => 0,
    'documents' => 0,
  ),
  'has_nocache_code' => 0,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5151fd0d20e9c3_11551735')) {function content_5151fd0d20e9c3_11551735($_smarty_tpl) {?><div class="floatleft folders">
	<?php if (!function_exists('smarty_template_function_printFolders')) {
    function smarty_template_function_printFolders($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['printFolders']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<?php if ($_smarty_tpl->tpl_vars['level']->value==0){?>
	<ul>
		<?php }else{ ?>
		<ul>
			<?php }?>
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['items']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
			<li id="foo_<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">
				<a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
folder/<?php echo $_smarty_tpl->tpl_vars['item']->value['root'];?>
<?php echo $_smarty_tpl->tpl_vars['item']->value['alias'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['fName'];?>
</a>
				<?php if ($_smarty_tpl->tpl_vars['item']->value['sub']){?>
				<?php smarty_template_function_printFolders($_smarty_tpl,array('items'=>$_smarty_tpl->tpl_vars['item']->value['sub'],'level'=>$_smarty_tpl->tpl_vars['level']->value+1));?>

				<?php }?>
			</li>
			<?php } ?>
		</ul>
		<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;}}?>


		<?php smarty_template_function_printFolders($_smarty_tpl,array('items'=>$_smarty_tpl->tpl_vars['folderNav']->value,'level'=>0));?>

</div>
<div class="floatright files">
	<div class="">
		<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
">
			Neuer Ordner:
			<input type="text" name="fAddName" value="" />
			<input type="hidden" name="fAddParent" value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['fID'];?>
" />
			<input type="submit" name="fAddSubmit" value="speichern" />
		</form>
	</div>

	<table class="documents">
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['folders']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr>
			<td></td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['fName'];?>
</td>
			<td></td>
			<td>[hash]</td>
			<td><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
?delete&amp;fID=<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">[delete]</a></td>
		</tr>
		<?php } ?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['documents']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr>
			<td></td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['dOriginalName'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['dAuthor'];?>
</td>
			<td>[prüfen]</td>
			<td>[delete]</td>
		</tr>
		<?php } ?>
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
<?php }} ?>