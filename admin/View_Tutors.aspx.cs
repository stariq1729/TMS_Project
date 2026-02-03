using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TMS_Project.admin
{
    public partial class View_Tutors : System.Web.UI.Page
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
                BindTutors();
            }
        }

        void BindTutors()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT tutor_id, name, surname, email, contact_no, country FROM tutor_signup";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewTutors.DataSource = dt;
                GridViewTutors.DataBind();

            }
        

        }

        protected void btnDeleteTutor_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int tutorId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM tutor_signup WHERE tutor_id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", tutorId);

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMsg.CssClass = "text-success";
                    lblMsg.Text = "Tutor deleted successfully.";
                    BindTutors(); // refresh grid
                }
                else
                {
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Failed to delete tutor.";
                }
            }
        }

    }
}
