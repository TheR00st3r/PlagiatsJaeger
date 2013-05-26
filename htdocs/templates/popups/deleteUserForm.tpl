<div id="deleteUserForm{$item.uID}" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="uID" value="{$item.uID}" />
		<h2>Benutzer löschen?</h2>
		Mit dem Benutzer werden auch alle seine Dokumente und Plagiatsprüfungen gelöscht.
		<br />
		<br />
		<input type="submit" name="button[deleteUser]" value="löschen" />
	</form>
</div>