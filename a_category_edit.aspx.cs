using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_category_edit : System.Web.UI.Page
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
            string q = "select * from Category where cat_id=" + Request.QueryString["cat_id"];
            cmd = new SqlCommand(q, con);
            SqlDataAdapter adp=new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string vtxtcat_name = txtcat_name.Text;

        string q1 = "select * from Category where cat_name='" + vtxtcat_name + "'";
        cmd = new SqlCommand(q1, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            lblmsg.Text = "category name is already exist";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            String qupd = "update Category set cat_name='" + vtxtcat_name + "' where cat_id= " + Request.QueryString["cat_id"];
            cmd = new SqlCommand(qupd, con);
            cmd.ExecuteNonQuery();
            lblmsg.Text = "Category updated successfully";
            lblmsg.ForeColor = System.Drawing.Color.Green;
        }
    }
}
