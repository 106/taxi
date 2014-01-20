# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$("#close_places_form").on "click", (event) ->
  event.preventDefault()
  event.stopPropagation()
  console.log '1'
  $("#add_to_route").trigger('click')
  console.log '2'
  $("#order_by_count").val "true"
  console.log '3'


city_id = $("#place_city_id").val()
$("#place_street").autocomplete
  source: "/streets.json?city_id=" + city_id
  minLength: 2
