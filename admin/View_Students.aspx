<%@ Page Title="View Students" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="View_Students.aspx.cs" Inherits="TMS_Project.admin.View_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label 
        ID="lblMsg" 
        runat="server" 
        EnableViewState="false">
    </asp:Label>
    <br />
    <div class="row">
        <div class="col-md-12">
            <h1 class="jumbotron bg-dark text-center text-white">STUDENTS DATA</h1>
        </div>
    </div>

    <div class="row">
        <asp:Repeater ID="RepeaterStudents" runat="server">


            <ItemTemplate>
                <div class="col-md-4">
                    <div class="card bg-light text-dark text-center">
                        <div class="card-header">
                            <small style="font-size: 15px; color: steelblue;">Name</small>
                            <h3><%# Eval("name") %></h3>
                        </div>
                        <div class="card-body">
                            <small style="font-size: 15px; color: steelblue;">Age</small>
                            <h5><%# Eval("age") %></h5>

                            <small style="font-size: 15px; color: steelblue;">Country</small>
                            <h5><%# Eval("country") %></h5>

                            <small style="font-size: 15px; color: steelblue;">City</small>
                            <h5><%# Eval("city") %></h5>

                            <small style="font-size: 15px; color: steelblue;">Contact</small>
                            <h5><%# Eval("contact_no") %></h5>

                            <small style="font-size: 15px; color: steelblue;">Photo</small>
                            <h5>
                                <asp:Image ID="ImgStudent" runat="server" ImageUrl='<%# ResolveUrl("~/" + Eval("profile_photo")) %>' Height="100px" Width="80px" Style="border: 2px solid steelblue; border-radius: 5px;" />
                            </h5>
                        </div>
                        <div class="card-footer">
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("student_id") %>' OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this student?');" CssClass="btn btn-danger">Delete</asp:LinkButton>
                        </div>
                    </div>
                    <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
