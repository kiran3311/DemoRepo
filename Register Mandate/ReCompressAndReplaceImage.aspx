<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_ReCompressAndReplaceImage, App_Web_recompressandreplaceimage.aspx.bf0ff4eb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     
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
        //function FillBranch() {
        //    var vbtnFillBranch = document.getElementById('MainContent_hiddBtnFillBranch');
        //    vbtnFillBranch.click();
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
   
  
         <%--   </ContentTemplate>
          <Triggers>
            <asp:PostBackTrigger ControlID="btnOk" />
            <asp:PostBackTrigger ControlID="linkExcel" />
        </Triggers>
        </asp:UpdatePanel>--%>
        <!-- [Start] Ajax Loading -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
     <center>
     <%--  <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <asp:Panel ID="pnlOne" GroupingText="Image Compression" runat="server" Width="100%">
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                    <table>

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
                                               
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblReportType" Text="Type :" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlRptType" runat="server" Width="200px" onkeydown="return MoveNext('MainContent_txtFromDate',event.keyCode);">
                                    <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Ack Rejected" Value="Ack Rejected"></asp:ListItem>
                                     <asp:ListItem Text="File to be Upload" Value="File to be Upload"></asp:ListItem>                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRptType" runat="server" Display="None" ErrorMessage="Please Select the Type"
                                    ValidationGroup="vgOk" ControlToValidate="ddlRptType"></asp:RequiredFieldValidator>
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
                                <asp:LinkButton ID="linkExcel" runat="server" Visible="false" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
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
    </center>
</asp:Content>

