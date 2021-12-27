<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_change_password.aspx.cs" Inherits="user_change_password" %>

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
								<h3 class="title">Change Password </h3>
							</div>

                            <div class="form-group">
                            <label>OLD&nbsp;PASSWORD</label>
                                <asp:TextBox ID="txtoldpwd"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter Old Password " TextMode="Password"/>
                            </div>
							
                            <div class="form-group">
                            <label>NEW&nbsp;PASSWORD</label>
					            <asp:TextBox ID="txtnewpwd"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter New Password" TextMode="Password" />
                           </div>   
							
                            <div class="form-group">
                            <label>CONFIRM&nbsp;PASSWORD</label>
							    <asp:TextBox ID="txtcnfrmpwd"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter Confirm Password" TextMode="Password" />
                            </div>

                            <div>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text=" Submit "/><br /><br />
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
    <!-- section -->
</asp:Content>


