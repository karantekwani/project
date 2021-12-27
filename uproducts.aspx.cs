using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class uproducts : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                string qcategory = "select * from Category";
                cmd = new SqlCommand(qcategory, con);

                SqlDataAdapter adpcategory = new SqlDataAdapter(cmd);
                DataSet dscategory = new DataSet();
                adpcategory.Fill(dscategory);

                DataTable dtcategory = new DataTable();
                dtcategory = dscategory.Tables[0];

                rptcat.DataSource = dtcategory;
                rptcat.DataBind();
            }

            string q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id order by product_id desc";

            if (Request.QueryString["cat_id"] != null)
            {
                q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id and p.cat_id=" + Request.QueryString["cat_id"];
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

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string q = "select p.*,c.cat_name from Product p,category c where p.cat_id=c.cat_id ";

        if (cpmain_txtsearch.Text.Trim() != "")
        {
            string vsearch = cpmain_txtsearch.Text;
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