<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="user_change_password.aspx.cs" Inherits="user_change_password" %>

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
								<h3 class="title"> Change password </h3>
							</div>
			
                            <label>OLD&nbsp;PASSWORD</label>
							<div class="form-group">
                                <asp:TextBox ID="txtoldpwd" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter Old Password " TextMode="Password"/>
                            </div>
							
                            <label>NEW&nbsp;PASSWORD</label>
							<div class="form-group">
                                <asp:TextBox ID="txtnewpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter New Password" TextMode="Password" />
                            </div>
							
							<label>CONFIRM&nbsp;PASSWORD</label>
                            <div class="form-group">
                                <asp:TextBox ID="txtcnfrmpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter Confirm Password" TextMode="Password" />
                            </div>

                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text=" Submit " /><br />
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


