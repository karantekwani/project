using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class user_change_password : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if(Session["ad_id"] == null)
        {
            Response.Redirect("a_login.aspx");
        }
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string v_new_password=txtnewpwd.Text;
        string v_old_password = txtoldpwd.Text;
        string v_confirm_password = txtcnfrmpwd.Text;

        if (v_new_password == v_confirm_password)
        {
            string qupd = "update Admin set ad_pwd='" + v_new_password + "' where ad_id=" + Session["ad_id"].ToString() + " and ad_pwd='" + v_old_password + "'";
            cmd = new SqlCommand(qupd, con);
            cmd.ExecuteNonQuery();
            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                lblmsg.Text = "Your password has been changed successfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblmsg.Text = "Invalid Old Password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblmsg.Text = "New and Confirm password do not match";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}