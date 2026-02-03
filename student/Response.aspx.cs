using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_Project.student
{
    public partial class Response : System.Web.UI.Page
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
                LoadResponses();
            }
        }
        void LoadResponses()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
            SELECT 
                t.name AS tutor_name,
                t.contact_no,
                r.request_date,
                r.request_status,
                r.tutor_message
             FROM tutor_requests r
             INNER JOIN tutor_signup t
                ON r.tutor_id = t.tutor_id
            WHERE r.student_username = @student
            ORDER BY r.request_date DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@student", Session["student_username"]);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable data = new DataTable();
                sda.Fill(data);

                RepeaterResponses.DataSource = data;
                RepeaterResponses.DataBind();

                lblNoResponses.Visible = data.Rows.Count == 0;
            }
        }
    }
}