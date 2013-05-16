<div id="deleteDocumentForm{$item.dID}" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="dID" value="{$item.dID}" />
		<h2>Dokument löschen?</h2>
		Mit dem Dokument werden auch alle dazugehörigen Plagiatsprüfungen gelöscht.
		<br />
		<br />
		<input type="submit" name="button[deleteDocument]" value="löschen" />
	</form>
</div>