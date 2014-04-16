$ ->
  $('#downloadLink').click (e) =>
    ga('send', 'event', 'Download', 'PDF', 'Download book version 3', 1, {'nonInteraction': 1})
    return true
  $('#readLink').click (e) =>
    ga('send', 'event', 'Read', 'HTML', 'Open html book version 3', 1, {'nonInteraction': 1})
    return true