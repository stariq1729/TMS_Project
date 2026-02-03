using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Threading;

namespace TMS_Project.student
{
    public partial class View_Tutors : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_username"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }


        void BindRepeater()
        {
            SqlConnection con = new SqlConnection(cs);

            string query = @"
        SELECT t.*,
               tr.request_status
        FROM tutor_signup t
        LEFT JOIN tutor_requests tr
             ON t.tutor_id = tr.tutor_id
            AND tr.student_username = @student";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@student", Session["student_username"].ToString());

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);

            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btn = (Button)e.Item.FindControl("btnRequestTutor");
                HiddenField hf = (HiddenField)e.Item.FindControl("hfStatus");

                if (hf != null && !string.IsNullOrEmpty(hf.Value))
                {
                    btn.Enabled = false;

                    if (hf.Value == "Pending")
                    {
                        btn.Text = "Requested";
                        btn.CssClass = "btn btn-warning btn-sm mt-2";
                    }
                    else if (hf.Value == "Accepted")
                    {
                        btn.Text = "Accepted";
                        btn.CssClass = "btn btn-success btn-sm mt-2";
                    }
                    else if (hf.Value == "Rejected")
                    {
                        btn.Text = "Rejected";
                        btn.CssClass = "btn btn-danger btn-sm mt-2";
                    }
                }
            }
        }


        protected void SearchBtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand("sp_SearchTutor", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@SearchText", SearchText.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);

            if (data.Rows.Count > 0)
            {
                Repeater1.DataSource = data;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No records found')</script>");
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Check which button was clicked
            if (e.CommandName == "RequestTutor")
            {
                // Get tutor_id from CommandArgument
                int tutorId = Convert.ToInt32(e.CommandArgument);

                // Get logged-in student username from session
                string studentUsername = Session["student_username"].ToString();

                // Call method to insert request
                SendTutorRequest(studentUsername, tutorId);
            }
        }
        void SendTutorRequest(string studentUsername, int tutorId)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand
                    (
                     "INSERT INTO tutor_requests (student_username, tutor_id, request_status, request_date) " +
                     "VALUES (@student, @tutor, 'Pending', GETDATE())", con
                    );

                cmd.Parameters.AddWithValue("@student", studentUsername);
                cmd.Parameters.AddWithValue("@tutor", tutorId);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    lblMsg.Text = "Tutor request sent successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch (SqlException ex)
                {
                    // 2627 = Unique constraint violation
                    if (ex.Number == 2627)
                    {
                        lblMsg.Text = "You have already requested this tutor.";
                        lblMsg.ForeColor = System.Drawing.Color.Orange;
                    }
                    else
                    {
                        throw; // real error → let it fail
                    }
                }
            }
        }



    }
}