<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_product_add.aspx.cs" Inherits="a_product_add" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="cpmain">
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
								<h3 class="title">product add</h3>
							</div>
							
							<div class="form-group">
                                <label>PRODUCT&nbsp;NAME</label>
                                <asp:TextBox ID="txtp_name" required pattern="[A-Za-z]+[A-Za-z(0-9) -\]*"  title="only digits,numbers,(,),-,\ are allowed and first letter should not be the space and number"  runat="server" CssClass="form-control" placeholder="Enter product_name " />
                            </div>

                           <div class="form-group">
							    <label>MINIMUM&nbsp;BID&nbsp;PRICE</label>   
                                <asp:TextBox ID="txtmin_price" required pattern= "^[1-9]\d{2,9}"  title="only more than 3 digit values and first digit should not be zero"  runat="server" CssClass="form-control" placeholder="Enter minimum_bid_price " />
                           </div>
                            
                            <div class="form-group">
                                 <label>DESCRIPTION</label>   
                                 <asp:TextBox ID="txtdescription" required pattern="[a-zA-Z0-9]*$"  title="add description" runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine" />
                            </div>

                            <div class="form-group">
                                 <label>BIDDING&nbsp;OFF&nbsp;DATE</label>
                                 <asp:TextBox ID="txtbodate" required title="add bidding off date" runat="server" CssClass="form-control" TextMode="Date">
                                 </asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>CATEGORY&nbsp;NAME</label>
                                <asp:DropDownList ID="txtcat_name" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                            <label>PRODUCT&nbsp;PHOTO</label>
                            <div class="form-group">
                                <asp:Image ID="Image1" runat="server" height=200 width=200 />
                                <asp:FileUpload ID="txtphoto" runat="server" accept=".png,.jpg,.jpeg"/><br />
                                maximum upload file size<=2mb    
                             <!--   <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>-->
                            </div>

                            <div class="form-group">
							    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"  OnClick="btnSubmit_Click" Text=" Submit " /><br />
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblmsg" runat="server" />
                            </div>

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




