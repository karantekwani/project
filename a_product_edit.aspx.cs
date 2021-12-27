using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class a_product_edit : System.Web.UI.Page
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

        //************* bind dropdown
        if (!IsPostBack)
        {
            string qcat = "select * from category";
            cmd = new SqlCommand(qcat, con);
            SqlDataAdapter adpcat = new SqlDataAdapter(cmd);
            DataSet dscat = new DataSet();
            adpcat.Fill(dscat);
            DataTable dtcat = new DataTable();
            dtcat = dscat.Tables[0];
            txtcat_name.DataSource = dtcat;
            txtcat_name.DataValueField = "cat_id";
            txtcat_name.DataTextField = "cat_name";
            txtcat_name.DataBind();

            string q = "select * from Product where product_id=" + Request.QueryString["product_id"];
            cmd = new SqlCommand(q, con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            txtp_name.Text = dt.Rows[0]["product_name"].ToString();
            txtmin_price.Text = dt.Rows[0]["min_price"].ToString();
            txtdescription.Text = dt.Rows[0]["description"].ToString();
            txtcat_name.Text = dt.Rows[0]["cat_id"].ToString();
            Image1.ImageUrl = dt.Rows[0]["photo"].ToString();
            DateTime bidOffDateFromAdminUser = DateTime.Parse(dt.Rows[0]["bidding_off_Date"].ToString(), System.Globalization.CultureInfo.CreateSpecificCulture("en-AU").DateTimeFormat);
            txtbodate.Text = bidOffDateFromAdminUser.ToString("yyyy-MM-dd");
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string vtxtp_name = txtp_name.Text;
        string vtxtmin_price = txtmin_price.Text;
        string vtxtdescription = txtdescription.Text;
        string vtxtcat_name = txtcat_name.SelectedValue;
        DateTime bidOffDateFromAdminUser = DateTime.Parse(txtbodate.Text, System.Globalization.CultureInfo.CreateSpecificCulture("en-AU").DateTimeFormat);

        if (photo.HasFile)
        {
            string vtxtphoto = "photo/" + photo.FileName;
            photo.SaveAs(MapPath(vtxtphoto));
            string qupdphoto = "update Product set photo='" + vtxtphoto + "' where product_id=" + Request.QueryString["product_id"];
            cmd = new SqlCommand(qupdphoto, con);
            cmd.ExecuteNonQuery();
        }

        if (bidOffDateFromAdminUser >= DateTime.Now.Date)
        {
            String qupd = "update Product set product_name='" + vtxtp_name + "', min_price='" + vtxtmin_price + "',description='" + vtxtdescription + "',cat_id='" + vtxtcat_name + "',bidding_off_date='" + txtbodate.Text + "' where product_id=" + Request.QueryString["product_id"];
            cmd = new SqlCommand(qupd, con);
            cmd.ExecuteNonQuery();

            lblmsg.Text = "Product updated succeessfully";
            lblmsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblmsg.Text = "Please check bidding off date";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}