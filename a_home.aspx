<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_home.aspx.cs" Inherits="a_user_master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
    <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
            <form id="checkout_form" runat="server" class="clearfix">
			<div class="row">
					<div class="col-md-12">
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Home</h3>
							</div>
                        </div>
					</div>
            </div>

            <style>
                        .mybox1{

                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px
                        }
                        .mybox2{
                            background-color:orange;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                        .mybox3{
                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                        .mybox4{
                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                        .mybox5{
                            background-color:orange;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                        .mybox6{
                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                        .mybox1:hover,.mybox2:hover,.mybox5:hover,.mybox3:hover,.mybox4:hover,.mybox6:hover {
                            background-color: teal;
                            transform:scale(1.1,1.1);
                        }
            </style>
            <div class="row">
        
                <a href="a_category_view.aspx">
                <div class="col-lg-3 mybox1">
                    <h3>Total Categories:</h3>
                    <asp:Label ID="lblcategory" runat="server"   />
                </div>
                </a>
                
                <a href="a_product_view.aspx">
                <div class="col-lg-3 mybox2">
                    <h3>Total Products:</h3>
                    <asp:Label ID="lblproduct" runat="server"   />
                </div>

                <a href="a_product_bid.aspx">
                <div class="col-lg-3 mybox3">
                    <h3>Total Pending Bids:</h3>
                    <asp:Label ID="lblbid" runat="server" />
                </div>
                </a>

            </div>
            <div class ="row">

                <a href="a_feedback_view.aspx">
                <div class="col-lg-3 mybox4">
                    <h3>Total Feedbacks:</h3>
                    <asp:Label ID="lblfeedback" runat="server" />
                </div>
                </a>
        
                <a href="a_review_list.aspx">
                <div class="col-lg-3  mybox5">
                    <h3>Total Reviews:</h3>
                    <asp:Label ID="lblreview" runat="server" />
                </div>
                </a>

                <a href="a_order_master_view.aspx">
                <div class="col-lg-3 mybox6">
                    <h3>Total orders:</h3>
                    <asp:Label ID="lblorder" runat="server" />
                </div>
                </a>

            </div>
            </form>
			<!-- /row -->
		</div>
		<!-- /container -->
    </div>
    <!--section-->
</asp:Content>




