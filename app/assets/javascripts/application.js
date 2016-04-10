// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  if (window.location.pathname === '/foods') {
    var myCenter = new google.maps.LatLng(37.773972,-122.431297);
    function initialize(){
      var mapProp = {
        center:myCenter,
        zoom:12,
        mapTypeId:google.maps.MapTypeId.ROADMAP,
        mapTypeControl: true,
        mapTypeControlOptions: {
          position: google.maps.ControlPosition.BOTTOM_LEFT
        }
        };

      map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

      var marker=new google.maps.Marker({
        position:myCenter,
        });

      marker.setMap(map);
      function getLatitudeLongitude(callback, address) {
        // If adress is not supplied, use default value 'Ferrol, Galicia, Spain'
        address = address || 'Ferrol, Galicia, Spain';
        // Initialize the Geocoder
        geocoder = new google.maps.Geocoder();
        if (geocoder) {
          geocoder.geocode({
            'address': address
          }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              callback(results[0]);
            }
          });
        }
      }
      markers = [];
      displayEvents();
    }
    google.maps.event.addDomListener(window, 'load', initialize);
  }
});

var displayEvents = function(events){
  var url = $(this).attr("href");
  $.get(url).done(function(response){
    setMarkers(response);
    debugger

    var eventsHTML = createEventsHTML(response);
    $("#googleMap").append(eventsHTML);
  })
}

var setMarkers = function(events){
  for (var i = 0; i < events.length; i++){
    var event = events[i];
    debugger
    var marker = new google.maps.Marker({
      position: {lat: event.latitude, lng: event.longitude},
      title: event.title,
      animation: google.maps.Animation.DROP,
      map: map
    });
    markers.push(marker);
  }
}

var createEventsHTML = function(events){
  var html = "<ul id=\"events\">";
  events.forEach(function(event){
    html += "<li class=\"list-box event\"><h4>" + event.name + "</h4><p>" + event.address + "</p><p>" + event.time + "</p></li>"
  })
  html += "</ul>"
  return html;
}


// var turnPurple = function(){
//   $(document).on("click", "div", function(event){
//     event.preventDefault();
//     var div = $(this);
//     div.css("background-color", "purple");
//   })
// }
