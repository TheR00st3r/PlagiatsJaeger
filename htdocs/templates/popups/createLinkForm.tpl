<div id="createLinkForm{$item.fID}" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<input type="hidden" name="fID" value="{$item.fID}" />
		<h2>Link für Studenten freigeben</h2>
		<label for="fLinkExpireDatetime">Link freigeben bis:</label>
		<input type="text" name="fLinkExpireDatetime" id="fLinkExpireDatetime" value="2013-12-12 23:59:59" />
		<br />
		<br />
		<input type="submit" name="button[createLink]" value="freigeben" />
	</form>
</div>