using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class user_edit_name : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            string qcategory = "select * from Category";
            cmd = new SqlCommand(qcategory, con);

            SqlDataAdapter adpcategory = new SqlDataAdapter(cmd);
            DataSet dscategory = new DataSet();
            adpcategory.Fill(dscategory);

            DataTable dtcat = new DataTable();
            dtcat = dscategory.Tables[0];

            rptcat.DataSource = dtcat;
            rptcat.DataBind();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string vtxte_name = txte_name.Text;

        String qupd = "update user_register set user_name='" + vtxte_name + "' where user_id='" + Session["user_id"] + "'";
        cmd = new SqlCommand(qupd, con);
        cmd.ExecuteNonQuery();
        
        Session["user_name"] = vtxte_name;
        
        lblmsg.Text = "Username successfully updated";
        lblmsg.ForeColor = System.Drawing.Color.Green;
    }
}