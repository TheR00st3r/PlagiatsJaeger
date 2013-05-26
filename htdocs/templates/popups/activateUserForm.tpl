<div id="activateUserForm{$item.uID}" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="uID" value="{$item.uID}" />
		<h2>Benutzer freischlaten</h2>
		<label for="uPermissonLevel">Berechtigung:</label>
		<select name="uPermissonLevel" id="uPermissonLevel">
			<option value="100">Dozent</option>
			<option value="500">Administrator</option>
		</select>
		<br />
		<br />
		<input type="submit" name="button[activateUser]" value="freischalten" />
	</form>
</div>