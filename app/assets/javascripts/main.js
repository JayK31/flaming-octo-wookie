$(document).ready(function() {
  $(".view-trips").click(function(event) {
    alert('hi');
    event.preventDefault();
    $.ajax({
      url: "/trips/users/2",
      method: "GET",
      dataType: "json"
    }).done(function(trips) {
      console.log("request complete");
      $("<h1>").appendTo(".trips")
            .text("My Trips")
      $.each(trips, function(index, trip) {
        $("<section>").appendTo(".trips")
            .append($("<p>").text(trip.start));

      })

    })
  })
})