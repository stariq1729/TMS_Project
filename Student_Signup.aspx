<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="TMS_Project.Student_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container">
        <br />
        <div class="row">
            <div class="col-md-12">
            <h1 class="jumbotron bg-primary text-white text-center ">Student SignUp</h1>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4">

                <asp:TextBox ID="NameTextBox" placeholder="Enter your name" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Required your name"></asp:RequiredFieldValidator>
                <br />
                 <asp:TextBox ID="SurnameTextBox" placeholder="Enter your surname" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="SurnameTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Surname is required"></asp:RequiredFieldValidator>
                <br />
                 <asp:TextBox ID="FatherTextBox" placeholder="Enter your father name" CssClass="form-control" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="FatherTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="father name is required"></asp:RequiredFieldValidator>
                
                <br />
                <asp:TextBox ID="AgeTextBox" placeholder="Enter your age" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Age is required"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be 5 be 60" ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="Red" MaximumValue="60" MinimumValue="6" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                <br />
                    <asp:TextBox ID="CountryTextBox" placeholder="enter country" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CountryTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Country is required"></asp:RequiredFieldValidator>
                <br /> 
                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>SELECT GENDER</asp:ListItem>
                    <asp:ListItem>MALE</asp:ListItem>
                    <asp:ListItem>FEMALE</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="GenderDropDownList" InitialValue="SELECT GENDER" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Gender is required"></asp:RequiredFieldValidator>
               
                <br />
                        
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="CityTextBox" placeholder="Enter your city" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CityTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="City is required"></asp:RequiredFieldValidator>  
                <br />
                
               <asp:TextBox ID="ClassTextBox"  placeholder="Enter your class" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ClassTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Class is required"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="GoingToDropDownList" CssClass="form-control" runat="server">
                   <asp:ListItem>SELECT GOING TO</asp:ListItem>
                    <asp:ListItem>SCHOOL</asp:ListItem>
                    <asp:ListItem>COLLEGE</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
               <asp:RequiredFieldValidator ControlToValidate="GoingToDropDownList" InitialValue="SELECT GOING TO" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Going to is required"></asp:RequiredFieldValidator>
               
                <br />
                <asp:TextBox ID="SubjectTextBox" placeholder="Enter your Subject" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="SubjectTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Subject is required"></asp:RequiredFieldValidator>
                <br />
                <%--I have remove the multiline in the textbox of address so the form come into the shape properly.--%>
                <%--Textmode="Multiline" Rows="2" Columns="20"--%>
                <asp:TextBox ID="addressTextBox"  placeholder="enter your address" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="addressTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                <br />
                <%--<br />--%>
<%--<asp:Label ID="lblPhoto" runat="server" Text="Upload Photo:" CssClass="text-primary"></asp:Label>--%>
<%--<br />--%>
<asp:FileUpload ID="fuStudentPhoto" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="fuStudentPhoto" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="photo is required"></asp:RequiredFieldValidator>
<br />

            </div>

            <div class="col-md-4">
                <asp:TextBox ID="ContactTextBox" placeholder="Enter your Contact Number" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Contact is required"></asp:RequiredFieldValidator>

                <br />
                 <asp:DropDownList ID="TutionTypeDropDownList" CssClass="form-control" runat="server">
                     <asp:ListItem>SELECT TUTION TYPE</asp:ListItem>
                     <asp:ListItem>ONLINE</asp:ListItem>
                     <asp:ListItem>OFFLINE</asp:ListItem>
        
                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="TutionTypeDropDownList" InitialValue="SELECT TUTION TYPE" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="tution type is required"></asp:RequiredFieldValidator>
               
                <br />
                 <asp:DropDownList ID="TutorPreferDropDownList" CssClass="form-control" runat="server">
                     <asp:ListItem>SELECT TUTOR TYPE</asp:ListItem>
                     <asp:ListItem>Graduate</asp:ListItem>
                     <asp:ListItem>Master</asp:ListItem>
                     <asp:ListItem>Mphill</asp:ListItem>
                     <asp:ListItem>PHD</asp:ListItem>
                     <asp:ListItem>Other's</asp:ListItem>
               
                     </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="TutorPreferDropDownList" InitialValue="SELECT TUTOR TYPE" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Tutor type is required"></asp:RequiredFieldValidator>
               
                <br />

                <asp:TextBox ID="UsernameTextBox" placeholder="enter your Username" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="UsernameTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                <br />
                 <asp:TextBox ID="PasswordTextBox" TextMode="Password" placeholder="enter your Password" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="PasswordTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="PasswordTextBox" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ID="RegularExpressionValidator1" runat="server" ErrorMessage="please enter a strong password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$"></asp:RegularExpressionValidator>
                <br />
                 <asp:TextBox ID="ConfirmTextBox" TextMode="Password" placeholder="enter your re-passward" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ConfirmTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="re-enter password is required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ConfirmTextBox" ControlToCompare="PasswordTextBox" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Password must be identical"></asp:CompareValidator>

                 <br />
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-md-6 mx-auto">
                <asp:Button ID="StudentSignUpbtn" OnClick="StudentSignUpbtn_Click" CssClass="btn btn-primary btn-block" runat="server" Text="SignUp" />        
            </div>    
        </div>
        <br />
        <div class="row">
            <div class="col-md-6 mx-auto text-center">
               
        <a href="Student_Signup.aspx" class="btn btn-success">SignUp as Student</a>
        <a href="Tutor_Signup.aspx" class="btn btn-info">SignUp as Tutor</a>

            </div>
        </div>
        <br />
    </div>

    <br />

</asp:Content>
