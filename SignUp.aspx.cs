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


namespace WEBCourseWork2Airlinesite
{
    public partial class SignUp : System.Web.UI.Page
    {
        string dbconstring = ConfigurationManager.ConnectionStrings["dbConstringAirLine"].ConnectionString;//my global constring variable
        StringBuilder fullDetails = new StringBuilder(); int AccountType = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpSignPageBtn(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {//insert store procedure when ever values are inserted here they get sent straight to the database
             /* SqlDataAdapter da = new SqlDataAdapter("spgetItems", con);*/ //queryName
                CheckSlection();
                SqlCommand sqlcmd = new SqlCommand("spCreateUpdateUser", con);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                sqlcmd.Parameters.AddWithValue("@USERID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value))); /*set hidden fields for the id'z*/
                sqlcmd.Parameters.AddWithValue("@FIRSTNAME", TextBoxforSignFName.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@LASTNAME", TextBoxforSignLName.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@GENDER", fullDetails.ToString());//
                sqlcmd.Parameters.AddWithValue("@DOB", TextBoxforSignDOB.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@TELE", int.Parse(TextBoxforSignTele.Text.Trim()));
                sqlcmd.Parameters.AddWithValue("@EMAIL", TextBoxforSignEmail.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@PASSWORD", TextBoxforSignPword.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@TYPEOFACCOUNT", int.Parse(AccountType.ToString())); /*TXTCardNumber.Text.Trim()*/
                sqlcmd.Parameters.AddWithValue("@CREDITCARDNUMBER", int.Parse(TextBoxforSignCcard.Text.Trim()));//
                sqlcmd.Parameters.AddWithValue("@RECIEPTNUMBERUSERACCOUNT", (HiddenField2.Value == "" ? 0 : Convert.ToInt32(HiddenField2.Value)));
                //sqlcmd.Parameters.AddWithValue("@Photo", FullUpload);
                sqlcmd.ExecuteNonQuery();
                Clear2();
                string successMessage = HiddenField1.Value;
                if (successMessage == "")
                    Response.Write("<script>alert('Account Created select ok and Login')</script>");
                //else
                //    LabelfroErrorMessage.Text = "Update Successfull";

                //da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //sqlcmd.ExecuteNonQuery();
                //DataTable dtbl = new DataTable();
                //da.Fill(dtbl);
                //GridView1.DataSource = dtbl;
                //GridView1.DataBind();
                //FillgridView();
            }
        }

        protected void LoginSignUpPageBtn(object sender, EventArgs e)
        {
            Session["EmpName"] = null;
            Response.Redirect("LoginPage.aspx");
        }

        protected void ClearBtn(object sender, EventArgs e)
        {
            //          HiddenField1.Value = HiddenField2.Value = "";
            //TextBoxforSignConfirPWord.Text = TextBoxforSignEmail.Text = TextBoxforSignPword.Text = "";

            //TextBoxforSignDOB.Text = TextBoxforSignFName.Text = TextBoxforSignLName.Text = "";
            //  TextBoxforSignTele.Text = TextBoxforSignCcard.Text= "";
            //          CheckboxMale111.Checked = false;
            //          CheckboxFemale111.Checked = false;
            Clear2();
            DropDownListAccountType111.SelectedValue = "-1";
    
        }
        public void CheckSlection()
        {
            if (DropDownListAccountType111.SelectedValue == "-1")
            {
                Response.Write("<script>alert('No Account Type was selected')</script>");
            }
            else
            {
               AccountType = Convert.ToInt32(DropDownListAccountType111.SelectedValue);
            }

            if ((CheckboxMale111.Checked == false) && (CheckboxFemale111.Checked == false))
            {
                Response.Write("<script>alert('No Accessories Selected')</script>");
            }
            else
            {
                if (CheckboxMale111.Checked)
                {
                    fullDetails.Append(" ," + CheckboxMale111.Text);
                }

                if (CheckboxFemale111.Checked)
                {
                    fullDetails.Append(" ," + CheckboxFemale111.Text);
                }
                // Response.Write("Selected Accessories is: " + details.ToString());
            }
        }
        public void Clear2()
        {
            TextBoxforSignConfirPWord.Text = TextBoxforSignEmail.Text = TextBoxforSignPword.Text = "";

            TextBoxforSignDOB.Text = TextBoxforSignFName.Text = TextBoxforSignFName.Text = "";

            TextBoxforSignLName.Text = TextBoxforSignTele.Text = TextBoxforSignCcard.Text = "";
            CheckboxMale111.Checked = false;
            CheckboxFemale111.Checked = false;

            DropDownListAccountType111.SelectedValue = "-1";
        }
    }
}