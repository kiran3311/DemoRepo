<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="FlagMaster, App_Web_flagmaster.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .btnpadd
        {
            /*margin-left: 15px;*/
        }
        .style1
        {
            height: 30px;
        }
        .style2
        {
            height: 29px;
        }
        .style3
        {
            height: 21px;
        }
        
        .EU_DataTable tr td
        {
            padding: 5px 10px 5px 10px;
            color: #454545;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            border: 1px solid #cccccc; 
            vertical-align: middle;
        }
        .txt
        {
            padding: 2px;
           /* border-width: 1px; *//* border-color:Black; */
        }
        .txt:focus
        {
            padding: 2px;
            border-width: 1px;
            border-color: Black;
        }
    </style>
    <asp:Panel ID="pnl" GroupingText="Rejection Codes Details" runat="server" Width="100%">
        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
            runat="server" HeaderText="Following errors occured while performing the action" />
        <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
            OnServerValidate="cvCustInfo_ServerValidate" Display="None"></asp:CustomValidator>
        <div align="center" style="width: 100%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table width="50%">
                 <%--<tr>
                    <td align="right" style="width: 40%">
                        Type:
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlType" runat="server" Width="250px" AutoPostBack="true"
                           CssClass="txt">
                        </asp:DropDownList>
                         
                    </td>
                </tr>--%>
                <tr>
                    <td align="right" style="width: 40%">
                        Rejection Category:
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlRejCategory" runat="server" Width="250px" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlRejCategory_SelectedIndexChanged" CssClass="txt">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 40%">
                        Code:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCode" CssClass="txt" runat="server" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="vgsave" Display="None"
                            ControlToValidate="txtCode" ErrorMessage="Enter Code" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style2">
                        Code Description:
                    </td>
                    <td align="left" class="style2">
                        <asp:TextBox ID="txtCodeDesc" CssClass="txt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vgsave" Display="None"
                            ControlToValidate="txtCodeDesc" ErrorMessage="Enter Code Description" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="style1">
                        <asp:Button ID="btnInsert" Style="padding: 2px" runat="server" Text="Add" OnClick="btnInsert_Click"
                            CausesValidation="true" ValidationGroup="vgsave" class="myButton" Width="60px" Height="25px" />
                        <asp:Button ID="btnEdit" Style="padding: 2px" runat="server" Text="Update" CssClass="btnpadd myButton"
                            CausesValidation="true" ValidationGroup="vgsave" 
                            OnClick="btnEdit_Click" Width="60px" Height="25px" />
                       <%-- <asp:Button ID="btnDelete" Style="padding: 2px" runat="server" Text="Delete" CssClass="btnpadd"
                            Visible="false" CausesValidation="true" ValidationGroup="vgsave" 
                            OnClick="btnDelete_Click" Width="75px" />--%>
                        <asp:Button ID="btnReset" Style="padding: 2px" runat="server" Text="Cancel" CssClass="btnpadd myButton"
                            OnClick="btnReset_Click" CausesValidation="False" class="myButton" Width="60px" Height="25px" />
                        <asp:Button runat="server" ID="btnClose" Text="Close" class="myButton" Width="60px" Height="25px" CssClass="btnpadd myButton" OnClick="btnClose_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="style3">
                        <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:GridView CssClass="EU_DataTable" ID="gvRejCodeDetails" runat="server" AllowPaging="True"
                            PageSize="10" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                            OnPageIndexChanging="gvRejCodeDetails_PageIndexChanging" CellPadding="4" ForeColor="#333333"
                            GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Code Desc" DataField="CODE_DESC" />
                                <asp:BoundField HeaderText="Code" DataField="CODE" />
                                <asp:BoundField HeaderText="ID_DESC" DataField="ID_DESC" />
                                <asp:BoundField HeaderText="SRNO" DataField="SRNO" />
                                <asp:CommandField SelectText="SELECT" ShowSelectButton="True" />
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
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
