$ ->
	console.log "binding form.search-bar's submit"
	$("form.search-bar").submit (event) ->
		window.location.href = "/search/#{$("input.search-bar-query").val()}"
		false