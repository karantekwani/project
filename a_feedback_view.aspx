<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_feedback_view.aspx.cs" Inherits="a_feedback_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
    <!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout_form" runat="server" class="clearfix">
					<div class="col-md-12">
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">feedback view</h3>
							</div>

                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th><center>FEEDBACK DATE</center></th>
                                        <th><center>USER NAME</center></th>
                                        <th><center>FEEDBACK MESSAGE</center></th>
                                        <th><center>EMAIL ID</center></th>
                                     </tr>
                                </thead>

                                <tbody>
                                    
                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("f_date") %></td>
                                        <td><%#Eval("f_name") %></td>
                                        <td><%#Eval("message") %></td>
                                        <td><%#Eval("f_email_id") %></td>
                                    </tr>
                                    </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
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

