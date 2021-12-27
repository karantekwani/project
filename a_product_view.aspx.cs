using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_product_view : System.Web.UI.Page
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
            //**************** delete coding
            if (Request.QueryString["product_id"] != null)
            {
                string qdel = "delete from product where product_id=" + Request.QueryString["product_id"];
                cmd = new SqlCommand(qdel, con);
                cmd.ExecuteNonQuery();
            }
            //********************

            //********************* display data
            string q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id order by product_id desc";
            cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            
            rpt.DataSource = dt;
            rpt.DataBind();
            //**********************************
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id ";

        if (txtsearch.Text.Trim() != "")
        {
            string vsearch = txtsearch.Text;
            q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id and ( product_name like '%" + vsearch + "%' or cat_name like '%" + vsearch + "%')";
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