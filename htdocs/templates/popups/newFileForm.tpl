<div id="newFileForm" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<h2>File Upload</h2>
		<label for="dAddFile">Wählen Sie die zu prüfende Datei:</label>
		<input type="file" name="dAddFile[]" id="dAddFile" multiple="multiple" />
		<br />
		<br />
		<label for="dAddAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
		<input type="text" name="dAddAutor" id="dAddAutor" />
		<br />
		<br />
		<input type="submit" name="button[newFile]" value="upload" />
	</form>
</div>