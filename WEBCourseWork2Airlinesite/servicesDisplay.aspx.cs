using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;//web api

namespace WEBCourseWork2Airlinesite
{
    public partial class servicesDisplay : System.Web.UI.Page
    {
        public string[] countryName = new string[8];
        public  double[] Countryprice = new double[8];
        public int buttonNumber = 0;
        public string Message;
        public void CNAMEVAULE()// the purpose of this method is to store the country name and value
        {
            if(buttonNumber == 1)
            {
                countryName[0] = "Jamaica";
                Countryprice[0] = 8000;
                //Message = "Please reselect country and refresh";
                //Label3.Text = Message;
                //Label1.Text = countryName[0].ToString();
                //Label2.Text = Countryprice[0].ToString();
            }
            if (buttonNumber == 2)
            {
                countryName[0] = "Bahamas";
                Countryprice[0] = 8000;
            }
            if (buttonNumber == 3)
            {
                countryName[0] = "Trinadad and Tobago";
                Countryprice[0] = 8000;
            }
            if (buttonNumber == 4)
            {
                countryName[0] = "America";
                Countryprice[0] = 10000;
            }
            if (buttonNumber == 5)
            {
                countryName[0] = "Canada";
                Countryprice[0] = 11000;
            }
            if (buttonNumber == 6)
            {
                countryName[0] = "England";
                Countryprice[0] = 12000;
            }
            if (buttonNumber == 7)
            {
                countryName[0] = "China";
                Countryprice[0] = 16000;
            }
            if (buttonNumber == 8)
            {
                countryName[0] = "Japan";
                Countryprice[0] = 15000;
            }
            if (buttonNumber == 9)
            {
                countryName[0] = "Nigeria";
                Countryprice[0] = 15000;
            }

            Message = "Please reselect country and refresh";
            Label3.Text = Message;
            Label1.Text = countryName[0].ToString();
            Label2.Text = Countryprice[0].ToString();
            Session["CName"] = Label1.Text;
            Session["CPrice"] = Label2.Text;
            Session["Message"]= Label3.Text;
            Response.Redirect("~/BookingPage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpName"] != null) // these code will check if the sessions are null and run the wepage despite
            {
                ServiceHidden.Value = Session["EmpName"].ToString();
            }
            //Session["EmpName"] = Employee;
        }

        protected void ButtonJamaica_Click(object sender, EventArgs e)
        {
            buttonNumber = 1;
            CNAMEVAULE(); //what aver value are assigned to the textboxes will go to the function

        }

        protected void ButtonBahamas_Click(object sender, EventArgs e)
        {
            buttonNumber = 2;
            CNAMEVAULE();
        }

        protected void ButtonTrinadad_Click(object sender, EventArgs e)
        {
            buttonNumber = 3;
            CNAMEVAULE();
        }

        protected void ButtonAmerica_Click(object sender, EventArgs e)
        {
            buttonNumber = 4;
            CNAMEVAULE();
        }

        protected void ButtonCanada_Click(object sender, EventArgs e)
        {
            buttonNumber = 5;
            CNAMEVAULE();
        }

        protected void ButtonEngland_Click(object sender, EventArgs e)
        {
            buttonNumber = 6;
            CNAMEVAULE();
        }

        protected void ButtonChina_Click(object sender, EventArgs e)
        {
            buttonNumber = 7;
            CNAMEVAULE();
        }

        protected void ButtonJapan_Click(object sender, EventArgs e)
        {
            buttonNumber = 8;
            CNAMEVAULE();
        }

        protected void ButtonNigeria_Click(object sender, EventArgs e)
        {
            buttonNumber = 9;
            CNAMEVAULE();
        }
    }
}