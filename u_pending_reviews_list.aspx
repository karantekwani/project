<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="u_pending_reviews_list.aspx.cs" Inherits="u_pending_reviews_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
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
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Pending Reviews List</h3>
							</div>

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
                                        <HeaderTemplate><center>BID PRICE</center></HeaderTemplate>
                                        <ItemTemplate><center><%#Eval("bid_price") %></center></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate><center>REVIEW</center></HeaderTemplate>
                                        <ItemTemplate><center><a href="u_add_review.aspx?product_id=<%#Eval("product_id") %>&pending_review_id=<%#Eval("pending_review_id") %>">Give Review</a></center></ItemTemplate>
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
</asp:Content>

