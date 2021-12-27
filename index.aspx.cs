using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
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

            string qproduct = "SELECT * FROM (SELECT top(6)* FROM product ORDER BY product_id DESC)var ORDER BY newId()";
            cmd = new SqlCommand(qproduct, con);

            SqlDataAdapter adpproduct = new SqlDataAdapter(cmd);
            DataSet dsproduct = new DataSet();
            adpproduct.Fill(dsproduct);

            DataTable dtproduct = new DataTable();
            dtproduct = dsproduct.Tables[0];
            
            product.DataSource = dtproduct;
            product.DataBind();

            rptcat.DataSource = dtcat;
            rptcat.DataBind();
            
            string qproducts = "select top (8)* from product order by newId()";
            cmd = new SqlCommand(qproducts, con);

            SqlDataAdapter adpproducts = new SqlDataAdapter(cmd);
            DataSet dsproducts = new DataSet();
            adpproducts.Fill(dsproducts);

            DataTable dtproducts = new DataTable();
            dtproducts = dsproducts.Tables[0];

            products.DataSource = dtproducts;
            products.DataBind();

            rptcat.DataSource = dtcat;
            rptcat.DataBind();
        }
    }
}
