<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="AuditLog, App_Web_auditlog.aspx.4cd3357d" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnl" GroupingText="Audit Log Report" runat="server" Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                    Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                            <table width="60%">
                                <tr>
                                    <td align="right" colspan="2" class="style2" width="30%">
                                        <asp:Label ID="Label1" runat="server" Text="Branch :"></asp:Label>
                                    </td>
                                    <td align="left" colspan="2" class="style2">
                                        <asp:DropDownList ID="drpBranch" Style="padding: 2px" runat="server" OnSelectedIndexChanged="drpBranch_SelectedIndexChanged"
                                            Width="146px" AutoPostBack="True">
                                            <%-- <asp:ListItem>&lt;--Select--&gt;</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2" class="style3">
                                        <asp:Label ID="Label3" runat="server" Text="User ID :"></asp:Label>
                                    </td>
                                    <td align="left" style="font-weight: 700" colspan="2" class="style3">
                                        <asp:DropDownList Style="padding: 2px" ID="drpUserName" runat="server" Width="146px">
                                            <%-- <asp:ListItem>&lt;--Select--&gt;</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <table width="60%">
                                <tr>
                                    <td align="right" colspan="2" class="style2" width="30%">
                                        <asp:Label ID="Label2" runat="server" Text="From Date :"></asp:Label>
                                    </td>
                                    <td align="left" class="style1">
                                        <asp:TextBox ID="txtStartDate" Style="padding: 1px; text-transform: uppercase" runat="server" Width="142px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="txtStartDate" Mask="99/99/9999"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" />
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                        <asp:CalendarExtender PopupButtonID="ImageButton1" Format="dd-MM-yyyy" runat="server"
                                            ID="ToDateExtender" TargetControlID="txtStartDate">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2" class="style2" width="30%">
                                        <asp:Label ID="Label5" runat="server" Text="To Date :"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtEndDate" Style="padding: 1px; text-transform: uppercase" runat="server" Width="142px"></asp:TextBox>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender2" TargetControlID="txtEndDate" Mask="99/99/9999"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" />
                                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                        <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                            ID="CalendarExtender1" TargetControlID="txtEndDate">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>&nbsp;<asp:TextBox
                                            ID="txtFilePath" runat="server" Visible="False" Width="287px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">LinkButton</asp:LinkButton>
                                    </td>
                                    <td align="left" colspan="4" class="style6">
                                        <asp:Button ID="btnLog" runat="server" Style="margin-right: 1px;" Text="Summary"
                                            CausesValidation="true" ValidationGroup="vgOk" OnClick="btnLog_Click" class="myButton" Width="80px" Height="25px" />
                                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton" Width="60px" Height="25px" />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
