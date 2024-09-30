<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="UnlockUser, App_Web_unlockuser.aspx.4cd3357d" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .txt
        {
            padding: 2px;
            /*border-width: 1px;*/ /* border-color:Black; */
        }
        .txt:focus
        {
            padding: 2px;
            border-width: 1px;
            border-color: Black;
        }
    </style>
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <%--</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" Display="None" ValidationGroup="vgOK"
                    OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <asp:Panel ID="pnl" GroupingText="User Management" runat="server" Width="100%">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table width="50%">
                                    <tr>
                                        <td align="right" width="50%" height="30">
                                            <asp:Label ID="Label1" runat="server" Text="Branch :"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="drpBranch" runat="server" Width="250px" AutoPostBack="True"
                                                OnSelectedIndexChanged="drpBranch_SelectedIndexChanged" CssClass="txt">
                                                <%--<asp:ListItem><--Select--></asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <%--   <asp:RequiredFieldValidator ID="rfvBatchNo" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Select the Branch" ValidationGroup="vgOK" ControlToValidate="drpBranch"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" height="30">
                                            <asp:Label ID="Label2" runat="server" Text="User Name :"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700">
                                            <asp:DropDownList ID="drpUserName" Style="padding: 1px" runat="server" Width="250px"
                                                CssClass="txt">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Select User Name" ValidationGroup="vgOk" ControlToValidate="drpUserName"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" height="30">
                                            <asp:Label ID="Label3" runat="server" Text="User Status"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700">
                                            <asp:CheckBox ID="chkUnlock" runat="server" Text="Unlock" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="style1" height="30">
                                            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="4" style="text-align: left;">
                                            <asp:Button ID="btnUpdate" runat="server" Style="margin-right: 1px" Text="Update"
                                                OnClick="btnUpdate_Click" CausesValidation="true" ValidationGroup="vgOK" class="myButton" Width="60px" Height="25px" />
                                            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" class="myButton" Width="60px" Height="25px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
