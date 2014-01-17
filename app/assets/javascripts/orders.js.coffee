# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$("#close_places_form").on "click", (event) ->
  event.preventDefault()
  event.stopPropagation()
  $("#add_to_route").trigger('click')
  $("input#order_by_count").val "true"
