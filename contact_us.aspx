<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
    <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
						<div class="billing-details">
							 <div class="section-title">
								<h3 class="title">Contact Us</h3>
                             </div>
                        </div>
					
                                                                           
                    <style>
                        
                        .mybox2{
                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                        }
                        .mybox3{
                            background-color:orange;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;

                        }
                        .mybox4{
                            background-color:lightblue;
                            font-size:18pt;
                            color:black;
                            height:150px;
                            margin:10px;
                            padding:10px;
                        }
                         .mybox2:hover, .mybox5:hover, .mybox3:hover, .mybox4:hover, .mybox6:hover {
                                    background-color: teal;
                                    transform: scale(1.1,1.1);
                                }                               

                 </style>
                 
                    <div class="row">
							<center>
                            <h3>
                                <h2 style="color:red"><center>Contact</center></h2>
                                <h4><center>Kindly reach out to us, we will be glad to be of help</center></h4>
                            </h3>
                            </center>

                        <div class="col-lg-3 mybox2">
                            <h3>Contact Number: 910641608</h3>
                        </div>

                        <div class="col-lg-3 mybox3">
                            <h3>Drop your mail at : ddshah747@gmail.com</h3>
                        </div>

                        <div class="col-lg-3 mybox4">
                            <h3>office hours :Mon-Sat 10am - 6pm</h3>
                        </div>

                    </div>
        
            <!-- /row -->
		</div>
		<!-- /container -->
    </div>
    <!--section-->
</asp:Content>

