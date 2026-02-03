using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace TMS_Project.student
{
    public partial class Student_Index : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_username"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadStudentProfile();
                pnlEditProfile.Visible = false;
                btnEditProfile.Visible = true;
            }
        }
        //protected void Page_Load(object sender, EventArgs e)
        //{ 
        //    if (Session["student_username"] == null)
        //    {
        //        Response.Redirect("~/Student_Login.aspx");
        //        return;
        //    }

        //    if (!IsPostBack)
        //    {
        //        // Show password changed message (only once)
        //        if (Session["PwdChanged"] != null)
        //        {
        //            lblMsg.Text = Session["PwdChanged"].ToString();
        //            lblMsg.ForeColor = System.Drawing.Color.Green;
        //            Session.Remove("PwdChanged");
        //        }

        //        // Load profile data first time only
        //        LoadStudentProfile();

        //        // Default UI state
        //        pnlEditProfile.Visible = false;
        //        btnEditProfile.Visible = true;
        //    }
        //}


        void LoadStudentProfile()
        {
            string username = Session["student_username"].ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 
                                    name, fname, age, country, city, subject,
                                    contact_no, username, profile_photo
                                 FROM student_signup
                                 WHERE username = @username";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblName.Text = dr["name"].ToString();
                    lblFather.Text = dr["fname"].ToString();
                    lblAge.Text = dr["age"].ToString();
                    lblCountry.Text = dr["country"].ToString();
                    lblCity.Text = dr["city"].ToString();
                    lblSubject.Text = dr["subject"].ToString();
                    lblContact.Text = dr["contact_no"].ToString();
                    lblUsername.Text = dr["username"].ToString();

                    string photoPath = dr["profile_photo"]?.ToString();

                    if (!string.IsNullOrEmpty(photoPath))
                        imgProfile.ImageUrl = ResolveUrl("~/" + photoPath);
                    else
                        imgProfile.ImageUrl = ResolveUrl("~/StudentImages/default.png");
                }
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            txtCity.Text = lblCity.Text;
            txtContact.Text = lblContact.Text;

            pnlEditProfile.Visible = true;
            btnEditProfile.Visible = false;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditProfile.Visible = false;
            btnEditProfile.Visible = true;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            string username = Session["student_username"].ToString();
            string newPhotoPath = null;
            string oldPhotoPath = null;

            // 🔹 Step 1: Get old photo path
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT profile_photo FROM student_signup WHERE username=@username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);

                con.Open();
                oldPhotoPath = cmd.ExecuteScalar() as string;
            }

            // 🔹 Step 2: Handle new photo upload
            if (fuProfilePhoto.HasFile)
            {
                string ext = Path.GetExtension(fuProfilePhoto.FileName).ToLower();

                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                {
                    string fileName = Guid.NewGuid() + ext;
                    string folderPath = Server.MapPath("~/StudentImages/");

                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    fuProfilePhoto.SaveAs(Path.Combine(folderPath, fileName));
                    newPhotoPath = "StudentImages/" + fileName;

                    // 🔹 Delete old photo (if not default)
                    if (!string.IsNullOrEmpty(oldPhotoPath) &&
                        !oldPhotoPath.Contains("default.png"))
                    {
                        string fullOldPath = Server.MapPath("~/" + oldPhotoPath);
                        if (File.Exists(fullOldPath))
                            File.Delete(fullOldPath);
                    }
                }
            }

            // 🔹 Step 3: Update database
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"UPDATE student_signup 
                                 SET city=@city,
                                     contact_no=@contact" +
                               (newPhotoPath != null ? ", profile_photo=@photo" : "") +
                               " WHERE username=@username";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@username", username);

                if (newPhotoPath != null)
                    cmd.Parameters.AddWithValue("@photo", newPhotoPath);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // 🔹 Step 4: Refresh UI
            LoadStudentProfile();
            pnlEditProfile.Visible = false;
            btnEditProfile.Visible = true;
        }

        //protected void btnChangePassword_Click(object sender, EventArgs e)
        //{

        //    pnlChangePassword.Visible = true;   // SHOW password panel
        //    pnlEditProfile.Visible = false;     // HIDE edit profile panel
        //    btnEditProfile.Visible = false;     // HIDE edit button


        //}
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string username = Session["student_username"].ToString();

            // Step 1: Basic validation
            if (string.IsNullOrWhiteSpace(txtOldPassword.Text) ||
                string.IsNullOrWhiteSpace(txtNewPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblPwdMsg.CssClass = "text-danger";
                lblPwdMsg.Text = "All fields are required.";
                return;
            }

            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lblPwdMsg.CssClass = "text-danger";
                lblPwdMsg.Text = "New password and confirm password do not match.";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Step 2: Check old password
                string query = "SELECT password FROM student_signup WHERE username = @username";
                SqlCommand checkCmd = new SqlCommand(query, con);
                checkCmd.Parameters.AddWithValue("@username", username);

                string dbPassword = Convert.ToString(checkCmd.ExecuteScalar());

                if (dbPassword != txtOldPassword.Text)
                {
                    lblPwdMsg.CssClass = "text-danger";
                    lblPwdMsg.Text = "Old password is incorrect.";
                    return;
                }

                // Step 3: Update password
                string query2 = "UPDATE student_signup SET password = @newPassword WHERE username = @username";
                SqlCommand updateCmd = new SqlCommand(query2
                   , con);
                updateCmd.Parameters.AddWithValue("@newPassword", txtNewPassword.Text);
                updateCmd.Parameters.AddWithValue("@username", username);

                updateCmd.ExecuteNonQuery();
            }

            // Step 4: Success UI reset
            //    lblPwdMsg.CssClass = "text-success";
            //lblPwdMsg.Text = "Password changed successfully.";

            //txtOldPassword.Text = "";
            //txtNewPassword.Text = "";
            //txtConfirmPassword.Text = "";

            // SUCCESS: password updated
            Session["PwdChanged"] = "Password changed with sesssion successfully. Please login again.";

            // logout student
            Session.Remove("student_username");

            // redirect to login
            Response.Redirect("~/Student_Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();


            pnlChangePassword.Visible = false;
            btnEditProfile.Visible = true;




        }


        protected void btnShowChangePassword_Click(object sender, EventArgs e)
        {
            pnlChangePassword.Visible = true;   // show password panel
            pnlEditProfile.Visible = false;     // hide edit profile panel
            btnEditProfile.Visible = false;     // hide edit profile button
        }
    }
}

