using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;
using System.Configuration;
using Tweetinvi.Models;

public partial class User : System.Web.UI.Page
{

    public List<Location> fireLocations;
    public string latLngs;

    protected void Page_Load(object sender, EventArgs e)
    {
        fireLocations = getFires();

        latLngs = "[";
        for (int i = 0; i < fireLocations.Count; i++)
        {
            Location l = fireLocations[i];
            if (i == fireLocations.Count - 1)
            {
                latLngs += "{ \"lat\": \"" + l.lat;

                latLngs += "\", \"lng\": \"" + l.lng + "\"} ";

            }
            else
            {
                latLngs += "{ \"lat\": \"" + l.lat;

                latLngs += "\", \"lng\": \"" + l.lng + "\"}, ";
            }
        }


        latLngs += "]";
    }

    public List<Location> getFires()
    {
        List<Location> ret = new List<Location>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString))
        {
            con.Open();
            string query = @"SELECT Latitude, Longitude
                               FROM FireMap.dbo.Location;";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ret.Add(new Location(reader.GetSqlDecimal(0), reader.GetSqlDecimal(1)));
                }

            }
        }
        return ret;
    }

    /* 
    public static string getClosestFire(double lat, double lng)
    {
        string s = "{}";
        using (SqlConnection con = new SqlConnection(Helper.Connect()))
        {
            con.Open();
            string query = @"SELECT Latitude, Longitude
                               FROM FireMap.dbo.Location
                              WHERE Latitude < @lat;";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@lat", lat);
                //cmd.Parameters.AddWithValue("@Longitude", lng);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string lats = reader.GetValue(0).ToString();
                    string lngs = reader.GetValue(1).ToString();

                    s = "{lat:" + lats + ", lng: " + lngs + "}";
                     
                }
                
            }
        }

        return s;
    }
    */
}