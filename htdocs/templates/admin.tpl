<div class="admin">
	<h2>Benutzer</h2>
	<table class="user">
		<tr>
			<th>Nachname</th>
			<th>Vorname</th>
			<th>eMail</th>
			<th>Rechte</th>
			<th>slTitle</th>
			<th>sCheckWWW</th>
			<th>sThreshold</th>
			<th>Client</th>
			<th></th>
		</tr>
		{$color = ''}
		{foreach from=$user item=item}
		<tr class="{$color}">
			<td>
				{$item.uLastname}
			</td>
			<td>
				{$item.uName}
			</td>
			<td>
				{$item.uEMailAdress}
			</td>
			<td>
				{$item.uPermissonLevel}
			</td>
			<td>
				{$item.slTitle}
			</td>
			<td>
				{$item.sCheckWWW}
			</td>
			<td>
				{$item.sThreshold}
			</td>
			<td>
				{$item.cName}
			</td>
			<td>
				{if $item.uPermissonLevel == 1}
				{include 'popups/activateUserForm.tpl'}
				<a class="create" href="#activateUserForm{$item.uID}">[activate]</a>
				{/if}
				{include 'popups/deleteUserForm.tpl'}
				<a class="create" href="#deleteUserForm{$item.uID}">[löschen]</a>
			</td>
		</tr>
		{if $color == ''}{$color = 'bgcolor'}{else}{$color = ''}{/if}
		{/foreach}
	</table>

	<br />
	<br />
	<br />

	<h2>Neuen Benuter anlegen</h2>
	<form method="post" action="" enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					Vorname:
				</td>
				<td>
					<input type="text" name="uName" value="" />
				</td>
			</tr>
			<tr>
				<td>
					Nachname:
				</td>
				<td>
					<input type="text" name="uLastname" value="" />
				</td>
			</tr>
			<tr>
				<td>
					eMail:
				</td>
				<td>
					<input type="text" name="uEMailAdress" value="" />
				</td>
			</tr>
			<tr>
				<td>
					Passwort:
				</td>
				<td>
					<input type="password" name="uPassword" value="" />
				</td>
			</tr>
			<tr>
				<td>
					Berechtigung:
				</td>
				<td>
					<select name="uPermissonLevel">
						<option value="100">User</option>
						<option value="500">Admin</option>
						<!-- <option value="900">SuperAdmin</option> -->
					</select>
				</td>
			</tr>

			<tr>
				<td></td>
				<td>
					<input type="submit" name="button[uAddSubmit]" value="speichern" />
				</td>
			</tr>
		</table>
	</form>
</div>