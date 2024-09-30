<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_DashBOARD, App_Web_dashboard.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
    <script type="text/javascript" language="javascript">

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }

        function SoleIDCheck() {
            var vbtnChkSoleID = document.getElementById('MainContent_hiddnbtnChkSolId');
            vbtnChkSoleID.click();
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

    </script>
    <div>
        <ajct:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
        runat="server" HeaderText="Following errors occured while performing the action" />
    <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel ID="pnl" GroupingText="Register Mandate" runat="server" Width="100%">
                <table style="margin-top: 0%">
                    <table width="80%">
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="lblCircle" runat="server" Text="Circle:"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="ddlCircle" runat="server" Width="200px" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlCircle_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="lblZone" Text="Zone:" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="ddlZone" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="lblSoleId" runat="server" Text="Sol Id:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSolId" MaxLength="4" onkeypress="return NumberOnly();" onblur="SoleIDCheck();"
                                    runat="server" OnTextChanged="txtSolId_TextChanged"></asp:TextBox>
                            </td>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="lblFromDate" runat="server" Text="From Date :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtFromDate" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                                        runat="server"></asp:TextBox>
                                    <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                        ErrorTooltipEnabled="True" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter From Date"
                                        ValidationGroup="vgOk" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                    <asp:CalendarExtender PopupButtonID="ImageButton1" Format="dd-MM-yyyy" runat="server"
                                        ID="ToDateExtender" TargetControlID="txtFromDate">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="lblToDate" runat="server" Text="To :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                                    <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                        ErrorTooltipEnabled="True" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                                        ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                    <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                        ID="CalendarExtender1" TargetControlID="txtToDate">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                        </tr>
                    </table>
                    <td valign="top">
                        <table>
                            <tr style="width: 100%; vertical-align: top;">
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rbtRegMandate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbtRegMandate_SelectedIndexChanged"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="Pending Maker Entry" Value="Pending Maker Entry"></asp:ListItem>
                                                    <asp:ListItem Text="Pending Checker Entry" Value="Pending Checker Entry"></asp:ListItem>
                                                    <asp:ListItem Text="Pending NPCI Upload" Value="Pending NPCI Upload"></asp:ListItem>
                                                    <asp:ListItem Text="Pending ACK" Value="Pending ACK"></asp:ListItem>
                                                    <asp:ListItem Text="Pending Response" Value="Pending Response"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upRegMan" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="DgvData" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333"
                                                            GridLines="None" OnPageIndexChanging="gvList_PageIndexChanging" PageSize="10"
                                                            Width="100%">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <EditRowStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="notification" runat="server" Visible="false">
                                                    <table>
                                                        <tr>
                                                            <td bgcolor="PaleGoldenrod" height="25px" width="25px">
                                                            </td>
                                                            <td>
                                                                Pending
                                                            </td>
                                                            <td bgcolor="#99FF66" height="25px" width="25px">
                                                            </td>
                                                            <td>
                                                                Done
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:Chart ID="chart1" runat="server" Visible="False">
                                                    <Series>
                                                        <asp:Series ChartType="Pie" Name="Series1">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" class="myButton" Width="60px" Height="25px" Style="
                                padding: 5px" Text="Print" Enabled="False" />
                            <asp:Button ID="Exit" runat="server" Style="margin-right: 10px; padding: 5px" Text="Exit"
                                OnClick="Exit_Click" class="myButton" Width="60px" Height="25px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div id="Div2" style="display: none" runat="server">
                <asp:Button ID="hiddnbtnChkSolId" runat="server" OnClick="hiddnbtnChkSolId_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

