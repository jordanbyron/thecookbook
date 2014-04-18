$(document).on 'paste', 'textarea[data-paste-format]', (e) ->
  e.preventDefault()
  $this = $(this)
  pastedText = e.originalEvent.clipboardData.getData('text/plain')

  formattedText = switch $this.data('paste-format')
    when 'ul'
      text = pastedText.replace(/(\r\n|\n|\r)([^-])/gm, "\n- $2")
      if /^[^-]/.test(text) then "- #{text}" else text
    when 'ol'
      text = pastedText.replace(/(\r\n|\n|\r)([^(\d\.)])/gm, "\n1. $2")
      if /^[^(\d\.)]/.test(text) then "1. #{text}" else text

  $(this).insertAtCaret(formattedText).change()
