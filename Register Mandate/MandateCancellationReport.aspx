<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_MandateCancellationReport, App_Web_mandatecancellationreport.aspx.bf0ff4eb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
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
        //function FillUtility() {
        //    var vbtnFillUtility = document.getElementById('MainContent_hiddBtnFillUtility');
        //    vbtnFillUtility.click();
        //}

        //function SoleIDCheck() {
        //    var vbtnChkSoleID = document.getElementById('MainContent_hiddnbtnChkSolId');
        //    vbtnChkSoleID.click();
        //}

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
                <asp:Panel ID="pnl" GroupingText="Mandate Cancellation report" runat="server" Width="100%">
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                    <table>                
                        <tr>
                            <td style="text-align: right">
                                <b>Process Date From:</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFromDate" Width="80px" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter From Date"
                                    ValidationGroup="vgOk" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                                <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                                    Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtFromDate">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                              <b>To :</b>  
                            </td>
                            <td>
                                <asp:TextBox ID="txtToDate" Width="80px" onkeydown="MoveNextWithServer(this, event.keyCode)" onblur="FillUtility();"
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                                    ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton2"
                                    Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtToDate">
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
                    </div>
                </asp:Panel>
              
            </ContentTemplate>
           
        </asp:UpdatePanel>
    </center>
</asp:Content>

