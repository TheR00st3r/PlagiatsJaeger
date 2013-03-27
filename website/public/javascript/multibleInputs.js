$(function() {
	$('.addScnt').live('click', function() {

		var element = $(this).attr('title');

		var target, i, y, arrayName;

		if (element == 'article') {
			i = $('#article li').size() + 1;
			target = "#" + element;
		} else if(element == 'text') {
			target = $(this).parent().find("ol");
			arrayName = $(this).parent().find("ol").attr('id');
		} else {
			//ID vom Eltern Element
			i = $(this).parent().parent().attr('id');
			y = uid();
			target = "#" + element;
		}

		var elementArray = element.split('_');

		var datei = "single" + elementArray[0] + ".php";
		// var target = "#" + element + " li:last";

		$.ajax({
			type : "POST",
			url : datei,
			data : {
				'i' : i,
				'y' : y,
				'arrayName' : arrayName
			},
			success : function(message) {
				$(target).append(message);
			}
		});

		return false;
	});

	$('.removeInput').live('click', function() {
		$(this).parent().parent('li').remove();
		return false;
	});
});

$(document).ready(function() {
	$('#article').nestedSortable({
		handle : 'div',
		items : 'li',
		protectRoot : true,
		tabSize : 0,
		// toleranceElement: '> div',
		maxLevels : 0
	});
	
	$('.textMultible').nestedSortable({
		//var x = $(this);
		handle : 'div',
		items : 'li',
		protectRoot : true,
		tabSize : 0,
		toleranceElement: '> div',
		maxLevels : 20
		// stop : function(toArray) {
			//alert(order);
		// stop : function() {
			// var order = $('#test').nestedSortable('serialize');
			// alert(order);
			// alert(function('serialized'));
			// $(this).find('.temp').val(order);
		// }
	});
});

function uid() {
	var result = '';
	for (var i = 0; i < 32; i++)
		result += Math.floor(Math.random() * 16).toString(16).toUpperCase();
	return result
}