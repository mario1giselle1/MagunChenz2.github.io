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
using System.Net;
using System.IO;

namespace WEBCourseWork2Airlinesite
{
    public partial class AdministrationPage : System.Web.UI.Page
    {
        string dbconstring = ConfigurationManager.ConnectionStrings["dbConstringAirLine"].ConnectionString;//my global constring variable
        protected void Page_Load(object sender, EventArgs e)
        {
            FillgridView();
            if(!IsPostBack)
            {
                btnDelete.Enabled = false;
                btnClear.Enabled = false;
                FillgridView();
                btnClear.Enabled = true;
            }
            if (Session["AdminName"] == null)
            {

                Response.Redirect("~/HomePage.aspx");
            }
        }

        //protected void ToggleBTNS2(object sender, EventArgs e)
        //{

        //}
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {//insert store procedure when ever values are inserted here they get sent straight to the database
               /* SqlDataAdapter da = new SqlDataAdapter("spgetItems", con);*/ //queryName
                SqlCommand sqlcmd = new SqlCommand("spCreateUpdateUser", con);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                sqlcmd.Parameters.AddWithValue("@USERID", (hiddenfieldzID.Value == ""?0:Convert.ToInt32(hiddenfieldzID.Value))); /*set hidden fields for the id'z*/
                sqlcmd.Parameters.AddWithValue("@FIRSTNAME",TextBoxForFname.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@LASTNAME", TextBoxForLname.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@GENDER", TextBoxForGender.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@DOB", TextBoxForDOB.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@TELE", int.Parse(TextBoxForTele.Text.Trim()));
                sqlcmd.Parameters.AddWithValue("@EMAIL", TextBoxForEmail.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@PASSWORD", TextBoxForPassCode.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@TYPEOFACCOUNT", TextBoxForAccountType.Text.Trim()); /*TXTCardNumber.Text.Trim()*/
                sqlcmd.Parameters.AddWithValue("@CREDITCARDNUMBER", TextBoxForCardNumber.Text.Trim());//
                sqlcmd.Parameters.AddWithValue("@RECIEPTNUMBERUSERACCOUNT", TextBoxForReceipt.Text.Trim());
                //sqlcmd.Parameters.AddWithValue("@Photo", FullUpload);
                sqlcmd.ExecuteNonQuery();
                Clear();
                string successMessage = hiddenfieldzID.Value; 
                if ( successMessage == "")
                    LabelForSuccessMessage.Text = "Saved Successfully";
                else
                    LabelfroErrorMessage.Text = "Update Successfull";

                //da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //sqlcmd.ExecuteNonQuery();
                //DataTable dtbl = new DataTable();
                //da.Fill(dtbl);
                //GridView1.DataSource = dtbl;
                //GridView1.DataBind();
                FillgridView();
            }
        }
        protected void LinkB_OnClick(Object sender, EventArgs e)
        {
            int UserId = int.Parse((sender as LinkButton).CommandArgument);
            using (SqlConnection con = new SqlConnection(dbconstring))
            {
                //these commands is to connect the table in the adminstration pae with the sql one and display it on screen
                con.Open();
                SqlDataAdapter sqlData = new SqlDataAdapter("UserAccountViewByID", con);
                sqlData.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlData.SelectCommand.Parameters.AddWithValue("@UserIDZ", UserId);
                DataTable dtbl = new DataTable();
                sqlData.Fill(dtbl);//start back here
                hiddenfieldzID.Value = UserId.ToString();
                TextBoxForFname.Text = dtbl.Rows[0]["FirstName"].ToString();
                TextBoxForLname.Text = dtbl.Rows[0]["LastName"].ToString();
                TextBoxForGender.Text = dtbl.Rows[0]["Gender"].ToString();
                TextBoxForDOB.Text = dtbl.Rows[0]["DOB"].ToString();
                TextBoxForTele.Text = dtbl.Rows[0]["Tele"].ToString();
                TextBoxForEmail.Text = dtbl.Rows[0]["Email"].ToString();
                TextBoxForPassCode.Text = dtbl.Rows[0]["Password"].ToString();
                TextBoxForAccountType.Text = dtbl.Rows[0]["TypeOfAccount"].ToString();
                TextBoxForCardNumber.Text = dtbl.Rows[0]["CreditcardNumber"].ToString();
                TextBoxForReceipt.Text = dtbl.Rows[0]["RecieptNumberUserAccount"].ToString();
                btnUpdate.Text = "Update";
                btnDelete.Enabled = true;
                btnClear.Enabled = true;
            }
        }

