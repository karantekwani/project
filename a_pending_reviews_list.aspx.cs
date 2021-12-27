using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class pending_review_list : System.Web.UI.Page
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
            string q = "select pr.*,p.*,b.*,u.*,o.* from pending_review pr,product p ,bid b,user_register u, Order_Master o where pr.bid_id=b.bid_id and p.product_id=b.product_id and b.user_id=u.user_id and b.bid_id=o.bid_id order by order_id desc";
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
}