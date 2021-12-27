using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;

public partial class user_change_password : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if(Session["user_id"] == null)
        {
            Response.Redirect("user_login.aspx");
        }
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string v_new_password=txtnewpwd.Text;
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buff = new byte[16];
        rng.GetBytes(buff);
        string salt = Convert.ToBase64String(buff);
 
        byte[] bytes = Encoding.UTF8.GetBytes(txtnewpwd.Text + salt);
        SHA256Managed sHA256ManagedString = new SHA256Managed();
        byte[] hash = sHA256ManagedString.ComputeHash(bytes);
        string passwordHash = Convert.ToBase64String(hash);
        
        string v_confirm_password = txtcnfrmpwd.Text;

        string v_old_password = txtoldpwd.Text;

        string q = "select pwdhash,pwdsalt from user_register where user_id='" + Session["user_id"].ToString() + "'";// and user_pwd = '"+vtxtPwd +"' ";
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        
        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            //Fetch password salt value from database and store in variable
            var passwordHashFromDB = dt.Rows[0]["pwdhash"].ToString();
            var passwordSalt = dt.Rows[0]["pwdsalt"].ToString();

            byte[] bytess = Encoding.UTF8.GetBytes(txtoldpwd.Text + passwordSalt);
            SHA256Managed sHA256ManagedStrings = new SHA256Managed();
            byte[] hash1 = sHA256ManagedStrings.ComputeHash(bytess);
            string passwordHashs = Convert.ToBase64String(hash1);

            if (passwordHashs == passwordHashFromDB)
            {
                if (v_new_password == v_confirm_password)
                {
                    string qupd = "update user_register set pwdhash='" + passwordHash + "' , pwdsalt='" + salt + "' where user_id='" + Session["user_id"].ToString() + "' and pwdhash='" + passwordHashs + "'";
                    cmd = new SqlCommand(qupd, con);
                    cmd.ExecuteNonQuery();
                    {
                        lblmsg.Text = "Password changed successfully";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                    }
                }
                else
                {
                    lblmsg.Text = "New and confirm password do not match";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblmsg.Text = "please enter valid old password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}

   