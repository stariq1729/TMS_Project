using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TMS_Project.Tutor
{
    public partial class Tutor_ResetPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Prevent direct access
                if (Session["TutorOTP"] == null || Session["TutorEmail"] == null)
                    //if (Session["OTP"] == null || Session["TutorEmail"] == null)
                {
                    Response.Redirect("Tutor_ForgotPassword.aspx");
                }

            }

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            // Check if OTP session exists
            if (Session["TutorOTP"] == null || Session["TutorOTPTime"] == null)
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "Session expired. Please request OTP again.";
                return;
            }

            // Check OTP expiry (5 minutes)
            DateTime otpTime = (DateTime)Session["TutorOTPTime"];
            TimeSpan diff = DateTime.Now - otpTime;

            if (diff.TotalMinutes > 5)
            {
                // Clear OTP session
                Session.Remove("TutorOTP");
                Session.Remove("TutorOTPTime");
                Session.Remove("TutorId");
                Session.Remove("TutorEmail");

                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "OTP expired. Please request a new OTP.";
                return;
            }

            // Step 1: Read values
            string enteredOtp = txtOtp.Text.Trim();
            string sessionOtp = Session["TutorOTP"].ToString();
            //string sessionOtp = Session["OTP"].ToString();
            string tutorEmail = Session["TutorEmail"].ToString();
            string newPassword = txtNewPassword.Text.Trim();

            // Step 2: OTP validation
            if (enteredOtp != sessionOtp)
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "Invalid OTP.";
                return;
            }

            // Step 3: Update password in DB
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE tutor_signup SET password = @password WHERE email = @email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@password", newPassword);
                cmd.Parameters.AddWithValue("@email", tutorEmail);

                con.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    // Clear sessions
                    Session.Remove("TutorOTP");  // Changed from "OTP"
                    Session.Remove("TutorEmail");

                    lblMsg.CssClass = "text-success";
                    lblMsg.Text = "Password reset successful. Redirecting...";
                    Response.Redirect("~/Tutor_Login.aspx");
                    //Response.Redirect("Tutor_Login.aspx");
                }
                else
                {
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Password reset failed.";
                }
            }
        }
    }
}
