<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WEBCourseWork2Airlinesite.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Page</title>
     <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body class="Sign-Up-Body">
     <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
        <%-- header element with all the navigation options--%>
        <ul class="first-navigation" aria-atomic="False">
            <li><a href="HomePage.aspx">Home</a></li>
            <li><a href="AboutPAge.aspx">About</a></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="servicesDisplay.aspx">Services</a><ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
            <li><a href="LoginPage.aspx" id="Account-a">Account</a></li>
        </ul>
    </header>
    <div class="Signup_form-Section-EL">
    <form id="form1" runat="server">
        <div class="left-Section-Items-Sign">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:Label Class="Signup_Labelz" ID="Label1" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignFName" runat="server" Class="Signup_TextBoxes" ></asp:TextBox><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label2" runat="server" Text="Last Name:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignLName" runat="server" Class="Signup_TextBoxes"></asp:TextBox><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label3" runat="server" Text="DOB:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignDOB" runat="server" Class="Signup_TextBoxes" ></asp:TextBox>  <br /><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label5" runat="server" Text="Gender:"></asp:Label>
           <asp:checkbox Class="Signup_Labelz" runat="server" id="CheckboxMale111" text="Male" font-size="Large"></asp:checkbox>
           <asp:checkbox Class="Signup_Labelz" runat="server" id="CheckboxFemale111" text="Female" font-size="Large"></asp:checkbox><br /><br /><br />
           <asp:Label Class="Signup_Labelz" ID="Label4" runat="server" Text="Tele:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignTele" onkeypress="isInputNumber1(event)" runat="server" Class="Signup_TextBoxes" ></asp:TextBox>
        </div>
        <div class="right-Section-Items-Sign">
            <asp:Label Class="Signup_Labelz" ID="Label6" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignEmail" runat="server" Class="Signup_TextBoxes"></asp:TextBox><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label7" runat="server" Text="Password:"></asp:Label>
             <asp:TextBox ID="TextBoxforSignPword" runat="server" Class="Signup_TextBoxes" textmode="Password"></asp:TextBox><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label11" runat="server" Text="Confirm P/W:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignConfirPWord" runat="server" Class="Signup_TextBoxes" textmode="Password"></asp:TextBox><br /><br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords does not match" ControlToCompare="TextBoxforSignPword" ControlToValidate="TextBoxforSignConfirPWord" ForeColor="black"></asp:CompareValidator>
           <div>
            <asp:Label Class="Signup_Labelz" ID="Label8" runat="server" Text="Account Type:"></asp:Label>
                 <asp:dropdownlist id="DropDownListAccountType111" runat="server" height="28px" width="136px" class="My-DropdowList">
                 <asp:ListItem Value="-1">Options</asp:ListItem>
                     <asp:ListItem Value="1">1. Regular </asp:ListItem>
                    <asp:ListItem Value="2">2. Silver</asp:ListItem>
                    <asp:ListItem Value="3">3. Gold</asp:ListItem>
                    <asp:ListItem Value="4">4.Platinum</asp:ListItem>
                    
                </asp:dropdownlist></div><br /><br /><br />
            <asp:Label Class="Signup_Labelz" ID="Label9" runat="server" Text="Credit Card:"></asp:Label>
            <asp:TextBox ID="TextBoxforSignCcard" onkeypress="isInputNumber(event)" runat="server" Class="Signup_TextBoxes"></asp:TextBox><br /><br />
        </div>
        <div class="SignUp-Btn-Section">
            <asp:Button ID="ButtonSIgnzSignUpZ1" runat="server" Text="SignUp" title="SignUp" OnClick="SignUpSignPageBtn"  />
            <asp:Button Class="ButtonSIgnzLoginZ1ClearZ1" ID="ButtonSIgnzLoginZ1" runat="server" Text="Login" OnClick="LoginSignUpPageBtn" />
            <asp:Button Class="ButtonSIgnzLoginZ1ClearZ1" ID="ButtonSIgnzClearz1" runat="server" Text="Clear" OnClick="ClearBtn" />
        </div>
    </form>
    </div>
     <div class="Signup_form-Section-Back" >
         
     </div><div class="Signup_form-Section-div">
         <h1>MaGunChenz Airline <br />Sign up With us</h1></div>
    <script type="text/javascript">
           function isInputNumber(evt)
           {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                }
           }
        function isInputNumber1(evt)
        {
           var ch = String.fromCharCode(evt.which);
           if (!(/[0-9]/.test(ch))) {
               evt.preventDefault();
           }
        }
    </script>
</body>
    
</html>
