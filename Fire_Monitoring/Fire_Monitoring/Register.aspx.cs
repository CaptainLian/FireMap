using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fire_Monitoring
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            GetStored();
        }

        void GetStored()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString))
            {
                con.Open();
                string query = @"INSERT INTO Respondent Values(@FullName, @RespondentType, @Address, @PhoneNumber, @UserName, @Password)";
                using (SqlCommand com = new SqlCommand(query, con))
                {
                    com.Parameters.AddWithValue("@FullName", txtFN.Text);
                    com.Parameters.AddWithValue("@RespondentType", ddlCategory.SelectedValue);
                    com.Parameters.AddWithValue("@Address", txtAddress.Text);
                    com.Parameters.AddWithValue("@PhoneNumber", SqlDbType.Int).Value = txtPhoneNumber.Text;
                    com.Parameters.AddWithValue("@UserName", Username.Text);
                    com.Parameters.AddWithValue("@Password", txtPassWord.Text);
                    com.ExecuteNonQuery();
                }
            }

            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Respondent Successfully Registered! Log In to Continue!');window.location='Login.aspx';", true);

        }

    }
}