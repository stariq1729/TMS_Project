<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master"
    AutoEventWireup="true"
    CodeBehind="Student_Login.aspx.cs"
    Inherits="TMS_Project.Student_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container">
        <div class="row">

            <%-- <div class="col-md-4 mx-auto"
                style="box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);
                       -webkit-box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);
                       -moz-box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);">--%>
            <div class="col-md-4 mx-auto"
                style="box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.53); -webkit-box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.53); -moz-box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.53);">

                <br />
                <div class="jumbotron text-center text-white bg-primary">
                    <h2>Student Login</h2>
                </div>

                <asp:TextBox ID="UsernameTxt" runat="server"
                    CssClass="form-control"
                    placeholder="Enter username">
                </asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="UsernameTxt"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    Display="Dynamic"
                    ErrorMessage="Username is required">
                </asp:RequiredFieldValidator>

                <br />

                <asp:TextBox ID="PasswordTxt" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Enter password">
                </asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server"
                    ControlToValidate="PasswordTxt"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    Display="Dynamic"
                    ErrorMessage="Password is required">
                </asp:RequiredFieldValidator>

                <br />

                <asp:Button ID="Student_LoginBtn"
                    runat="server"
                    Text="Login"
                    CssClass="btn btn-primary btn-block"
                    OnClick="LoginBtn_Click" />

                <div class="text-center">
                    <a href="Tutor_Login.aspx" class="text-center">Login as tutor</a>
                </div>
                <br />
            </div>
            <br />
        </div>
        <br />
    </div>
    <br />
</asp:Content>
