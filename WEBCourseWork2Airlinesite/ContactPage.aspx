<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
      <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body class="ContactPage-Body">
     <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
        <%-- header element with all the navigation options--%>
        <ul class="first-navigation" aria-atomic="False">
            <li><a href="HomePage.aspx">Home</a></li>
            <li><a href="AboutPage.aspx">About</a></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="servicesDisplay.aspx">Services</a></li>
            <li><a href="LoginPage.aspx" id="Account-a">Account</a></li>
        </ul>
    </header>
    <form id="form1" runat="server">
        <div class="right-Section-Contact">
            <h6>Because MaGunChenz Airline Aims for the highest in Customer
                support, we have devised many different ways for our Valid and
                Potential Customers to contact us <br /><br />We can be Contacted 
                via telephone<br /> at: 1876-243-MAGC or 1876-311-0041<br /><br />
                Via Email at: MagunchenzTechsupport@cnbc.com
            </h6>
            <h5>
                Or send us an Email by Clicking
            </h5><br />
            <input type="button" id="Clickme-Contact" value="Me!" onclick="ClickMeLogin()" />
        </div>
        
    </form>
    <div class="Login-Form-Loginz" id="LoginFormLogin">
    <form  id="registrationLogin" action="MAILTO:mariomatthias1@gmail.com" method="post" enctype="text/plain">
        <div>
        <input type="button" id="User-Contact-Btn" onclick="UserContachBTNZ()" value="X"/></div><br /><br />
        <div class="Login-FormPage-Items">
        <label>Full Name:</label>
        <input  type="text" id="UserContact-Name"/>
        <label>Email:</label>
        <input  type="text" id="UserContact-Email"/>
        <label>Message:</label>
        <textarea id="UserContact-Texts"></textarea>
        <div><br />
            <input type="submit" id ="button1" value="Signup" onclick="Register_Button()" />
            <input id="buttons" type="reset" value="Clear" />
        </div>
            </div>
    </form>
    </div>
    <script type="text/javascript">
        var Container ="";
        document.getElementById("LoginFormLogin").style.display = "none";
        Container = document.getElementById("LoginFormLogin");
        //document.getElementById("openContactform").onclick = function()
        function ClickMeLogin() {
            //this is to show or hide the contact form

            if (Container.style.display === "none") {
                Container.style.display = "block";
            }
        }
        function UserContachBTNZ() {//this is to close any of the form elements displaying


            if (Container.style.display === "block") {
                Container.style.display = "none";
            }
        }
        </script>
</body>
</html>
