<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mybid.aspx.cs" Inherits="mybid" %>

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
                            if (Session["user_name"] == null)
                            { %>
                        Guest!
                            <%}
                            else
                            {
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
                        <div class="logo">
                            <img src="./img/logo.png" alt="">
                        </div>
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
                                <li><a href="logout.aspx"><i class="fa fa-sign-out"></i>Logout </a></li>
                                <li><a href="user_change_password.aspx"><i class="fa fa-key"></i>Change Password</a></li>
                                <li><a href="user_edit_name.aspx"><i class="fa fa-edit"></i>Edit Name </a></li>
                            </ul>
                        </li>
                        <!-- /Account -->

                        <!-- Cart -->
                        <li class="header-cart dropdown default-dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"></a>
                            <a href="mybid.aspx">
                                <div class="header-btns-icon">
                                    <!--<i class="fa fa-shopping-cart"></i>-->
                                    <img src="img/mybid.png" />
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
                <li><a href="mybid.aspx">My Bid</a></li>
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
                    <div class="col-md-12">
                        <form runat="server">

                            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" CssClass="table" BorderWidth="2">

                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>PRODUCT NAME</center></HeaderTemplate>
                                        <ItemTemplate><center><%#Eval("product_name") %></center></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>Photo</center></HeaderTemplate>
                                        <ItemTemplate><center><img src='<%#Eval("photo") %>' style="width:200px;height:200px" /></center></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>PRICE</center></HeaderTemplate>
                                        <ItemTemplate><center><%#Eval("min_price") %></center></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>BID PRICE</center></HeaderTemplate>
                                        <ItemTemplate><center><%#Eval("bid_price") %></center></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>BID STATUS</center></HeaderTemplate>
                                        <ItemTemplate><center><%#Eval("bid_status") %></center></ItemTemplate>
                                    </asp:TemplateField>
                                
                                </Columns>

                            </asp:GridView>
                        </form>
                    </div>
                </div>
                <!-- /Product Details -->
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
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved |  by Dhairya Shah & Parth Shah
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
