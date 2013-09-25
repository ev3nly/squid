$ ->
	$("form.search").submit (event) ->
		window.location.href = "search/#{$("input.search-query").val()}"
		false