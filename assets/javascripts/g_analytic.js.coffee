$ ->
  $('#downloadLink').click (e) =>
    _gaq.push(['_trackEvent', 'Download', 'PDF', 'Download book version 3', 1, true]) if _gaq?
    return true
  $('#readLink').click (e) =>
    _gaq.push(['_trackEvent', 'Read', 'HTML', 'Open html book version 3', 1, true]) if _gaq?
    return true