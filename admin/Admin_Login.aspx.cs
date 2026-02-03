using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace TMS_Project.admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from admin_login where username = @username and password = @password";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", UsernameTxt.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTxt.Text);
           
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                //created a session which will redirected to admin_index and in admin_index session will check whether it is null or not
                Session["admin_username"] = UsernameTxt.Text;
                Response.Redirect("admin_index.aspx");
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: \"Failure\",text: \"Password or username does not match!\",icon:\"error\"});", true);
            }
                con.Close();
        }
    }
}