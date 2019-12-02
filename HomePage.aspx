
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.HomePage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MaGunChenz Airline</title>
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif&display=swap" rel="stylesheet" />
</head>
<body>
   <%-- header element with all the navigation options--%>
    <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
       <%-- <div class="additional-icon" ></div>--%>
            <ul class="first-navigation" >
                <li><a href="#">Home</a></li>
                 <li><a href="AboutPage.aspx">About</a></li>
                 <li><a href="ContactPage.aspx">Contact</a></li>
                 <li><a href="#">Services</a> <ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
                 <li><a href="SignUp.aspx" id="Account-a">Account</a></li>
            </ul>
    </header>
        <div class="left-section" >
           <%-- workin here-----------------------------------------------------------------------------%>

            <div class="left-Image-section">
                <div class="main-div">

                </div>
               <%-- <span id="slider-image1"></span> --%>  <%--                                                --%>
                <%--<span id="slider-image2"></span>--%>   <%--these spans are the headers for the images below--%>
               <%-- <span id="slider-image3"></span>--%>   <%--                                                --%>
            <%--<div class="Image-container">--%>
           <%-- this is the left side of the home page where the image and slider is--%>
     <%--       <img src="css/images/pexels-photo-333525.jpg" alt="AirlineImage group" class="left-section-img" />
            <img src="css/images/pexels-photo-1309644.jpg" alt="AirlineImage group" class="left-section-img" />
            <img src="css/images/pexels-photo-2707704.jpg" alt="AirlineImage group" class="left-section-img" />
        </div>
                <div class="button-container-div">
                     <a href="#slider-image1" class="slider-button" ></a>&nbsp;&nbsp;
                     <a href="#slider-image2" class="slider-button" ></a>&nbsp;&nbsp;
                     <a href="#slider-image3" class="slider-button" ></a>
                </div>--%>
                </div> <%--button container div ends here--%>
                 <%-- workin here-----------------------------------------------------------------------------%>
            <img src="css/images/iconns.png" alt="Image-Logo" id="header-icon2" />
              <div class="additional-icon" >
            <div class="sd1"></div></div>
             </div>
    
        <div class="right-section">
           <%-- this is the right section of the home page--%>
            <div class="right-section-container"><br />
                          <div class="Globe-Image-Div">
                 <img id="Map-Img" src="css/images/g3.jpg" alt="globe" /></div> 
                <div class="text-Right-section-only">
            <h1 id="our-Name-header">MaGunChenz</h1>
            <h2>Airline</h2>
                <h3>Fly in style</h3>
                <h4>wish to know more about the best booking agency worldwide We have</h4>
                <ol>
                    <li> <a href="#" class="Anchor-line">
                        the cheepest Rates per flights
                        </a>
                    </li>
                    <li> <a href="#" class="Anchor-line">
                       the best first class travel
                          </a>
                    </li>
                    <li> <a href="#" class="Anchor-line">
                        comfortable seating
                        </a>
                    </li>
                    <li> <a href="#" class="Anchor-line">
                        Fast response to any refundind issues
                        </a>
                    </li>
                    <li> <a href="#" class="Anchor-line">
                        The highest customer raitings 
                        </a>
                    </li>
                </ol>
                <h4>Wish to get connected?</h4>
                <div >
                <a href="BookingPage.aspx" class="Btn" title="Click here">Click here</a></div> </div>
                </div> <%--right section-elements div ending--%>
            </div>
      <div class="Cookie-Home" id="CookieBlock">
          <p>HI There! welcome to our Website, We use cookies to improve your experience, to remember your preferences and to show you offers based on your
           interests as detailed in our Cookie policy. 
          By continuing to use MaGunChenz Airline, you accept our use of cookies.</p>
          <input type="button" id="CoockieMessage" onclick="CookieHide()" value="Ok"/>
      </div>
    <div class="bottom-section">
        <h1>What do our Customers say</h1>
        <div class="line1"></div><br />

 <!--           this section is undone-->
        <div class="wrap">
     <div id="arrow-left" class="arrow"></div>
     <div id="slider">
         <div class="slide slide1" id="slidings1"><%-- i changed all the slidings idz--%>
             <div class="slide-content">
                 <img src="css/images/darkgirl.jpg"  id="darkgirl1" />
                 <div class="spanz"> <h6>Sarah Burnett</h6> <br /> <p id="p1" >this travel agency is by far</p> <p id="p2">the best ever the experience was amazing</p></div>
             </div>
         </div>
           
            <div class="slide slide2" id="slidings2">
             <div class="slide-content">
                 <img src="css/images/happywhitegirl.jpg" alt="whitegirl" id="whitehappygirl" />
                  <div class="spanz1"> <h6>Sarah Burnett</h6> <br /> <p id="p11" >this travel agency is by far</p> <p id="p22">the best ever the experience was amazing</p></div>
                 <%--<span>My Partner APP I SAVE<br />this is where as an indivual you can save between 3-24 months in this plan to register <a href="FAX.html">Click Here<br /></a>for further details you cantact us <a href="Contact_Page.html">Here</a></span>--%>
             </div>
         </div>
            <div class="slide slide3" id="slidings3">
             <div class="slide-content">
                 <img src="css/images/bycicleguy.jpg" alt="bycicle guy" id="bycicleman" />
                <div class="spanz2"> <h6>Sarah Burnett</h6> <br /> <p id="p111" >this travel agency is by far</p> <p id="p222">the best ever the experience was amazing</p></div>
             </div>
         </div>
     </div>
        </div>
     <div id="arrow-right" class="arrow"></div>
    </div>
    <footer>
  <p class="p1s">MaGunChenz Airline</p>
        <div class="line2"></div><br /> <p>All Rights Reserved &copy; 2019</p>
        <div class="list1">
        <ol class="ol1">
            <li><a href="HomePage.aspx" class="Anchor-line2">HOME</a> </li>
            <li><a href="#" class="Anchor-line2">About</a> </li>
            <li><a href="#" class="Anchor-line2">Contact</a> </li>
            <li><a href="servicesDisplay.aspx" class="Anchor-line2">Services</a> </li>
            <li><a href="SignUp.aspx" class="Anchor-line2">login</a> </li>
        </ol>
           </div>
         <div class="list2">
           <ol class="ol2">
            <li><a href="#" class="Anchor-line2">Buisness Plans</a> </li>
            <li><a href="#" class="Anchor-line2">Corporate Travel</a> </li>
            <li><a href="#" class="Anchor-line2">Beyond Business Experience</a> </li>
            <li><a href="#" class="Anchor-line2">Meetings and Events</a> </li>
            <li><a href="#" class="Anchor-line2">First Class reservations</a> </li>
        </ol>
             </div>
         <div class="list3">
           <ol class="ol3">
            <li><a href="#" class="Anchor-line3">learn how to</a> </li>
            <li><a href="#" class="Anchor-line3">Become a Partner</a> </li>
            <li><a href="#" class="Anchor-line3">Rate our Services</a> </li>
            <li><a href="#" class="Anchor-line3">Stay in touch</a> </li>
            <li><a href="#" class="Anchor-line3">Travel in comfort</a> </li>
        </ol>
             </div>
          <div class="square-Scroll-Icon">
                <a href="#Home-section-header">	☝	</a>
            </div>
    </footer>
    <!--inline javascript-->
             <script type="text/javascript">
        'use strict'
      // alert("testing");
        //Current represents the image were on
        let sliderImages = document.querySelectorAll('.slide'),arrowLeft= document.querySelector('#arrow-left'),arrowRight= document.querySelector('#arrow-right'),Current=0;
        //function to clear images
        function Reset()
        {
            for(let i = 0; i < sliderImages.length; i++)
                {
                    sliderImages[i].style.display = 'none';
                    
            }
        }
              //initial slider
        function startSlide()
        {
            Reset();
     sliderImages[0].style.display = 'block';
        }
              //show rpeview
              function slideLeft()
              {
                  Reset();
                  sliderImages[Current - 1].style.display='block';
                  Current--;
              }
              // this show whats coming up
              function slideRight()
              {
                  Reset();
                  sliderImages[Current+1].style.display = 'block';
                  Current++;
              }
              // Left arrow clock
 arrowLeft.addEventListener('click',function()
              {
                  if(Current === 0 )
                      {
                          Current = sliderImages.length;
                      }
                  slideLeft();
              });
                         // Right arrow clock
 arrowRight.addEventListener('click',function()
              {
                  if(Current === sliderImages.length - 1 )
                      {
                          Current = -1;
                      }
                  slideRight();
              });
              
        startSlide();
    
                 var cookieBlocks;
                  document.getElementById("CookieBlock").style.display = "block";
          cookieBlocks = document.getElementById('CookieBlock');
          function  CookieHide() {//this is to close any of the form elements displaying


           if (cookieBlocks.style.display === "block") {
               cookieBlocks.style.display = "none";
                 
            }
        }
      </script>
</body>
</html>
