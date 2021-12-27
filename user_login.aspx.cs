using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class user_login : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if (!IsPostBack)
        {
            string qcategory = "select * from Category";
            cmd = new SqlCommand(qcategory, con);

            SqlDataAdapter adpcategory = new SqlDataAdapter(cmd);
            DataSet dscategory = new DataSet();
            adpcategory.Fill(dscategory);

            DataTable dtcat = new DataTable();
            dtcat = dscategory.Tables[0];

            rptcat.DataSource = dtcat;
            rptcat.DataBind();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        /*
         * 1. Bind user detail using entrerd email address
         * 2. If record not found then redirect to login page with proper message
         * 2. Now check if user is active or not (in your case we have column pass)
         * 3. Now check password if its matched then allow login other wise redirec to login page
         */

        string vtxtEmail = txtEmail.Text;
        string vtxtPwd = txtPwd.Text;

        string q="select * from user_register where user_email_id='"+vtxtEmail+"'";// and user_pwd = '"+vtxtPwd +"' ";
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        
        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            if ((bool)dt.Rows[0]["IsActive"])
            {
                //Fetch password salt value from database and store in variable
                var passwordHashFromDB = dt.Rows[0]["pwdhash"].ToString();
                var passwordSalt = dt.Rows[0]["pwdsalt"].ToString();

                byte[] bytes = Encoding.UTF8.GetBytes(txtPwd.Text + passwordSalt);
                SHA256Managed sHA256ManagedString = new SHA256Managed();
                byte[] hash = sHA256ManagedString.ComputeHash(bytes);
                string passwordHash = Convert.ToBase64String(hash);

                if (passwordHash == passwordHashFromDB)
                {
                    Session["user_id"] = dt.Rows[0]["user_id"].ToString();
                    Session["user_name"] = dt.Rows[0]["user_name"].ToString();
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblmsg.Text = "Email or Password must be incorrect.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblmsg.Text = "User is not active ";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }            
        }
        else
        {
            lblmsg.Text = "Email address not found";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}