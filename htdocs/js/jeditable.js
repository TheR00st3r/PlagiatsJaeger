$(document).ready(function() {
	//$('.jeditable').editable('http://www.example.com/save.php');

	$('.jeditable').editable('jeditable.php', {
		type : 'text',
		cancel : 'Cancel',
		submit : 'OK',
		// indicator : '<img src="img/indicator.gif">',
		tooltip : 'Click to edit...',
		id : 'id',
		name : 'content'
	});
});
