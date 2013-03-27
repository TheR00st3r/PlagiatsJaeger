$(document).ready(function() {
	$('#sortable').nestedSortable({
		handle : 'div',
		items : 'li',
		toleranceElement : '> div',
		maxLevels : 5,
		stop : function() {
			var order = $('#sortable').nestedSortable('toArray');
			$.ajax({
				type : "POST",
				url : "saveNavigationSort.php",
				data : {
					'navigation' : order
				},
				success : function(message) {
					//alert(message);
					if (message == 1) {
						toastr.success("Änderungen gespeichert.")
					} else {
						toastr.error("Es ist ein Fehler beim Speichern aufgetreten.");
					}

					// $('#ajaxOutput').show();
					// $('#ajaxOutput').html(message);
					// $('#ajaxOutput').delay(2000).slideUp('slow');
				}
			});
		}
	});

	// $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".portlet-header").addClass("ui-widget-header ui-corner-all").prepend("<span class='ui-icon ui-icon-minusthick'></span>").end().find(".portlet-content");
// 
	// $(".portlet-header .ui-icon").click(function() {
		// $(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
		// $(this).parents(".portlet:first").find(".portlet-content").toggle();
	// });

	// $('#save').click(function () {
	// var order = $('#sortable').nestedSortable('toArray');
	// $.ajax({
	// type: "POST",
	// url: "saveNavigationSort.php",
	// data: {'navigation': order},
	// success: function(message){
	// //alert(message);
	// if(message == 1) {
	// toastr.success("Änderungen gespeichert.")
	// }
	// else {
	// toastr.error("Es ist ein Fehler beim Speichern aufgetreten.");
	// }
	//
	// // $('#ajaxOutput').show();
	// // $('#ajaxOutput').html(message);
	// // $('#ajaxOutput').delay(2000).slideUp('slow');
	// }
	// });
	// });
}); 