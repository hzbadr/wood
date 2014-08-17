# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

show_destination = ->
  $('#supplier-tr, #customer-tr, #safe-tr, #bank-tr').prop('disabled', true).hide().parent().hide()
  id = $('#transaction_destination_type').val().toLowerCase() + "-tr"
  $("#"+id).prop('disabled', false).show().parent().show()

ready = ->
  show_destination()
  $('#transaction_destination_type').change ->
    show_destination()
    
if $('#transaction_destination_type').length > 0
  $(document).ready(ready)
  $(document).on('page:load', ready)