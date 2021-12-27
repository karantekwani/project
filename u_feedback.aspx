<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="u_feedback.aspx.cs" Inherits="a_feedback" %>

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
								<h3 class="title">feedback</h3>
							</div>
							
							<div class="form-group">
                                 <label>EMAIL ID</label>
                                <asp:TextBox ID="txtE_id"  required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" title="please enter your valid email id" runat="server" CssClass="form-control" placeholder="Enter Email_id" />
                            </div>
							
							<div class="form-group">
                                <label>NAME</label>
							    <asp:TextBox ID="txtname" required pattern="[A-Za-z]+[A-Za-z ]*" title="only alphabets are allowed and First character should not be the space" runat="server" CssClass="form-control" placeholder="Enter name" />
                            </div>

                            <div class="form-group">
							    <label>DATE</label>
                                <asp:TextBox ID="txtdate" required  title="select date" runat="server" CssClass="form-control"  TextMode="Date" />
                            </div>

                            <div class="form-group">
                                <label>MESSAGE</label>
							    <asp:TextBox ID="txtmsg" required pattern="[a-zA-Z0-9]*$" title="add mesage" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter message " />
                            </div>
							
							<div class="form-group">
							    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Text=" Submit " />
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


