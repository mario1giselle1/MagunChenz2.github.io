<%@ Page Title="" Language="C#" MasterPageFile="~/theRealSite.Master" AutoEventWireup="true" CodeBehind="servicesDisplay.aspx.cs" Inherits="WEBCourseWork2Airlinesite.servicesDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
        <%-- header element with all the navigation options--%>
        <header id="Home-section-header">
            <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
            <%--<div class="additional-icon" ></div>--%>
            <ul class="first-navigation" aria-atomic="False">
                <li><a href="HomePage.aspx">Home</a></li>
                <li><a href="AboutPage.aspx">About</a></li>
                <li><a href="ContactPAge.aspx">Contact</a></li>
                <li><a href="servicesDisplay.aspx">Services</a><ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
                <li><a href="SignUp.aspx" id="Account-a">Account</a></li>
            </ul>
            </header>
            <div class="header-service">
                <img src="css/images/happygirl.png" id="header-img-services" alt="happy girl" />
                <h1>welcome to our service section</h1>
            </div><br />
            <div class="body-service">
            <%--  <span></span>if spans does not show please re add them here
                <span></span>
                <span></span>--%>
             <%--   <p>to see the countries travel to scroll down</p>
                <br />
                <p>Or click the arrow below</p>--%>

                <asp:Label ID="Label1" runat="server" Text=""></asp:Label><%--These are fr the session storage----------------------------------------%>
               <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <asp:Label runat="server" ID="Label3" Text=""></asp:Label>
            </div><br /><br /><br /><br />
            <%--these are for the cards in the service section of the website--%>
            <div class="Card-body-section">
                <div class="box-card">
                    <div class="card-hearder-image">
                        <img src="css/images/jamaica.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>this island of Jamaica</p>
                            <br />
                            <asp:Button ID="ButtonJamaica" runat="server" Text="Book Flight" OnClick="ButtonJamaica_Click"  Class="Button-Class"/>
                        </div>
                    </div>

                    <div class="card-hearder-image">
                        <img src="css/images/bahamas.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>this island of Bahamas</p>
                            <br />
                            <asp:Button ID="ButtonBahamas" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonBahamas_Click" />
                        </div>
                    </div>
                    <div class="card-hearder-image">
                        <img src="css/images/trinadad.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>Trinadad and tobago</p>
                            <br />
                            <asp:Button ID="ButtonTrinadad" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonTrinadad_Click" />
                        </div>
                    </div>
                </div>
                <div class="box-card">
                    <div class="card-hearder-image">
                        <img src="css/images/america.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>America</p>
                            <br />
                             <asp:Button ID="ButtonAmerica" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonAmerica_Click" />
                        </div>
                    </div>

                    <div class="card-hearder-image">
                        <img src="css/images/canada.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>Canada</p>
                            <br />
                             <asp:Button ID="ButtonCanada" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonCanada_Click" />
                        </div>
                    </div>
                    <div class="card-hearder-image">
                        <img src="css/images/england.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>England</p>
                            <br />
                             <asp:Button ID="ButtonEngland" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonEngland_Click"/>
                        </div>
                    </div>
                </div>
                <div class="box-card">
                    <div class="card-hearder-image">
                        <img src="css/images/china.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>China</p>
                            <br />
                             <asp:Button ID="ButtonChina" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonChina_Click"/>
                        </div>
                    </div>

                    <div class="card-hearder-image">
                        <img src="css/images/japan.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>Japan</p>
                            <br />
                             <asp:Button ID="ButtonJapan" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonJapan_Click" />
                        </div>
                    </div>
                    <div class="card-hearder-image">
                        <img src="css/images/nigeria.jpg" alt="jamaica" />
                        <div class="card-text-button">
                            <p>Nigera</p>
                            <br />
                             <asp:Button ID="ButtonNigeria" runat="server" Text="Book Flight" Class="Button-Class" OnClick="ButtonNigeria_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%--this ends the card section--%>
    <div>
        <footer class="Footer-service">
  <p class="p1s">MaGunChenz Airline</p>
        <div class="line2"></div><br /> <p>All Rights Reserved &copy; 2019</p>
        <div class="list1">
        <ol class="ol1">
            <li><a href="index.html" class="Anchor-line2">HOME</a> </li>
            <li><a href="index.html" class="Anchor-line2">About</a> </li>
            <li><a href="index.html" class="Anchor-line2">Contact</a> </li>
            <li><a href="index.html" class="Anchor-line2">Services</a> </li>
            <li><a href="index.html" class="Anchor-line2">login</a> </li>
        </ol>
           </div>
         <div class="list2">
           <ol class="ol2">
            <li><a href="index.html" class="Anchor-line2">HOME</a> </li>
            <li><a href="index.html" class="Anchor-line2">About</a> </li>
            <li><a href="index.html" class="Anchor-line2">Contact</a> </li>
            <li><a href="index.html" class="Anchor-line2">Services</a> </li>
            <li><a href="index.html" class="Anchor-line2">login</a> </li>
        </ol>
             </div>
         <div class="list3">
           <ol class="ol3">
            <li><a href="index.html" class="Anchor-line3">HOME</a> </li>
            <li><a href="index.html" class="Anchor-line3">About</a> </li>
            <li><a href="index.html" class="Anchor-line3">Contact</a> </li>
            <li><a href="index.html" class="Anchor-line3">Services</a> </li>
            <li><a href="index.html" class="Anchor-line3">login</a> </li>
        </ol>
             </div>
            <div class="square-Scroll-Icon">
                <a href="#Home-section-header">˄</a>
            </div>
    </footer>
        <asp:HiddenField ID="ServiceHidden" runat="server" />
        </div>
</asp:Content>

