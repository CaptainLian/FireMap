using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Fire_Monitoring
{
    public partial class Identify_Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReport_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.Connect()))
            {
                con.Open();
                string insert = @"INSERT INTO FireMap Values(@Latitude, @Longitude, @Address, @Date)";

                using (SqlCommand cmd = new SqlCommand(insert, con))
                {
                    
                }
            }
        }
    }
}