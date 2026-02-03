using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TMS_Project.admin
{
    public partial class View_Students : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindStudents();
            }
        }

        void BindStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT student_id, name, age, country, city, contact_no, profile_photo FROM student_signup";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                RepeaterStudents.DataSource = dt;
                RepeaterStudents.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int studentId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM student_signup WHERE student_id = @id", con);
                cmd.Parameters.AddWithValue("@id", studentId);

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {                   
                    lblMsg.Text = "Student deleted successfully.";
                    lblMsg.CssClass = "alert alert-success";
                    BindStudents(); // refresh list
                }
                else
                {
                    lblMsg.Text = "Delete failed.";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
        }

    }
}
