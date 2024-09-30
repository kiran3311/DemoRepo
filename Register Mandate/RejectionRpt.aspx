﻿<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_RejectionRpt, App_Web_rejectionrpt.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    <script type="text/javascript" language="javascript">

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false; 
            }
        });
        function FillBranch() {
            var vbtnFillBranch = document.getElementById('MainContent_hiddBtnFillBranch');
            vbtnFillBranch.click();
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
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <center>
        <%--<asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <asp:Panel ID="pnl" GroupingText="Mandate Registration Report" runat="server" Width="100%">
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                    <table>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblSoleId" Text="SoleId:" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSolId" MaxLength="4" onkeypress="return NumberOnly();" onblur="SoleIDCheck();" runat="server"></asp:TextBox>
                            </td>
                            <td >
                                <asp:Label ID="lblBranch" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblReportType" Text="Report Type :" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlRptType" runat="server" Width="200px" onkeydown="return MoveNext('MainContent_txtFromDate',event.keyCode);"
                                     OnSelectedIndexChanged="ddlRptType_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Acceptance Report" Value="Acceptance Report"></asp:ListItem>
                                    <asp:ListItem Text="Rejection Report" Value="Rejection Report"></asp:ListItem>
                                    <asp:ListItem Text="Acknowledgment Report" Value="Acknowledgment Report"></asp:ListItem>
                                    <asp:ListItem Text="Acceptance Pending" Value="NPCI Acceptance Not Received"></asp:ListItem>
                                    <asp:ListItem Text="Pending For NPCI Upload" Value="Pending For NPCI Upload"></asp:ListItem>
                                    <asp:ListItem Text="Wrong Mandate" Value="Wrong Mandate"></asp:ListItem>
                                    <asp:ListItem Text="NPCI Uploadable Report" Value="NPCI Uploadable Report"></asp:ListItem>
                                    <asp:ListItem Text="Mandate Summary Report" Value="Mandate Summary Report"></asp:ListItem>
                                    <asp:ListItem Text="Maturity Report" Value="Maturity Report"></asp:ListItem>
                                    <asp:ListItem Text="Response Report" Value="Response Report"></asp:ListItem>
                                    <asp:ListItem Text="User Performance Report" value= "User performance Report"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRptType" runat="server" Display="None" ErrorMessage="Please Select the Report Type"
                                    ValidationGroup="vgOk" ControlToValidate="ddlRptType"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblFromDate" Text="From Date :" runat="server"></asp:Label>
                            </td>
                            <td align="left" >
                                <asp:TextBox ID="txtFromDate" width="80px" runat="server" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"></asp:TextBox>
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
                                <asp:Label ID="lblTo" Text="To Date:" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtToDate" width="80px" runat="server" onkeydown="return MoveNext('MainContent_btnOk',event.keyCode);"></asp:TextBox>
                                <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                                    ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                    ID="CalendarExtender1" TargetControlID="txtToDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr style="height: 40px">
                            <td colspan="4" style="text-align: center;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" class="myButton" Width="60px" Height="25px" ValidationGroup="vgOk"
                                    CausesValidation="true" OnClick="btnOk_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnCancel_Click" />
                            </td>
                            <td class="form-fld-lbl">
                            </td>
                            <td class="form-fld-val">
                                <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="lblMsg" runat="server">
                   
                            </asp:Label>
                        </tr>
                    </table>
                    <div id="Div1" style="display: none" runat="server">
                        <asp:TextBox ID="txtFilePath" runat="server">      
                        </asp:TextBox>
                        <asp:Button ID="hiddnbtnChkSolId" runat="server" OnClick="hiddnbtnChkSolId_Click" />                     
                    </div>
                </asp:Panel>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        <!-- [Start] Ajax Loading -->
        <div id="divProgress" style="display: none;">
            <div class="action-progress" style="font-weight: bold;">
                Processing your request. Please wait....
            </div>
        </div>
        <div id="divMain" class="UnFreezePage">
        </div>
        <!-- [End] Ajax Loading -->
    </center>
</asp:Content>

