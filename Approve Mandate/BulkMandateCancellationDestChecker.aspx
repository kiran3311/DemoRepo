<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="ACH_CR.BulkMandateCancellationDestChecker, App_Web_bulkmandatecancellationdestchecker.aspx.1f1b7ac7" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .EU_TableScroll
        {
            max-height: 275px;
            overflow: auto;
            border: 1px solid #ccc;
        }
        .EU_DataTable
        {
            border-collapse: collapse;
            width: 100%;
        }
        .EU_DataTable tr th
        {
            background-color: #3c454f;
            color: #ffffff;
            padding: 10px 5px 10px 5px;
            border: 1px solid #cccccc;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: normal;
            text-transform: capitalize;
        }
        .EU_DataTable tr:nth-child(2n+2)
        {
            background-color: #f3f4f5;
        }
        
        .EU_DataTable tr:nth-child(2n+1) td
        {
            background-color: #d6dadf;
            color: #454545;
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
        .EU_DataTable tr td:first-child
        {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function SetAction(Action) {
            var hidAction =
        document.getElementById("<%=hidAction.ClientID%>");
            hidAction.value = Action;

        }

        function RestrictAllSpecialChars() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57))
                return true;
            else
                return false;
        }

    </script>
    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <asp:Panel ID="pnl" GroupingText="Upload Destination Inward : Checker" runat="server"
        Width="100%">
        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
            runat="server" HeaderText="Following errors occured while performing the action" />
        <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
            ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
        <div id="dvDataFound" runat="server">
            <table style="width: 100%">
                <tr>
                    <td colspan="2">
                        <div style="padding: 5px; height: 250px" align="center">
                            <asp:GridView ID="dgvData" runat="server" AutoGenerateColumns="False" CellPadding="6"
                                ForeColor="#333333" OnRowCancelingEdit="dgvData_RowCancelingEdit" OnRowEditing="dgvData_RowEditing"
                                OnRowUpdating="dgvData_RowUpdating" OnRowDataBound="dgvData_RowDataBound" PageIndex="5"  >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SR No.">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:HiddenField ID="hiddDocID" runat="server" Value='<%#Eval("DocID")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FILE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_FileName" runat="server" Text='<%#Eval("Filename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TOTAL COUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_CBSRemarks" runat="server" Text='<%#Eval("TotalItems") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IMPORTED ON">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_ImportDt" runat="server" Text='<%#Eval("ImportOn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IMPORTED BY">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_ImportedBy" runat="server" Text='<%#Eval("ImportBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CHECKER COMMENTS">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_CheckerCmnts" runat="server" Text='<%#Eval("CheckerComment") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txt_CheckerCmnts" MaxLength="100" TextMode="MultiLine" Width="200px"
                                                runat="server" Text='<%#Eval("CheckerComment") %>' onkeypress="return RestrictAllSpecialChars();"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                        </ItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="btn_Accept" runat="server" OnClientClick="SetAction('Accept')" Text="Accept"
                                                CommandName="Update" CausesValidation="true" ValidationGroup="vgOK" />
                                            <asp:Button ID="btn_Reject" runat="server" OnClientClick="SetAction('Reject')" Text="Reject"
                                                CommandName="Update" CausesValidation="true" ValidationGroup="vgOK" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#ffffcc" />
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
        </div>
        <div id="dvNoData" runat="server" style="font-size: 15px; font-weight: bold; color: Red">
            No Data Found
        </div>
    </asp:Panel>
    <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" class="myButton"
        Width="60px" Height="25px" />
    <div>
        <asp:HiddenField ID="hidAction" runat="server" />
    </div>
</asp:Content>
