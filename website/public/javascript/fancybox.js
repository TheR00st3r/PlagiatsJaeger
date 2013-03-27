$(document).ready(function() {
	$('.pictureManager').fancybox({

		autoSize : false,

		// beforeShow : function() {
		// x = $('.fancybox-iframe').contents().find('#xyz').val();
		// },
		// afterClose : function() {
		// $(this).parent().children('input').val(x);
		//$('.pictureImput').val(x);
		//alert("the value of input#xyz is : " + x);
		// optional
		// }
	});

	//Picture Manager
	$('.preview').fancybox({
		openEffect : 'fade',
		closeEffect : 'fade',
		nextEffect : 'fade',
		prevEffect : 'fade',
		padding : 3,
		closeClick : true,
		helpers : {
			title : {
				type : 'inside'
			}
		}
	});

	//Text
	$('.picture').fancybox({
		padding : 10,
		closeClick : true,
		helpers : {
			title : {
				type : 'inside'
			}
		}
	});
});
