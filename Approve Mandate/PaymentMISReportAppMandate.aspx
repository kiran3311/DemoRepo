<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_PaymentMISReportAppMandate, App_Web_paymentmisreportappmandate.aspx.1f1b7ac7" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--<link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>--%>
    <script type="text/javascript" language="javascript">
        function dateSelectionChanged(sender, args) {
            fill();
        }

        function fill() {
            var vbtnFill = document.getElementById('MainContent_btn_fill');
            vbtnFill.click();
        }
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

        function MoveNextWithServer(ctrl, _key) {
            var mCtrl;
            if (_key == 13) {
                if (ctrl.id == "MainContent_txtToDate") {
                    fill();
                }
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
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <center>
         <asp:UpdatePanel ID="upPnl" runat="server">
            <ContentTemplate>
        <asp:Panel ID="pnl" GroupingText="Approve Mandate" runat="server" Width="80%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <%--<asp:Panel ID="pnl" GroupingText="Approve Mandate" runat="server" Width="100%">--%>
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                runat="server" HeaderText="Following errors occured while performing the action" />
            <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
            <div>
                <table style="width: 62%; margin-left: 0px">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="lblCircle" Text="Circle:" runat="server"></asp:Label>
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
                            <asp:DropDownList ID="ddlZone" runat="server" Width="200px" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="lblSoleId" runat="server" Text="Sol Id:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtSolId" MaxLength="4" onkeypress="return NumberOnly();" onblur="SoleIDCheck();"
                                runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="right">
                            Reports :
                        </td>
                        <td class="style2" align="left">
                            <asp:DropDownList ID="ddlApproveMandate" Width="260px" runat="server" AutoPostBack="true"
                                onkeydown="return MoveNext('MainContent_txtFromDate',event.keyCode);" OnSelectedIndexChanged="ddlApproveMandate_SelectedIndexChanged">
                                <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                <asp:ListItem Text="Inward Mandate MIS" Value="Inward Mandate MIS"></asp:ListItem>
                                <asp:ListItem Text="Accepted Mandates" Value="Accepted Mandates"></asp:ListItem>
                                <asp:ListItem Text="Rejected Mandates" Value="Rejected Mandates"></asp:ListItem>
                                <asp:ListItem Text="Mandates Under Process" Value="Mandates Under Process"></asp:ListItem>
                                <asp:ListItem Text="Pending for NPCI Upload" Value="Pending for NPCI Upload"></asp:ListItem>
                                <%--<asp:ListItem Text="NPCI Uploadable Report" Value="NPCI Uploadable Report"></asp:ListItem>--%>
                                <%--<asp:ListItem>User Performance Report</asp:ListItem>--%>
                                <asp:ListItem Text="User Performance Report" Value="User Performance Report"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <%--<td align="right" width="35%" height="30px"></td>--%>
                        <td align="right" style="width: 35%;"><asp:CheckBox runat="server" AutoPostBack="true" ID="chkArchive" OnCheckedChanged="chkArchive_CheckedChanged"/></td>
                         <td align="left" style="width: 35%;">Include Archived Data</td>
                    </tr>
                     <tr>
                        <%--<td align="right" width="35%" height="30px"></td>--%>
                        <td align="right" style="width: 35%;"><asp:CheckBox runat="server" AutoPostBack="true" ID="chkAPIEmandate" OnCheckedChanged="chkAPIEmandate_CheckedChanged"/></td>
                         <td align="left" style="width: 35%;">Include API Emandate Data</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%--<table width="100%">
                                        <tr>--%>
                            <%--<td class="style3">
                                                Settlement Date
                                            </td>--%>
                            <%-- <td align="right" class="style3">--%>
                            <asp:Label ID="Label2" runat="server" Text="Settlement Date From :"></asp:Label>
                            <%--    </td>--%>
                            <%-- </tr>--%>
                        </td>
                        <%-- </table>--%>
                        <td align="left">
                            <asp:TextBox ID="txtFromDate" Width="80px"  onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                                runat="server"></asp:TextBox> <!--onblur="fill()"-->
                            <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                ErrorTooltipEnabled="True" runat="server" />
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                            <%-- <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                                Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtFromDate">
                            </asp:CalendarExtender>--%>
                            <asp:CalendarExtender PopupButtonID="ImageButton1" Format="dd-MM-yyyy" runat="server"
                                ID="CalendarExtender2" TargetControlID="txtFromDate">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblToDate" runat="server" Text="Settlement Date To :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtToDate" Width="80px" onchange="fill()" onkeydown="MoveNextWithServer(this, event.keyCode)"
                                runat="server"></asp:TextBox><!--  onblur="fill()"-->
                            <asp:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="txtToDate" Mask="99/99/9999"
                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                ErrorTooltipEnabled="True" runat="server" />
                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                            <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                ID="CalendarExtender1" TargetControlID="txtToDate">
                            </asp:CalendarExtender>
                            <div style="display: none">
                                <asp:Button ID="btn_fill" runat="server" Text="Button" OnClick="btn_fill_Click" /></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" width="35%">
                            Utility Name :
                        </td>
                        <td align="left" style="width: 70%">
                            <asp:DropDownList ID="ddlAPPMUtilityNM" runat="server" AutoPostBack="true" onkeydown="return MoveNext('MainContent_btnAPPMRpt',event.keyCode);"
                                OnSelectedIndexChanged="ddlAPPMUtilityNM_SelectedIndexChanged" Width="260px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                   
                    <tr>
                        <td align="center" colspan="4">
                            <asp:Button ID="btnAPPMRpt" runat="server" CausesValidation="true" OnClick="btnAPPMRpt_Click"
                                AutoPostBack="true" Text="OK" ValidationGroup="vgOK" class="myButton" Width="60px"
                                Height="25px" />
                            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" class="myButton"
                                Width="60px" Height="25px" />
                        </td>
                        <td class="form-fld-lbl">
                        </td>
                        <td class="form-fld-val">
                            <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="linkExcel_Click" Visible="false">Click to download</asp:LinkButton>--%>
                            <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<asp:Label ID="Label1" Text="" runat="server" ForeColor="Black" Visible="false"></asp:Label>--%>
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="true" Text="Msg"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>--%>
            </div>
            <%--   </asp:Panel>--%>
            <div id="Div1" runat="server" style="display: none;">
                <asp:TextBox ID="txtFilePath" runat="server"> </asp:TextBox>
                <asp:TextBox ID="TextBox1" runat="server"> </asp:TextBox>
            </div>
        </asp:Panel>
        <div id="Div2" style="display: none" runat="server">
            <asp:Button ID="hiddnbtnChkSolId" runat="server" OnClick="hiddnbtnChkSolId_Click"
                CausesValidation="false" />
        </div>
         </ContentTemplate>
        <triggers>
                <asp:PostBackTrigger ControlID="btnAPPMRpt" />
            </triggers>
         </asp:UpdatePanel>
        <!-- [Start] Ajax Loading -->
        <%--<div id="divProgress" style="display: none;">
            <div class="action-progress" style="font-weight: bold;">
                Processing your request. Please wait....
            </div>
        </div>
        <div id="divMain" class="UnFreezePage">
        </div>--%>
        <div id="divMain" class="UnFreezePage">
        </div>
        <!-- [End] Ajax Loading -->
    </center>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            /*background-color: rgb(235,235,235);*/
            background-color1: rgb(232,232,232);
            width: 70%;
            height: 28px;
        }
        .style3
        {
            height: 17px;
        }
    </style>
</asp:Content>

