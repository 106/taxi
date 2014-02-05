# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

city_id = $("#place_city_id").val()
$("#place_address").autocomplete
  source: "/streets.json?city_id=" + city_id
  minLength: 2
