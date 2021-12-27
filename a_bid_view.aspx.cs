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
        if (Session["ad_id"] == null)
        {
            Response.Redirect("a_login.aspx");
        }

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

            string q = "select p.*,b.*,u.*,p.min_price/2 as advance from product p ,bid b,user_register u where p.product_id=b.product_id and b.user_id=u.user_id and b.product_id = '" + product_id + "' and b.bid_status='pending' order by bid_price desc";
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