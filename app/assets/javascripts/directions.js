$("#directions-trigger").on('click', function(event){
event.preventDefault();
$("#directions").empty();
renderDirections(render);
});

function getDirections() {
  return {
    origin: String(start),
    destination: String(dest),
    provideRouteAlternatives: true,
    avoidHighways: false,
    travelMode: google.maps.TravelMode.DRIVING
  }
}

function renderDirections(render) {
  direction.route(getDirections(), function(response) {
    console.log(response);
    render.setMap(map)
    render.setPanel(document.getElementById("directions"));
    render.setDirections(response)
  });
}

$(document).ready(function(){
  var render = new google.maps.DirectionsRenderer();
    renderDirections(render)
});
