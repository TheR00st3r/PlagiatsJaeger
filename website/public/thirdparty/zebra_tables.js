function zebra_tables() {
	if ( typeof document.getElementsByTagName == 'undefined')
		return;
	var counter, c, // columns
	r, // rows
	t, // tables
	evenRows, evenColumns;
	t = document.getElementsByTagName("table");
	for (var i = 0; i < t.length; i++) {
		evenRows = t[i].className.match(/evenRows/);
		evenColumns = t[i].className.match(/evenCols/);
		r = t[i].getElementsByTagName("tr");
		for (var j = 0; j < r.length; j++) {
			// add "oddRow" class to odd rows
			if (evenRows && (j % 2 == 1)) {
				r[j].className = "evenRow " + r[j].className;
			}
			if (evenColumns) {
				c = r[j].childNodes;
				counter = 0;
				for (var k = 0; k < c.length; k++) {
					// node must be element, not whitespace
					// add "oddCol" class to odd cells
					if ((c[k].nodeType == 1) && (counter++ % 2 == 1)) {
						c[k].className = "evenCol " + c[k].className;
					}
				}
			}
		}
	}
}