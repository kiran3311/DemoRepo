<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_StopEMIUploadFile, App_Web_stopemiuploadfile.aspx.28963a75" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
   <%--<link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>--%>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <center>
        <asp:Panel ID="pnl" GroupingText="Hold Transaction Payment" runat="server" Width="100%">
        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
            runat="server" HeaderText="Following errors occured while performing the action" />
        <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
            Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
        <table>
            <tr>
                <td style="text-align:right">From Date :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFromDate" onblur="FillUtility();" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                        runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                        ErrorTooltipEnabled="True" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter From Date"
                        ValidationGroup="vgOk" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                    <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                        Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtFromDate">
                    </asp:CalendarExtender>
                </td>
                <td>To :
                </td>
                <td>
                    <asp:TextBox ID="txtToDate" Enabled="false" onkeydown="MoveNextWithServer(this, event.keyCode)" onblur="FillUtility();"
                        runat="server"></asp:TextBox>
                    <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                        ErrorTooltipEnabled="True" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                        ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                    <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" Enabled="false" PopupButtonID="ImageButton2"
                        Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtToDate">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td align="right">Import File :
                </td>
                <td align="left">
                    <asp:FileUpload ID="fileupld" runat="server" Width="200px" />
                </td>
                <td>
                    <span style="float: right">
                        <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="fileupld"
                            ErrorMessage="Select Only .xls or .xlsx" ValidationGroup="vgOk" ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$|.*\.([Xx][Ll][Ss])$)"
                            Display="Dynamic" ForeColor="#FF0066"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr style="height: 40px">
                <td colspan="4" style="text-align: center;">
                    <asp:Button ID="btnOk" runat="server" Text="Upload" Width="100px" ValidationGroup="vgOk"
                        CausesValidation="true" OnClick="btnOk_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Close" Width="100px" OnClick="btnCancel_Click" />
                </td>
                <td class="form-fld-lbl">
                    
                </asp:Label>
                </td>
                <td class="form-fld-val">
                    <asp:LinkButton ID="linkExcel" Visible="false" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                </td>
            </tr>
               <tr>
                                    <td>
                                        <asp:Label ID="lblTotRecInFile" Visible="false" Text="TotRecord" runat="server">                    
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTotRecUpload" Visible="false" Text="TotRecUpload" runat="server">                    
                                        </asp:Label>
                                    </td>
                                    </tr>
                                  <tr>
                                    <td>
                                        <asp:Label ID="lblRejct" Visible="false" Text="NoOfRecdRejct" runat="server">                    
                                        </asp:Label>
                                    </td>
                                </tr>
            <tr>
                                    <td class="form-fld-lbl">
                                      <asp:Label ID="lblMsg" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
        </table>
        <div id="Div1" style="display: none" runat="server">
            <asp:TextBox ID="txtFilePath" runat="server">      
            </asp:TextBox>
        </div>
    </asp:Panel>
        <div id="Div2" style="display: none" runat="server">
            <asp:Button ID="hiddBtnFillUtility" runat="server" OnClick="hiddBtnFillUtility_Click" />
            <%--<asp:Button ID="hiddnbtnChkSolId" runat="server" OnClick="hiddnbtnChkSolId_Click" />--%>
            <%-- <asp:Button ID="hiddBtnFillBranch" runat="server" 
                        onclick="hiddBtnFillBranch_Click" />--%>
        </div>
    </center>

</asp:Content>



