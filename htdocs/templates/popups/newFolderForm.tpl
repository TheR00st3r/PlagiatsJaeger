<div id="newFolderForm" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="fAddParent" value="{$folder.fID}" />
		<h2>Neuer Ordner</h2>
		<input type="text" name="fAddName" value="" />
		<br />
		<br />
		<input type="submit" name="button[newFolder]" value="speichern" />
	</form>
</div>