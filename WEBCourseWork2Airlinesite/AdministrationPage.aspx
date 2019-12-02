<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrationPage.aspx.cs" Inherits="WEBCourseWork2Airlinesite.AdministrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body id="Admin-Body">
    <header id="Home-section-header">
        <img src="css/images/icconn1.png" alt="Image-Logo1" class="header-icon123" />
        <%-- header element with all the navigation options--%>
        <ul class="first-navigation" aria-atomic="False">
            <li><a href="HomePage.aspx">Home</a></li>
            <li><a href="AboutPage.aspx">About</a></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="#">Services</a><ul class="dropdown">
        <li><a href="LoginPage.aspx">Booking</a></li>
        <li><a href="serviceDisplay.apsx">Coutries to travel</a></li>
      </ul></li>
            <li><a href="SignUp.aspx" id="Account-a">Account</a></li>
        </ul>
    </header>
    <form id="form1" runat="server">
        <div class="containerz">
            <div class="containerz-Elements">
                <asp:Label class="labelzall" runat="server" ID="AdminUName"></asp:Label>
                <asp:Label class="labelzall" runat="server" ID="Label1" Text="User Name:">Name:</asp:Label><br />
                <br />
                <asp:Label class="labelzall" runat="server" Text="What would you like to do?">What would you like to do today</asp:Label><br />
                <br />
                <asp:RadioButtonList class="labelzall" ID="RadioBtnForAdminUpdate" runat="server">
                    <%--radio button for slecting admin options--%>
                    <asp:ListItem Value="-1">Update User Accounts</asp:ListItem>
                    <asp:ListItem Value="0">Generate report</asp:ListItem>
                    <asp:ListItem Value="1">Update bookings (Currently Unavailable)</asp:ListItem>
                </asp:RadioButtonList><br />
                <br />

                <%--<input type="radio" text="Update User Accounts"><label>Update User Accounts</label><br /><br />
   <input type="radio" text="Generate report"><label>Generate report</label><br /><br />
   <input type="radio" text="Update bookings"><label>Update bookings(Currently Unavailable)</label>--%>

                <asp:Label class="labelzall" ID="AdminCodeID" runat="server" Text="Admin Code:"></asp:Label>&nbsp;&nbsp;<asp:TextBox runat="server" requierd="" ID="AdminTExtBox"></asp:TextBox>&nbsp;&nbsp;
   <asp:Button runat="server" ID="configCode" Text="↺" OnClick="configCode_Click"></asp:Button><br />
                <br />

                <asp:Label class="labelzall" runat="server" Text="Member Details"></asp:Label>

                <asp:DropDownList ID="DropDownList2" runat="server" Height="29px" Width="157px">
                    <asp:ListItem Value="-1">Select</asp:ListItem>
                    <asp:ListItem Value="0">Update Membership</asp:ListItem>
                    <asp:ListItem Value="1">View Members</asp:ListItem>
                    <asp:ListItem Value="2">Delete  Members</asp:ListItem>
                </asp:DropDownList><br />
                <br />
                <%--  <select>
        <option>Select</option>
        <option>Update Membership</option>
        <option>View Members</option>
        <option>Delete  Members</option>
    </select>--%>
                <asp:Label class="labelzall" runat="server" Text="Reports"></asp:Label>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; still unsure<br />
                <input type="button" class="aboutbtn" value="Submit" onclick="ToggleBTNS3()" id="SubmitButtonz" />&nbsp; &nbsp; 
      <asp:Button runat="server" class="LogoutAccount" Text="Logout" ID="ButtonforLogout"></asp:Button>
            </div>
        </div>
        <div id="showHideForm">
            <input type="button" id="BtnNumber1Adminz" class="X-ButnAdminz" value="X" onclick="CloseXBTN()" />

            <div class="admin-Alter-Section">
                <div class="left-side-Admin-Pagez">
                    <asp:HiddenField runat="server" ID="hiddenfieldzID"></asp:HiddenField>
                    <asp:Label class="AdminLabelfirst" ID="Label2" runat="server" Text="First Name"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForFname"></asp:TextBox>
                    <asp:Label class="AdminLabelfirst" ID="Label3" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForLname"></asp:TextBox>
                    <asp:Label class="AdminLabelfirst" ID="Label4" runat="server" Text="Gender"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForGender"></asp:TextBox><br />
                    <asp:Label class="AdminLabelfirst" ID="Label5" runat="server" Text="DOB"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForDOB"></asp:TextBox><br />
                    <asp:Label class="AdminLabelfirst" ID="Label6" runat="server" Text="Tele"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForTele"></asp:TextBox>

                </div>
                <div class="right-side-Admin">
                    <asp:Label class="AdminLabel1" ID="Label7" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForEmail"></asp:TextBox><br />
                    <asp:Label class="AdminLabel1" ID="Label8" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForPassCode"></asp:TextBox><br />
                    <asp:Label class="AdminLabel1" ID="Label9" runat="server" Text="Account Type"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForAccountType"></asp:TextBox><br />
                    <asp:Label class="AdminLabel1" ID="Label10" runat="server" Text="Card Number:"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForCardNumber"></asp:TextBox><br />
                    <asp:Label class="AdminLabel1" ID="Label11" runat="server" Text="Reciept Number:"></asp:Label>
                    <asp:TextBox Class="AdminLabelz" runat="server" ID="TextBoxForReceipt"></asp:TextBox>
                </div>
            </div>
            <div class="Admin-Btn-Section">
                <asp:Button runat="server" class="LogoutAccount" ID="btnUpdate" Text="Save" OnClick="btnSave_Click" />
                <asp:Button runat="server" class="LogoutAccount" ID="btnDelete" Text="Delete" OnClick="BtnDelete" />
                <asp:Button runat="server" class="LogoutAccount" ID="btnClear" Text="Cear" OnClick="btnClear_Click" />
                <input type="button" class="aboutbtn" value="Show Table" onclick="ShowHideGrid()" id="SubmitButtonz1" />
            </div>
            <asp:Label runat="server" ID="LabelForSuccessMessage" Text="" ForeColor="green"></asp:Label>
            <asp:Label runat="server" ID="LabelfroErrorMessage" Text="" ForeColor="red"></asp:Label>
        </div>
        <div id="showHideDataGridDiv">
            <asp:GridView ID="GVUser" runat="server" Width="273px" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <%--here--%>
                <Columns>
                    <%-- <asp:BoundField DataField="UserId" HeaderText="UserId" />--%>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" />
                    <asp:BoundField DataField="Tele" HeaderText="Tele" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:BoundField DataField="TypeOfAccount" HeaderText="" />
                    <asp:BoundField DataField="CreditcardNumber" HeaderText="CreditcardNumber" />
                    <asp:BoundField DataField="RecieptNumberUserAccount" HeaderText="RecieptNumberUserAccount" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkView" CssClass="linkViewz1" runat="server" CommandArgument='<%# Eval("UserId") %>' OnClick="LinkB_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="darkslategray" ForeColor="white" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />

            </asp:GridView>
            <div class="WebApi-Section">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
             <h1 id="1">Web Api Section</h1>
            <asp:Button ID="Button1Get" runat="server" Text="Get" OnClick="Button1Get_Click" />
             <asp:Button ID="ButtonPost" runat="server" Text="Post" OnClick="ButtonPost_Click" />
        </div>
        </div>
        
    </form>
    <script type="text/javascript">

        document.getElementById("showHideForm").style.display = "none";
        document.getElementById("showHideDataGridDiv").style.display = "none";
        x = document.getElementById("showHideDataGridDiv");
        var x, contact;//global vaiables
        var getAdmin = "";
        contact = document.getElementById("showHideForm");
        //document.getElementById("openContactform").onclick = function()
        function ToggleBTNS3() {
            //this is to show or hide the contact form

            if (contact.style.display === "none") {
                contact.style.display = "block";
            }
        }
        function ShowHideGrid() {
            //this is to show or hide the nav bar on fone view

            if (x.style.display === "none") {
                x.style.display = "block";
            }
        }
        function CloseXBTN() {//this is to close any of the form elements displaying


            if (contact.style.display === "block" || x.style.display === "block") {
                contact.style.display = "none";
                x.style.display = "none";
            }
        }
      //  function ToggleBTN3()
      //{
      //    //this is to show or hide the nav bar on fone view
      //    var x = document.getElementById("Show_Hide");
      //    if (x.style.display === "block"){
      //        x.style.display = "none";
      //    } else{
      //        x.style.display = "block";
      //    }
      //}
    </script>
    
</body>
</html>
