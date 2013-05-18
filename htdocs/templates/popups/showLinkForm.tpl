<div id="showLinkForm{$item.fID}" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<input type="hidden" name="fID" value="{$item.fID}" />
		<h2>Link ist für Studenten freigegeben</h2>
		Ablaufdatum: {$item.fLinkExpireDatetime|date_format:'%d.%m.%Y %H:%M'}
		<br />
		<br />
		<a target="_blank" href="{$root}public?id={$item.fHashLink}">{$root}public?id={$item.fHashLink}</a>
	</form>
</div>