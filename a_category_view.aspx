<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_category_view.aspx.cs" Inherits="a_category_view" %>

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
								<h3 class="title">category view</h3>
							</div>
                            
                            <table class="table" border="1">
                                 <thead>
                                    <tr>
                                        <th>CATEGORY NAME</th>
                                        <th>ACTION</th>
                                    </tr>
                                 </thead>

                                 <tbody>

                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("cat_name") %> </td>
                                        <td> 
                                            <a href="a_category_edit.aspx?cat_id=<%#Eval("cat_id") %>"> EDIT </a> / 
                                            <a href="a_category_view.aspx?cat_id=<%#Eval("cat_id") %>"> DELETE </a>
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

