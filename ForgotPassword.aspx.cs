using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TMS_Project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string userInput = txtUser.Text.Trim();

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    //SqlCommand cmd = new SqlCommand("sp_CheckStudentExists", con);
                    //        cmd.CommandType = CommandType.StoredProcedure;
                    string query = "SELECT email FROM student_signup WHERE username = @user OR contact_no = @user";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@user", userInput);

                    con.Open();
                    object result = cmd.ExecuteScalar(); // Get email of user

                    if (result != null) // user found
                    {
                        string userEmail = result.ToString();

                        // Generate 6-digit OTP
                        Random rnd = new Random();
                        string otp = rnd.Next(100000, 999999).ToString();

                        // Store OTP and username in session
                        Session["OTP"] = otp;
                        Session["ResetUser"] = userInput;

                        // For now, just display OTP in a label for testing (we'll send email in next step)
                        lblMsg.CssClass = "text-success";
                        lblMsg.Text = $"OTP generated (for testing): {otp}";

                        // Redirect to ResetPassword page after generating OTP (optional)
                        // Response.Redirect("ResetPassword.aspx");
                    }
                    else
                    {
                        lblMsg.CssClass = "text-danger";
                        lblMsg.Text = "User not found.";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Error: " + ex.Message;
                }
            }
        }

        //protected void btnCheck_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        //string query = "SELECT COUNT(*) FROM student_signup WHERE username = @user OR contact_no = @user";
        //        //SqlCommand cmd = new SqlCommand(query, con);
        //        SqlCommand cmd = new SqlCommand("sp_CheckStudentExists", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());

        //        con.Open();
        //        int count = Convert.ToInt32(cmd.ExecuteScalar());

        //        if (count > 0)
        //        {
        //            lblMsg.CssClass = "text-success";
        //            lblMsg.Text = "User verified. You can reset password.";
        //        }
        //        else
        //        {
        //            lblMsg.CssClass = "text-danger";
        //            lblMsg.Text = "User not found.";
        //        }
        //    }
        //}
    }
}
