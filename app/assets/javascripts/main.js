$(document).ready(function() {
  $(".view-trips").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: "/trips/users/" + userId,
      method: "GET",
      dataType: "json"
    }).done(function(data) {
      $(".trips").empty()
      $("<h1>").appendTo(".trips")
            .text("My Trips")
      $.each(data.trips, function(index, trip) {
        $("<section>").appendTo(".trips")
            .append($("<p>").text(trip.start));
      })
      $.each(data.invites, function(index, invite) {
        $("<section>").appendTo(".trips")
            .append($("<p>").text(invite[0].start));
      })
    })
  })
})