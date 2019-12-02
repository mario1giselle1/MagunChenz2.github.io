using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security; //needed for the web config login credentials

namespace WEBCourseWork2Airlinesite
{
    public partial class LoginPage : System.Web.UI.Page
    {
        int tries = 3;
        SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-GO6F4NVG;Initial Catalog=MaGunChenzAirline;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (con.State == ConnectionState.Open)
            //{
            //    con.Close();
            //}
            //con.Open();
            if (!IsPostBack) { 
                if (Session["EmpName"] != null)
                {
                    Response.Redirect("~/servicesDisplay.aspx");
                }
             }
        }
        string FNAME = "";
        protected void ButtonLogin(object sender, EventArgs e)
        {
            if (txtUsername.Text == "MarioMM" && txtPassword.Text == "admin1" || txtUsername.Text == "Chennell" && txtPassword.Text == "Chennell" || txtUsername.Text == "Noel" && txtPassword.Text == "Noel")
            {
                Session["AdminName"] = FNAME;
                Response.Redirect("~/AdministrationPage.aspx");
            }
            else
            {
                AuthenticateUser(txtUsername.Text, txtPassword.Text);
            }
        }

        protected void buttonclearBoxes(object sender, EventArgs e)
        {
            txtUsername.Text = txtPassword.Text = "";
        }
        protected void IncreamentCounter()
        {
            int counter;
            if (ViewState["Count"] != null)
            {
                counter = Convert.ToInt32(ViewState["Count"]);
            }
            else
            {
                counter = 0;
            }
            counter = counter + 1;
            ViewState["Count"] = counter;
            //this.lbltriesleft.Text = counter.ToString();
            this.lbltriesleft.Text = (tries - counter).ToString();



            if ((tries - counter) == -1)
            {
                //txttriesleft.Text = (tries - counter).ToString();
                //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CloseWindow", "returnToParent();", true);
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mykey", "CloseWindow();", true);
                // this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
                // Response.Write("<script>parent.close_window();</script>");

                Response.Write("<script language='javascript'>closeWindow1();</script>");
                // Response.Redirect("Default.aspx");
            }
        }
        private void AuthenticateUser(String username, string password)
        {
            //if (con.State == ConnectionState.Closed)
            //{
            //    con.Open();

            //    SqlCommand cmd = con.CreateCommand();
            //    cmd.CommandText = "Select Email2, Password2  from LoginTable" +
            //    "where Email2= '" + txtUsername.Text + "' and Password2 = '" + txtPassword.Text + "'"; //here
            //    con.Open();
            //    cmd.ExecuteNonQuery();
            //    DataTable dt = new DataTable();
            //    SqlDataAdapter dalogin = new SqlDataAdapter(cmd);
            //    dalogin.Fill(dt);

            //    int found = int.Parse(dt.Rows.Count.ToString());
            //    if (found > 0)
            //    {
            //        Response.Redirect("servicesDisplay.aspx");
            //    }
            //    con.Close();
            //}

            String dbConString = ConfigurationManager.ConnectionStrings["dbConstringAirLine"].ConnectionString; //can use arrays index or actual name of connection string
            String Employee;
            using (SqlConnection con = new SqlConnection(dbConString))
            {
                //Select ACCOUNTID, Email2, Password2  from LoginTable where Email2 = 'mariomatthias1@gmail.com' and Password2 = 'Admin'
                SqlCommand cmd = new SqlCommand("spAuthenticateUserz", con);
                cmd.CommandType = CommandType.StoredProcedure;
                String encryptPass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                SqlParameter getEmail = new SqlParameter("@UserEmail", username);
                SqlParameter getPass = new SqlParameter("@UserPassword", password);
                //SqlParameter getPass = new SqlParameter("@UserPassword", encryptPass);
                cmd.Parameters.Add(getEmail);
                cmd.Parameters.Add(getPass);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    int RetryAttempts = Convert.ToInt32(rdr["RetryAttempts"]);

                    if (Convert.ToBoolean(rdr["AccountLocked"]))
                    {

                        lblerror.Style.Add("display", "block");
                        lbltriesleft.Text = "Account locked. Please contact administrator";
                    }
                    else if (RetryAttempts > 0)
                    {
                        int AttemptsLeft = (4 - RetryAttempts);
                        lbltriesleft.Text = "Invalid username and/or password. " +
                            AttemptsLeft.ToString() + " attempt(s) left";

                        RetryAttempts++;
                    }
                    else if (Convert.ToBoolean(rdr["Authenticated"]))// i will take this out
                    {
                        Employee = rdr["LastName"].ToString() + ", " + rdr["FirstName"].ToString();
                        Session["EmpName"] = Employee;
                        FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, chkRememberMe.Checked);
                        lbltriesleft.Text = "User Confirmed ";
                        Response.Redirect("~/servicesDisplay.aspx");
                    }
                }

            }

        }
    }
}