<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_product_bid.aspx.cs" Inherits="a_product_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
    <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
			 	<form id="checkout_form" runat="server" class="clearfix">
					<div class="col-md-12">
						<div class="billing-details">
                            <div class="section-title">
							    <h3 class="title">Product Bid</h3>
                            </div>
                               
                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th><center>PRODUCT NAME</center></th>
                                        <th><center>MINIMUM PRICE</center></th>
                                        <th><center>UPLOAD DATE</center></th>
                                        <th><center>DESCRIPTION</center></th>                                        
                                        <th><center>CATEGORY</center></th>
                                        <th><center>PRODUCT PHOTO</center></th>
                                        <th><center>BIDDING OFF DATE</center></th>
                                        <th><center>VIEW BID</center></th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    
                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("product_name")%> </td>
                                        <td><%#Eval("min_price") %> </td>
                                        <td><%#Eval("upload_date") %> </td>
                                        <td><%#Eval("description") %></td>
                                        <td><%#Eval("cat_name") %></td>
                                        <td><img src='<%#Eval("photo") %>' width="150px" height="150px" /> </td> 
                                        <td><%#Eval("bidding_off_date") %></td>  
                                        <td> 
                                            <a href="a_bid_view.aspx?product_id=<%#Eval("product_id") %>">  SHOW BID </a> 
                                        </td>
                                   </tr>
                                   </ItemTemplate>
                                   </asp:Repeater>

                                </tbody>
                            </table>
                        </div>
					</div>
                </form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
    </div>
    <!--section-->
</asp:Content>

