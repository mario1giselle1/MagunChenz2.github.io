<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutPage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.AboutPAge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
      <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Gupter|Noto+Serif&display=swap" rel="stylesheet" />
</head>

<body class="AboutPage-Body">
       
    <%--above we set enable session stare to readonly--%>
    <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
        <%-- header element with all the navigation options--%>
        <ul class="first-navigation" aria-atomic="False">
            <li><a href="HomePage.aspx">Home</a></li>
            <li><a href="AboutPage.aspx">About</a></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="servicesDisplay.aspx">Services</a><ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
            <li><a href="SignUp.aspx" id="Account-a">Account</a></li>
        </ul>
    </header>
    <form id="form1" runat="server">
        <div class="Wrapper">
        <div class="Container-Body-About">
            
            <img src="css/images/BigHeartImageeeee.jpg" alt="Love Image" />
        <div class="ribbon ribbon-1"></div>
        <div class="ribbon ribbon-2"></div>
        <div class="ribbon ribbon-3"></div>
        <div class="ribbon ribbon-4"></div>
            <div id="arrow-leftz1" class="arrow"></div>
                <div class="SLIDERz text-section-abt">
            <h1>About Us</h1>
            <h3>MaGunChen Airline is a airline booking website. this website is 
                very user friendly with no glitches. the idaea that led to the development of this website was formed from our knack of creating stunning websites

               </h3>
        </div> <%--here---------------------%>
                <div class="SLIDERz text-section-abt">
            <h1>About Developers</h1>
            <h3>MaGunChen Airline  was devoped by Chennell Allison, Noel Gonzales and Mario Matthias.<br />
                with aid from Youtube, Pexels images and Our Lecturer.
               </h3>
        </div>
        </div></div>
     <div id="arrow-rightz1" class="arrow"></div>
         <img id="About-Section_Header" src="css/images/iconns.png" />
    
    </form>
    <script type="text/javascript">
             let sliderImages = document.querySelectorAll('.SLIDERz'),arrowLeft= document.querySelector('#arrow-leftz1'),arrowRight= document.querySelector('#arrow-rightz1'),Current=0;
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
    </script>
</body>
</html>
