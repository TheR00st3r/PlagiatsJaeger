<form method="post" action="{$root}registrate">
	<h2>Registrieren</h2>
	
	<table>
		<tr>
			<td><label for="uName">Vorname</label></td>
			<td><input type="text" name="uName" id="uName" value="{$smarty.post.uName}" /></td>
		</tr>
		<tr>
			<td><label for="uLastname">Nachname</label></td>
			<td><input type="text" name="uLastname" id="uLastname" value="{$smarty.post.uLastname}" /></td>
		</tr>
		<tr>
			<td><label for="uEMailAdress">eMail-Adresse</label></td>
			<td><input type="text" name="uEMailAdress" id="uEMailAdress" value="{$smarty.post.uEMailAdress}" /></td>
		</tr>
		<tr>
			<td><label for="uPassword">Passwort</label></td>
			<td><input type="password" name="uPassword" id="uPassword" value="" /></td>
		</tr>
		<tr>
			<td><label for="uPassword2">Passwort</label></td>
			<td><input type="password" name="uPassword2" id="uPassword2" value="" /></td>
		</tr>
		<tr>
			<td><label for="cID">Mandantennummer</label></td>
			<td><input type="text" name="cID" id="cID" value="{$smarty.post.cID}" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="button[uRegistrate]" value="registrieren" /></td>
		</tr>
	</table>
</form>
