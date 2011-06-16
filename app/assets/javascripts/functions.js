function open_webconference_room(path) {
  url = location.protocol + '//' + document.domain + ":" + location.port + path;
  newwindow = window.open(url, "_blank", "resizable=yes,toolbar=no,menubar=no,addressbar=no,location=no,status=no");
  if (window.focus) {newwindow.focus()}
  return false;    
}

function show_webconference_details(id) {
  $("div#home_webconference_details_" + id).toggle(80);
  return false;
}
