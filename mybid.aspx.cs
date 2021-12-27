using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class mybid : System.Web.UI.Page
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

            string qcategory = "select * from Category";
            cmd = new SqlCommand(qcategory, con);

            SqlDataAdapter adpcategory = new SqlDataAdapter(cmd);
            DataSet dscategory = new DataSet();
            adpcategory.Fill(dscategory);

            DataTable dtcategory = new DataTable();
            dtcategory = dscategory.Tables[0];

            rptcat.DataSource = dtcategory;
            rptcat.DataBind();

            string user_id = Session["user_id"].ToString();
            //string user_id = "1";
            string q = "select p.*,b.* from product p, Bid b where b.product_id=p.product_id and b.user_id='" + user_id +"' order by bid_id desc";
            cmd = new SqlCommand(q, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            gv.DataSource = dt;
            gv.DataBind();

            string qdel = "delete from bid where bid_status<>'confirm' and product_id='" + "' and user_id =" + user_id;
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();
        }
    }
}