using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string vtxtEmail = txtEmail.Text;
        string vtxtpwd = txtpwd.Text;

        string q = "select * from Admin where ad_email_id='" + vtxtEmail + "' and ad_pwd = '" + vtxtpwd + "'";
        cmd = new SqlCommand(q, con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            Session["ad_id"] = dt.Rows[0]["ad_id"].ToString();
            Session["ad_name"] = dt.Rows[0]["ad_name"].ToString();
            Response.Redirect("a_home.aspx");
        }
        else
        {
            lblmsg.Text = "Invalid email or password";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}