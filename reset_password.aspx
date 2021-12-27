﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="reset_password" %>

<!DOCTYPE html>

<head runat="server">
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
	<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome Guest!</span>
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
							<img src="img/logo.png">
						</div>
					</div>
                    <!-- /Logo -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						
                        <!-- Account -->
						<li class="header-account dropdown default-dropdown">
                            <a href="user_login.aspx">
                                <div class="header-btns-icon">
									  <i class="fa fa-sign-in"></i>
                                </div>
                                      <strong class="text-uppercase">LOGIN</strong>
							</a>
					    </li>
					    <!-- /Account -->

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
				<div class="category-nav show-on-click">
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
                    </ul>
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

   <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">  
			<!-- row -->
			<div class="row">
				<form id="checkout_form" runat="server" class="clearfix">
					<div class="col-md-8">
						<div class="billing-details">
							
                            <div class="section-title">
								<h3 class="title">Reset Password</h3>
							</div>
							
   							<div class="form-group"> 
                                <label>NEW&nbsp;PASSWORD</label>           							
                                <asp:TextBox ID="txtnewpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required"  runat="server" CssClass="form-control" placeholder="Enter New Password" />
                            </div>

                            <div class="form-group">
                                <label>CONFIRM&nbsp;PASSWORD</label>
                                <asp:TextBox ID="txtcnfrmpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required"  runat="server" CssClass="form-control" placeholder="Confirm Password" />
                            </div>

	                        <div class="form-group">
						         <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" OnClick="btnsubmit_Click" Text=" Submit"  /><br /><br />
                                 <asp:Label ID="lblmsg" runat="server" /><br /><br />
                                 <a href="user_login.aspx" ><b><u>GOTO LOGIN PAGE>></u></b></a>
                            </div>

                        </div>
					</div>
			    </form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
    </div>
    <!--/section -->
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
                                 <li><a href="user_login.aspx">LOGIN</a></li>
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
