using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fire_Monitoring
{
    public partial class Identify_Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReport_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString))

            {
                con.Open();
                string insert = @"INSERT INTO FireMap Values(@Latitude, @Longitude, @Address, @Date)";

                using (SqlCommand cmd = new SqlCommand(insert, con))
                {
                    cmd.Parameters.AddWithValue(@"Latitude", 1.9);
                    cmd.Parameters.AddWithValue(@"Longhitude", 2.8);
                    cmd.Parameters.AddWithValue("@Address", "sample");
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}