<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_category_edit.aspx.cs" Inherits="a_category_edit" %>

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
								<h3 class="title">category edit </h3>
							</div>

                            <div class="form-group">
                                <label>CATEGORY&nbsp;NAME</label>
							    <asp:TextBox ID="txtcat_name" required pattern="[A-Za-z]+[A-Za-z ]*" title="only alphabets are allowed and First character should not be the space" runat="server" CssClass="form-control" placeholder="Edit category_name " />
                            </div>

                            <div class="form-group">
						        <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" OnClick="btnupdate_Click" Text=" update" /><br />
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
    

