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

    console.log window.selectedSports
    console.log numberOfSports()
    $(".select-sports-count").text("#{numberOfSports()} sports selected!")

  $(".sign-up-select-sports .sport")
    .mouseenter (event) -> 
      $("##{this.id} .sport-level-selector").css("visibility", "visible")
    .mouseleave (event) -> 
      $("##{this.id} .sport-level-selector").css("visibility", "hidden")

  $(".select-sports-submit").click (event) ->
    console.log window.selectedSports
    console.log $(".model-other-sports").val()
    console.log $(".model-phone").val()
    console.log $(".model-location").val()