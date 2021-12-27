using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class uwinners : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if (Session["user_id"] == null)
        {
            Response.Redirect("user_login.aspx");
        }

        if (!IsPostBack)
        {
                string q = "select p.*,b.*,u.*,o.* from product p ,bid b,user_register u, Order_Master o where p.product_id=b.product_id and b.user_id=u.user_id  and b.bid_id=o.bid_id order by order_id desc";
            
                cmd = new SqlCommand(q, con);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                DataTable dt = new DataTable();
                dt = ds.Tables[0];

                rpt.DataSource = dt;
                rpt.DataBind();
        }
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string q = "select p.*,b.*,u.*,o.* from product p ,bid b,user_register u, Order_Master o where p.product_id=b.product_id and b.user_id=u.user_id  and b.bid_id=o.bid_id order by order_id  desc";
        if (txtsearch.Text.Trim() != "")
        {
            string vsearch = txtsearch.Text;
            q = "select p.*,o.*,b.*,u.* from product p,order_master o,bid b,user_register u where p.product_id=b.product_id and o.bid_id=b.bid_id and b.user_id=u.user_id and (user_name like '%" + vsearch + "%' or product_name like'%" + vsearch + "%') order by order_id desc";
        }
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        rpt.DataSource = dt;
        rpt.DataBind();
    }
}