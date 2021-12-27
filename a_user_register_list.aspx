<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="a_user_register_list.aspx.cs" Inherits="a_user_master_list" %>

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
							    <h3 class="title">Users
                                    <asp:TextBox ID="txtsearch" runat="server"/>
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
								</h3>
							</div>

                            <table class="table" border="1">
                                <thead>
                                    <tr>
                                        <th><center>USER NAME</center></th>
                                        <th><center>EMAIL ID</center></th>
                                        <th><center>PHONE NO</center></th>
                                        <th><center>CITY</center></th>
                                        <th><center>ADDRESS</center></th>
                                        <th><center>ACTION</center></th>
                                    </tr>
                                 </thead>

                                 <tbody>
                                    
                                    <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("user_name") %></td>
                                        <td><%#Eval("user_email_id") %></td>
                                        <td><%#Eval("phone_no") %></td>
                                        <td><%#Eval("city") %></td>
                                        <td><%#Eval("address") %></td>
                                        <td>
                                            <a href="a_user_register_list_edit.aspx?user_id=<%#Eval("user_id") %>"> EDIT </a> / 
                                             <a href="a_user_register_list.aspx?user_id=<%#Eval("user_id") %>">  DELETE </a>
                                        </td>
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

