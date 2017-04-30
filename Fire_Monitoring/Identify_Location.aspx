<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Identify_Location.aspx.cs" Inherits="Fire_Monitoring.Identify_Location" %>

<!DOCTYPE html>
<script runat="server">

    protected void btnReport_Click(object sender, EventArgs e)
    {

    }
</script>


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
            <input type="button" name="btnFindLoc" style="position: center"
                id="btnFindLoc" value="Find My Current Location" />

            <div id="googleMap" style="width: 100%; height: 600px"></div>
            <div id="errDiv"></div>


            Latitude -
            <p id="lati"></p>
            Longitude -
            <p id="longi"></p>
            Coordinates of Location -
            <p id="coor"></p>
             <p><a type="button" class="btn btn-success btn-block" href="#" data-toggle="modal" data-target="#submitReport">1234</a></p>
            <script>
                $(function () {
                    var error = $('#errDiv');
                    $('#btnFindLoc').click(function () {
                        if (Modernizr.geolocation) {
                            navigator.geolocation.getCurrentPosition(currentPosition, positionError);
                        }
                        else {
                            error.html("GeoLocation API of HTML 5 is not supported");
                        }
                    });

                    function currentPosition(currentPos) {
                        var coordinates = currentPos.coords;
                        var mapProp = {
                            center: new google.maps.LatLng(coordinates.latitude, coordinates.longitude),
                        };
                        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                        var myCenter = new google.maps.LatLng(coordinates.latitude, coordinates.longitude);
                        var mapCanvas = document.getElementById("googleMap");
                        var mapOptions = { center: myCenter, zoom: 19 };
                        var map = new google.maps.Map(mapCanvas, mapOptions);
                        var markericon = new google.maps.MarkerImage('img/person-icon-person-icon-clipart-image-from-our-icon-clipart-category--9.png', null, null, null, new google.maps.Size(50, 50));

                        var marker = new google.maps.Marker({
                            position: myCenter, icon: markericon
                        });
                        marker.setMap(map);

                        var infowindow = new google.maps.InfoWindow({
                            content: "You are here! Please specify the FIRE SOURCE"
                        });
                        infowindow.open(map, marker);

                        //var myCity = new google.maps.Circle({
                        //    center: myCenter,
                        //    radius: 100,
                        //    strokeColor: "#FF0000",
                        //    strokeOpacity: 0.8,
                        //    strokeWeight: 2,
                        //    fillColor: "#FF0000",
                        //    fillOpacity: 0.4
                        //});
                        //myCity.setMap(map);
                        
                        var result = null;

                        var clickListener = function (event) {
                            document.getElementById('lati').innerHTML = event.latLng.lat()
                            document.getElementById('longi').innerHTML = event.latLng.lng()
                            document.getElementById('coor').innerHTML = event.latLng.lat() + ', ' + event.latLng.lng()

                            //for specified fire source
                            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
                            var latit = document.getElementById("lati").innerHTML;
                            var longit = document.getElementById("longi").innerHTML;
                            var myCenter = new google.maps.LatLng(latit, longit);
                            var mapCanvas = document.getElementById("googleMap");
                            var mapOptions = { center: myCenter, zoom: 19 };
                            var map = new google.maps.Map(mapCanvas, mapOptions);
                            var markericon = new google.maps.MarkerImage('img/new-flame-icon-png-12.png', null, null, null, new google.maps.Size(50, 50));

                            var marker = new google.maps.Marker({
                                position: myCenter, icon: markericon
                            });
                            marker.setMap(map);

                            var infowindow = new google.maps.InfoWindow({
                                content: "Fire Source"
                            });
                            infowindow.open(map, marker);

                            var myCity = new google.maps.Circle({
                                center: myCenter,
                                radius: 100,
                                strokeColor: "#FF0000",
                                strokeOpacity: 0.8,
                                strokeWeight: 2,
                                fillColor: "#FF0000",
                                fillOpacity: 0.4
                            });
                            myCity.setMap(map);

                            google.maps.event.addListener(map, 'click', clickListener);


                            let geocoder = new google.maps.Geocoder;
                            let infowinder = new google.maps.InfoWindow;
                            let latlng = {
                                lat: event.latLng.lat(),
                                lng: event.latLng.lng()
                            };

                            geocoder.geocode({
                                'location': latlng
                            }, function (results, status) {
                                if (status == 'OK') {
                                    if (results[1]) {
                                        let marker = new google.maps.Marker({
                                            position: latlng,
                                            map: map
                                        });
                                        infowinder.setContent(results[1].formatted_address);
                                        infowinder.open(map, marker);

                                        console.log(results[1].formatted_address + " HEY I'M HERE");
                                                
                                        console.log(results);

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
                        };

                        google.maps.event.addListener(map, 'click', clickListener);

                        
                        
                    }

                    


                    function positionError(errCode) {
                        switch (errCode.code) {
                            case 0:
                                error.html("Unknown Error - has occured");
                                break;
                            case 1:
                                error.html("Permission Denied - By the user");
                                break;
                            case 2:
                                error.html("Position/Location Unavailable");
                                break;
                            case 3:
                                error.html("Timeout");
                                break;
                        }
                    }

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
                            <p id="reportLat" >1234</p>
                            <p id="reportLong" >1234</p>
                            <p id="reportLocation" >1234</p>
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
                        <asp:Button ID="btnReport" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnReport_Click" />
                    </div>
                </div>
            </div>
        </div>
    <!-- modal-->
        </div>

       

        
    </form>

     
</body>
</html>
