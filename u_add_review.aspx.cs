using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class u_add_review : System.Web.UI.Page
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
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string vproduct_id = Request.QueryString["product_id"].ToString();
        string vdate = DateTime.Today.ToShortDateString();
        string vreviewmsg = lblreviewmsg.Text; 
        string vuser_id = Session["user_id"].ToString();
        string q = "insert into Review(review_date,review_msg,product_id,user_id) values ('" 
        + vdate + "','" + 
        vreviewmsg + "','" + 
        vproduct_id + "','" + 
        vuser_id + 
                    "')";
        cmd = new SqlCommand(q, con);
        cmd.ExecuteNonQuery();

        string qdel = "delete from pending_review where pending_review_id=" + Request.QueryString["pending_review_id"];
        cmd = new SqlCommand(qdel, con);
        cmd.ExecuteNonQuery();

        Response.Redirect("u_pending_reviews_list.aspx");
    }
 }