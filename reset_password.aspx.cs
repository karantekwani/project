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

public partial class reset_password : System.Web.UI.Page
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string v_user_id = Request.QueryString["user_id"].ToString();

        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buff = new byte[16];
        rng.GetBytes(buff);
        string salt = Convert.ToBase64String(buff);

        byte[] bytes = Encoding.UTF8.GetBytes(txtnewpwd.Text + salt);
        SHA256Managed sHA256ManagedString = new SHA256Managed();
        byte[] hash = sHA256ManagedString.ComputeHash(bytes);
        string passwordHash = Convert.ToBase64String(hash);

        string v_new_password = txtnewpwd.Text;
        string v_confirm_password = txtcnfrmpwd.Text;

        if (v_new_password == v_confirm_password)
        {
            string qupd = "update user_register set pwdhash='" + passwordHash + "' , pwdsalt='" + salt + "' where user_id = '" + v_user_id + "'";
            cmd = new SqlCommand(qupd, con);
            cmd.ExecuteNonQuery();
            
            Response.Redirect("user_login.aspx");
        }
        else
        {
            lblmsg.Text = "New and confirm password do not match";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}