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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["RespondentNumber"] != null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand(
                "SELECT * FROM Respondent where UserName ='" + txtIDNum.Text + "' and Password ='" + txtPassword.Text + "'", con);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["RespondentNumber"] = dr["RespondentNumber"].ToString();
                }
                con.Close();
                if (Request.QueryString["url"] == null)
                {
                    Response.Redirect("Identify_Location.aspx");
                }
                else
                {
                    Response.Redirect(Request.QueryString["url"].ToString());
                }
            }

            else
            {
                con.Close();
                error.Visible = true;
            }
        }
    }
}