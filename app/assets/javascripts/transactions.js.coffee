# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

show_destination = ->
  $('#customer-tr, #safe-tr, #bank-tr').hide()
  id = $('#transaction_destination_type').val().toLowerCase() + "-tr"
  $("#"+id).show()

ready = ->
  show_destination()
  $('#transaction_destination_type').change ->
    show_destination()

$(document).ready(ready)
$(document).on('page:load', ready)