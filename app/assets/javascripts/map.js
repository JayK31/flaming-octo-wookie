var directionsDisplay = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();
var map;
var start = $("#trip-start").text();
var dest = $("#trip-dest").text();


$(document).ready(function() {
  console.log(start)
  console.log(dest)
  renderDirections(directionsDisplay);
  initialize();
})


function initialize() {
  var mapOptions = {
      center: new google.maps.LatLng(40.7127, -74.0059),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map_canvas = document.getElementById("map-canvas")
  var map = new google.maps.Map(map_canvas, mapOptions);
  directionsDisplay.setMap(map);

}

function getDirections() {
  return {
    origin: String(start),
    destination: String(dest),
    provideRouteAlternatives: true,
    avoidHighways: false,
    travelMode: google.maps.TravelMode.DRIVING
  }
}

function renderDirections(directionsDisplay) {
  directionsService.route(getDirections(), function(response) {
    directionsDisplay.setPanel(document.getElementById("directions"))
    directionsDisplay.setDirections(response)
  });
}