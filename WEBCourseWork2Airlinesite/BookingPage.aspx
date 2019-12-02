<%@ Page Title="" Language="C#" EnableSessionState="ReadOnly" MasterPageFile="~/theRealSite.Master" AutoEventWireup="true" CodeBehind="BookingPage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.BookingPage" %>

<%--above we set enable session stare to readonly--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <script src="Script/jquery-1.7.1.js"></script>
    <script src="Script/My Script File jquery.js"></script>
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
    <main class="Booking-Main">
        <script type="text/javascript" src="textScript.js"></script>
        <%--<img src="css/images/iconns.png" alt="Image-Logo" id="header-icon2bookings" />--%>
        <h2 class="H20">Book Today! 
           <%-- <span id="txtElem" class="TXT-Type" data-wait="3000" data-words='["we haveTheBestRates","Membershipdiscounts","ExclelentFlightServices"]'></span>--%>
        </h2>
        <%--<h1 class="Typing" id="typingzs">have</h1>--%> <%--this is to test the typewritter effect--%>
        <h2 class="Typing aim-Typewritter" id="typingzs">and travel in comfort</h2> <%--this is the same thing--%>
        <div class="additional-iconbookings">
            <div class="sd1bookings"></div>
        </div>
        <div class="border-Arround-Form">
            <div class="BookingForm">
                <div class="member-Sectionz1"><br />
                    <h1 class="h1-bookings">Already a Member? </h1>
                    <div class="member-Section">
                        <asp:hiddenfield runat="server"></asp:hiddenfield>

                        <asp:textbox class="BookingText" requierd="" runat="server" palceholder="Enter Email here" id="TXTEmail" width="317px" height="29px"></asp:textbox>
                        <asp:label class="BookingLabel" runat="server" text="Email"></asp:label>
                        


                        &nbsp;&nbsp;&nbsp;
                        <asp:textbox class="BookingText1" requierd="" runat="server" palceholder="Enter Password here" id="TXTPassword" width="287px" height="29px"></asp:textbox>
                        <asp:label class="BookingLabel1" runat="server" text="Password"></asp:label>
                        &nbsp;&nbsp;
                        <div class="Email-Password-Btn">
                <asp:button Class="Refresh-Btnz"  id="ButtonforcheckingEmail" runat="server" height="38px" text="↺" onclick="ButtonforcheckingEmail_Click" backcolor="#006666" bordercolor="#006666"  forecolor="White" width="36px" />
                      </div> <%--ends email password btn--%>
                            <asp:label id="successLabel" runat="server" text="" forecolor="green"></asp:label>
                        <%--<div class="additional-icon" ></div>--%>
                        <asp:label id="UnsuccesfullLabel" runat="server" text="" forecolor="Red"></asp:label>
                    </div>
                </div> <br /><br />
                     
                       
                <div>
                    <asp:label id="Label6" runat="server" text="Select Country" font-size="Large"></asp:label>
                    &nbsp;
                <asp:dropdownlist id="DropDownList2" runat="server" height="28px" width="136px">
                <%--    <asp:ListItem Value="-1">Options</asp:ListItem>
                    <asp:ListItem Value="8000">Jamaica</asp:ListItem>
                    <asp:ListItem Value="8000">Bahamas</asp:ListItem>
                    <asp:ListItem Value="8000">Trinadad and tobago</asp:ListItem>
                    <asp:ListItem Value="10000">America</asp:ListItem>
                    <asp:ListItem Value="11000">Canada</asp:ListItem>
                    <asp:ListItem Value="12000">England</asp:ListItem>
                    <asp:ListItem Value="15000">Nigeria</asp:ListItem>
                    <asp:ListItem Value="15000">Japan</asp:ListItem>
                    <asp:ListItem Value="16000">China</asp:ListItem>--%>
                </asp:dropdownlist>
                    <asp:label id="Label100" runat="server" text="Country Selected" font-size="Large"></asp:label>
                    &nbsp;&nbsp;&nbsp;
                <asp:label id="LabelCountryName" runat="server" font-size="Large"></asp:label>
                    &nbsp;&nbsp;&nbsp;
                <asp:label id="Label5" runat="server" text="Price per travel" font-size="Large"></asp:label>
                    &nbsp;&nbsp;&nbsp;
                <asp:label id="LabelCountryVaule" runat="server" font-size="Large"></asp:label>
                    <asp:button Class="Country-Btnz" id="ButtonSHOWcountryPrice" runat="server" text="ADD" onclick="ButtonSHOWcountryPrice_Click" backcolor="#006666" bordercolor="#006666" font-size="Medium" forecolor="White" height="27px" width="50px" />
                    <asp:label id="LabelReSelect" runat="server" font-size="Large" text=" "></asp:label>
                </div><br /><br />
                <div>
                    <asp:hiddenfield runat="server" id="hiddenfieldzID"></asp:hiddenfield>
                    <asp:hiddenfield runat="server" id="hiddenfieldPersonID"></asp:hiddenfield>
                    <asp:hiddenfield runat="server" id="hiddenfieldACCID"></asp:hiddenfield>
                    <asp:hiddenfield runat="server" id="hiddenfieldCountrID"></asp:hiddenfield>
                    <asp:hiddenfield runat="server" id="hiddenfieldUserBookinNum"></asp:hiddenfield>
                    <asp:hiddenfield runat="server" id="hiddenfieldRecieotID"></asp:hiddenfield>

                    <asp:textbox class="BookingText" requierd="" runat="server" id="TXTFirstName" width="319px" height="29px"></asp:textbox>
                    <asp:label class="BookingLabel" runat="server" text="First Name"></asp:label>
                 
                    <asp:requiredfieldvalidator id="RequiredFieldValidatorFirstName" runat="server" controltovalidate="TXTFirstName" errormessage="First Name field cannot be empty" forecolor="Red" text="*" enabled="False"></asp:requiredfieldvalidator>

                    <asp:textbox class="BookingText1" requierd="" runat="server" id="TXTLastName" width="286px" height="29px"></asp:textbox>
                    <asp:label class="BookingLabel1" runat="server" text="Last Name"></asp:label>
                    <asp:requiredfieldvalidator id="RequiredFieldValidatorLasttName" runat="server" controltovalidate="TXTLastName" errormessage="Last Name field cannot be empty" forecolor="Red" text="*" enabled="False" enabletheming="True"></asp:requiredfieldvalidator>
                </div><br />
                <div>
                    <asp:label runat="server" text="Gender" font-size="Large"></asp:label>
                    <asp:checkbox runat="server" id="CheckboxMale" text="Male" font-size="Large"></asp:checkbox>
                    <asp:checkbox runat="server" id="CheckboxFemale" text="Female" font-size="Large"></asp:checkbox>
                </div><br />
                <div>

                    <asp:textbox class="BookingText" requierd="" palceholder="Enter Travel Date here" id="TXTDate" runat="server" width="200px" height="24px"></asp:textbox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                 <asp:label class="BookingLabel" id="Label1" runat="server" text="Date eg.(mm/dd/yyyy)"></asp:label><%-- the id value--%>
                    <asp:label id="Label2" runat="server" text="Time" font-size="Large"></asp:label>
                    <asp:dropdownlist id="DropDownListforTravelTime" runat="server" height="23px" width="99px" font-size="Medium">
                    <asp:ListItem Selected="True" Value="-1">Options</asp:ListItem>
                    <asp:ListItem Value="6:00 am">6:00 am</asp:ListItem>
                    <asp:ListItem Value="8:00 am">8:00 am</asp:ListItem>
                    <asp:ListItem Value="10:00 am">10:00 am</asp:ListItem>
                    <asp:ListItem Value="1:00 pm">1:00 pm</asp:ListItem>
                    <asp:ListItem Value="6:00 pm">6:00 pm</asp:ListItem>
                    <asp:ListItem Value="7:00 pm">7:00 pm</asp:ListItem>
                    <asp:ListItem Value="9:00 pm">9:00 pm</asp:ListItem>
                </asp:dropdownlist>
                </div><br />
                <div>
                    <asp:label id="Label3" runat="server" text="Travel Type"></asp:label>
                    <asp:radiobuttonlist id="RadioButtonListforTravelType" runat="server" onselectedindexchanged="RadioButtonListforTravelType_SelectedIndexChanged" font-size="Large">
                    <asp:ListItem>Round Trip</asp:ListItem>
                    <asp:ListItem>One Way</asp:ListItem>
                </asp:radiobuttonlist>
                </div>
                <div>
                    <h1>&nbsp;</h1>
                    <h1 class="h1-bookings">Number of persons Travelling</h1>
                    <asp:dropdownlist id="DropDownList1" runat="server" onselectedindexchanged="DropDownList1_SelectedIndexChanged" font-size="Medium" height="25px" width="89px">
                    <asp:ListItem Value="-1">Options</asp:ListItem>
                    <asp:ListItem Value="1">Adult</asp:ListItem>
                    <asp:ListItem Value="2">Children</asp:ListItem>
                </asp:dropdownlist>
                    <asp:button id="BTNAddAdultChild" runat="server" text="ADD" onclick="BTNAddAdultChild_Click" backcolor="#006666" bordercolor="#006666" forecolor="White" width="46px" />

                    <asp:textbox class="BookingTextAdult" requierd="" id="TXTAdults" runat="server" placeholder="Number of Adults" height="24px"></asp:textbox>
                    <asp:label class="BookingLabelAdult" id="LabelforAdult" runat="server"></asp:label>

                    <asp:textbox class="BookingTextChild" requierd="" id="TXTChildren" runat="server" placeholder="Number of Children" height="27px"></asp:textbox>
                    <asp:label class="BookingLabelChild" id="LabelforChildren" runat="server"></asp:label>
                    <asp:label runat="server" id="Labelsomething" text="(no tax is taken from additional tickets)" font-size="Large"></asp:label>
                    <br />
                    <br />
                </div>
                <div>

                    <asp:textbox class="BookingText" requierd="" id="TXTCardNumber" runat="server" width="318px"  onkeypress="isInputNumber(event)"  ontextchanged="TXTCardNumber_TextChanged" height="30px"></asp:textbox>
                    <asp:label class="BookingLabel" id="Label4" runat="server" text="Credit Card"></asp:label>
                    <div class="refresh-cardz">
                    <asp:button Class="Refresh-Btnz" id="ButtonForCreditCrard" runat="server" text="↺" backcolor="#006666" onclick="ButtonForCreditCrard_Click" bordercolor="#006666" forecolor="White" height="38px" Width="37px" />
                    </div> <%-- ends card button div--%>
                    <asp:requiredfieldvalidator id="RequiredFieldValidatorCredit" runat="server" controltovalidate="TXTCardNumber" errormessage="Last Name field cannot be empty" forecolor="Red" text="*" enabletheming="True" Enabled="False"></asp:requiredfieldvalidator>
                    <asp:label id="LabelconfirmCrad" runat="server" text="" forecolor="Green"></asp:label>
                    <asp:label id="LabelDeclineCard" runat="server" text="" forecolor="Red"></asp:label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TXTCardNumber" Enabled="False" ErrorMessage="number only!" ForeColor="Red" ValidationExpression="111111111111-999999999999"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:button id="ButtonCheck" runat="server" text="Check" width="134px" onclick="ButtonCheck_Click" backcolor="#006666" bordercolor="#006666" font-size="Medium" forecolor="White" height="32px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:button id="ButtonClear" runat="server" text="Clear" width="124px" onclick="ButtonClear_Click" backcolor="#666699" bordercolor="#666699" font-size="Medium" forecolor="White" height="32px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:button id="ButtonSubmit" runat="server" text="Print" width="128px" backcolor="#006666" bordercolor="#006666" font-size="Medium" forecolor="White" height="32px" OnClick="ButtonSubmit_Click" />
                </div>
                <div>
                    <asp:listbox id="ListBox1" runat="server" height="181px" width="427px"></asp:listbox>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            //this function prevents users from typing in Charaters inside the card text box
            function isInputNumber(evt)
            {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                }
            }
            //$(function(){
            //    $('.border-Arround-Form .BookingForm asp:textbox').focusout(function(){
            //        var text_Val = $(this).val();
            //        if (text_Val === "") {

            //            $(this).removeClass('has-Value');
            //        }
            //        else {
            //             $(this).addClass('has-Value');
            //        }
            //    });

            //});
        </script>
    </main>

</asp:Content>
