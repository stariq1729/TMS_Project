<%@ Page Title="" Language="C#" MasterPageFile="~/student/student_dashboard.Master" AutoEventWireup="true" CodeBehind="Response.aspx.cs" Inherits="TMS_Project.student.Response" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--        <h2 class="text-center mt-3">Tutor Response</h2>
    <hr />--%>

        <br />
    <div class="row">

        <div class="col-md-12">

            <h1 class="jumbotron bg-dark text-center text-white">TUTOR'S RESPONSE</h1>

        </div>

    </div>

    <asp:Repeater ID="RepeaterResponses" runat="server">
    <ItemTemplate>

        <div class="col-md-4">
            <div class="card mb-3">
                <div class="card-body">

                    <h5 class="text-primary">
                        Tutor: <%# Eval("tutor_name") %>
                    </h5>

                    <p>
                        <strong>Contact No:</strong>
                        <%# Eval("contact_no") %>
                    </p>

                    <p>
                        <strong>Requested On:</strong>
                        <%# Eval("request_date") %>
                    </p>

<p>
    <strong>Status:</strong>
    <span style='<%# 
        Eval("request_status").ToString() == "Accepted" ? "color:green;font-weight:bold;" :
        Eval("request_status").ToString() == "Rejected" ? "color:red;font-weight:bold;" :
        "color:orange;font-weight:bold;" %>'>
        <%# Eval("request_status") %>
    </span>
</p>


<p>
    <strong>Tutor Message:</strong><br />
    <%# string.IsNullOrEmpty(Eval("tutor_message")?.ToString())
        ? "No message from tutor"
        : Eval("tutor_message") %>
</p>


                </div>
            </div>
        </div>

    </ItemTemplate>
</asp:Repeater>
<asp:Label 
    ID="lblNoResponses"
    runat="server"
    Text="You have not received any tutor responses yet."
    CssClass="text-muted text-center d-block mt-3"
    Visible="false">
</asp:Label>




</asp:Content>
