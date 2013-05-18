<div id="newFolderForm" style="display: none">
	<form method="post" action="{$root}{$page}">
		<h2>Neuer Ordner</h2>
		<input type="text" name="fAddName" value="" />
		<input type="hidden" name="fAddParent" value="{$folder.fID}" />
		<input type="submit" name="button[newFolder]" value="speichern" />
	</form>
</div>