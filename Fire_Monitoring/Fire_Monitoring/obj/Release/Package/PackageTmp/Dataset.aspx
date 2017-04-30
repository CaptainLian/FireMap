<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dataset.aspx.cs" Inherits="Fire_Monitoring.Dataset" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Twitter</title>
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
    <form runat="server">
        <%--        Twitter Post:
        <input type="text" name="fname" id="twitterPost" /><br />--%>
        <%--        <input type="button" name="btnPost"
            id="btnPost" value="Post"/>--%>

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

                            <li><a href="Register.aspx">Register</a></li>
                            <li><a href="Login.aspx">Login</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

<div class="container">
        <asp:TextBox runat="server" ID="txtKeyword"></asp:TextBox>
        <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click1" />
        <asp:Literal runat="server" ID="ltTweets"></asp:Literal>

        
        <div class="col-lg-12">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Fulltext</th>
                        <th>Coordinates</th>
                        <th>Created By</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="viewtweets" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("FullText") %>
                                </td>
                                <td>
                                    <%# Eval("Coordinates")%> 
                                </td>
                                <td>
                                    <%# Eval("CreatedBy") %>
                                </td>
                                <td>
                                    <%# Eval("CreatedAt") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </tbody>
            </table>
        </div>
        </div>
    </form>

    <%--    <script>
        $(function () {
            $('#btnPost').click(function() {
                // Generate credentials that we want to use
                ITwitterCredentials creds = new TwitterCredentials("IhIBD5JtBt53MS8Qz3hxZdTzg", "vIqqU99D0kNJW9YrcHUeBghq4Z1gUwrV0wtf6LU5i4N60YeJ8K", "858280990313263104-EZPA93QrwsoIOk9teT9NzgPcE3fTeTU", "K8Zi85UJBZMUfI06BMQVkYZNZ9lnVDYm9IyOInNLwsIxf");
                Auth.SetCredentials(creds);

                // Use the ExecuteOperationWithCredentials method to invoke an operation with a specific set of credentials
                var tweet = Auth.ExecuteOperationWithCredentials(creds, () =>
                {
                    return Tweet.PublishTweet("Hello World");
                });
                    // Get the IAuthenticatedUser from the specified credentials
                    var authenticatedUser = User.GetAuthenticatedUser(creds);

                    // Perform an operation with creds - this is true even if the thread uses another set of credentials
                    authenticatedUser.GetFriends();
                });
            });
    </script>--%>
</body>
</html>
