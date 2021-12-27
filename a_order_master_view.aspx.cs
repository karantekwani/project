using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class order_list : System.Web.UI.Page
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

        //**************** delete coding
        if (Request.QueryString["order_id"] != null)
        {
            string qdel = "delete from order_master where order_id=" + Request.QueryString["order_id"];
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();
        }
        //********************

        if(!IsPostBack)
        {
            string q = "select p.*,b.*,u.*,o.* from product p ,bid b,user_register u, Order_Master o where p.product_id=b.product_id and b.user_id=u.user_id and b.bid_id=o.bid_id order by order_id desc";
            cmd = new SqlCommand(q, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            rpt.DataSource = dt;
            rpt.DataBind();
        }

        if (Request.QueryString["bid_id"] != null)
        {
            string vbid = Request.QueryString["bid_id"].ToString();
            string order_date = DateTime.Today.ToShortDateString();
            string ins = "insert into Order_master (order_date,bid_id) values('" + order_date + "','" + vbid + "')";
            cmd = new SqlCommand(ins, con);
            cmd.ExecuteNonQuery();

            string update = "update Bid set bid_status<>'confirmed' where bid_id='" + vbid + "'";
            cmd = new SqlCommand(update, con);
            cmd.ExecuteNonQuery();
        }
    }
}