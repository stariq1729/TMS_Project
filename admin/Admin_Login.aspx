<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="TMS_Project.admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <%-- this is admin login page--%>
    <title>Admin Login</title>
   <%-- <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="~/dist/sweetalert2.min.css" rel="stylesheet"/>
    <script src="~/dist/sweetalert2.min.js" type="text/javascript"></script>--%>
    <link href="<%= ResolveUrl("~/assets/vendor/bootstrap/css/bootstrap.min.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/dist/sweetalert2.min.css") %>" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/dist/sweetalert2.min.js") %>"></script>

</head>
<body style="background-color:aliceblue">
    <form id="form1" runat="server">
        <div class="container">
            
            <div class="row">

                <div class="col-md-4 mx-auto style="box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);
                            -webkit-box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);
                            -moz-box-shadow: 10px 10px 5px 2px rgba(0,0,0,0.53);">

                    <div class="jumbotron text-center text-white bg-primary">
                        <h2>Admin Login</h2>

                    </div>

                    <asp:TextBox ID="UsernameTxt" placeholder="Enter username" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="UsernameTxt" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="USername is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="PasswordTxt" TextMode="Password" placeholder="Enter password" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="PasswordTxt" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="LoginBtn_Click" />

                </div>

            </div>

        </div>

        <div>
        </div>
    </form>
    <script src="~/assets/vendor/jquery/jquery.min.js"></script>
    <script src="~/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
