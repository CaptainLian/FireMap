<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/modernizr-2.8.3.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5JadLWJZaNbKJ3FGwwSOwSs8gGKWAbDc&callback=myMap"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div id="googleMap" style="width: 100%; height: 600px"></div>

        <script>
            //global variables
            var map = null;
            var currentPositionMarker = null;

            var canvas = null;

            var currentCoordinates = null;

            $(document).ready(function () {
                navigator.geolocation.getCurrentPosition(function (currentPos) {
                    currentCoordinates = currentPos.coords;

                    canvas = document.getElementById("googleMap");

                    let mapProp = {
                        center: new google.maps.LatLng(currentCoordinates.latitude, currentCoordinates.longitude),
                        zoom: 20
                    };

                    map = new google.maps.Map(canvas, mapProp);

                    let currentPositionMarkerImage = new google.maps.MarkerImage('img/person-icon-person-icon-clipart-image-from-our-icon-clipart-category--9.png', null, null, null, new google.maps.Size(50, 50));
                    currentPositionMarker = new google.maps.Marker({
                        position: mapProp.center,
                        icon: currentPositionMarkerImage
                    });
                    currentPositionMarker.setMap(map);

                    let infoWindow = new google.maps.InfoWindow({
                        content: "You are here!"
                    });
                    infoWindow.open(map, currentPositionMarker);
                     const latLngs = JSON.parse('<%=latLngs%>');

                    let fireMarkerIcon = new google.maps.MarkerImage('img/new-flame-icon-png-12.png', null, null, null, new google.maps.Size(50, 50));

                    for (i = 0; i < latLngs.length; i++) { 
                        let current = latLngs[i];

                        let latLng = new google.maps.LatLng(current.lat, current.lng);

                        let fireMarker = new google.maps.Marker({
                            position: latLng,
                            icon: fireMarkerIcon
                        });
                        fireMarker.setMap(map);

                        let dangerCircle = new google.maps.Circle({
                            center: latLng,
                            radius: 100,
                            strokeColor: "#FF0000",
                            strokeOpacity: 0.8,
                            strokeWeight: 2,
                            fillColor: "#FF0000",
                            fillOpacity: 0.4
                        });

                        let safeCircle = new google.maps.Circle({
                            center: latLng,
                            radius: 150,
                            strokeColor: "#00ff00",
                            strokeOpacity: 0.8,
                            strokeWeight: 2,
                            fillColor: "#00ff00",
                            fillOpacity: 0.4
                        });

                        safeCircle.setMap(map);
                        dangerCircle.setMap(map);
                    }

                    google.maps.event.addListener(map, 'click', function (event) {
                        let clickedLat = event.latLng.lat();
                        let clickedLng = event.latLng.lng();

                        let fireMarkerIcon = new google.maps.MarkerImage('img/new-flame-icon-png-12.png', null, null, null, new google.maps.Size(50, 50));
                        let fireMarker = new google.maps.Marker({
                            position: new google.maps.LatLng(clickedLat, clickedLng),
                            icon: fireMarkerIcon
                        });
                        fireMarker.setMap(map);


                    });

                },
                    function (error) {


                    });


               
            });


        </script>


        <!--
    <script>
        
        var nearLat;
        var nearLng;

        var currentLat;
        var currentLng;

        

        $(document).ready(function(){
            navigator.geolocation.getCurrentPosition(function (currentPos) {
                let currentCoords = currentPos.coords;

                currentLat = currentCoords.latitude;
                currentLng = currentCoords.longitude;

                console.log("lat: " + currentLat + ", lng: " + currentLng);
                $.ajax({
                    type: "POST",
                    url: "User.aspx/getClosestFire",
                    data: {
                        "lat": currentLat,
                        "lng": currentLng
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        console.log(errorThrown);
                    }

                });

            }, function (error) {


            });

            
        });
    </script>
        -->
    </form>
</body>
</html>
