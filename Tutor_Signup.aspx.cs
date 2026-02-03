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
    public partial class Tutor_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void ResetControls()
        {
            NameTextBox.Text = string.Empty;
            SurnameTextBox.Text = string.Empty;           
            GenderDropDownList.ClearSelection();
            AgeTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            MaritalStatusDropDownList.ClearSelection();
            QualificationDropDownList.ClearSelection();
            CountryTextBox.Text = string.Empty;
            CityTextBox.Text = string.Empty;
            addressTextBox.Text = string.Empty;
            ExperirenceDropDownList.ClearSelection();
            DegreeTextBox.Text = string.Empty;
            ContactTextBox.Text = string.Empty;
            UsernameTextBox.Text = string.Empty;
            PasswordTextBox.Text = string.Empty;
            
        }

        protected void TutorSignUpbtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                //string query = "insert into tutor_signup values(@name, @surname, @age, @gender, @email, @marital_status, @country, @city, @address, @qualification, @degree, @experience, @contact_no, @username, @password)";

                string query = @"
                    INSERT INTO tutor_signup
                    (
                        name,
                        surname,
                        gender,
                        age,
                        email,
                        marital_status,
                        country,
                        city,
                        address,
                        qualification,
                        degree,
                        experience,
                        contact_no,
                        username,
                        password
                    )
                    VALUES
                    (
                        @name,
                        @surname,
                        @gender,
                        @age,
                        @email,
                        @marital_status,
                        @country,
                        @city,
                        @address,
                        @qualification,
                        @degree,
                        @experience,
                        @contact_no,
                        @username,
                        @password
                    )";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
                
                cmd.Parameters.AddWithValue("@surname", SurnameTextBox.Text);
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(AgeTextBox.Text));
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
                cmd.Parameters.AddWithValue("@marital_status", MaritalStatusDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@country", CountryTextBox.Text);
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text);
                cmd.Parameters.AddWithValue("@address", addressTextBox.Text);
                cmd.Parameters.AddWithValue("@qualification", QualificationDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@degree", DegreeTextBox.Text);
                cmd.Parameters.AddWithValue("@experience", ExperirenceDropDownList.SelectedItem.Text);
                
                cmd.Parameters.AddWithValue("@contact_no", ContactTextBox.Text);
             
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);

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