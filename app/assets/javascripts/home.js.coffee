
$('form.new_accomplishment').on 'ajax:beforeSend', (xhr, settings) ->
  alert("Sending...")