<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="a_login.aspx.cs" Inherits="Admin_login" %>

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
								<h3 class="title">Admin Login</h3>
							</div>

							<div class="form-group">
                                <label>EMAIL</label>      							
                                <asp:TextBox ID="txtEmail" required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" title="please enter your valid Email ID"  runat="server" CssClass="form-control" placeholder="Enter Your Email" />
                            </div>

                            <div class="form-group">
							  <label>PASSWORD</label>
                              <asp:TextBox ID="txtpwd" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="at least 8 characters are required & from 8 characters one should be number,one should be lower and one should upper letter are required " runat="server" CssClass="form-control" placeholder="Enter Password "  TextMode="Password" />
                            </div>

                            <div class="form-group">
							    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" OnClick="btnLogin_Click" Text="Login" /><br /><br />
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


