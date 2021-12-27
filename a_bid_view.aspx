<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_bid_view.aspx.cs" Inherits="a_user_master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
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
								<h3 class="title">bid View</h3>
							</div>

                                <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th colspan="2"><center>PRODUCT DETAILS</center></th>
                                        <th colspan="4"><center>USER DETAILS</center></th>
                                        <th colspan="3"><center>BID DETAILS</center></th>
                                        <th rowspan="2"><center>CONFIRM ORDER</center></th>
                                    </tr>

                                   <tr>
                                        <th><center>NAME</center></th>
                                        <th><center>PHOTO</center></th>
                                        <th><center>NAME</center></th>
                                        <th><center>ADDRESS</center></th>
                                        <th><center>CITY</center></th>
                                        <th><center>PHONE NO</center></th>
                                        <th><center>BID PRICE</center></th>
                                        <th><center>BID DATE</center></th>
                                        <th><center>ADVANCE</center></th>
                                   </tr>
                               </thead>

                               <tbody>
                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>

                                    <tr>
                                        <td><%#Eval("product_name") %> </td>
                                        <td><img src='<%#Eval("photo") %>' width="150px" height="150px" /></td> 
                                        <td><%#Eval("user_name") %></td>
                                        <td><%#Eval("address") %></td>
                                        <td><%#Eval("city") %> </td>
                                        <td><%#Eval("phone_no") %></td>
                                        <td><%#Eval("bid_price") %> </td>
                                        <td><%#Eval("bid_date") %></td>
                                        <td><%#Eval("advance") %> </td>
                                        <td><a href='a_bid_code.aspx?bid_id=<%#Eval("bid_id") %>&user_id=<%#Eval("user_id")%>&product_id=<%#Eval("product_id")%>'>Order</a>
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




