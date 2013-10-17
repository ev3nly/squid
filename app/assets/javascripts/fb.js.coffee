window.fbConnected = ->
  console.log "Welcome! Fetching your information..."
  FB.api "/me", (response) ->
    console.log "Good to see you, #{response.name}."

$( document ).ready ->
  $(".btn-fb").click ->
    FB.getLoginStatus (response) ->
    	window.location = "/auth/facebook"
      # FB.login (response) ->
      #   console.log "connected 2!"
      #   window.location = "/auth/facebook/callback?#{$.param({ signed_request: response.authResponse.signedRequest })}" if response.authResponse