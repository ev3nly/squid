# http://ws.geonames.org/searchJSON?name_startsWith=Chic&country=US

# url: "/locations?callback=?&q=%QUERY"
# url: "http://gd.geobytes.com/AutoCompleteCity?callback=?&filter=US&q=%QUERY"

$( document ).ready ->
	$(".model-location").typeahead
		name: "Cities Bitches"
		remote: 
			url: "/locations?callback=?&q=%QUERY"
			dataType: "jsonp"

		# local: ["San Francisco, CA", "New York, NY"]
		# limit: 10