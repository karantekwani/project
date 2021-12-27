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

public partial class a_bid_code : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd;

        if (Session["ad_id"] == null)
        {
            Response.Redirect("a_login.aspx");
        }

        string cs = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        con = new SqlConnection(cs);
        con.Open();

            string vbid = Request.QueryString["bid_id"].ToString();
            string order_date = DateTime.Now.ToShortDateString();
            string ins = "insert into Order_master (order_date,bid_id) values('" + order_date + "','" + vbid + "')";
            cmd = new SqlCommand(ins, con);
            cmd.ExecuteNonQuery();

            string update = "update Bid set bid_status='confirmed' where bid_id='" + vbid + "'";
            cmd = new SqlCommand(update, con);
            cmd.ExecuteNonQuery();

            string qbid = "select * from bid where bid_id=" + vbid;
            SqlCommand cmd2 = new SqlCommand(qbid, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            string ins1 = "insert into Pending_Review (bid_id) values('" + vbid + "')";
            cmd = new SqlCommand(ins1, con);
            cmd.ExecuteNonQuery();

            string product_id = dt.Rows[0]["product_id"].ToString();
            string qdel = "delete from bid where bid_status<>'confirmed' and product_id=" + product_id;
            cmd = new SqlCommand(qdel, con);
            cmd.ExecuteNonQuery();

            string vuser_id = Request.QueryString["user_id"].ToString();
            string qwinner = "select user_email_id,user_name from user_register where user_id=" + vuser_id;
            SqlCommand cmd3 = new SqlCommand(qwinner, con);

            SqlDataAdapter adp2 = new SqlDataAdapter(cmd3);
            DataSet ds2 = new DataSet();
            adp2.Fill(ds2);

            DataTable dt2 = new DataTable();
            dt2 = ds2.Tables[0];

            string vproduct_id = Request.QueryString["product_id"].ToString();
            string qproduct = "select product_name from product where product_id=" + vproduct_id;
            SqlCommand cmd4 = new SqlCommand(qproduct, con);

            SqlDataAdapter adp3 = new SqlDataAdapter(cmd4);
            DataSet ds3 = new DataSet();
            adp3.Fill(ds3);

            DataTable dt3 = new DataTable();
            dt3 = ds3.Tables[0];
            
            if (dt2.Rows.Count > 0 && dt3.Rows.Count > 0)
            {
                string vtxtEmail = dt2.Rows[0]["user_email_id"].ToString();
                MailMessage email = new MailMessage();
                email.From = new MailAddress("ddshah747@gmail.com"); //Enter sender email address
                email.To.Add(vtxtEmail); //Destination Recipient e-mail address.
                email.Subject = "Bid Confirmation:";//Subject for your request
                email.Body = "Hi " + dt2.Rows[0]["user_name"].ToString() + "<br/>your bid on " + dt3.Rows[0]["product_name"].ToString() + " is confirmed<br/>...<br/>The Link for check your bidding information is mentioned below:<br/><a href=\"http://localhost:65372/mybid.aspx\">View Confirm bid here</a>";
                email.IsBodyHtml = true;
                SmtpClient smtpc = new SmtpClient("smtp.gmail.com");
                smtpc.Port = 587;
                smtpc.UseDefaultCredentials = false;
                smtpc.EnableSsl = true;

                smtpc.Credentials = new NetworkCredential("ddshah747@gmail.com", "DdShah#@12");
                smtpc.Send(email);
                Response.Redirect("a_order_master_view.aspx");
            }
    }
}