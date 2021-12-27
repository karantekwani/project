<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="u_add_review.aspx.cs" Inherits="u_add_review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
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
								<h3 class="title">Add Review</h3>
							</div>
						
                            <div class="form-group">
							    <label>Review&nbsp;Message</label>
                                <asp:TextBox ID="lblreviewmsg" required  runat="server" CssClass="form-control" placeholder="Write Review Message" TextMode="MultiLine"/>
                            </div>

                            <div class="form-group">
							    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text=" Submit " /><br /><br />
                            </div>
							
 						</div>
                    </div>
                </form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
    </div>
    <!--/section -->
</asp:Content>

