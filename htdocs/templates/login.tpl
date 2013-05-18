<form method="post" action="{$root}" enctype="multipart/form-data">
	<fieldset class="loginform">
		<legend>
			Login Form
		</legend>
		<table>
			<tr>
				<td>eMail:</td>
				<td>
				<input type="text" name="lEMailAdress" value="" />
				</td>
			</tr>
			<tr>
				<td>Passwort:</td>
				<td>
				<input type="password" name="lPassword" value="" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="submit" name="lSubmit" value="login" />
				</td>
			</tr>

		</table>
		<br />
		<a href="{$root}forgot-password">Passwort vergessen?</a><br />
		<a href="{$root}registrate">Ich möchte mich Registrieren.</a>
	</fieldset>
</form>