<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_pending_reviews_list.aspx.cs" Inherits="pending_review_list" %>

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
								<h3 class="title">Pending Review List</h3>
							</div>

                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th colspan="2"><center>PRODUCT DETAILS</center></th>
                                        <th rowspan="2"><center>USER NAME</center></th>
                                        <th rowspan="2"><center>ORDER DATE</center></th>
                                        <th rowspan="2"><center>BID PRICE</center></th>
                                    </tr>
                                    <tr>
                                        <th><center>NAME</center></th>
                                        <th><center>PHOTO</center></th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("product_name") %> </td>
                                        <td><img src='<%#Eval("photo") %>' width="150px" height="150px" /></td> 
                                        <td><center><center><%#Eval("user_name") %></center></td>
         
                                        <td><center><%#Eval("order_date") %></center></td>
                                        <td><center><%#Eval("bid_price")%></center></td>
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
