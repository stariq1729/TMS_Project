<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Admin_Index.aspx.cs" Inherits="TMS_Project.admin.Admin_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt-4">

        <!-- Total Students -->
        <div class="col-md-4">
            <a href="View_Students.aspx" style="text-decoration: none;">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Students</h5>
                        <h2>
                            <asp:Label ID="lblTotalStudents" runat="server"></asp:Label>
                        </h2>
                    </div>
                </div>
            </a>
        </div>


        <!-- Total Tutors -->
        <div class="col-md-4">
            <a href="View_Tutors.aspx" style="text-decoration: none;">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Tutors</h5>
                        <h2>
                            <asp:Label ID="lblTotalTutors" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                </div>
            </a>
        </div>

        <!-- Total Users -->
        <div class="col-md-4">
            <div class="card text-white bg-dark mb-3">
                <div class="card-body text-center">
                    <h5 class="card-title">Total Users</h5>
                    <h2>
                        <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
