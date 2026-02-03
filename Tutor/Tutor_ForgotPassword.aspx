<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutor_ForgotPassword.aspx.cs"
    Inherits="TMS_Project.Tutor.Tutor_ForgotPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Tutor Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card p-4 shadow" style="width: 400px;">

                <h4 class="text-center text-primary mb-4">
                    Tutor Forgot Password
                </h4>

                <!-- Message -->
                <asp:Label 
                    ID="lblMsg" 
                    runat="server" 
                    CssClass="d-block mb-3 text-center" />

                <!-- Username or Email -->

               
                <%--<asp:TextBox ID="txtUser" runat="server" CssClass="form-control mb-3" placeholder="Enter username or email" />--%>
               <%-- <asp:TextBox 
                    ID="txtUser"
                    runat="server"
                    CssClass="form-control mb-3"
                    Placeholder="Enter Username or Email" />--%>
<%--                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUser" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Need to submit valid email or id"></asp:RequiredFieldValidator>--%>
           

                <!-- Send OTP Button -->

                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control mb-3" placeholder="Enter username or email" />

<!-- Send OTP Button -->
<asp:Button 
    ID="btnSendOtp" 
    runat="server"
    Text="Send OTP"
    CssClass="btn btn-primary w-100" 
    OnClick="btnSendOtp_Click"
    CausesValidation="false"/>
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtUser" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" runat="server" ErrorMessage="Need valid email or username"></asp:RequiredFieldValidator>--%>

            </div>
        </div>
    </form>

</body>
</html>
