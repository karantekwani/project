<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_user_register_list_edit.aspx.cs" Inherits="a_user_register_list_edit" %>

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
								<h3 class="title">user edit </h3>
							</div>

                            <div class="form-group">
                                <label>NAME</label>
							    <asp:TextBox ID="txtuser_name" required pattern="[A-Za-z]+[A-Za-z ]*" title="only alphabets are allowed and First character should not be the space" runat="server" CssClass="form-control" placeholder="Edit user_name " />
                            </div>

                            <div class="form-group">
                                <label>EMAIL</label>
                                <asp:TextBox ID="txtuser_email" required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}"  title="please enter your valid Email ID" runat="server" CssClass="form-control" placeholder="Enter Email" />
                            </div>

                            <div class="form-group">
                                <label>CITY</label>
							    <asp:TextBox ID="txtuser_city" required pattern="[A-Za-z]+[A-Za-z ]*" title="only alphabets are allowed and First character should not be the space" runat="server" CssClass="form-control" placeholder="Edit City" />
                            </div>

                            <div class="form-group">
                                <label>PHONE&nbsp;NO</label>
                                <asp:TextBox ID="txtuser_phn_no" required pattern="(\+?\d[- .]*){7,13}"  title ="international,local or telephone no" runat="server" CssClass="form-control" placeholder="Edit Phone_no " />
                            </div>

                            <div class="form-group">
                                <label>ADDRESS</label>
                                <asp:TextBox ID="txtuser_address" required  runat="server" CssClass="form-control" placeholder="Edit address & pincode" TextMode="MultiLine"/>
                            </div>

                            <asp:CheckBox ID="txtuser_pass" required runat="server" text="&nbsp;Is&nbsp;Activated"/>

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

