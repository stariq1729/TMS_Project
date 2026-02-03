<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Tutors.aspx.cs" Inherits="TMS_Project.admin.View_Tutors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
   <asp:GridView ID="GridViewTutors" runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered table-striped">


        <Columns>

    <asp:BoundField DataField="tutor_id" HeaderText="ID" />
    <asp:BoundField DataField="name" HeaderText="Name" />
    <asp:BoundField DataField="surname" HeaderText="Surname" />
    <asp:BoundField DataField="email" HeaderText="Email" />
    <asp:BoundField DataField="contact_no" HeaderText="Contact" />
    <asp:BoundField DataField="country" HeaderText="Country" />


    
    <asp:TemplateField HeaderText="Action">
        <ItemTemplate>
            <asp:LinkButton ID="btnDeleteTutor"
                runat="server"
                Text="Delete"
                CssClass="btn btn-danger btn-sm"
                CommandArgument='<%# Eval("tutor_id") %>'
                OnClick="btnDeleteTutor_Click"
                OnClientClick="return confirm('Are you sure you want to delete this tutor?');">
            </asp:LinkButton>
        </ItemTemplate>
    </asp:TemplateField>

</Columns>

    </asp:GridView>

    <asp:Label ID="lblMsg" runat="server"></asp:Label>

</asp:Content>
