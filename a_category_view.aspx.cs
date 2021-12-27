using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_category_view : System.Web.UI.Page
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
        if (Request.QueryString["cat_id"] != null)
        {
            string qdel = "delete from Category where cat_id=" + Request.QueryString["cat_id"];
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();
        }
        //********************
        
        string q = "select * from category";
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