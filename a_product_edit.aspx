<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_product_edit.aspx.cs" Inherits="a_product_edit" %>

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
								<h3 class="title">Product Edit</h3>
							</div>
							
                            <div class="form-group">
                                <label>PRODUCT&nbsp;NAME</label>
                                <asp:TextBox ID="txtp_name" required pattern="[A-Za-z0-9()- ]*"  title="only upper letter and lower letter are allowed"  runat="server" CssClass="form-control" placeholder="Enter product_name " />
                            </div>

                            <div class="form-group">
							    <label>MINIMUM&nbsp;PRICE</label>
                                <asp:TextBox ID="txtmin_price" required pattern= "^[1-9]\d{2,9}(\.\d{1,2})?$"  title="only digits"  runat="server" CssClass="form-control" placeholder="Enter minimum_price " />
                            </div>
							
                            <div class="form-group">
                                <label>DESCRIPTION</label>
                                <asp:TextBox ID="txtdescription" required pattern="[a-zA-Z0-9]*$"  title="add desciption"  runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine" />
                            </div>

                            <div class="form-group">
                                <label>CATEGORY&nbsp;NAME</label>
                                <asp:DropDownList ID="txtcat_name" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                 <label>BIDDING&nbsp;OFF&nbsp;DATE</label>
                                 <asp:TextBox ID="txtbodate" runat="server" CssClass="form-control" TextMode="Date">
                                 </asp:TextBox>
                            </div>

                            <label>PRODUCT&nbsp;PHOTO</label>
                            <div class="form-group">
							    <asp:Image ID="Image1" runat="server" height=200 Width=200 />
                                <asp:FileUpload ID="photo" runat ="server" />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </div>
							
                            <div class="form-group">
						        <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" OnClick="btnupdate_Click" Text=" Update " /><br />
                            </div>

                            <div class="form-group">
							    <asp:Label ID="lblmsg" runat="server"  />
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


