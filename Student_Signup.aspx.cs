using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;





namespace TMS_Project
{
    public partial class Student_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void ResetControls()
        {
            NameTextBox.Text = string.Empty;
            SurnameTextBox.Text = string.Empty;
            FatherTextBox.Text = string.Empty;
            GenderDropDownList.ClearSelection();
            AgeTextBox.Text = string.Empty;
            CountryTextBox.Text = string.Empty;
            CityTextBox.Text = string.Empty;
            addressTextBox.Text = string.Empty;
            ClassTextBox.Text = string.Empty;
            GoingToDropDownList.ClearSelection();
            SubjectTextBox.Text = string.Empty;
            ContactTextBox.Text = string.Empty;
            TutionTypeDropDownList.ClearSelection();
            TutorPreferDropDownList.ClearSelection();
            UsernameTextBox.Text = string.Empty;
            PasswordTextBox.Text = string.Empty;
        }


        protected void StudentSignUpbtn_Click(object sender, EventArgs e)
        {
            string photoPath = "";

            if (fuStudentPhoto.HasFile)
            {
                string ext = System.IO.Path.GetExtension(fuStudentPhoto.FileName).ToLower();

                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                {
                    string fileName = Guid.NewGuid().ToString() + ext;
                    photoPath = "StudentPhotos/" + fileName;
                    fuStudentPhoto.SaveAs(Server.MapPath("~/StudentImages/") + fileName);

                    //fuStudentPhoto.SaveAs(Server.MapPath("~/StudentPhotos/") + fileName);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup",
                        "Swal.fire({title:'Error', text:'Only JPG, JPEG, PNG allowed', icon:'error'});", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup",
                    "Swal.fire({title:'Error', text:'Please upload photo', icon:'error'});", true);
                return;
            }

            SqlConnection con = new SqlConnection(cs);

            try
            {
                photoPath = null;

                if (fuStudentPhoto.HasFile)
                {
                    string folderPath = Server.MapPath("~/StudentImages/");
                    string fileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fuStudentPhoto.FileName);
                    fuStudentPhoto.SaveAs(folderPath + fileName);
                    photoPath = "StudentImages/" + fileName;
                }

                //string query = "insert into student_signup values(@name, @fname, @surname, @gender, @age, @country, @city, @address, @standard, @goingto, @subject, @contact_no, @tution_type, @tutor_prefer, @username, @password)";
                //string query = @"insert into student_signup
                //(name, fname, surname, gender, age, country, city, address, standard, goingto, subject, contact_no, tution_type, tutor_prefer, username, password, photo)
                //values
                //(@name, @fname, @surname, @gender, @age, @country, @city, @address, @standard, @goingto, @subject, @contact_no, @tution_type, @tutor_prefer, @username, @password, @photo)";
                //                string query = @"INSERT INTO student_signup
                //(name, fname, surname, gender, age, country, city, address, standard, goingto, subject,
                // contact_no, tution_type, tutor_prefer, username, password, student_photo)
                //VALUES
                //(@name, @fname, @surname, @gender, @age, @country, @city, @address, @standard, @goingto, @subject,
                // @contact_no, @tution_type, @tutor_prefer, @username, @password, @photo)";
                string query = @"INSERT INTO student_signup
                (name, fname, surname, gender, age, country, city, address, standard, goingto, subject,
                 contact_no, tution_type, tutor_prefer, username, password, profile_photo)
                VALUES
                (@name, @fname, @surname, @gender, @age, @country, @city, @address, @standard, @goingto, @subject,
                 @contact_no, @tution_type, @tutor_prefer, @username, @password, @photo)";


                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@fname", FatherTextBox.Text);
                cmd.Parameters.AddWithValue("@surname", SurnameTextBox.Text);
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(AgeTextBox.Text));
                cmd.Parameters.AddWithValue("@country", CountryTextBox.Text);
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text);
                cmd.Parameters.AddWithValue("@address", addressTextBox.Text);
                cmd.Parameters.AddWithValue("@standard", ClassTextBox.Text);
                cmd.Parameters.AddWithValue("@goingto", GoingToDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@subject", SubjectTextBox.Text);
                cmd.Parameters.AddWithValue("@contact_no", ContactTextBox.Text);
                cmd.Parameters.AddWithValue("@tution_type", TutionTypeDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@tutor_prefer", TutorPreferDropDownList.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
                //cmd.Parameters.AddWithValue("@password", PasswordHelper.HashPassword(PasswordTextBox.Text));
                //string hashedPassword = PasswordHelper.HashPassword(PasswordTextBox.Text);
                //cmd.Parameters.AddWithValue("@password", hashedPassword);
                //cmd.Parameters.AddWithValue(
                //    "@password",
                //    TMS_Project.App_Code.PasswordHelper.HashPassword(PasswordTextBox.Text)
                //);
                //cmd.Parameters.AddWithValue("@password",
                //PasswordHelper.HashPassword(PasswordTextBox.Text));
                //cmd.Parameters.AddWithValue("@password", TMS_Project.PasswordHelper.HashPassword(PasswordTextBox.Text));
                //cmd.Parameters.AddWithValue("@password", PasswordHelper.HashPassword(PasswordTextBox.Text));
                //cmd.Parameters.AddWithValue("@password", PasswordHelper.HashPassword(PasswordTextBox.Text));
                //cmd.Parameters.AddWithValue("@password", PasswordHelper.HashPassword(PasswordTextBox.Text));
                //cmd.Parameters.AddWithValue("@password", PasswordHelper.HashPassword(PasswordTextBox.Text));

                cmd.Parameters.AddWithValue("@photo", photoPath);


                con.Open();

                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('You have registered succesfully')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: \"Success\",text: \"You have register successfully!\",icon:\"success\"});", true);
                    ResetControls();

                }
                else
                {
                    //Response.Write("<script>alert('You have registered failed, try another username')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: \"Failure\",text: \"Password or username does not match!\",icon:\"error\"});", true);
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("UNIQUE KEY constraint"))
                {
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: \"Failure\",text: \"Password or username does not match!..\",icon:\"error\"});", true);
                    ScriptManager.RegisterStartupScript(
                        this,
                         GetType(),
                         "Popup",
                         $"Swal.fire({{ title: 'Failure', text: 'Username {UsernameTextBox.Text} already existed, try with another username!', icon: 'error' }});",
                            true
                    );
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: \"Failure\",text: \"Registration failed...!\",icon:\"error\"});", true);
                }
            }
            finally
            {
                con.Close();
            }


        }
    }
}