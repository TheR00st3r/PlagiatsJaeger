<div id="newShortTestForm" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<h2>Text Upload</h2>
		<label for="dAddShortText">Fügen Sie Ihren zu prüfenden Text ein:</label>
		<textarea name="dAddShortText" id="dAddShortText"></textarea>
		<br />
		<br />
		<label for="dAddShortAutor">Fügen Sie den Namen des Autors/Studenten hinzu:</label>
		<input type="text" name="dAddAutor" id="dAddShortAutor" />
		<br />
		<br />
		<input type="submit" name="button[newShortTest]" value="upload" />
	</form>
</div>