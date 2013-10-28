# sign-up-select-sports sport
# select-sports-count


# add a class for selected vs unselected
# keep track of number of selected sports and reflect in select-sports-count

# levels of competition keys - basketball:casual

window.selectedSports = {}

addSport = (sportKey) ->
  window.selectedSports[sportKey] = 1

  sport = sportKey.split(":")[0]
  $("##{sport}").addClass("selected")

removeSport = (sportKey) ->
  delete window.selectedSports[sportKey]

  sport = sportKey.split(":")[0]
  $("##{sport}").removeClass("selected")

toggleSport = (sportKey) ->
  if window.selectedSports[sportKey]
    removeSport(sportKey)
  else
    addSport(sportKey)

numberOfSports = ->  
  sports = []
  _.each _.keys(window.selectedSports), (sportKey) ->
    sport = sportKey.split(":")[0]
    sports.push sport if _.indexOf(sports, sport) == -1

  console.log sports
  sports.length

$( document ).ready ->
  $(".sign-up-select-sports .sport button.btn").click (event) -> 
    button = $(this)
    
    sport = button.parent().parent().attr("id")
    level = button.text().toLowerCase()

    alreadySelected = button.hasClass("selected")

    $("##{sport} button.btn.selected").toggleClass("selected")
    button.toggleClass("selected") if not alreadySelected

    removeSport("#{sport}:competitive")
    removeSport("#{sport}:casual")
    if !alreadySelected
      if level == "both"
        toggleSport("#{sport}:competitive")
        toggleSport("#{sport}:casual")
      else
        toggleSport("#{sport}:#{level}")

    if (numberOfSports() == 0) 
      $(".select-sports-count").text("No sports selected")
    else
      sportsString = if (numberOfSports() > 1) then "sports" else "sport"
      $(".select-sports-count").text("#{numberOfSports()} #{sportsString} selected!")

  $(".sign-up-select-sports .sport")
    .mouseenter (event) -> 
      $("##{this.id} .sport-level-selector").addClass("selected")
    .mouseleave (event) -> 
     $("##{this.id} .sport-level-selector").removeClass("selected")

  $(".select-sports-submit").click (event) ->
    email = $(".model-email").val()
    location = $(".model-location").val()
    phone = $(".model-phone").val()
    otherSports = $(".model-other-sports").val()

    error = false

    if not email
      $(".error.email").removeClass("hidden")
      error = true
    else
      $(".error.email").addClass("hidden")

    if not location
      $(".error.location").removeClass("hidden")
      error = true
    else
      $(".error.location").addClass("hidden")

    if not phone
      $(".error.phone").removeClass("hidden")
      error = true
    else
      $(".error.phone").addClass("hidden")

    return if error

    data =
      email:        email
      location: 		location
      phone: 				phone
      other_sports: otherSports

    form = $(".select-sports-form")
    _.each data, (value, key) -> form.append("<input type='hidden' name='#{key}' id='#{key}' value='#{value}'/>")
    _.each window.selectedSports, (value, sportKey) -> form.append("<input type='hidden' name='sports[]' id='sports[]' value='#{sportKey}'/>")
    form.submit()

    $(".select-sports-submit").button("loading")
