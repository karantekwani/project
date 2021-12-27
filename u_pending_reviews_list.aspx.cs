using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class u_pending_reviews_list : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("user_login.aspx");
        }

        if (!IsPostBack)
        {
            string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            con = new SqlConnection(cs);
            con.Open();

            string user_id = Session["user_id"].ToString();
            //string user_id = "1";
            string q = "select pr.*,p.*,b.* from pending_review pr,product p,bid b where pr.bid_id=b.bid_id and b.product_id = p.product_id and b.user_id = '" + user_id + "' order by b.bid_id desc";
            cmd = new SqlCommand(q, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            gv.DataSource = dt;
            gv.DataBind();
        }
    }
}