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

public partial class user_register : System.Web.UI.Page
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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string vtxtpwd = txtpwd.Text;

        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buff = new byte[16];
        rng.GetBytes(buff);
        string salt = Convert.ToBase64String(buff);

        byte[] bytes = Encoding.UTF8.GetBytes(txtpwd.Text + salt);
        SHA256Managed sHA256ManagedString = new SHA256Managed();
        byte[] hash = sHA256ManagedString.ComputeHash(bytes);
        string passwordHash = Convert.ToBase64String(hash);

        string vtxtcnfrm_pwd = txtcnfrm_pwd.Text;
        string vtxtname = txtname.Text;
        string vtxtaddress = txtaddress.Text;
        string vcity = txtcity.Text;
        string vtxtEmail = txtEmail.Text;
        string vtxtphn_no = txtphn_no.Text;
        string vtxtD_O_B = txtD_O_B.Text;
        string vgender = "male";
        if (radiobtnfemale.Checked)
            vgender = "female";

        string q1 = "select * from user_register where user_email_id='" + vtxtEmail + "'";
        cmd = new SqlCommand(q1, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            lblmsg.Text = "Email ID is already taken...";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }

        else
        {
            string q = "insert into user_register(user_name,address,city,User_Email_id,phone_no,date_of_birth,gender,IsActive, pwdhash, pwdsalt) values('" +
            vtxtname + "','" +
            vtxtaddress + "','" +
            vcity + "','" +
            vtxtEmail + "','" +
            vtxtphn_no + "','" +
            vtxtD_O_B + "','" +
            vgender + "','" +
            "True" + "','" +
            passwordHash + "','" +
            salt +
            "')";

            if (vtxtpwd == vtxtcnfrm_pwd)
            {
                cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                Response.Redirect("user_login.aspx");
            }
            else
            {
                lblmsg.Text = "Password don't match with confirm password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}