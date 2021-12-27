using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_user_master : System.Web.UI.Page
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
            string product_id = Request.QueryString["product_id"];
            lblproduct.Text = totalcount("select * from product");
            lblcategory.Text = totalcount("select * from category");
            lblbid.Text = totalcount("select * from Bid where bid_status='pending'"); 
            lblorder.Text = totalcount("select * from order_master");
            lblfeedback.Text = totalcount("select * from feedback");
            lblreview.Text = totalcount("select * from review");
        }
    }

    public string totalcount(string q)
    {
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        return dt.Rows.Count.ToString();
    }
}