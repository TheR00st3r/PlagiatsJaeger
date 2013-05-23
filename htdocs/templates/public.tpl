<form method="post" action="{$root}public?id={$smarty.get.id}" enctype="multipart/form-data">
	<h2>Externer Dateiupload</h2>
	<label for="dAddFile">Wählen Sie die zu prüfende Datei:</label>
	<input type="file" name="dAddFile[]" id="dAddFile" multiple="multiple" />
	<br />
	<br />
	<label for="dAddAutor">Fügen Sie Ihren Namen hinzu:</label>
	<input type="text" name="dAddAutor" id="dAddAutor" />
	<br />
	<br />
	<input type="submit" name="dAddSubmit" value="upload" />
</form>
