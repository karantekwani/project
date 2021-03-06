<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uproducts.aspx.cs" Inherits="uproducts" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>BIDDING ZONE</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>

    <form runat="server" class="clearfix">
        <!-- HEADER -->
        <header>
            <!-- top Header -->
            <div id="top-header">
                <div class="container">
                    <div class="pull-left">
                        <span>Welcome
                             <% 
                            if (Session["user_name"] == null){ %>
                        Guest!
                            <%}
                            else
                            {
                                Response.Write(Session["user_name"].ToString());
                            }%>
                        </span>
                    </div>

                    <div class="pull-right">
                        <ul class="header-top-links">
                            <li><a href="a_login.aspx">ADMIN PANEL</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /top Header -->

            <!-- header -->
            <div id="header">
                <div class="container">
                    <div class="pull-left">
                        <!-- Logo -->
                        <div class="header-logo">
                            <div class="logo">
                                <img src="./img/logo.png" alt="">
                            </div>
                        </div>
                        <!-- /Logo -->
                    </div>                        
                <div class="pull-right">
                    <ul class="header-btns">
						<!-- Account -->
						    <%
                                 if(Session["user_id"] != null ){
                                        %>
                        <li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase"> MY ACCOUNT <i class="fa fa-caret-down"></i></strong>
							</div>
							<ul class="custom-menu">
								<li><a href="logout.aspx"><i class="fa fa-sign-out"></i> Logout </a></li>
								<li><a href="user_change_password.aspx"><i class="fa fa-key"></i> Change Password</a></li>
                                <li><a href="user_edit_name.aspx"><i class="fa fa-edit"></i> Edit Name </a></li>
                            </ul>
                    </li>
							        <%}else{ %>
                       <li class="header-account dropdown default-dropdown">
                            <a href="user_login.aspx">
                                <div class="header-btns-icon">
									  <i class="fa fa-sign-in"></i>
                                </div>
                                      <strong class="text-uppercase">Login</strong>
							</a>
					   </li>
							        <%} %>
                            
						<!-- /Account -->

						<!-- Cart -->
                            <%
                                if(Session["user_id"] != null ){
                                        %>
							<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"></a>
							<a href="mybid.aspx">	
                            <div class="header-btns-icon">
						    <!--<i class="fa fa-shopping-cart"></i>-->
                            <img src="img/mybid.png"/>
							</div>
                                <strong class="text-uppercase">My Bid</strong>
                            </a>
                            <%} %>
                           
						<!-- /Cart -->

                        <!-- Mobile nav toggle-->
                            <li class="nav-toggle">
                                <button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
                            </li>
                        <!-- / Mobile nav toggle -->
                        </ul>
                    </div>
                </div>
                <!-- header -->
            </div>
            <!-- container -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <div id="navigation">
            <!-- container -->
            <div class="container">
                <div id="responsive-nav">
                    <!-- category nav -->
                    <div class="category-nav show-on-click ">
                        <span class="category-header">Categories <i class="fa fa-list"></i></span>
                        <ul class="category-list">
                            <asp:Repeater ID="rptcat" runat="server">
                                <ItemTemplate>
                                    <li><a href="uproducts.aspx?cat_id=<%#Eval("cat_id") %>"><%#Eval("cat_name") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- /category nav -->
  
                    <!-- menu nav -->
                    <div class="menu-nav">
                        <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                        <ul class="menu-list">
                            <li><a href="index.aspx">Home</a></li>
                            <li><a href="uproducts.aspx">Products</a></li>
                            <li><a href="u_feedback.aspx">Feedback</a></li>
                            <% 
                                if(Session["user_id"] == null){ %>
                                <%}else{%> 
                                    <li><a href="u_pending_reviews_list.aspx">Reviews</a></li>
                                    <li><a href="uwinners.aspx">Winners</a></li>
                                <% }%> 
                        </ul>
                    </div>
                    <!-- menu nav -->
                </div>
            </div>
            <!-- /container -->
        </div>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.aspx">Home</a></li>
                    <li class="active">Products</li>
                </ul>
            </div>
        </div>
        <!-- /BREADCRUMB -->
        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="section-title">
                    <h3 class="title">products
                                    <asp:TextBox ID="cpmain_txtsearch" runat="server"/>
                                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="btnsearch_Click" />
                    </h3>
                    </div>

                    <!-- MAIN -->
                    <div id="main" class="col-md-12">
                        <!-- STORE -->
                        <div id="store">
                            <!-- row -->
                            <div class="row">

                                <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                        <!-- Product Single -->
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <div class="product product-single">
                                                
                                                <div class="product-thumb">
                                                    <img src="<%#Eval("photo") %>" style="width:250px;height:360px"> 
                                                </div>   
                                                
                                                <div class="product-body">
                                                    <h2 class="product-price">₹<%#Eval("min_price") %> </h2>
                                                    <h3 class="product-name"><%#Eval("product_name") %></h3></center>
                                                    <center>
                                                       <div class="product-btns">
                                                           <%# Convert.ToDateTime(Eval("bidding_off_date", "{0:d}")) > DateTime.Now ? string.Format("<a class='primary-btn add-to-cart' style='margin-left: 00px; width: 70px' href='uproduct_details.aspx?product_id={0}'> BID </a>", Eval("product_id")) : string.Format("<a class='primary-btn add-to-cart' style='margin-left: 00px; width: 140px'>Unavailable</a>")%>                                                                                                                  
                                                       </div>
                                                    </center> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Product Single -->
                                    </ItemTemplate>
                                </asp:Repeater>

                             </div>
                            <!-- /row -->
                        </div>
                        <!-- /STORE -->
                    </div>
                    <!-- /MAIN -->
                 </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /section -->

    <!-- FOOTER -->
	<footer id="footer" class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<!-- footer logo -->
						<div class="footer-logo">
							<div class="logo">
		                        <img src="./img/logo.png" alt="">
		                    </div>
						</div>
						<!-- /footer logo -->
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">My Account</h3>
						<ul class="list-links">
                            <!-- Account -->
						    <%
                                 if(Session["user_id"] != null ){
                                        %>
                             <li class="header-account dropdown default-dropdown">
							    <ul class="list-links">
								    <li><a href="logout.aspx">LOGOUT</a></li>
								    <li><a href="user_change_password.aspx">Change Password</a></li>
                                    <li><a href="user_edit_name.aspx">Edit Name</a></li>
                                </ul>
                             </li>
							        <%}else{ %>
                             <ul class="list-links">
                                 <li><a href="user_login.aspx">LOGIN</a></li>
                             </ul>
							        <%} %>
                           <!-- /Account -->
						</ul>
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Customer Service</h3>
						<ul class="list-links">
							<li><a href="about_us.aspx">About Us</a></li>
                            <li><a href="contact_us.aspx">Contact Us</a></li>
						</ul>
					</div>
				</div>
                <!-- /footer widget -->

				<!-- footer subscribe -->
				<div class="col-md-3 col-sm-6 col-xs-6">

					<div class="footer">
                        <ul class="list-links">
						<h3 class="footer-header">How To Play</h3>
						<li><a href="terms_nd_condition.aspx">Terms & condition</a></li>
                            <% 
                                if(Session["user_id"] == null){ %>
                                <%}else{%> 
                                    <li><a href="uwinners.aspx">Winners</a></li>
                                <% }%> 
                        </ul>
					</div>
				</div> 
				<!-- /footer subscribe -->
			</div>
			<!-- /row -->
			<hr>
			<!-- row -->
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<!-- footer copyright -->
					<div class="footer-copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |  by Dhairya Shah & Parth Shah
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<!-- /footer copyright -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
</form>
</body>
</html>