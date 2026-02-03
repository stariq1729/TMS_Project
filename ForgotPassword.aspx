<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="TMS_Project.ForgotPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card p-4 shadow">
                        <h4 class="text-center mb-3">Forgot Password</h4>

                        <asp:Label Text="Username or Email" runat="server" />
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control mb-3" />

                        <asp:Button ID="btnCheck"
                            runat="server"
                            Text="Verify"
                            CssClass="btn btn-primary w-100"
                            Onclick="btnCheck_Click" />
                            

                        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger mt-3 d-block" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUser" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Need valid email or username"></asp:RequiredFieldValidator>
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
