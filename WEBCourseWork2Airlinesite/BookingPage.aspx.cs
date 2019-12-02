using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;//
using System.Threading.Tasks;
//using System.Windows.Forms;

namespace WEBCourseWork2Airlinesite
{
    public partial class BookingPage : System.Web.UI.Page
    {
        //my global variables

        string dbconstring = ConfigurationManager.ConnectionStrings["dbConstringAirLine"].ConnectionString;//my global constring variable
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;//this message can also be used to allow validation
            if (!IsPostBack)
            {   //when page is loaded these ny default will be false
                LabelforAdult.Text = LabelforChildren.Text = "";
                TXTAdults.Enabled = false; TXTChildren.Enabled = false;
                RequiredFieldValidatorCredit.Enabled = false;//comeback
                ButtonClear.Enabled = false;
                ButtonSubmit.Enabled = false;
                myDataBinding();
            } //end postback
            if (Session["Cname"] != null) // these code will check if the sessions are null and run the wepage despite
            {
                LabelCountryName.Text = Session["Cname"].ToString();
            }
            if (Session["CPrice"] != null)
            {
                LabelCountryVaule.Text = Session["CPrice"].ToString();
            }
            if(Session["Message"] != null)
            {
                LabelReSelect.Text = Session["Message"].ToString();
            }
        }
        protected void ButtonSHOWcountryPrice_Click(object sender, EventArgs e)
        {
            LabelCountryName.Text = DropDownList2.SelectedItem.Text;
            LabelCountryVaule.Text = DropDownList2.SelectedValue;
        }
        protected void RadioButtonListforTravelType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonforcheckingEmail_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(dbconstring))
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = " Select UserAccount.UserId , Password,Email from LoginTable inner join UserAccount on LoginTable.ACCOUNTID" +
                 " = UserAccount.UserId where Email= '" + TXTEmail.Text + "' and Password = '" + TXTPassword.Text + "'"; //here
                con.Open();
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter dalogin = new SqlDataAdapter(cmd);
                dalogin.Fill(dt);
                int found = int.Parse(dt.Rows.Count.ToString());
                if (found > 0)
                {
                    //this postback function allows the button to be anabled if the page is reloaded and there are values in the text bex fields
                    if (IsPostBack)
                    {
                        successLabel.Text = "Welcome " + TXTEmail.Text;
                        TXTFirstName.Enabled = false;
                        TXTLastName.Enabled = false;
                        CheckboxFemale.Enabled = false;
                        CheckboxMale.Enabled = false;
                        ButtonforcheckingEmail.Enabled = false;
                        TXTEmail.Enabled = false;
                        TXTPassword.Enabled = false;
                        UnsuccesfullLabel.Text = " ";
                    }
                }   //end if       
                else
                    UnsuccesfullLabel.Text = "Unrecognized Entry";
                TXTEmail.Text = TXTPassword.Text = " ";

            }//sql con object closes here
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void CheckUserOptions()//this method will check the drop down list if an adult or a child was selected
        {
            switch (DropDownList1.SelectedValue)//this swith statement will check user input and print an output for either chald or adulu alone with a value
            {
                case "-1":
                    Response.Write("<script>alert('No option Selected')</script>");
                    ListBox1.Text = "";
                    break;
                case "1":
                    LabelforAdult.Text = "Enter Amount";
                    TXTAdults.Enabled = true;
                    break;
                case "2":
                    LabelforChildren.Text = "Enter Amount";
                    TXTChildren.Enabled = true;
                    break;
                default:
                    Response.Write("<script>alert('No option Selected')</script>");
                    break;

            }
        }

        protected void BTNAddAdultChild_Click(object sender, EventArgs e)
        {
            CheckUserOptions();
        }

        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            RequiredFieldValidatorLasttName.Enabled = true;//coming back to this -----------------------
            RequiredFieldValidatorFirstName.Enabled = true;
            if (Page.IsValid)
            {
                //cookie object------------
                HttpCookie Cookie = new HttpCookie("UserInfo");
                Cookie["FName"] = TXTFirstName.Text;
                Cookie["LName"] = TXTLastName.Text;
                Cookie.Expires = DateTime.Now.AddDays(30);// this will alow the cookies to remain on the clients computer for a certain period
                Response.Cookies.Add(Cookie);
                ADDUserInputs();
                ListBox1.Enabled = false;

                //Response.Redirect("Reciept.aspx");
            }//end of if validation check
            else
            {
                Response.Redirect("~/BookingPage.aspx");
            }
        }
  
        protected void TXTCardNumber_TextChanged(object sender, EventArgs e)
        {
            RequiredFieldValidatorCredit.Enabled = true;

           // if(char.IsControl(e.KeyChar))

        }

        public float cardEntry = 0;
        const double Roudtrip = 2;
        double AdultTicket = 0.0; double ChildTicket = 0.0; double AdultTicketTotal, childTicketTotal;
        const double GCT = 0.165;
        double discount = 0.0;
        StringBuilder fullDetails = new StringBuilder();
        public string FNAME, LNAME, CountryName, Timez, TravleTypeString;
        public string TravelDate;
        Random myRandom = new Random();
        int randomNumber = 0;
        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            ClearBoxes();
        }

        public double CountryCost, TotalCost, gctAmount, travelTypeAmount, TypeTotal;

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Ticket Confirmed your Tracking Number will be sent to you in the next  hour Thanks for Making int MagunChenz')</script>");
        }

        protected void ButtonForCreditCrard_Click(object sender, EventArgs e)
        {
            //our credit card button now what thsis button does is to check if the credit text box is empty or not
            RequiredFieldValidatorCredit.Enabled = true;
            //if (Page.IsValid)
            //{
            //    LabelconfirmCrad.Text = "confirmed"; 
            //}
          
            RequiredFieldValidatorCredit.Enabled = true;
            LabelDeclineCard.Text = "";
            LabelconfirmCrad.Text = "";
            cardEntry = float.Parse(TXTCardNumber.Text);
            if (cardEntry > 111111111111 && cardEntry < 999999999999)
            {
                ListBox1.Enabled = true;
                LabelconfirmCrad.Text = "confirmed";
            }
            else
            {
                LabelDeclineCard.Text = "Invalid Entry";
                TXTCardNumber.Text = "";
                RegularExpressionValidator1.Enabled = true;

            }
            RequiredFieldValidatorCredit.Enabled = true;
        }

        public int[] numberOFClidAdult = new int[1];
        public void ADDUserInputs()
        {
            if ((CheckboxMale.Checked == false) && (CheckboxFemale.Checked == false))
            {
                Response.Write("<script>alert('Plese Select a Gender')</script>");
                ListBox1.Text = "";
            }
            else
            {
                if (CheckboxMale.Checked)
                {
                    fullDetails.Append(" ," + CheckboxMale.Text);
                }

                if (CheckboxFemale.Checked)
                {
                    fullDetails.Append(" ," + CheckboxFemale.Text);
                }
                // Response.Write("Selected Accessories is: " + details.ToString());
            }
            if (DropDownList2.SelectedValue == "-1")
            {
                //error to go here------
                
                ListBox1.Text = "";
            }
            else
            {
                CountryCost = double.Parse(LabelCountryVaule.Text);
                CountryName = LabelCountryName.Text;
            }
            if (DropDownListforTravelTime.SelectedValue == "-1")
            {
                //error if there was no time selected
                Response.Write("No time was selected");
                ListBox1.Text = "";
            }
            else
            {
                Timez = DropDownListforTravelTime.SelectedItem.Text;
            }
            TravelDate = TXTDate.Text;
            TravleTypeString = RadioButtonListforTravelType.SelectedItem.Text;
            if (RadioButtonListforTravelType.SelectedIndex == 0)
            {
                //checking if user selected round trip and adding a ticket value
                travelTypeAmount = double.Parse(LabelCountryVaule.Text) * 0.80;
                //TypeTotal = travelTypeAmount + double.Parse(LabelCountryVaule.Text);

            }
            if (RadioButtonListforTravelType.SelectedIndex == 1)
            {
                //nothing happends here
            }
            if(TXTCardNumber.Text == "")
            {
                Response.Write("<script>alert('Plese Enter your card number')</script>");
                ListBox1.Text = "";
            }
            //TicketValueMethod();
            if (DropDownList1.SelectedValue == "1")
            {
                AdultTicket = double.Parse(TXTAdults.Text);
                AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount));//safe
                if (AdultTicket > 5)
                {
                    AdultTicketTotal = ((AdultTicket * CountryCost) + travelTypeAmount) * 0.040;
                }
            }
            else if (DropDownList1.SelectedValue == "2")
            {
                ChildTicket = double.Parse(TXTChildren.Text);
                childTicketTotal = (((ChildTicket * CountryCost) + travelTypeAmount) / 2);
                if (ChildTicket > 5)
                {
                    childTicketTotal = (((ChildTicket * CountryCost) + travelTypeAmount) / 2) * 0.050;
                }
            }
            else if (DropDownList1.SelectedValue == "1" && DropDownList1.SelectedValue == "2")
            {
                AdultTicket = double.Parse(TXTAdults.Text);
                AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount));//safe
                ChildTicket = double.Parse(TXTChildren.Text);
                childTicketTotal = ((ChildTicket * (CountryCost + travelTypeAmount)) / 2);
                if (AdultTicket > 5)
                {
                    AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount)) * 0.40;
                }
                if (ChildTicket > 5)
                {
                    childTicketTotal = (((ChildTicket * (CountryCost + travelTypeAmount)) / 2) * 0.50);
                }
            }
            gctAmount = (CountryCost + travelTypeAmount) * GCT;
           TotalCost = gctAmount + travelTypeAmount + CountryCost + AdultTicketTotal + childTicketTotal;
            //this should add the random reciept number
            randomNumber = myRandom.Next(1, 100000);
            hiddenfieldRecieotID.Value = randomNumber.ToString();
            //randomNumber= double.Parse(hiddenfieldRecieotID.Value);
            fillDataGrid2();
            ListBox1.Items.Add("Reciept Number: " +randomNumber.ToString());
            ListBox1.Items.Add("Country Selected: " + CountryName);
            ListBox1.Items.Add("Full Name: " + TXTFirstName.Text + " " + TXTLastName.Text);
            ListBox1.Items.Add("Gender: " + fullDetails.ToString());
            ListBox1.Items.Add("Date:" + TravelDate.ToString() + "  Time: " + Timez);
            ListBox1.Items.Add("Travel Option" + TravleTypeString + "Cost: " + travelTypeAmount.ToString());
            ListBox1.Items.Add("Adults Selected: "+ AdultTicket.ToString()+"  "+"Children Selected: "+ChildTicket.ToString());
            ListBox1.Items.Add("GCT amount: " + gctAmount.ToString());
            ListBox1.Items.Add("Your Total: " + TotalCost.ToString());
            // Response.Write("Selected Car Cost is: " + carCost.ToString());
            ButtonCheck.Enabled = false;
            ButtonClear.Enabled = true;
            ButtonSubmit.Enabled = true;
        }
        public void TicketValueMethod()
        {
           // if (DropDownList1.SelectedValue == "1")
           // {
           //     AdultTicket = double.Parse(TXTAdults.Text);
           //     AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount));//safe
           //     if (AdultTicket > 5)
           //     {
           //         AdultTicketTotal = ((AdultTicket * CountryCost) + travelTypeAmount) * 0.040;
           //     }
           // }
           //else if (DropDownList1.SelectedValue == "2")
           // {
           // ChildTicket = double.Parse(TXTChildren.Text);
           // childTicketTotal = (((ChildTicket * CountryCost) + travelTypeAmount) / 2);
           // if (ChildTicket > 5)
           // {
           //     childTicketTotal = (((ChildTicket * CountryCost) + travelTypeAmount) / 2) * 0.050;
           // }
           //}
           // else if(DropDownList1.SelectedValue == "1" && DropDownList1.SelectedValue == "2")
           // {
           //     AdultTicket = double.Parse(TXTAdults.Text);
           //     AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount));//safe
           //     ChildTicket = double.Parse(TXTChildren.Text);
           //     childTicketTotal = ((ChildTicket * (CountryCost + travelTypeAmount)) / 2);
           //     if (AdultTicket > 5)
           //     {
           //         AdultTicketTotal = (AdultTicket * (CountryCost + travelTypeAmount)) * 0.40;
           //     }
           //     if (ChildTicket > 5)
           //     {
           //         childTicketTotal = (((ChildTicket * (CountryCost + travelTypeAmount)) / 2) * 0.50);
           //     }
           // }
           
            
        }
        public void ClearBoxes()
        {
            //this method is supposed to clear all text boxes and disable the update button after
            DropDownList2.SelectedIndex = -1;
            LabelCountryName.Text = LabelCountryVaule.Text = TXTFirstName.Text = TXTLastName.Text = TXTDate.Text = TXTAdults.Text= TXTChildren.Text = LabelforAdult.Text = LabelforChildren.Text = TXTCardNumber.Text = LabelconfirmCrad.Text = LabelDeclineCard.Text="";
            CheckboxMale.Checked = false; CheckboxFemale.Checked = false;
            DropDownListforTravelTime.SelectedIndex = -1;
            RadioButtonListforTravelType.SelectedIndex = -1;
            DropDownList1.SelectedIndex = -1;
            ListBox1.Items.Clear();
            ButtonCheck.Enabled = true;
            ButtonClear.Enabled = false;

        }
        protected void fillDataGrid2()
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {//insert store procedure when ever values are inserted here they get sent straight to the database
                /*SqlDataAdapter da = new SqlDataAdapter("spgetItems", con);*/ //queryName
                
                SqlCommand sqlcmd = new SqlCommand("spRegisterBookings", con);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                sqlcmd.Parameters.AddWithValue("@BookingNum ", (hiddenfieldzID.Value == "" ? 0 : Convert.ToInt32(hiddenfieldzID.Value))); /*set hidden fields for the id'z*/
                sqlcmd.Parameters.AddWithValue("@PersonID", (hiddenfieldPersonID.Value == "" ? 0 : int.Parse(hiddenfieldPersonID.Value)));//
                sqlcmd.Parameters.AddWithValue("@CountrybookingNumb", (hiddenfieldUserBookinNum.Value == "" ? 0 : int.Parse(hiddenfieldPersonID.Value)));//
                sqlcmd.Parameters.AddWithValue("@userBooking", (hiddenfieldUserBookinNum.Value == "" ? 0 : int.Parse(hiddenfieldPersonID.Value)));//
                sqlcmd.Parameters.AddWithValue("@AccountIDD", (hiddenfieldACCID.Value == "" ? 0 : int.Parse(hiddenfieldPersonID.Value)));//
                sqlcmd.Parameters.AddWithValue("@firstNamez", TXTFirstName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@LastNamez", TXTLastName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@TravelD", TXTDate.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@CreditCRD", cardEntry = float.Parse(TXTCardNumber.Text.Trim())); /*TXTCardNumber.Text.Trim()*/
                sqlcmd.Parameters.AddWithValue("@RecieptBooking", (int.Parse(randomNumber.ToString())));//fix here int.Parse(AccountType.ToString()));
                //sqlcmd.Parameters.AddWithValue("@Photo", FullUpload);
                sqlcmd.ExecuteNonQuery();
                if (hiddenfieldzID.Value == "")
                    Response.Write("Saved Successfully");
                else
                    Response.Write("Unsuccessfull");

                //da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //sqlcmd.ExecuteNonQuery();
                //DataTable dtbl = new DataTable();
                //da.Fill(dtbl);
                //GridView1.DataSource = dtbl;
                //GridView1.DataBind();
            }
        }
        private void myDataBinding()
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {
                SqlCommand cmd = new SqlCommand("Select CountryN, Price, CountryID  from Country", con);
                con.Open();
                DropDownList2.DataTextField = "CountryN";
                DropDownList2.DataValueField = "Price";
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataBind();
            }
                
        }
    }
}
