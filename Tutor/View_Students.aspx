<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor_Dashboard.Master" AutoEventWireup="true" CodeBehind="View_Students.aspx.cs" Inherits="TMS_Project.Tutor.View_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="row">

        <div class="col-md-12">

            <h1 class="jumbotron bg-dark text-center text-white">STUDENTS DATA</h1>

        </div>

    </div>
    <div class="row">

        <div class="col-md-4">

            <div class="input-group">

                <asp:TextBox ID="SearchText" class="form-control" placeholder="Search Student" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <button id="SearchBtn" runat="server" onserverclick="SearchBtn_ServerClick" class="btn btn-secondary" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

        </div>

    </div>
    <br />
    <div class="row">

        <asp:Repeater ID="Repeater1" runat="server">

            <ItemTemplate>

                <div class="col-md-4">

                    <div class="card bg-dark text-white text-center">
                        <div class="card-header">
                            <small style="font-size: 15px; color: steelblue;">Name</small>
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body">
                            <small style="font-size: 15px; color: steelblue;">Photo</small>
                            <%-- <h5>
                                <asp:Image ID="ImgProfile"
                                    runat="server"
                                    ImageUrl='<%# Eval("profile_photo") %>'
                                    Height="100px"
                                    Width="80px"
                                    Style="border: 2px solid steelblue; border-radius: 5px;" />
                            </h5>--%>
                            <small style="font-size: 15px; color: steelblue;">Photo</small>
                            <h5>
                                <asp:Image ID="Image1"
                                    runat="server"
                                    ImageUrl='<%# ResolveUrl("~/" + Eval("profile_photo")) %>'
                                    Height="100px"
                                    Width="80px"
                                    Style="border: 2px solid steelblue; border-radius: 5px;" />
                            </h5>


                            <small style="font-size: 15px; color: steelblue;">Age</small>
                            <h5>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                            </h5>

                            <small style="font-size: 15px; color: steelblue;">City</small>
                            <h5>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            </h5>

                            <small style="font-size: 15px; color: steelblue;">Contact</small>
                            <h5>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                            </h5>

                            <small style="font-size: 15px; color: steelblue;">Subject</small>
                            <h5>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                            </h5>

                            <small style="font-size: 15px; color: steelblue;">Tution Type</small>
                            <h5>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("tution_type") %>'></asp:Label>
                            </h5>
                        </div>
                        <div class="card-footer">
                            <small style="font-size: 15px; color: steelblue;">Standard</small>
                            <h5>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("standard") %>'></asp:Label>
                            </h5>

                        </div>
                    </div>

                    <br />
                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>
</asp:Content>
