<?php /* Smarty version Smarty-3.1.12, created on 2013-03-30 11:29:23
         compiled from "templates/folder.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11515509635156ac45120ab4-41761360%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b4d6ac95279ebe8718a511ec67cd37525c10aca5' => 
    array (
      0 => 'templates/folder.tpl',
      1 => 1364639332,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11515509635156ac45120ab4-41761360',
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
  'unifunc' => 'content_5156ac452556a8_36172691',
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
    'color' => 0,
    'documents' => 0,
    'report' => 0,
  ),
  'has_nocache_code' => 0,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5156ac452556a8_36172691')) {function content_5156ac452556a8_36172691($_smarty_tpl) {?><div class="floatleft folders">
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

		<div id="newShortTestForm" style="display: none">
			<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
" enctype="multipart/form-data">
				<h2>Text Upload</h2>
				<label for="dAddShortText">Fügen Sie Ihren zu prüfenden Text ein:</label>
				<textarea name="dAddShortText" id="dAddShortText"></textarea>
				<br />
				<br />
				<label for="dAddShortAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
				<input type="text" name="dAddAutor" id="dAddShortAutor" />
				<br />
				<br />
				<input type="submit" name="dAddShortSubmit" value="upload" />
			</form>
		</div>
		<a class="create button" href="#newShortTestForm"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/file.gif" alt="" /> Schnelltest</a>
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
		<?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['folders']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr class="<?php echo $_smarty_tpl->tpl_vars['color']->value;?>
">
			<td class="image"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/folder-closed.gif" alt="" /></td>
			<td class="borderright">
			<div class="jeditable" id="fName_<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">
				<?php echo $_smarty_tpl->tpl_vars['item']->value['fName'];?>

			</div></td>
			<td class="borderright">&nbsp;</td>
			<td class="smal"> <?php if ($_smarty_tpl->tpl_vars['item']->value['fHashLink']!=''){?> <a target="_blank" href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
public?id=<?php echo $_smarty_tpl->tpl_vars['item']->value['fHashLink'];?>
">[Link]</a> <?php }else{ ?> <a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
?action=hash&amp;fID=<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">[hash]</a> <?php }?> </td>
			<td class="smal"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
?action=deleteFolder&amp;fID=<?php echo $_smarty_tpl->tpl_vars['item']->value['fID'];?>
">[delete]</a></td>
		</tr>
		<?php if ($_smarty_tpl->tpl_vars['color']->value==''){?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('bgcolor', null, 0);?><?php }else{ ?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?><?php }?>
		<?php } ?>
		<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['documents']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
		<tr class="<?php echo $_smarty_tpl->tpl_vars['color']->value;?>
">
			<td class="image"><img src="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
images/file.gif" alt="" /></td>
			<td class="borderright"> <?php echo $_smarty_tpl->tpl_vars['item']->value['dOriginalName'];?>
<?php echo $_smarty_tpl->tpl_vars['item']->value['dID'];?>

			
				<?php  $_smarty_tpl->tpl_vars['report'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['report']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['item']->value['reports']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['report']->key => $_smarty_tpl->tpl_vars['report']->value){
$_smarty_tpl->tpl_vars['report']->_loop = true;
?>
				<li>
					<a href="report.php?rID=<?php echo $_smarty_tpl->tpl_vars['report']->value['rID'];?>
" class="pictureManager fancybox.iframe"><?php echo $_smarty_tpl->tpl_vars['report']->value['rDate'];?>
</a>
					<!-- <a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
report?rID=<?php echo $_smarty_tpl->tpl_vars['report']->value['rID'];?>
"><?php echo $_smarty_tpl->tpl_vars['report']->value['rDate'];?>
 -->
				</li>
				<?php } ?>
			</td>
			<td class="borderright"><?php echo $_smarty_tpl->tpl_vars['item']->value['dAuthor'];?>
</td>
			<td class="smal"><a href="<?php echo $_smarty_tpl->tpl_vars['root']->value;?>
<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
?action=check&amp;dID=<?php echo $_smarty_tpl->tpl_vars['item']->value['dID'];?>
">[prüfen]</a></td>
			<td class="smal">[delete]</td>
		</tr>
		<?php if ($_smarty_tpl->tpl_vars['color']->value==''){?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('bgcolor', null, 0);?><?php }else{ ?><?php $_smarty_tpl->tpl_vars['color'] = new Smarty_variable('', null, 0);?><?php }?>
		<?php } ?>
	</table>

</div>
<div class="floatclear">
	&nbsp;
</div>
<?php }} ?>