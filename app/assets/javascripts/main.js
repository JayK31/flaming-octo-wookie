$(document).ready(function() {
  $(".view-trips").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: "/trips/users/" + userId,
      method: "GET",
      dataType: "json"
    }).done(function(data) {
      $(".trips").empty()
      $("<h3>").appendTo(".trips")
            .text("My Trips")
      $.each(data.trips, function(index, trip) {
        var url = "/trips/" + trip.id
        $("<section>").appendTo(".trips")
            .append($("<p>").text(trip.start))
                .wrap('<a href=' + url + '>');
      })
      $.each(data.invites, function(index, invite) {
        var url = "/trips/" + invite[0].id
        $("<section>").appendTo(".trips")
            .append($("<p>").text(invite[0].start))
                .wrap('<a href=' + url + '>');
      })
    })
  })
})