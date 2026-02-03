
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutor_ResetPassword.aspx.cs"
    Inherits="TMS_Project.Tutor.Tutor_ResetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body class="bg-light">

    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-5">

                    <div class="card shadow">
                        <div class="card-header bg-dark text-white text-center">
                            <h4>Reset Password</h4>
                        </div>

                        <div class="card-body">

                            <!-- OTP -->
                            <div class="form-group">
                                <asp:Label runat="server" Text="Enter OTP"></asp:Label>
                                <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator 
                                    ControlToValidate="txtOtp"
                                    ErrorMessage="OTP is required"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    runat="server" />
                            </div>

                            <!-- New Password -->
                            <div class="form-group">
                                <asp:Label runat="server" Text="New Password"></asp:Label>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator 
                                    ControlToValidate="txtNewPassword"
                                    ErrorMessage="New password is required"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    runat="server" />
                            </div>

                            <!-- Confirm Password -->
                            <div class="form-group">
                                <asp:Label runat="server" Text="Confirm Password"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator 
                                    ControlToValidate="txtConfirmPassword"
                                    ErrorMessage="Confirm password is required"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    runat="server" />
                            </div>

                            <!-- Compare Password -->
                            <asp:CompareValidator 
                                ControlToCompare="txtNewPassword"
                                ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Passwords do not match"
                                ForeColor="Red"
                                Display="Dynamic"
                                runat="server" />

                            <br />

                            <!-- Reset Button -->
                            <asp:Button 
                                ID="btnResetPassword"
                                runat="server"
                                Text="Reset Password"
                                CssClass="btn btn-primary btn-block"
                                OnClick="btnResetPassword_Click"/>

                            <br />

                            <!-- Message -->
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>

</body>
</html>

