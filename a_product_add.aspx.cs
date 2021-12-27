using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class a_product_add : System.Web.UI.Page
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
            string qr = "select * from category";
            cmd = new SqlCommand(qr, con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            txtcat_name.DataSource = dt;
            txtcat_name.DataValueField = "cat_id";
            txtcat_name.DataTextField = "cat_name";
            txtcat_name.DataBind();
        //*************
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string vp_name = txtp_name.Text;
        string vmin_price = txtmin_price.Text;
        string vdescription = txtdescription.Text;
        string vtxtcat_name = txtcat_name.SelectedValue;
        //DateTime bidOffDateFromAdminUser = DateTime.Parse(txtbodate.Text);
        DateTime bidOffDateFromAdminUser = DateTime.Parse(txtbodate.Text, System.Globalization.CultureInfo.CreateSpecificCulture("en-AU").DateTimeFormat);
        string vupload_date = DateTime.Now.ToShortDateString();
        
        if (bidOffDateFromAdminUser >= DateTime.Now.Date)
        {
            if (txtphoto.HasFile)
            {
                if (txtphoto.FileBytes.Length < 2097152)
                {
                    string vtxtphoto = "photo/" + txtphoto.FileName;
                    txtphoto.SaveAs(MapPath(vtxtphoto));
                    Image1.ImageUrl = vtxtphoto;

                    String q = "insert into Product (product_name,min_price,description,upload_date,cat_id,photo,bidding_off_date) values('" +
                    vp_name + "','" +
                    vmin_price + "','" +
                    vdescription + "','" +
                    vupload_date + "','" +
                    vtxtcat_name + "','" +
                    vtxtphoto + "','" +
                    txtbodate.Text + 
                                 "')";

                    cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    lblmsg.Text = "Product added successfully";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblmsg.Text = "Uploaded photo size is not less than 2mb...";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblmsg.Text = "Select image file";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblmsg.Text = "Please check bidding off date";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}