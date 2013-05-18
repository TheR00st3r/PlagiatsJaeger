<div id="deleteFolderForm{$item.fID}" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="fID" value="{$item.fID}" />
		<h2>Ordner löschen?</h2>
		Mit dem Ordner werden auch alle Dokumente und Plagiatsprüfungen im Ordner gelöscht.
		<br />
		<br />
		<input type="submit" name="button[deleteFolder]" value="löschen" />
	</form>
</div>