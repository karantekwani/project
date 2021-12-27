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

public partial class forgot_password : System.Web.UI.Page
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

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string vtxtEmail = txtEmail.Text;
        string q = "select pwdhash,user_name,user_email_id,user_id from user_register where user_email_id='" + vtxtEmail + "'";
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];

        if (dt.Rows.Count > 0)
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress("ddshah747@gmail.com"); //Enter sender email address
            email.To.Add(vtxtEmail); //Destination Recipient e-mail address.
            email.Subject = "Your Forget Password:";//Subject for your request
            email.Body = "Hello " + dt.Rows[0]["user_name"].ToString() + "<br />The Link for the change password is mentioned below:<br/><a href=\"http://localhost:65372/reset_password.aspx?user_id="+ dt.Rows[0]["user_id"] +"\">Update Password</a>";
            email.IsBodyHtml = true;
            SmtpClient smtpc = new SmtpClient("smtp.gmail.com");
            smtpc.Port = 587;
            smtpc.UseDefaultCredentials = false;
            smtpc.EnableSsl = true;

            smtpc.Credentials = new NetworkCredential("ddshah747@gmail.com", "DdShah#@12");
            smtpc.Send(email);
            lblmsg.Text = "Reset password link has been sent to your email address";
            lblmsg.ForeColor = System.Drawing.Color.Green;
        }
        
        else
        {
            lblmsg.Text = "Email address not found...";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
