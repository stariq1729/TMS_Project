<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master"
    AutoEventWireup="true" CodeBehind="Student_Requests.aspx.cs"
    Inherits="TMS_Project.Tutor.Student_Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="text-center mt-3">Student Requests</h2>
    <hr />

    <asp:Repeater 
        ID="RepeaterRequests" 
        runat="server"
        OnItemCommand="RepeaterRequests_ItemCommand"
        OnItemDataBound="RepeaterRequests_ItemDataBound">

        <ItemTemplate>

            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-body">

                        <h5>
                            Student Username:
                            <span class="text-primary">
                                <%# Eval("student_username") %>
                            </span>
                        </h5>

                        <p>
                            Status:
                            <strong>
                                <%# Eval("request_status") %>
                            </strong>
                        </p>

                        <p>
                            Request Date:
                            <%# Eval("request_date") %>
                        </p>

                        <!-- Tutor message -->
                        <div class="mt-2">
                            <label>Message to student (optional):</label>

                            <asp:TextBox
                                ID="txtTutorMessage"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="3"
                                CssClass="form-control"
                                EnableViewState="true"
                                placeholder="Write a short message for the student">
                            </asp:TextBox>

                        </div>

                        <!-- Action buttons -->
                        <div class="mt-2">
                            <asp:Button 
                                ID="btnAccept"
                                runat="server"
                                Text="Accept"
                                CssClass="btn btn-success btn-sm me-2"
                                CommandName="Accept"
                                CommandArgument='<%# Eval("request_id") %>'
 />

                            <asp:Button
                                ID="btnReject"
                                runat="server"
                                Text="Reject"
                                CssClass="btn btn-danger btn-sm"
                                CommandName="Reject"
                                CommandArgument='<%# Eval("request_id") %>'
 />
                        </div>

                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
