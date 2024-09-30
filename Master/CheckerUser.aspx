<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_CheckerUser, App_Web_checkeruser.aspx.28963a75" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
      <script type="text/javascript">
    
        function RestrictAllSpecialChars() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57) || k == 32)
                return true;
            else
                return false;
        }

    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     &nbsp;
     <asp:Panel ID="PanelGridView" runat="server">
                            <table align="center" >
                                
                                <tr>
                                    <td colspan="2">
                                        <div style="padding: 5px; height: 250px; font-family: 'Verdana'; font-size: 10px;
                                            font-weight: normal; font-style: normal; color: #000000;" align="center">
                                            <asp:GridView ID="dgvData" runat="server" AutoGenerateColumns="false" CellPadding="4"
                                                AllowPaging="true" PageSize="5"  OnPageIndexChanging="dgvData_PageIndexChanging"  OnRowCommand="GridView1_RowCommand">
                                               
                                                <AlternatingRowStyle BackColor="White" Height="50px" Width="30px" />
                                                <Columns>
                                                  <%--  <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" Width="20px" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkEmp" AutoPostBack="true" runat="server" OnCheckedChanged="chkEmp_CheckedChanged">
                                                            </asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                     <asp:BoundField DataField="user_code" HeaderText="USER Srno" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Medium" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="user_id" HeaderText="USER ID" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Medium" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="user_name" HeaderText="USER NAME" ItemStyle-Width="20%" ItemStyle-Font-Size="Small"
                                                        ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="Status" HeaderText="STATUS" ItemStyle-Font-Size="Small"
                                                       ItemStyle-Width="20%" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="createdby" HeaderText="CREATED BY" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-CssClass="breakword1" />
                                                    <asp:BoundField DataField="CREATE_DATE" HeaderText="CREATED DATE" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:BoundField DataField="RoleName" HeaderText="Role" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:BoundField DataField="new_status" HeaderText="Prv Status" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:BoundField DataField="NEW_roleid" HeaderText="New Role" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:BoundField DataField="Edited_By" HeaderText="Edited By" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:BoundField DataField="Edit_Date" HeaderText="Edit Date" ItemStyle-Width="20%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                     <asp:TemplateField HeaderText="COMMENTS"> 
                                                                                                              
                                                     <ItemTemplate>                                            
                                                <asp:TextBox ID="txt_CheckerCmnts" MaxLength="100" TextMode="MultiLine" Width="200px" runat="server"   
                                                    onkeypress="return RestrictAllSpecialChars();"></asp:TextBox>
                                                        
                                            
                                                    </ItemTemplate>
                                               </asp:TemplateField>
                                                     <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                             
                                                   <asp:Button ID="BtnAccpt" runat="server" Text="ACCEPT" CommandName="Accept" CommandArgument="<%# Container.DataItemIndex %>" Font-Bold="true" ForeColor="Blue"    /> 

                                                           
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <%--<asp:LinkButton ID="LinkButton" runat="server" CausesValidation="false" CommandName="Select"
                                                                Font-Underline="true" Text="Select" Width="30px"></asp:LinkButton>--%>
                                                            <asp:Button ID="BtnRejt" runat="server" Text="REJECT" CausesValidation="false" CommandName="Reject"  CommandArgument="<%# Container.DataItemIndex %>" Font-Bold="true" ForeColor="RED"    />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                        
                                        
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
</asp:Content>

