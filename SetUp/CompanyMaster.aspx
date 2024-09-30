<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.Mst_Company, App_Web_companymaster.aspx.4cd3357d" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 175px;
            height: 26px;
        }
        .style2
        {
            height: 26px;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
    </script>
    <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="text-align: center;">
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"></asp:CustomValidator>
                <div style="height: 30px">
                </div>
                <asp:Panel ID="pnl" GroupingText="" runat="server" Width="600px">
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary1" ValidationGroup="vgsave"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
                        Display="None" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
                    <table>
                        <tr>
                            <td style="width: 175px; text-align: left">
                                Name Registered with NCPI
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtClientName" runat="server" Width="300px" CssClass="txt" AutoCompleteType="Disabled"
                                    MaxLength="35"></asp:TextBox>
                                <asp:DropDownList ID="ddlClientName" Style="padding: 3px" runat="server" Width="300px"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkNew" Text="New" Checked="false" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="chkNew_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 175px; text-align: left">
                                NPCI Bank Code
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNPCIBKCode" Style="padding: 3px" Width="200px" runat="server"
                                    AutoCompleteType="Disabled" MaxLength="4"></asp:TextBox>
                                <asp:Label ID="lblco_code" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 175px; text-align: left">
                                Sponsor Bank Code:
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSponsorBKCode" Width="200px" Style="padding: 3px" runat="server"
                                    AutoCompleteType="Disabled" MaxLength="11"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" class="style1">
                                NCPI Login ID:
                            </td>
                            <td class="style2" align="left">
                                <asp:TextBox ID="txtNPCILoginID" Style="padding: 3px" Width="200px" runat="server"
                                    AutoCompleteType="Disabled" MaxLength="9"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" class="style1">
                                <asp:Label ID="lblBankcode" Text="Bankcode" runat="server"></asp:Label>
                            </td>
                            <td class="style2" align="left">
                                <asp:TextBox ID="txtBankcode" Style="padding: 3px" Width="200px" runat="server" AutoCompleteType="Disabled"
                                    MaxLength="3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 175px; text-align: left">
                                Status:
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkStatus" Text="Active" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right;">
                                <asp:Button ID="btnSave" runat="server" Style="margin-right: 5px" OnClick="btnSave_Click"
                                    CausesValidation="true" ValidationGroup="vgsave" Text="Save" Width="80" />
                                <asp:Button ID="btnclose" runat="server" Style="margin-right: 5px" OnClick="btnCancel_Click"
                                    Text="Cancel" Width="80" />
                                <asp:Button ID="btnExit" runat="server" Style="margin-right: 2px" OnClick="btnExit_Click"
                                    Text="Exit" Width="80" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
