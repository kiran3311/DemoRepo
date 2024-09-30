<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.ApplicationSettings, App_Web_setup.aspx.4cd3357d" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            else
                return true;
        }
    </script>
     <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnablePageMethods="true" />
    </div>
    <div style="text-align: center;">
        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
            runat="server" HeaderText="Following errors occured while performing the action" />
        <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" OnServerValidate="cvOk_ServerValidate"
            Display="None" ValidationGroup="vgOk"></asp:CustomValidator>
        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
        <div style="height: 30px">
        </div>
        <asp:Panel ID="Panel1" GroupingText="Application Setting" runat="server" Width="100%">
            <table width="80%">
                <tr>
                    <td align="left">
                        Default Scanner
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlDefaultScanner" runat="server" Width="100px">
                            <asp:ListItem Text="CTS LS150" Value="SAVINGS"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Scan Locally
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkScanLocally" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Authorization - Four eye Principle
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkEyePrinciple" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Authorization - Checker
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkAuthChecker" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Authorization for Images &amp; data Upload
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkAuthforUploadData" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Process same Bank Transaction separately
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkOwnest" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        New Mandate Format
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="ChkNewMndtFormat" runat="server" />
                    </td>
                </tr>
                <%--<tr>
                    <td align="left">
                        Password Expiry Cycle
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlPwd" runat="server" Width="100px">
                            <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                            <asp:ListItem Text="30Days" Value="30Days"></asp:ListItem>
                            <asp:ListItem Text="60Days" Value="60Days"></asp:ListItem>
                            <asp:ListItem Text="90Days" Value="90Days"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPasswordExpCycle" runat="server" ControlToValidate="ddlPwd"
                            Display="None" ErrorMessage="Please Select Password Expiry Cycle" ValidationGroup="vgOk"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>
                <tr>
                    <td align="left">
                        Maximum Mandate Filesize for NPCI Upload (MB) :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtMMSSize" runat="server" Width="100px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Maximum Transaction Records for NPCI Upload :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtTXNRecord" runat="server" Width="100px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Maximum Records for CBS Upload :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCBSRecord" runat="server" Width="100px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Inward Batch Size :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtInwardBatch" runat="server" Width="100px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="left">
                        CBS Automation :
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkCBSAutomation" runat="server" />
                    </td>
                </tr>
                <%-- <tr>
                    <td align="left">
                        Set Image Path:
                    </td>
                    <td align="left">
                        <asp:FileUpload ID="ImgPath" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="ImgPath"
                            Display="None" ErrorMessage="Please Select Image Path" ValidationGroup="vgOk"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnl" GroupingText="NCPI Upload Window Timing" runat="server" Width="600px">
            <table>
                <tr>
                    <td align="left" class="style3">
                        Registration
                    </td>
                    <td>
                       From: <asp:TextBox ID="dtpMandateFrom" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="dtpMandateFrom"
                        Mask="99:99:99" MaskType="Time"  MessageValidatorTip="true" AcceptAMPM="true" autocompletevalue="00:00:00 AM" >
                        </asp:MaskedEditExtender>
                       
                    </td>
                    <td>
                        To: 
                    </td>
                    <td>
                        <asp:TextBox ID="dtpMandateTo" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="dtpMandateTo"
                        Mask="99:99:99" MaskType="Time"  MessageValidatorTip="true" AcceptAMPM="true" autocompletevalue="00:00:00 AM" >
                        </asp:MaskedEditExtender>
                        
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td >
                         <asp:MaskedEditValidator ID="MaskedEditValidator1" ForeColor="Red"  runat="server"  ControlToValidate="dtpMandateFrom"
                        ControlExtender="MaskedEditExtender1"  IsValidEmpty="false" EmptyValueMessage="Input time"
                        InvalidValueMessage="Invalid From Time (Registration)">  </asp:MaskedEditValidator>
                    </td>
                    <td></td>
                    <td>
                         <asp:MaskedEditValidator ID="MaskedEditValidator2" ForeColor="Red" runat="server"  ControlToValidate="dtpMandateTo"
                        ControlExtender="MaskedEditExtender1"  IsValidEmpty="false" EmptyValueMessage="Input time"
                        InvalidValueMessage=" Invalid To Time (Registration) ">  </asp:MaskedEditValidator>                        
                    </td>
                   
                </tr>
                <tr>
                    <td align="left" class="style3">
                        Transaction
                    </td>
                    <td>
                        From: <asp:TextBox ID="dtpTranFrom" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender3" runat="server" TargetControlID="dtpTranFrom"
                        Mask="99:99:99" MaskType="Time"  MessageValidatorTip="true" AcceptAMPM="true" autocompletevalue="00:00:00 AM" >
                        </asp:MaskedEditExtender>
                       
                    </td>
                    <td>
                        To: 
                    </td>
                    <td>
                        <asp:TextBox ID="dtpTranTo" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender4" runat="server" TargetControlID="dtpTranTo"
                        Mask="99:99:99" MaskType="Time"  MessageValidatorTip="true" AcceptAMPM="true" autocompletevalue="00:00:00 AM" >
                        </asp:MaskedEditExtender>
                        
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                         <asp:MaskedEditValidator ID="MaskedEditValidator3" runat="server" ForeColor="Red" ControlToValidate="dtpTranFrom"
                        ControlExtender="MaskedEditExtender1"  IsValidEmpty="false" EmptyValueMessage="Input time"
                        InvalidValueMessage="Invalid From Time (Transaction)">  </asp:MaskedEditValidator>
                       
                    </td>
                    <td>
                         <asp:MaskedEditValidator ID="MaskedEditValidator4" runat="server" ForeColor="Red" ControlToValidate="dtpTranTo" IsValidEmpty="false"
                        ControlExtender="MaskedEditExtender4" EmptyValueMessage="Input time" InvalidValueMessage="Invalid To Time (Transaction)">                         
                        </asp:MaskedEditValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table style="margin: 0px auto;">
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" CausesValidation="true"
                        ValidationGroup="vgOk" Text="OK" class="myButton" Width="60px" Height="25px" />
                    <asp:Button ID="btnclose" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                        class="myButton" Width="60px" Height="25px" />
                    <asp:Button ID="btnExit" runat="server" OnClick="btnExit_Click" Text="Exit" class="myButton" Width="60px" Height="25px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            width: 83px;
        }
        .style3
        {
            width: 95px;
        }
    </style>
</asp:Content>
