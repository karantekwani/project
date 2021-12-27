<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uproduct_details.aspx.cs" Inherits="uproduct_details" %>

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


	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

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
	<!-- HEADER -->
	 <header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome 
                          <% 
                            if(Session["user_name"] == null){ %>
                        Guest!
                            <%}else{ 
                                Response.Write(Session["user_name"].ToString());
                            }
                          %>
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
						<a class="logo" href="#">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /Logo -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
							</div>
							<ul class="custom-menu">
								<li><a href="logout.aspx"><i class="fa fa-sign-out"></i> Logout </a></li>
								<li><a href="user_change_password.aspx"><i class="fa fa-key"></i> Change Password</a></li>
                                <li><a href="user_edit_name.aspx"><i class="fa fa-edit"></i> Edit Name </a></li>
                            </ul>
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"></a>
							<a href="mybid.aspx">	
                                <div class="header-btns-icon">
								<!--<i class="fa fa-shopping-cart"></i>-->
                                    <img src="img/mybid.png"/>
								</div>
                                <strong class="text-uppercase">My Bid</strong>
                    		</a>
						</li>
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
					    <li><a href="u_feedback.aspx">Feedback</a> </li>
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
				<li><a href="uproducts.aspx">Products</a></li>
				<li><asp:Label ID="lblproduct_name1" runat="server"></asp:Label></li>
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
                <!--  Product Details -->
				<div class="product product-details clearfix">

					<div class="col-md-6">
						<div id="product-main-view">
							<div class="product-view">
								<asp:Image ID="photo"  style="width:400px;height:400px" runat="server" alt=""/>
							</div>
						</div>
                    
                        <div class="col-md-12">
						    <div class="product-tab">
							    <ul class="tab-nav">
							        <li class="active"><a data-toggle="tab" href="#tab2">Reviews (<asp:Label ID="lblreviews" runat="server" />)</a></li>
								    <li><a data-toggle="tab" href="#tab1">Description</a></li>
                                </ul>
							    <div class="tab-content">
								    <div id="tab1" class="tab-pane fade in">
                                        <p><asp:Label ID="lbldescription1" runat="server"></asp:Label> </p>	
                                    </div>		     					
                        	    
								<div id="tab2" class="tab-pane fade in active">
                                    <div class="row">
								         <div class="col-md-9">
										    <div class="product-reviews">
											    <div class="single-review">
                                                    <asp:Repeater ID="reviews" runat="server">
                                                        <ItemTemplate>
                                                            <div class="review-heading">
                                                                <div><i class="fa fa-user-o"></i> <%#Eval("user_name") %></div>
														        <div><i class="fa fa-calendar-check-o"></i> <%#Eval("review_date")%></div>
													        </div>
													        <div class="review-body">
                                                                <h5><%#Eval("review_msg") %> </h5><br/>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
											    </div>
											</div>
										 </div>
                                    </div>
								</div>
							    </div>
						    </div>
					    </div>
                    </div>	
                    
                    <div class="col-md-6">
					    <div class="product-body">
                            <h2 class="product-name"><asp:Label ID="lblproduct_name" runat="server"></asp:Label></h2>
							<h3 class="product-price">₹<asp:Label ID="lblmin_price" runat="server"></asp:Label></h3>
					    </div>
							
                        <p><asp:Label ID="lbldescription" runat="server"></asp:Label> </p>
						   <form id="f1" runat="server">
						   <div class="product-btns">
								
                                <div class="qty-input">
									<span class="text-uppercase"><b> Bid:</b></span>
									<asp:TextBox class="input" required pattern=^[1-9]\d{2,9} title="only numeric values & first number should not be zero" runat="server" ID="bid"/> 
								</div>
                                <br />
                                <br />

                                <div class="qty-input">
									<span class="text-uppercase"><b> Bidding Off Date: </b></span>
									<asp:Label class="input"  runat="server"  ID="lblbod" />
								</div>
                                <br />
                                <br />

                                <div class="qty-input">
									<span class="text-uppercase"><b> Advance Payable: </b></span>
									<asp:Label class="input"  runat="server"  ID="lbladvance" />
								</div>
                                <br />
                                <br />

                                <div class="qty-input">
									<span class="text-uppercase"><b> ENTER UPI ID : </b></span>
									<asp:TextBox ID="txtupi" required title="Please Enter UPI ID" runat="server" />
								</div>
                                <br />
                                <br />

                                <label>Customer&nbsp;Agreement</label><br />
                                <div>
                                     • Please,Read the <a href="terms_nd_condition.aspx" style="color:darkslateblue;"><u><b>Terms & Condition</b></u></a> before APPLY BID on product
                                </div>
                                <br />

                                <div>
                                    <asp:CheckBox runat="server" ID="AcceptTerms" ClientIDMode="Static"/><b> I accept all terms & conditions </b>
                                </div> 
								<br />

                                <div class="qty-input">
      								<asp:Button ID="btnapplybid" runat="server" Text="Apply Bid" class="primary-btn add-to-cart" OnClick="btn_Click"/><br /><br />
                                    <asp:Label  CssClass="text-danger" Font-Size="Medium" runat="server" ID="lblmsg" />    
                                </div>
						   </div>
                           </form>
                    </div>
				</div>
                <!-- /Product Details -->
            </div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
    <!--section-->

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
                             <li class="header-account dropdown default-dropdown">
							 <ul class="list-links">
								<li><a href="logout.aspx">LOGOUT</a></li>
								<li><a href="user_change_password.aspx">Change Password</a></li>
                                 <li><a href="user_edit_name.aspx">Edit Name</a></li>
                             </ul>
                            </li>
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

</body>
</html>
