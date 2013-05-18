<div id="shareFolderForm{$item.fID}" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<input type="hidden" name="fID" value="{$item.fID}" />
		<h2>Ordner Kollegen freigeben</h2>
		Kollege auswählen:
		{foreach $users as $user}
		<label for="user{$item.fID}{$user.uID}"> <input {if {$user.uID}|in_array:$item.user}checked="checked"{/if} type="checkbox" name="uIDs[]" value="{$user.uID}" id="user{$item.fID}{$user.uID}" /> {$user.uName} {$user.uLastname}</label>
		{/foreach}
		<br />
		<input type="submit" name="button[shareFolder]" value="teilen" />
	</form>
</div>