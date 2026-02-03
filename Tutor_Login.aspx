<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Login.aspx.cs" Inherits="TMS_Project.Tutor_Login" %>

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
                    <h2>Tutor Login</h2>
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

                <asp:Button ID="Tutor_LoginBtn"
                    runat="server"
                    Text="Login"
                    CssClass="btn btn-primary btn-block"
                    OnClick="Tutor_LoginBtn_Click" />

                <div class="text-center mt-2">
                    <a href="Tutor/Tutor_ForgotPassword.aspx" class="text-primary">Forgot Password?
                    </a>
                </div>


                <div class="text-center">
                    <a href="Student_Login.aspx" class="text-center">Login As Student</a>
                </div>
                <br />
            </div>
            <br />
        </div>
        <br />
    </div>
    <br />
</asp:Content>