//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Xml.Linq;

//namespace TMS_Project.student
//{
//    public partial class Student_Index : System.Web.UI.Page
//    {
//        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;


//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["student_username"] == null)
//            {
//                Response.Redirect("~/Student_Login.aspx");
//                return;
//            }

//            if (!IsPostBack)
//            {
//                LoadStudentProfile();

//                pnlEditProfile.Visible = false;
//                btnEditProfile.Visible = true;
//            }
//        }

//        void LoadStudentProfile()
//        {
//            string username = Session["student_username"].ToString();

//            using (SqlConnection con = new SqlConnection(cs))
//            {

//                string query = @"SELECT 
//                            name,
//                            fname,
//                            age,
//                            country,
//                            city,
//                            subject,
//                            contact_no,
//                            username,
//                            profile_photo
//                         FROM student_signup
//                         WHERE username = @username";

//                SqlCommand cmd = new SqlCommand(query, con);
//                cmd.Parameters.AddWithValue("@username", username);

//                con.Open();
//                SqlDataReader dr = cmd.ExecuteReader();

//                if (dr.Read())
//                {
//                    lblName.Text = dr["name"].ToString();
//                    lblFather.Text = dr["fname"].ToString();
//                    lblAge.Text = dr["age"].ToString();
//                    lblCountry.Text = dr["country"].ToString();
//                    lblCity.Text = dr["city"].ToString();
//                    lblSubject.Text = dr["subject"].ToString();
//                    lblContact.Text = dr["contact_no"].ToString();
//                    lblUsername.Text = dr["username"].ToString();


//                    string photoPath = dr["profile_photo"]?.ToString();

//                    if (!string.IsNullOrEmpty(photoPath))
//                    {
//                        imgProfile.ImageUrl = ResolveUrl("~/" + photoPath);
//                    }
//                    else
//                    {
//                        imgProfile.ImageUrl = ResolveUrl("~/StudentImages/default.png");
//                    }


//                }
//            }
//        }

//        protected void btnEditProfile_Click(object sender, EventArgs e)
//        {
//            // Prefill edit fields from labels
//            txtCity.Text = lblCity.Text;
//            txtContact.Text = lblContact.Text;

//            pnlEditProfile.Visible = true;
//            btnEditProfile.Visible = false;
//        }


//        protected void btnCancelEdit_Click(object sender, EventArgs e)
//        {
//            pnlEditProfile.Visible = false;   //  HIDE panel
//            btnEditProfile.Visible = true;    //  SHOW edit button
//        }


//        protected void btnSaveProfile_Click(object sender, EventArgs e)
//        {


//            string username = Session["student_username"].ToString();
//            string photoPath = null;

//            // 1️⃣ Handle photo upload (if selected)
//            if (fuProfilePhoto.HasFile)
//            {
//                //lblCity.Text = fuProfilePhoto.HasFile ? "HAS FILE" : "NO FILE";
//                string ext = System.IO.Path.GetExtension(fuProfilePhoto.FileName).ToLower();

//                // Allow only images
//                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
//                {
//                    string fileName = Guid.NewGuid().ToString() + ext;
//                    string folderPath = Server.MapPath("~/StudentImages/");

//                    // Ensure folder exists
//                    if (!System.IO.Directory.Exists(folderPath))
//                    {
//                        System.IO.Directory.CreateDirectory(folderPath);
//                    }

//                    fuProfilePhoto.SaveAs(folderPath + fileName);
//                    photoPath = "StudentImages/" + fileName;
//                }
//            }

//            // 2️⃣ Update DB
//            using (SqlConnection con = new SqlConnection(cs))
//            {
//                string query = @"
//            UPDATE student_signup 
//            SET city = @city,
//                contact_no = @contact" +
//                        (photoPath != null ? ", profile_photo = @photo" : "") +
//                    " WHERE username = @username";

//                SqlCommand cmd = new SqlCommand(query, con);
//                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
//                cmd.Parameters.AddWithValue("@contact", txtContact.Text.Trim());
//                cmd.Parameters.AddWithValue("@username", username);

//                if (photoPath != null)
//                {
//                    cmd.Parameters.AddWithValue("@photo", photoPath);
//                }

//                con.Open();
//                cmd.ExecuteNonQuery();
//            }

//            // 3️⃣ Reload profile + reset UI
//            LoadStudentProfile();
//            pnlEditProfile.Visible = false;
//            btnEditProfile.Visible = true;
//        }



//    }
//}