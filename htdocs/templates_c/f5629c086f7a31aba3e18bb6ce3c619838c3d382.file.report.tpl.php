<?php /* Smarty version Smarty-3.1.12, created on 2013-03-30 11:08:44
         compiled from "templates/report.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15826133505156b4c869a068-68980608%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f5629c086f7a31aba3e18bb6ce3c619838c3d382' => 
    array (
      0 => 'templates/report.tpl',
      1 => 1364638124,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15826133505156b4c869a068-68980608',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.12',
  'unifunc' => 'content_5156b4c86d80f9_15674666',
  'variables' => 
  array (
    'results' => 0,
    'color' => 0,
    'item' => 0,
    'root' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5156b4c86d80f9_15674666')) {function content_5156b4c86d80f9_15674666($_smarty_tpl) {?><div class="report">
	<table>
		<?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['results']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr class="<?php echo $_smarty_tpl->tpl_vars['color']->value;?>
">
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['rtText'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['rtSourceText'];?>
</td>
			<td><a target="_blank" href="<?php echo $_smarty_tpl->tpl_vars['item']->value['rtSourceLink'];?>
"><img width="15" src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
thirdparty/icons/152_new_window.png" alt="<?php echo $_smarty_tpl->tpl_vars['item']->value['rtSourceLink'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['item']->value['rtSourceLink'];?>
" /></a></td>
		</tr>
		<?php if ($_smarty_tpl->tpl_vars['color']->value==''){?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('bgcolor', null, 0);?><?php }else{ ?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?><?php }?>
		<?php } ?>
	</table>
</div><?php }} ?>