using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_user_master_list : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

        //**************** delete coding
        if (Request.QueryString["user_id"] != null)
        {
            string qdel = "delete from user_register where user_id=" + Request.QueryString["user_id"];
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();
        }
        //********************

        string q = "select user_name,user_email_id,phone_no,city,address,user_id from user_register";
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        rpt.DataSource = dt;
        rpt.DataBind();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string q = "select user_id,user_name,user_email_id,city,address,phone_no,user_id from user_register"; 
        if (txtsearch.Text.Trim() != "")
        {
            string vsearch = txtsearch.Text;
            q = "select user_id,user_name,user_email_id,city,address,phone_no from user_register where (user_email_id like '%" + vsearch + "%' or user_name like '%" + vsearch + "%')";
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