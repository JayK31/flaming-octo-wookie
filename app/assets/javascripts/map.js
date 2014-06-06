function initialize() {
  var mapOptions = {
      center: new google.maps.LatLng(40.7127, -74.0059),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map_canvas = document.getElementById("my_map_canvas")
  var map = new google.maps.Map(map_canvas, mapOptions);
}

$(function() {
  initialize()
})