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