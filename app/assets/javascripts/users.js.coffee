# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).bind 'success.rest-in-place', (event, json) ->
  $("#timeline").load( "/refresh_timeline" );
  $("#everyone").load( "/refresh_everyone" );
