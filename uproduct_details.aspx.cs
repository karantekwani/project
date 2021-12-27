using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class uproduct_details : System.Web.UI.Page
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

                string qreviews = "select r.*,u.* from review r,user_register u where u.user_id=r.user_id and r.product_id="+ Request.QueryString["product_id"];
                cmd = new SqlCommand(qreviews, con);

                SqlDataAdapter adpreviews = new SqlDataAdapter(cmd);
                DataSet dsreviews = new DataSet();
                adpreviews.Fill(dsreviews);

                DataTable dtreviews = new DataTable();
                dtreviews = dsreviews.Tables[0];

                reviews.DataSource = dtreviews;
                reviews.DataBind();

                rptcat.DataSource = dtcategory;
                rptcat.DataBind();
                lblreviews.Text = totalcount("select r.*,u.* from review r,user_register u where u.user_id=r.user_id and r.product_id="+ Request.QueryString["product_id"]);

            }
            string pid = Request.QueryString["product_id"];
            string q = "select p.*,r.*,u.*,c.cat_name from Product p,category c,Review r,user_register u where p.cat_id=c.cat_id and p.product_id =" + pid;

            cmd = new SqlCommand(q, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            lblproduct_name1.Text = dt.Rows[0]["product_name"].ToString();
            lblproduct_name.Text = dt.Rows[0]["product_name"].ToString();
            lblmin_price.Text = dt.Rows[0]["min_price"].ToString();
            lbldescription.Text = dt.Rows[0]["description"].ToString().Replace("\n", "<br>• ");
            lbldescription1.Text = dt.Rows[0]["description"].ToString().Replace("\n", "<br>• ");
            photo.ImageUrl = dt.Rows[0]["photo"].ToString();
            DateTime date = Convert.ToDateTime(dt.Rows[0]["bidding_off_date"].ToString());
            string vbiddingoffdate = date.ToString("dd/MM/yyyy");
            lblbod.Text = vbiddingoffdate;
            lbladvance.Text = (int.Parse(dt.Rows[0]["min_price"].ToString()) / 2).ToString();
        }
    }
    public string totalcount(string q)
    {
        cmd = new SqlCommand(q, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        return dt.Rows.Count.ToString();
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string vproduct_id = Request.QueryString["product_id"].ToString();
        string vbid = bid.Text;
        string vstatus="pending";
        string vtxtupi=txtupi.ToString();
        string vdate=DateTime.Today.ToShortDateString();
        if (AcceptTerms.Checked == true)
        {
           if (double.Parse(bid.Text) >= double.Parse(lblmin_price.Text))
           {
               string vuser_id = Session["user_id"].ToString();
               string q = "insert into Bid(bid_date,bid_price,bid_status,product_id,user_id) values ('" + vdate + "','" + vbid + "','" + vstatus + "','" + vproduct_id + "','" + vuser_id + "')";
               cmd = new SqlCommand(q, con);
               cmd.ExecuteNonQuery();
               Response.Redirect("mybid.aspx");
           }
           else
           {
               lblmsg.Text = "Bid price should be greaterthan Minimum price of product...";
               lblmsg.ForeColor = System.Drawing.Color.Red;
           }
        }
        else
        {
            lblmsg.Text = "Accept all terms & conditions to bid";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
