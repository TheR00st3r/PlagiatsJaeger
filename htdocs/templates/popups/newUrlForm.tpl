<div id="newUrlForm" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<h2>Text Upload</h2>
		<label for="dOriginalName">Fügen Sie Ihren zu prüfende Url ein:</label>
		<input type="text" name="dOriginalName" id="dOriginalName" />
		<br />
		<br />
		<label for="dAddShortAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
		<input type="text" name="dAddAutor" id="dAddShortAutor" />
		<br />
		<br />
		<input type="submit" name="button[newUrl]" value="upload" />
	</form>
</div>