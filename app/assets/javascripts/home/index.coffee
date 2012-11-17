open_bigbluebuttonerence_room = (path) ->
  url = location.protocol + '//' + document.domain + ":" + location.port + path;
  newwindow = window.open(url, "_blank", "resizable=yes,toolbar=no,menubar=no,addressbar=no,location=no,status=no");
  if (window.focus)
    newwindow.focus();
  false;

show_webconference_details = (id) ->
  $("div#home_webconference_details_" + id).toggle(80);
  false;

$(document).ready ->
  $("a.webconference_join_button_mobile").fancybox({
    'hideOnContentClick': false,
    'frameWidth': 250,
    'frameHeight': 500
  });
  $("a.webconference_user_new").fancybox({
    'hideOnContentClick': false,
    'frameWidth': 250,
    'frameHeight': 500
  });
  $("a.webconference_join_button").click ->
    open_webconference_room($(this).attr('href'));
  $("a.webconference_details_button").click ->
    show_webconference_details($(this).attr('data-room-id'));
