<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_review_list.aspx.cs" Inherits="a_review_list" %>

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
								<h3 class="title">Review list</h3>
							</div>

                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th><center>REVIEW DATE</center></th>
                                        <th><center>REVIEW MESSAGE</center></th>
                                        <th><center>PRODUCT NAME</center></th>
                                        <th><center>USER NAME</center></th>
                                    </tr>
                               </thead>

                                <tbody>
                                    
                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("review_date") %></td>
                                        <td><%#Eval("review_msg") %></td>
                                        <td><%#Eval("product_name") %></td>
                                        <td><%#Eval("user_name") %></td>
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

