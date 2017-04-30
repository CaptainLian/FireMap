<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Report.aspx.cs" Inherits="Fire_Monitoring.Add_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Identify Victim's Location</title>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/modernizr-2.8.3.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }

        #floating-panel {
            position: absolute;
            top: 5px;
            left: 50%;
            margin-left: -180px;
            width: 350px;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
        }

        #latlng {
            width: 225px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <div class="container">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="Identify_Location.aspx">
                                <span>
                                    <img src="18221920_1486814521350053_7356267987730823203_n.jpg" width="5%" /></span>FireMap</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li><a href="#">Home</a></li>
                            <li><a class="btn" href="#" type="button" name="btnFindLoc" style="position: center"
                                id="btnFindLoc">Find my Current Location</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">About
        <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="https://earthdata.nasa.gov/earth-observation-data/near-real-time" target="_blank">NASA Resources</a></li>
                                    <li><a href="AboutApp">About the App</a></li>
                                    <li><a href="AboutDevelopers">About Developers</a></li>
                                </ul>
                            </li>

                            <li class="active"><a href="Register.aspx">Register</a></li>
                            <li><a href="Login.aspx">Login</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <%--<input type="button" name="btnFindLoc" style="position: center"
                id="btnFindLoc" value="Find My Current Location" />--%>
            <div class="container">
            <div id="googleMap" style="width: 100%; height: 600px"></div>
            <div id="errDiv"></div>
            </div>

            <br />

            <div class="container">
            <div class="well">
            Latitude -
            <p id="lati"></p>
            Longitude -
            <p id="longi"></p>
            Coordinates of Location -
            <p id="coor"></p>
            <p><a type="button" class="btn btn-success btn-block" href="#" data-toggle="modal" data-target="#submitReport">1234</a></p>
                </div>
                </div>
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
                            content: "You are here! Please specify the FIRE SOURCE"
                        });
                        infoWindow.open(map, currentPositionMarker);


                        google.maps.event.addListener(map, 'click', function (event) {

                            //clicked longitude and latitude
                            let latLng = event.latLng;



                            let fireMarkerIcon = new google.maps.MarkerImage('img/new-flame-icon-png-12.png', null, null, null, new google.maps.Size(50, 50));
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

                            let geocoder = new google.maps.Geocoder;
                            let infoWindow = new google.maps.InfoWindow;
                            let latlng = {
                                lat: event.latLng.lat(),
                                lng: event.latLng.lng()
                            };

                            geocoder.geocode({
                                'location': latlng
                            }, function (results, status) {
                                if (status == 'OK') {
                                    if (results[1]) {

                                        infoWindow.setContent(results[1].formatted_address);
                                        infoWindow.open(map, fireMarker);

                                        let lat = $('#txtLat');
                                        let long = $('#txtLong');
                                        let location = $('#txtLocation');

                                        lat.val(latlng.lat);
                                        long.val(latlng.lng);
                                        location.val(results[1].formatted_address);

                                        lat = $('#reportLat');
                                        long = $('#reportLong');
                                        location = $('#reportLocation');

                                        lat.html("Latitude: " + latlng.lat);
                                        long.html("Longhitude: " + latlng.lng);
                                        location.html("Address:" + results[1].formatted_address);
                                    }
                                }

                            });

                        });


                    },
                    function (error) {


                    });
                });

            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5JadLWJZaNbKJ3FGwwSOwSs8gGKWAbDc&callback=myMap"></script>

            <!-- Modal -->
            <div class="modal fade" id="submitReport" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Report a Fire</h4>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label class="control-label">You reported a fire at.</label>
                            </div>
                            <div class="form-group">
                                <p id="reportLat">1234</p>
                                <p id="reportLong">1234</p>
                                <p id="reportLocation">1234</p>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-8">
                                    <asp:HiddenField ID="txtLat" runat="server" />
                                    <asp:HiddenField ID="txtLong" runat="server" />
                                    <asp:HiddenField ID="txtLocation" runat="server" />
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnReport" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnReport_Click1" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-->
        </div>




    </form>


</body>
</html>
