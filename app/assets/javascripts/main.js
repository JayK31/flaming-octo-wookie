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
            .append($("<div class='title'>").text(trip.name))
                .wrap('<a href=' + url + '>')
            .append($("<p>").text(trip.start + ' to ' + trip.destination))
            .append($("<p>").text('Description: ' + trip.description))
      })
      $.each(data.invites, function(index, invite) {
        var trip = invite[0]
        var url = "/trips/" + trip.id
        $("<section>").appendTo(".trips")
            .append($("<div class='title'>").text(trip.name))
                .wrap('<a href=' + url + '>')
            .append($("<p>").text(trip.start + ' to ' + trip.destination))
            .append($("<p>").text('Description: ' + trip.description))
      })
    })
  })
})