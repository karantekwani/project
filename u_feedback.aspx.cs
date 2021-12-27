using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class a_feedback : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string vtxtE_id = txtE_id.Text;
        string vtxtname = txtname.Text;
        string vtxtdate = txtdate.Text;
        string vtxtmsg = txtmsg.Text;

        string q = "insert into Feedback(f_date,f_name,message,f_email_id) values('" +
           vtxtdate + "','" +
           vtxtname + "','" +
           vtxtmsg + "','" +
           vtxtE_id +
           "')";

        cmd = new SqlCommand(q, con);
        cmd.ExecuteNonQuery();
        lblmsg.Text = "feedback added Successfully";
        lblmsg.ForeColor = System.Drawing.Color.Green;
    }
}