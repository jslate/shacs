updateStartTime = ->
  date_array = $('#event_start_date').val().split('/').map (val) -> parseInt(val)
  hour = parseInt($('#event_start_hour').val())
  hour += 12 if $('#event_start_am_pm').val() == 'pm' && hour < 12
  hour -= 12 if $('#event_start_am_pm').val() == 'am' && hour == 12
  minute = parseInt($('#event_start_minute').val())
  date = new Date(date_array[2], date_array[0]-1, date_array[1], hour, minute)
  $('#event_start_time').val(date)

$ ->
  $('#event_start_date,#event_start_hour,#event_start_minute,#event_start_am_pm').on 'change', updateStartTime
  $('form:first *:input[type!=hidden]:first').focus()
