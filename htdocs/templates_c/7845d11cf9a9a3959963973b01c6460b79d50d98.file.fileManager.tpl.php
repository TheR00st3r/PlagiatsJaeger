<?php /* Smarty version Smarty-3.1.12, created on 2013-03-28 15:40:53
         compiled from "templates/pages/fileManager.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21137632945152cbfe62a372-47018487%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7845d11cf9a9a3959963973b01c6460b79d50d98' => 
    array (
      0 => 'templates/pages/fileManager.tpl',
      1 => 1364481650,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21137632945152cbfe62a372-47018487',
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
  'unifunc' => 'content_5152cbfe6c4331_53417201',
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
<?php if ($_valid && !is_callable('content_5152cbfe6c4331_53417201')) {function content_5152cbfe6c4331_53417201($_smarty_tpl) {?><div class="floatleft folders">
	<?php if (!function_exists('smarty_template_function_printFolders')) {
    function smarty_template_function_printFolders($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['printFolders']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<?php if ($_smarty_tpl->tpl_vars['level']->value!=0){?>
	<ul>
		<?php }?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['items']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<li id="foo_<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">
			<span class="folder"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
folder/<?php echo $_smarty_tpl->tpl_vars['item']->value['root'];?>
<?php echo $_smarty_tpl->tpl_vars['item']->value['alias'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['fName'];?>
</a></span>
			<?php if ($_smarty_tpl->tpl_vars['item']->value['sub']){?>
			<?php smarty_template_function_printFolders($_smarty_tpl,array('items'=>$_smarty_tpl->tpl_vars['item']->value['sub'],'level'=>$_smarty_tpl->tpl_vars['level']->value+1));?>

			<?php }?>
		</li>
		<?php } ?>
	</ul>
	<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;}}?>

	<ul id="filetree1" class="filetree">
		<li>
			<span class="folder"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
folder/">Meine Dateien</a></span>
			<ul>
				<?php smarty_template_function_printFolders($_smarty_tpl,array('items'=>$_smarty_tpl->tpl_vars['folderNav']->value,'level'=>0));?>

		</li>
		<li>
			<span class="folder"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
folder/">Freigegebene Ordner (not impl.)</a></span>
			<ul>
				<li>
					<span class="folder">AVH</span>
					<ul>
						<li>
							<span class="folder">Vorlesung Logic</span>
						</li>
						<li>
							<span class="folder">Volesung Test</span>
						</li>
					</ul>
				</li>
				<li>
					<span class="folder">PL</span>
					<ul>
						<li>
							<span class="folder">Vorlesung Compilerbau</span>
						</li>
					</ul>
				</li>

			</ul>
		</li>

</div>
<div class="floatright files">
	<div class="folderMenue">

		<div id="newFolderForm" style="display: none">
			<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
">
				<h2>Neuer Ordner</h2>
				<input type="text" name="fAddName" value="" />
				<input type="hidden" name="fAddParent" value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['fID'];?>
" />
				<input type="submit" name="fAddSubmit" value="speichern" />
			</form>
		</div>
		<a class="create button" href="#newFolderForm"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/folder-closed.gif" alt="" /> Neuer Ordner</a>

		<?php if ($_smarty_tpl->tpl_vars['folder']->value['fID']){?>
		<div id="newFileForm" style="display: none">
			<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
" enctype="multipart/form-data">
				<h2>File Upload</h2>
				<label for="dAddFile">Wählen Sie die zu prüfende Datei:</label>
				<input type="file" name="dAddFile" id="dAddFile" multiple="multiple" />
				<br />
				<br />
				<label for="dAddAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
				<input type="text" name="dAddAutor" id="dAddAutor" />
				<br />
				<br />
				<input type="submit" name="dAddSubmit" value="upload" />
			</form>
		</div>
		<a class="create button" href="#newFileForm"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/file.gif" alt="" /> Datei upload</a>
		<?php }?>
	</div>
	<?php echo $_smarty_tpl->tpl_vars['folder']->value['pathName'];?>

	<br />
	<br />
	<table class="documents">
		<tr>
			<th colspan="2">Filename</th>
			<th>Autor</th>
			<th colspan="2">Optionen</th>
		</tr>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['folders']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr>
			<td class="image"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/folder-closed.gif" alt="" /></td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['fName'];?>
</td>
			<td>&nbsp;</td>
			<td class="smal"> <?php if ($_smarty_tpl->tpl_vars['item']->value['fHashLink']!=''){?> <a target="_blank" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
public?id=<?php echo $_smarty_tpl->tpl_vars['item']->value['fHashLink'];?>
">[Link]</a> <?php }else{ ?> <a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
?link&amp;fID=<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">[hash]</a> <?php }?> </td>
			<td class="smal"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
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
			<td class="image"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/file.gif" alt="" /></td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['dOriginalName'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['item']->value['dAuthor'];?>
</td>
			<td class="smal">[prüfen]</td>
			<td class="smal">[delete]</td>
		</tr>
		<?php } ?>
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
<?php }} ?>