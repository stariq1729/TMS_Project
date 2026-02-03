<%@ Page Title="" Language="C#" MasterPageFile="~/student/student_dashboard.Master"
    AutoEventWireup="true" CodeBehind="Student_Index.aspx.cs"
    Inherits="TMS_Project.student.Student_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mt-4">

        <!-- Profile Photo -->
        <div class="col-md-4 text-center">
            <asp:Image ID="imgProfile"
                runat="server"
                Height="150px"
                Width="130px"
                Style="border: 2px solid black; border-radius: 8px;"
                ImageUrl="~/StudentImages/default.png" />
            <br />

            <h5 class="mt-2 text-primary">Profile Photo</h5>

            <br />
            <asp:Button ID="btnEditProfile"
                runat="server"
                Text="Edit Profile"
                CssClass="btn btn-primary"
                OnClick="btnEditProfile_Click" />
            <br />
            <br />

            <asp:Button ID="btnShowChangePassword"
                runat="server"
                Text="Change Password"
                CssClass="btn btn-primary"
                OnClick="btnShowChangePassword_Click"
                CausesValidation="false" />

        </div>



        <!-- Edit Profile Panel (Hidden by default) -->
        <asp:Panel ID="pnlEditProfile" runat="server" Visible="false">


            <asp:Label Text="City" runat="server" CssClass="text-primary" />
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control mb-2" />

            <asp:Label Text="Contact" runat="server" CssClass="text-primary" />
            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control mb-2" />


            <asp:Label Text="Change Photo" runat="server" CssClass="text-primary" />
            <asp:FileUpload ID="fuProfilePhoto" runat="server" CssClass="form-control mb-3" />

            <asp:Button
                ID="btnSaveProfile"
                runat="server"
                Text="Save"
                CssClass="btn btn-success"
                OnClick="btnSaveProfile_Click" />

            <%--    <asp:Button ID="btnSaveProfile"
        runat="server"
        Text="Save Changes"
        CssClass="btn btn-success"
        OnClick="btnSaveProfile_Click"/>--%>

            <asp:Button ID="btnCancelEdit"
                runat="server"
                Text="Cancel"
                CssClass="btn btn-secondary ms-2"
                OnClick="btnCancelEdit_Click"
                CausesValidation="false" />

        </asp:Panel>



        <!-- Change Password Panel -->
        <asp:Panel ID="pnlChangePassword" runat="server" Visible="false" CssClass="mt-4">

            <h5 class="text-primary">Change Password</h5>

            <asp:Label Text="Old Password" runat="server" />
            <asp:TextBox ID="txtOldPassword" runat="server"
                TextMode="Password"
                CssClass="form-control mb-2" />

            <asp:Label Text="New Password" runat="server" />
            <asp:TextBox ID="txtNewPassword" runat="server"
                TextMode="Password"
                CssClass="form-control mb-2" />

            <asp:Label Text="Confirm New Password" runat="server" />
            <asp:TextBox ID="txtConfirmPassword" runat="server"
                TextMode="Password"
                CssClass="form-control mb-3" />

            <asp:Button ID="btnChangePassword"
                runat="server"
                Text="Change Password"
                CssClass="btn btn-warning"
                OnClick="btnChangePassword_Click" />

            <asp:Label ID="lblPwdMsg" runat="server" CssClass="d-block mt-2" />

        </asp:Panel>


        <!-- Student data -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    Student Profile
                </div>
                <div class="card-body">

                    <p>
                        <b>Name :</b>
                        <asp:Label ID="lblName" runat="server" />
                    </p>
                    <p>
                        <b>Father Name :</b>
                        <asp:Label ID="lblFather" runat="server" />
                    </p>

                    <p><b>Age :</b><asp:Label ID="lblAge" runat="server" /></p>
                    <p>
                        <b>Country :</b>
                        <asp:Label ID="lblCountry" runat="server" />
                    </p>
                    <p>
                        <b>City :</b>
                        <asp:Label ID="lblCity" runat="server" />
                    </p>
                    <p>
                        <b>Subject :</b>
                        <asp:Label ID="lblSubject" runat="server" />
                    </p>
                    <p>
                        <b>Contact :</b>
                        <asp:Label ID="lblContact" runat="server" />
                    </p>
                    <p>
                        <b>Username :</b>
                        <asp:Label ID="lblUsername" runat="server" />
                    </p>




                </div>
            </div>
        </div>

    </div>


</asp:Content>