        void FillgridView()
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {
                //these commands is to connect the table in the adminstration page with the sql one and display it on screen
                con.Open();
                SqlDataAdapter sqlData = new SqlDataAdapter("UserAccountViewAll",con);
                sqlData.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlData.Fill(dtbl);
                GVUser.DataSource = dtbl;
                GVUser.DataBind();
            }
        }
        public void Clear()
        {
            hiddenfieldzID.Value = "";
            TextBoxForFname.Text = TextBoxForLname.Text = TextBoxForGender.Text = TextBoxForDOB.Text = TextBoxForTele.Text = TextBoxForEmail.Text = TextBoxForPassCode.Text = TextBoxForAccountType.Text = TextBoxForCardNumber.Text = TextBoxForReceipt.Text = "";
            btnClear.Enabled = false;
        }

        protected void BtnDelete(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(dbconstring))
            {
                SqlCommand sqlcmd = new SqlCommand("UserAccountDeleById", con);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                sqlcmd.Parameters.AddWithValue("@UserIDZ",int.Parse(hiddenfieldzID.Value));
                sqlcmd.ExecuteNonQuery();
                Clear();
                FillgridView();
                LabelForSuccessMessage.Text = "Delete Successfull";


            }
        }

        protected void configCode_Click(object sender, EventArgs e)
        {
            string AdminCode="";
            if (AdminTExtBox.Text == "Mario" || AdminTExtBox.Text == "Noel" || AdminTExtBox.Text == "Chennell")
            {
                AdminCodeService.WebService1SoapClient client = new AdminCodeService.WebService1SoapClient();
                AdminTExtBox.Text = client.GrabCode();
            }
            else
            {
                AdminTExtBox.Text = "Error try again";
            }

        }

        protected void Button1Get_Click(object sender, EventArgs e)
        {
            //the get api method what happends here is when this button is clicked the 
            string structTest = String.Format("http://jsonplaceholder.typicode.com/posts/1/comments");
            WebRequest requestObject = WebRequest.Create(structTest);
            requestObject.Method = "GET";
            HttpWebResponse responseObject = null;
            responseObject = (HttpWebResponse)requestObject.GetResponse();
            string setResult = null;
            using (Stream stream = responseObject.GetResponseStream())
            {
                StreamReader sr = new StreamReader(stream);
                setResult = sr.ReadToEnd();
                sr.Close();
            }
            //post method

            
        }

        protected void ButtonPost_Click(object sender, EventArgs e)
        {
            string strUrl = String.Format("https://jsonplaceholder.typicode.com/posts");
            WebRequest RequestObjPost = WebRequest.Create(strUrl);
            RequestObjPost.Method = "POST";
            RequestObjPost.ContentType = "application/json";
            string PostData = "{\"title\":\"testdata\",\"body\":\"testbody\",\"userid\":\"50\"}";
            using (var STREAMwritter = new StreamWriter(RequestObjPost.GetRequestStream()))
            {
                STREAMwritter.Write(PostData);
                STREAMwritter.Flush();
                STREAMwritter.Close();

                var httpResponse = (HttpWebResponse)RequestObjPost.GetResponse();
                using (var STREAMReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var Result2 = STREAMReader.ReadToEnd();
                }
            }
        }
        //public void GridInserAmount()
        //{
        //    using (SqlConnection con = new SqlConnection(dbconstring))
        //    {
        //        SqlCommand cmd = new SqlCommand("select * from ", con);//remeber to use this count for admin section in project----------------------
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        GVUser.DataSource = rdr;
        //        GVUser.DataBind();
        //        con.Close();
        //        con.Open();
        //        cmd = new SqlCommand("select count(ParishName) from Parish", con);

        //        lblParishTotal.Text = cmd.ExecuteScalar().ToString();
        //    }

        //} to be used 
    }
}