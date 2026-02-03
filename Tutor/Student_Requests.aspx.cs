using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_Project.Tutor
{
    public partial class Student_Requests : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tutor_username"] == null)
            {
                Response.Redirect("~/Tutor_Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentRequests();
            }
        }

        void LoadStudentRequests()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Get tutor_id using tutor_username
                SqlCommand getTutorIdCmd = new SqlCommand(
                    "SELECT tutor_id FROM tutor_signup WHERE username = @username", con);

                getTutorIdCmd.Parameters.AddWithValue("@username", Session["tutor_username"]);

                con.Open();
                object result = getTutorIdCmd.ExecuteScalar();

                if (result == null)
                    return;

                int tutorId = Convert.ToInt32(result);

                // Get requests for this tutor
                SqlCommand cmd = new SqlCommand(
                    @"SELECT request_id,
                             student_username,
                             request_status,
                             request_date
                      FROM tutor_requests
                      WHERE tutor_id = @tutorId
                      ORDER BY request_date DESC", con);

                cmd.Parameters.AddWithValue("@tutorId", tutorId);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                RepeaterRequests.DataSource = dt;
                RepeaterRequests.DataBind();
            }
        }

        protected void RepeaterRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int requestId = Convert.ToInt32(e.CommandArgument);

            // 🔥 THIS IS THE CORRECT WAY
            TextBox txtMsg = (TextBox)e.Item.FindControl("txtTutorMessage");
            string tutorMessage = txtMsg != null ? txtMsg.Text.Trim() : "";

            if (e.CommandName == "Accept")
            {
                UpdateRequestStatus(requestId, "Accepted", tutorMessage);
            }
            else if (e.CommandName == "Reject")
            {
                UpdateRequestStatus(requestId, "Rejected", tutorMessage);
            }

            LoadStudentRequests();
        }


        void UpdateRequestStatus(int requestId, string status, string tutorMessage)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE tutor_requests
                      SET request_status = @status,
                          tutor_message = @message
                      WHERE request_id = @id", con);

                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@message", tutorMessage);
                cmd.Parameters.AddWithValue("@id", requestId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void RepeaterRequests_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnAccept = (Button)e.Item.FindControl("btnAccept");
                Button btnReject = (Button)e.Item.FindControl("btnReject");

                string status = DataBinder.Eval(e.Item.DataItem, "request_status")?.ToString();

                // Disable buttons after decision
                if (status == "Accepted" || status == "Rejected")
                {
                    btnAccept.Enabled = false;
                    btnReject.Enabled = false;
                }
            }
        }
    }
}
