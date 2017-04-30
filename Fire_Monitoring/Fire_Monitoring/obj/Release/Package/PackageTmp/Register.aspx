<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fire_Monitoring.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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
            /*background-color: #0094ff;*/
            background-image: url("http://www.myalivechurch.org/wp-content/uploads/2015/05/background_blue_v0011.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
            background-color: lightblue;
            background-attachment: fixed;
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

            <div class="container">
            <div class="well col-lg-offset-1 col-lg-10" style="background-color: rgba(255, 255, 255, 0.39)">
                <div>
                    <h2 style="text-align:center"> Register to Website</h2>
                    <div class="form-group">
                        <label class="control-label col-lg-3">Respondent Type:</label>
                        <div class="col-lg-7">
                            <asp:DropDownList ID="ddlCategory" runat="server" Width="100%" Height="100%"
                                CssClass="form-control" AutoPostBack="false" required>
                                <asp:ListItem runat="server" Enabled="true">Select Respondent Type</asp:ListItem>
                            <asp:ListItem runat="server">Fireman</asp:ListItem>
                            <asp:ListItem runat="server">Volunteer</asp:ListItem>
                            </asp:DropDownList>
                            
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">Full Name:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="txtFN" runat="server"
                                CssClass="form-control" MaxLength="20" Width="100%"
                                required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">Address:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="txtAddress" runat="server"
                                CssClass="form-control" MaxLength="1000" Width="100%"
                                required />
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-lg-3">Phone Number:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="txtPhoneNumber" runat="server"
                                CssClass="form-control" MaxLength="1000" Width="100%"
                                required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">Username:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="Username" runat="server"
                                CssClass="form-control" MaxLength="1000" Width="100%"
                                required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">Password:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"
                                CssClass="form-control" Width="100%"
                                required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">Confirm Password:</label>
                        <div class="col-lg-7">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                                CssClass="form-control" Width="100%"
                                required />
                        </div>
                    </div>


                    <div class="col-lg-8">
                        <asp:Button ID="btnRegister" runat="server"
                            class="btn btn-success col-lg-offset-3" Text=" Register " OnClick="btnRegister_Click" />
                    </div>
                    <br />


                </div>
            </div>
        </div>
            </div>
    </form>
</body>
</html>
