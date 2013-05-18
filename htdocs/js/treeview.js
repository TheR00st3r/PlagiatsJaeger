$(document).ready(function() {

	$("#filetree1").treeview({
		animated : "fast",
		persist : "location",
		collapsed : true,
		unique : false
	});

	$(".filetree2").treeview({
		animated : "fast",
		persist : "location",
		collapsed : false,
		unique : false
	});

	// fourth example
	$("#black, #gray").treeview({
		control : "#treecontrol",
		persist : "cookie",
		cookieId : "treeview-black"
	});

	// third example
	$("#test").treeview({
		animated : "fast",
		collapsed : true,
		unique : true,
		persist : "cookie"
	});

});

$('ul#checkboxes').checkboxTree({ });


(function($){
$('ul#checkboxes input[type="checkbox"]').each (
 function () {
  $(this).bind('click change', function (){
   if($(this).is(':checked')) {
    $(this).siblings('ul').find('input[type="checkbox"]').attr('checked', 'checked');
    $(this).parents('ul').siblings('input[type="checkbox"]').attr('checked', 'checked');
   } else {
    $(this).siblings('ul').find('input[type="checkbox"]').removeAttr('checked', 'checked');
   }
  });
 }
);
})(jQuery);