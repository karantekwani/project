<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="uwinners.aspx.cs" Inherits="uwinners" %>

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
								<h3 class="title">Winners
                                    <asp:TextBox ID="txtsearch" runat="server"/>
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
							    </h3>
                            </div>

                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th rowspan="2"><center>WINNER NAME</center></th>
                                        <th colspan="2"><center>PRODUCT DETAILS</center></th>
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
                                        <td><center><%#Eval("user_name") %></center></td>
                                        <td><center><%#Eval("product_name") %></center></td>
                                        <td><center><img src='<%#Eval("photo") %>' width="150px" height="150px" /></center></td> 
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

