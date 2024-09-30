<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="BranchMaster, App_Web_faqmaster.aspx.28963a75" %>

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
            border-width: 1px; /* border-color:Black; */
        }
        .txt:focus
        {
            padding: 2px;
            border-width: 1px;
            border-color: Black;
        }
        .breakword
        {
            width: 150px;
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>
    <asp:Panel ID="pnl" GroupingText="FAQ Details" runat="server" Width="100%">
        <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
            OnServerValidate="cvCustInfo_ServerValidate" Display="None"></asp:CustomValidator>
        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
                    runat="server" HeaderText="Following errors occured while performing the action" />
        <div align="center" style="width: 100%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table width="50%">
                <tr>
                    <td align="right" style="width: 40%">
                        <asp:Label ID="lblQuestion" Text="Question:" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Width="500px" Height="50px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfdQuestion" runat="server" ErrorMessage="Question cannot be Blank"
                            ControlToValidate="txtQuestion" Display="None" ValidationGroup="vgsave"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 40%">
                        Answer:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" Width="500px" Height="120px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqfAnswer" runat="server" ErrorMessage="Answer cannot be Blank"
                            ControlToValidate="txtAnswer" ValidationGroup="vgsave" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="style1">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="true" ValidationGroup="vgsave"
                            class="myButton" Width="60px" Height="25px" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnEdit" runat="server" Text="Update" class="myButton" Width="60px" Height="25px" 
                            OnClick="btnEdit_Click" CausesValidation="true" ValidationGroup="vgsave" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="60px" Height="25px" class="myButton"
                             OnClick="btnDelete_Click" CausesValidation="true" ValidationGroup="vgsave" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton"
                            OnClick="btnClose_Click" CausesValidation="False" Width="60px" Height="25px" />
                        <%--<asp:Button ID="btnEdit" runat="server" Text="Update" CssClass="btnpadd myButton" Enabled="False"
                            Width="60px" Height="25px" OnClick="btnEdit_Click" CausesValidation="true" ValidationGroup="vgsave" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnpadd myButton"
                            Enabled="False" Width="60px" Height="25px" OnClick="btnDelete_Click" CausesValidation="true"
                            ValidationGroup="vgsave" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btnpadd myButton"
                            OnClick="btnClose_Click" CausesValidation="False" Width="60px" Height="25px" />--%>
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
                <%-- <tr>
                    <td colspan="2" align="center">
                        <asp:GridView CssClass="EU_DataTable" ID="gvFaqDetails" runat="server" AllowPaging="True"
                            PageSize="10" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                             CellPadding="4" ForeColor="#333333"
                            GridLines="None" onpageindexchanging="gvFaqDetails_PageIndexChanging"  BorderStyle="None" Width="100%"
                              >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Question" DataField="QUESTION" ItemStyle-CssClass="breakword" ItemStyle-HorizontalAlign="Left"  />
                                <asp:BoundField HeaderText="Answer" DataField="ANSWER" ItemStyle-CssClass="breakword" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="SrNo" DataField="SRNO" ItemStyle-HorizontalAlign="Left" />
                                <asp:CommandField SelectText="EDIT" ShowSelectButton="True" ItemStyle-HorizontalAlign="Left" />
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
                </tr>--%>
            </table>
            <asp:GridView CssClass="EU_DataTable" ID="gvFaqDetails" runat="server" AllowPaging="True"
                PageSize="10" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvFaqDetails_PageIndexChanging"
                BorderStyle="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="SrNo" DataField="FAQNO" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField HeaderText="Question" DataField="QUESTION" ItemStyle-HorizontalAlign="Left" />
                    <%-- <asp:BoundField HeaderText="Answer" DataField="ANSWER" ItemStyle-CssClass="breakword" ItemStyle-HorizontalAlign="Left"/>--%>
                    <asp:BoundField HeaderText="Answer" DataField="ANSWER" ItemStyle-HorizontalAlign="Left" />
                    <asp:CommandField SelectText="EDIT" ShowSelectButton="True" ItemStyle-HorizontalAlign="Left" />
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
    </asp:Panel>
</asp:Content>
