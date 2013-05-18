<div id="activateUserForm{$item.uID}" style="display: none">
	<form method="post" action="{$root}{$page}">
		<input type="hidden" name="uID" value="{$item.uID}" />
		<h2>Benutzer freischlaten</h2>
		<label for="uPermissonLevel">Berechtigung:</label>
		<select name="uPermissonLevel" id="uPermissonLevel">
			<option value="100">User</option>
			<option value="500">Admin</option>
			<!-- <option value="900">SuperAdmin</option> -->
		</select>
		<br />
		<input type="submit" name="button[activateUser]" value="freischalten" />
	</form>
</div>