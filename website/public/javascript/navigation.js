	$(function() {

		//Navigation
		$("#nav li:has(ul)").hover(function(){
			$(this).find("ul").slideDown();
		}, function(){
			$(this).find("ul").hide();
		});

		//Tabs
		$( "#tap" ).tabs();

		//Sortieren
		// $( ".column" ).sortable({
			// connectWith: ".column"
		// });
		
		//Sortieren
		// $( ".portlet" ).addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
			// .find( ".portlet-header" )
				// .addClass( "ui-widget-header ui-corner-all" )
				// .prepend( "<span class='ui-icon ui-icon-minusthick'></span>")
				// .end()
			// .find( ".portlet-content" );
//  
		// $( ".portlet-header .ui-icon" ).click(function() {
			// $( this ).toggleClass( "ui-icon-minusthick" ).toggleClass( "ui-icon-plusthick" );
			// $( this ).parents( ".portlet:first" ).find( ".portlet-content" ).toggle();
		// });
 
		// $( ".column" ).disableSelection();
	});