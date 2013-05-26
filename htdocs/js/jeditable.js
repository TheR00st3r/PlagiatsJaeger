$(document).ready(function() {
	//$('.jeditable').editable('http://www.example.com/save.php');

	$('.jeditable').editable('jeditable.php', {
		type : 'text',
		cancel : 'Abbrechen',
		submit : 'OK',
		// indicator : '<img src="img/indicator.gif">',
		tooltip : 'Klicken zum Bearbeiten....',
		id : 'id',
		name : 'content'
	});
});
