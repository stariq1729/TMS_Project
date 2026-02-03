using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;


namespace TMS_Project.Tutor
{
    public partial class Tutor_ForgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            // Validate first
            if (string.IsNullOrWhiteSpace(txtUser.Text))
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "Please enter username or email";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT tutor_id, email FROM tutor_signup WHERE username = @user OR email = @user";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (!dr.Read())
                        {
                            lblMsg.CssClass = "text-danger";
                            lblMsg.Text = "Tutor not found!";
                            return;
                        }

                        Session["TutorId"] = dr["tutor_id"].ToString();
                        Session["TutorEmail"] = dr["email"].ToString();
                    }
                }

                // Generate OTP
                Random rnd = new Random();
                string otp = rnd.Next(100000, 999999).ToString();
                Session["TutorOTP"] = otp;
                Session["TutorOTPTime"] = DateTime.Now;
                //this is going to change the time limit of otp so it not


                // Send email
                SendOtpEmail(Session["TutorEmail"].ToString(), otp);

                // Simple redirect - NO client script needed
                Response.Redirect("Tutor_ResetPassword.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
        //protected void btnSendOtp_Click(object sender, EventArgs e)

        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            string query = "SELECT tutor_id, email FROM tutor_signup WHERE username = @user OR email = @user";
        //            SqlCommand cmd = new SqlCommand(query, con);
        //            cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());

        //            con.Open();

        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                if (!dr.Read())
        //                {
        //                    lblMsg.CssClass = "text-danger";
        //                    lblMsg.Text = "Tutor not found!";
        //                    return;
        //                }

        //                Session["TutorId"] = dr["tutor_id"].ToString();
        //                Session["TutorEmail"] = dr["email"].ToString();
        //            }
        //        }

        //        // Generate OTP
        //        Random rnd = new Random();
        //        string otp = rnd.Next(100000, 999999).ToString();
        //        Session["OTP"] = otp;
        //        //Session["TutorOTP"] = otp;

        //        // Send email
        //        SendOtpEmail(Session["TutorEmail"].ToString(), otp);

        //        // Client-side redirect (WORKS ALWAYS)
        //        // Send email
        //        SendOtpEmail(Session["TutorEmail"].ToString(), otp);

        //        // Direct redirect
        //        Response.Redirect("Tutor_ResetPassword.aspx", false);
        //        Context.ApplicationInstance.CompleteRequest();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMsg.Text = ex.Message;
        //    }
        //}

        //protected void btnSendOtp_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            string query = "SELECT tutor_id, email FROM tutor_signup WHERE username = @user OR email = @user";
        //            SqlCommand cmd = new SqlCommand(query, con);
        //            cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());

        //            con.Open();

        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                if (dr.Read())
        //                {
        //                    string tutorId = dr["tutor_id"].ToString();
        //                    string tutorEmail = dr["email"].ToString();

        //                    // Generate OTP
        //                    Random rnd = new Random();
        //                    string otp = rnd.Next(100000, 999999).ToString();

        //                    // Store session
        //                    Session["TutorOTP"] = otp;
        //                    Session["TutorId"] = tutorId;
        //                    Session["TutorEmail"] = tutorEmail;
        //                }
        //                else
        //                {
        //                    lblMsg.CssClass = "text-danger";
        //                    lblMsg.Text = "Tutor not found!";
        //                    return;
        //                }
        //            }
        //        }

        //        // Send OTP AFTER reader & connection are closed
        //        SendOtpEmail(Session["TutorEmail"].ToString(), Session["TutorOTP"].ToString());

        //        // Redirect safely
        //        Response.Redirect("Tutor_ResetPassword.aspx", false);
        //        Context.ApplicationInstance.CompleteRequest();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMsg.Text = "Error: " + ex.Message;
        //    }
        //}

        void SendOtpEmail(string toEmail, string otp)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("Tariqwork2910@gmail.com");
            mail.To.Add(toEmail);
            mail.Subject = "OTP for Password Reset";
            mail.Body = "Your OTP for password reset is: <b>" + otp + "</b>";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(
                "Tariqwork2910@gmail.com",
                "reguggemszmejxoe"
            );
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}

//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
  

// regu ggem szme jxoe -- this is app password from gmail


//using System;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Net;
//using System.Net.Mail;

//namespace TMS_Project.Tutor
//{
//    public partial class Tutor_ForgotPassword : System.Web.UI.Page
//    {
//        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void btnSendOtp_Click(object sender, EventArgs e)
//        {
//            using (SqlConnection con = new SqlConnection(cs))
//            {
//                string query = "SELECT tutor_id, email FROM tutor_signup WHERE username = @user OR email = @user";
//                SqlCommand cmd = new SqlCommand(query, con);
//                cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());

//                con.Open();
//                SqlDataReader dr = cmd.ExecuteReader();

//                if (dr.Read())
//                {
//                    string tutorId = dr["tutor_id"].ToString();
//                    string tutorEmail = dr["email"].ToString();

//                    // Generate 6 digit OTP
//                    Random rnd = new Random();
//                    string otp = rnd.Next(100000, 999999).ToString();

//                    // Store in session
//                    Session["TutorOTP"] = otp;
//                    Session["TutorId"] = tutorId;
//                    Session["TutorEmail"] = tutorEmail;

//                    // Send OTP to email
//                    SendOtpEmail(tutorEmail, otp);

//                    // Redirect to reset page when otp is varified
//                    Response.Redirect("Tutor_ResetPassword.aspx");
//                }
//                else
//                {
//                    lblMsg.CssClass = "text-danger";
//                    lblMsg.Text = "Tutor not found!";
//                }
//            }
//        }

//        void SendOtpEmail(string toEmail, string otp)
//        {
//            MailMessage mail = new MailMessage();
//            mail.From = new MailAddress("Tariqwork2910@gmail.com");
//            mail.To.Add(toEmail);
//            mail.Subject = "OTP for Password Reset";
//            mail.Body = "Your OTP for password reset is: <b>" + otp + "</b>";
//            mail.IsBodyHtml = true;

//            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
//            smtp.Credentials = new NetworkCredential(
//                "Tariqwork2910@gmail.com",
                
//                "reguggemszmejxoe"
//            );
//            smtp.EnableSsl = true;

//            smtp.Send(mail);
//        }
//    }
//}
