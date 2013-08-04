$ ->
  $('.container').on 'ajax:success', '.unfollow-link', (event) ->
    $(event.currentTarget).text('Follow').removeClass('unfollow-link').addClass('follow-link')

  $('.container').on 'ajax:success', '.follow-link', (event) ->
    $(event.currentTarget).text('Unfollow').removeClass('follow-link').addClass('unfollow-link')
