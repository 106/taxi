# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$("#close_places_form").on "click", (event) ->
  event.preventDefault()
  event.stopPropagation()
  $("#add_to_route").trigger('click')
  $("#order_by_count").val "true"

city_id = $("#place_city_id").val()
$("#place_street").autocomplete
  source: "/streets.json?city_id=" + city_id
  minLength: 2

$("#additional_toggler").on "click", (event) ->
  event.preventDefault()
  event.stopPropagation()
  $("#additional").toggle();
  $("#additional_toggler i").toggleClass("icon-chevron-down icon-chevron-up");
