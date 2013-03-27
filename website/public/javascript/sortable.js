$(document).ready(function() {
	$('.sortable2').nestedSortable({
		handle : 'div',
		items : 'li',
		toleranceElement : '> div',
		maxLevels : 1,
		stop : function() {
			var order = $(this).nestedSortable('toArray');
			var table = $(this).attr('rel');
			$.ajax({
				type : "POST",
				url : "saveSort.php",
				data : {
					'table' : table,
					'order' : order
				},
				success : function(message) {
					// alert(message);
					if (message == 1) {
						toastr.success("Änderungen gespeichert.")
					} else {
						toastr.error("Es ist ein Fehler beim Speichern aufgetreten.");
					}
				}
			});
		}
	});
}); 