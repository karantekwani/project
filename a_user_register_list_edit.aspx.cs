using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_user_register_list_edit : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if (Session["ad_id"] == null)
        {
            Response.Redirect("a_login.aspx");
        }

        if (!IsPostBack)
        {
            string q = "select * from user_register where user_id=" + Request.QueryString["user_id"];
            cmd = new SqlCommand(q, con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            txtuser_name.Text = dt.Rows[0]["user_name"].ToString();
            txtuser_address.Text = dt.Rows[0]["address"].ToString();
            txtuser_city.Text = dt.Rows[0]["city"].ToString();
            txtuser_phn_no.Text = dt.Rows[0]["phone_no"].ToString();
            txtuser_email.Text = dt.Rows[0]["user_email_id"].ToString();
            if (dt.Rows[0]["IsActive"].ToString().ToLower() == "true")
            {
                txtuser_pass.Checked = true;
            }
            else
            {
                txtuser_pass.Checked = false;
            }
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string vtxtuser_name = txtuser_name.Text;
        string vtxtuser_address = txtuser_address.Text;
        string vtxtuser_city = txtuser_city.Text;
        string vtxtuser_phn_no = txtuser_phn_no.Text;
        string vtxtuser_email = txtuser_email.Text;
        bool isActive = txtuser_pass.Checked;
        String qupd = "update user_register set user_name='" + vtxtuser_name + "', address='" + vtxtuser_address + "',city='" + vtxtuser_city + "',phone_no='" + vtxtuser_phn_no + "',user_email_id='" + vtxtuser_email + "',IsActive='" + isActive + "' where user_id=" + Request.QueryString["user_id"];
        cmd = new SqlCommand(qupd, con);
        cmd.ExecuteNonQuery();

        lblmsg.Text = "User Information Updated succeessfully";
        lblmsg.ForeColor = System.Drawing.Color.Green;
    }
}