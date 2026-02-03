<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="TMS_Project.Tutor_Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <div class="container">
        <br />
        <div class="row">
            <div class="col-md-12">
            <h1 class="jumbotron bg-primary text-white text-center ">Totor SignUp</h1>
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
                <%-- <asp:TextBox ID="FatherTextBox" placeholder="enter your father name" CssClass="form-control" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ControlToValidate="FatherTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="father name is required"></asp:RequiredFieldValidator>
                <br />--%>
                <asp:TextBox ID="AgeTextBox" placeholder="enter age" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Age is required"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be 20 be 70" ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="Red" MaximumValue="70" MinimumValue="20" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                <br />
                 <asp:DropDownList ID="GenderDropDownList" CssClass="form-control" runat="server">
                 <asp:ListItem>SELECT GENDER</asp:ListItem>
                 <asp:ListItem>MALE</asp:ListItem>
                 <asp:ListItem>FEMALE</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ControlToValidate="GenderDropDownList" InitialValue="SELECT GENDER" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Gender is required"></asp:RequiredFieldValidator>

                 <br />

                 <asp:TextBox ID="EmailTextBox" placeholder="enter your email" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                 <asp:DropDownList ID="MaritalStatusDropDownList" CssClass="form-control" runat="server">
                     <asp:ListItem>SELECT STATUS</asp:ListItem>
                     <asp:ListItem>SINGLE</asp:ListItem>
                     <asp:ListItem>MARRIED</asp:ListItem>
                     <asp:ListItem>OTHER</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ControlToValidate="MaritalStatusDropDownList" InitialValue="SELECT STATUS" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Status is required"></asp:RequiredFieldValidator>
                 <br />
                     
            </div>

            <div class="col-md-4">

                <asp:TextBox ID="CountryTextBox" placeholder="enter country" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CountryTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Country is required"></asp:RequiredFieldValidator>
                <br /> 


                <asp:TextBox ID="CityTextBox" placeholder="enter city" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CityTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="City is required"></asp:RequiredFieldValidator>  
                <br />
                
              

                 <asp:DropDownList ID="QualificationDropDownList" CssClass="form-control" runat="server">
                 <asp:ListItem>SELECT QUALIFICATION</asp:ListItem>
                 <asp:ListItem>GRAD</asp:ListItem>
                 <asp:ListItem>MASTER'S</asp:ListItem>
                 <asp:ListItem>MPHILL</asp:ListItem>
                     <asp:ListItem>PHD</asp:ListItem>
                     <asp:ListItem>OTHER'S</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ControlToValidate="QualificationDropDownList" InitialValue="SELECT QUALIFICATION" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="QUALIFICATION is required"></asp:RequiredFieldValidator>
                 <br />

    


              <%--  <asp:TextBox ID="SubjectTextBox" placeholder="enter your Subject" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="SubjectTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Subject is required"></asp:RequiredFieldValidator>
                <br />--%>
                <asp:TextBox ID="addressTextBox" Textmode="Multiline" Rows="6" Columns="20" placeholder="enter your address" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="addressTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                <br />
            </div>

            <div class="col-md-4">

                 <asp:DropDownList ID="ExperirenceDropDownList" CssClass="form-control" runat="server">
                <asp:ListItem>SELECT EXPERIENCE</asp:ListItem>
                 <asp:ListItem>1 year</asp:ListItem>
                 <asp:ListItem>2 year</asp:ListItem>
                 <asp:ListItem>3+ years</asp:ListItem>
                 <asp:ListItem>5+ years</asp:ListItem>
                 <asp:ListItem>8+ years</asp:ListItem>
                 <asp:ListItem>10+ years</asp:ListItem>
             </asp:DropDownList>
            <asp:RequiredFieldValidator ControlToValidate="ExperirenceDropDownList" InitialValue="SELECT EXPERIENCE" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="experience is required"></asp:RequiredFieldValidator>

             <br />

                <asp:TextBox ID="DegreeTextBox" placeholder="enter degree" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="DegreeTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="degree is required"></asp:RequiredFieldValidator>  
                <br />
                <asp:TextBox ID="ContactTextBox" placeholder="enter your COntact Number" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Contact is required"></asp:RequiredFieldValidator>

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
            <div class="col-md-4 mx-auto">
                <asp:Button ID="TutorSignUpbtn" OnClick="TutorSignUpbtn_Click" CssClass="btn btn-primary btn-block" runat="server" Text="SignUp" />
            </div>
        </div>
         <br />
 <div class="row">
     <div class="col-md-6 mx-auto text-center">
        
 <a href="Student_Signup.aspx" class="btn btn-success">SignUp as Student</a>
 <a href="Tutor_Signup.aspx" class="btn btn-info">SignUp as Tutor</a>

     </div>
 </div>
    </div>

    <br />

    </asp:Content>