using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_Project.admin
{
    public partial class Admin_Index : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("admin_Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadDashboardCounts();
            }
        }
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["admin_username"] == null)
        //    {
        //        Response.Redirect("admin_Login.aspx");
        //    }

        //    // TEMP TEST
        //    lblTotalStudents.Text = "TEST_STUDENTS";
        //    lblTotalTutors.Text = "TEST_TUTORS";
        //    lblTotalUsers.Text = "TEST_USERS";
        //}


        void LoadDashboardCounts()
        {
           
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Total Students shows in the index
                SqlCommand cmdStudents = new SqlCommand(
                    "SELECT COUNT(*) FROM student_signup", con);
                int totalStudents = Convert.ToInt32(cmdStudents.ExecuteScalar());

                // Total Tutors
                SqlCommand cmdTutors = new SqlCommand(
                    "SELECT COUNT(*) FROM tutor_signup", con);
                int totalTutors = Convert.ToInt32(cmdTutors.ExecuteScalar());

                // Assign to labels
                lblTotalStudents.Text = totalStudents.ToString();
                lblTotalTutors.Text = totalTutors.ToString();
                lblTotalUsers.Text = (totalStudents + totalTutors).ToString();
            }
        }


    }
}