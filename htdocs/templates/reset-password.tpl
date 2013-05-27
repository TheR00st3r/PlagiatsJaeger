Hallo <b>{$user.uName} {$user.uLastname}</b><br />
<br />
geben Sie bitte eine neues Passwort ein:<br />
<br />
<form action="{$root}{$page}?key={$smarty.get.key}" method="post">

	<label for="uPassword1">Ihr neues Passwort:</label>
	<input id="uPassword1" class="text" type="password" name="uPassword1" value="" /><br />
	<br />
	<label for="uPassword2">Ihr neues Passwort bestätigen:</label>
	<input id="uPassword2" class="text" type="password" name="uPassword2" value="" /><br />
	<br />
	<input name="uPasswordReset" type="submit" value="Passwort speichern" />
</form>