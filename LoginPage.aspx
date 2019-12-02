<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
      <link href="css/StyleSheet1.css" rel="stylesheet" />
</head>
<body class="LoGIn-Up-Body">
   
    <%--above we set enable session stare to readonly--%>
    <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
        <%-- header element with all the navigation options--%>
        <ul class="first-navigation" aria-atomic="False">
            <li><a href="HomePage.aspx">Home</a></li>
            <li><a href="AboutPage.aspx">About</a><ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="servicesDisplay.aspx">Services</a></li>
            <li><a href="SignUp.aspx" id="Account-a">Account</a></li>
        </ul>
    </header>

    <div class="loginBox1" >   
          <img id="MyImage" src="css/images/User-icon.png" />  
        <h2 class="text-in-Login" id="Mag-Login-Head">MaGunChenz Airline<br />Log in here</h2>
    <form id="form1" runat="server">
        <div>
             <asp:Label runat="server" ID="lbltriesleft"></asp:Label> <br />   
            </div>
        <div><br />
            <asp:Label class="text-in-Login"  ID="Label1" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox class="Login-TextBoxes" ID="txtUsername" runat="server"></asp:TextBox>
            </div><br />
        <div class="Login-PW-Section">
            <asp:Label class="text-in-Login"  ID="Label2" runat="server" Text="Password:"></asp:Label>
            <i class="EyeIcon" id="EYE" >͒L</i>
            <asp:TextBox class="Login-TextBoxes" ID="txtPassword" runat="server" type="password"></asp:TextBox><br /><br />
             <asp:CheckBox ForeColor="White" ID="chkRememberMe" Font-Size="Small" Text="Remember Me" runat="server" />
        </div><br />
        <div>
            <asp:Button class="Submit-Box-Login" ID="Button1" runat="server" Text="Login" OnClick="ButtonLogin"  />
            <asp:Button class="Clear-Box-Login" ID="Button2" runat="server" Text="Clear" OnClick="buttonclearBoxes" />
         <div class ="alert alert-danger" id="lblerror" runat="server" style="margin-top:10px; display:none"></div>
        </div><br />
        <div>
            <p class="text-in-Login" >Not yet Registered?</p>
            <a href="SignUp.aspx" class="aTag-in-Login" >Signup</a>
           <%-- <div class="signup-Line"></div> if the bottom border dosent work try this--%>
        </div>
    </form>
        </div>
    <script type="text/javascript">
        //this javascript code is used to show or hide user password
        var txtPassword = document.getElementById('txtPassword');
        var EYE = document.getElementById('EYE');

        EYE.addEventListener('click', togglePass)

        function togglePass() {


            EYE.classList.toggle('active');
            (txtPassword.type == 'password') ? txtPassword.type = 'text' : txtPassword.type = 'password';
        }
    </script>
</body>
</html>
