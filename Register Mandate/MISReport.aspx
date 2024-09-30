<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_MISReport, App_Web_misreport.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">

        function dateSelectionChanged(sender, args) {
            FillUtility();
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
                    FillUtility();
                }
            }
        }
        function FillUtility() {
            var vbtnFillUtility = document.getElementById('MainContent_hiddBtnFillUtility');
            vbtnFillUtility.click();
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
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                args.set_errorHandled(true);
            }
        }
    </script>
    <center>
        <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnl" GroupingText="Mandate MIS Report" runat="server" Width="100%">
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                    <table>
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
                            <td style="text-align: right">
                                From Date :
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFromDate" Width="80px" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                                    runat="server"></asp:TextBox> <%-- onblur="FillUtility();"--%>
                                <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <%--<asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter From Date"
                                    ValidationGroup="vgOk" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>--%>
                                <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                                    Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtFromDate">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                                To Date :
                            </td>
                            <td>
                                <asp:TextBox ID="txtToDate" Width="80px" onkeydown="MoveNextWithServer(this, event.keyCode)" onchange="FillUtility();"
                                    runat="server"></asp:TextBox> <%--onblur="FillUtility();"--%> 
                                <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <%--<asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                                    ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>--%>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton2"
                                    Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtToDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Utility Name :
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlAPPMUtilityNM" runat="server" AutoPostBack="true" onkeydown="return MoveNext('MainContent_btnOk',event.keyCode);"
                                    Width="260px">
                                </asp:DropDownList>
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
                    </div>
                </asp:Panel>
                <div id="Div2" style="display: none" runat="server">
                    <asp:Button ID="hiddBtnFillUtility" runat="server" OnClick="hiddBtnFillUtility_Click" />
                    <asp:Button ID="hiddnbtnChkSolId" runat="server" OnClick="hiddnbtnChkSolId_Click" />
                    <asp:LinkButton ID="LnkExcel" runat="server" Visible="false" OnClick="LnkExcel_Click">Click to download</asp:LinkButton>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="LnkExcel" />
            </Triggers>
        </asp:UpdatePanel>
        <!-- [Start] Ajax Loading -->
        <!-- [End] Ajax Loading -->
    </center>
  <%--   <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
         <div id="divMain" class="UnFreezePage">
    </div>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    </div>--%>
</asp:Content>

