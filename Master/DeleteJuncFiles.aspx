<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.DeleteJuncFiles, App_Web_deletejuncfiles.aspx.28963a75" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>  
    <script type="text/javascript">
        function dateSelectionChanged(sender, args) {
            // FillUtility();
        }
        function Backup() {
            var vbtnBackup = document.getElementById('MainContent_hiddBtnvBackup');            
            vbtnBackup.click();           
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
                    // FillUtility();
                }
            }
        }
        function ConfirmToDelete() {

            var retVal = confirm("Do you want to take backup?");          
            if (retVal == true) {         
                 return true;
            } else {
                return false;
            }

        }
    </script>
    <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <%--<asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgDelete"
                runat="server" HeaderText="Following errors occured while performing the action" />
            <asp:CustomValidator ForeColor="Red" ID="cvDelete" runat="server" ValidationGroup="vgDelete"
                Display="None" OnServerValidate="cvDelete_ServerValidate"></asp:CustomValidator>
            <center>
                <asp:Panel ID="pnl" GroupingText="Delete Junc Data" runat="server" Width="100%">
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <table>
                        <tr>
                            <td>
                                Date :
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" onkeydown="return MoveNext('MainContent_btnDelete',event.keyCode);"
                                    runat="server"></asp:TextBox>
                                <asp:MaskedEditExtender ID="mskDate" TargetControlID="txtDate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter the Date"
                                    ValidationGroup="vgDelete" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                                <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                                    Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr style="height: 40px">
                            <td colspan="4" style="text-align: center;">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="100px" OnClientClick="return ConfirmToDelete();"
                                    ValidationGroup="vgDelete" CausesValidation="true" OnClick="btnDelete_Click"/>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" OnClick="btnCancel_Click" />
                            </td>
                           
                        </tr>
                        
                        <tr>
                            <asp:Label ID="lblMsg" runat="server">
                            </asp:Label>
                        </tr>
                    </table>
                </asp:Panel>
            </center>
            <div id="Div1" style="display: none" runat="server">
                <asp:Button ID="hiddBtnvBackup" runat="server" OnClick="hiddBtnvBackup_Click" />
               <%-- <asp:Button ID="hiddBtnvBackup" runat="server" OnClick="hiddBtnvBackup_Click" />--%>
            </div>
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <%-- <!-- [Start] Ajax Loading -->
        <div id="divProgress" style="display: none;">
            <div class="action-progress" style="font-weight: bold;">
                Processing your request. Please wait....
            </div>
        </div>
        <div id="divMain" class="UnFreezePage">
        </div>
        <!-- [End] Ajax Loading -->--%>
</asp:Content>
