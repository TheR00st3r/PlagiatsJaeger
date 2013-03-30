$(document).ready(function() {
	var element;
	$('.create').click(function() {
		element = $(this).attr("href");
	}).fancybox({
		'autoDimensions' : true,
		'titleShow' : false,
		'onStart' : function() {
			//aktuelles UploadForm enzeigen
			$(element).show();
		},
		'onClosed' : function() {
			//alle Uploadforms ausblenden
			$('.uploadforms').hide();
		}
	});
}); 