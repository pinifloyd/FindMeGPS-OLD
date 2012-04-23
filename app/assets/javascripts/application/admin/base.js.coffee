$(document).ready ->
  $('.js-actions .js-destroy').click( (e)->
    e.stopPropagation()
    e.preventDefault()

    link = $(this)

    $.ajax({
      type:    'DELETE',
      url:     link.attr('href'),
      success: ->
        link.closest('tr').remove()
    })
  )
