$ ->
  $('#downloadLink').click (e) =>
    ga('send', 'event', 'Download', 'PDF', 'Download book version 5')
  $('#readLink').click (e) =>
    ga('send', 'event', 'Read', 'HTML', 'Open html book version 5')
