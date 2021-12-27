using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_review_list : System.Web.UI.Page
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
        if (Request.QueryString["review_id"] != null)
        {
            string qdel = "delete from review where review_id=" + Request.QueryString["review_id"];
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();
        }
        string q = "select r.*,p.product_name,u.user_name from Review r,Product p,user_register u where p.product_id=r.product_id and r.user_id=u.user_id";
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