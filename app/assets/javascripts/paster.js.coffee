$(document).on 'paste', 'textarea[data-paste-format]', (e) ->
  e.preventDefault()
  $this = $(this)
  pastedText = e.originalEvent.clipboardData.getData('text/plain')

  formattedText = switch $this.data('paste-format')
    when 'ul'
      "- " + pastedText.replace(/(\r\n|\n|\r)/gm, "\n- ")
    when 'ol'
      "1. " + pastedText.replace(/(\r\n|\n|\r)/gm, "\n1. ")

  $(this).insertAtCaret(formattedText).change()
  console.log "Pasted"
