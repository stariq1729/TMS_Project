<%@ Page Title="" Language="C#" MasterPageFile="~/student/student_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutors.aspx.cs" Inherits="TMS_Project.student.View_Tutors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">

        <div class="col-md-12">

            <h1 class="jumbotron bg-dark text-center text-white">TUTOR'S DATA</h1>

        </div>

    </div>
    <div class="row">

        <div class="col-md-4">

            <div class="input-group">

                <asp:TextBox ID="SearchText" class="form-control" placeholder="search Tutor" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <button id="SearchBtn" runat="server" onserverclick="SearchBtn_ServerClick" class="btn btn-secondary" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

        </div>
      
    </div>
    <br />
    <div class="row">
<asp:Repeater 
    ID="Repeater1" 
    runat="server"
    OnItemCommand="Repeater1_ItemCommand"
    OnItemDataBound="Repeater1_ItemDataBound">

       <%-- <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">--%>

            <ItemTemplate>

                <div class="col-md-4">

                    <div class="card bg-dark text-white text-center">
                        <div class="card-header">
                            <small style="font-size: 15px; color: steelblue;">Name</small>
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body">
                            <small style="font-size: 15px; color: steelblue;">Email</small>
                            <h5>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </h5>
                            <small style="font-size: 15px; color: steelblue;">Country</small>
                            <h5>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </h5>
                            <small style="font-size: 15px; color: steelblue;">City</small>
                            <h5>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            </h5>
                            <small style="font-size: 15px; color: steelblue;">Experience</small>
                            <h5>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("experience") %>'></asp:Label>
                            </h5>
                            <small style="font-size: 15px; color: steelblue;">Contact_No</small>
                            <h5>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                            </h5>
                        </div>
                        <div class="card-footer">
                            <small style="font-size: 15px; color: steelblue;">Qualification</small>
                            <h4>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("qualification") %>'></asp:Label>
                            </h4>

                            <!-- REQUEST TUTOR BUTTON -->
<asp:Button 
    ID="btnRequestTutor"
    runat="server"
    Text="Request Tutor"
    CssClass="btn btn-success btn-sm mt-2"
    CommandName="RequestTutor"
    CommandArgument='<%# Eval("tutor_id") %>' />

<asp:HiddenField 
    ID="hfStatus"
    runat="server"
    Value='<%# Eval("request_status") %>' />

                        </div>

                    </div>

                    <br />
                </div>

            </ItemTemplate>

        </asp:Repeater>
        <asp:Label ID="lblMsg" runat="server" CssClass="text-success"></asp:Label>

    </div>

</asp:Content>
