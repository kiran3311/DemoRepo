<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_RegenerateMandateRegistration, App_Web_regeneratemandateregistration.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
<script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function ProcessDate() {
            debugger;
            var vbtnProcessDate = document.getElementById('MainContent_hiddProcessDate');
            vbtnProcessDate.click();
        }
        function cnfrmtym() {
            var getval = document.getElementById('MainContent_hiddCompareDates');
            var val = getval.value;
            if (val == "True") {
                alert('System Date and Login Date is incorrect, you are not able to generate the report.');
                return; 
            }
            var getval1 = document.getElementById('MainContent_hiddNpciTime');
            var valNpciTime = getval1.value;
            if (valNpciTime == "True") {
                var result = confirm('Your NPCI Window Time has been Expired. Still You Want to Generate?');
                if (result == true) {
                }
                else {
                    return false;
                }
            }
        }
        function CallProcessDate(ctrl, _key)
        {
            
                var mCtrl;
                if (_key == 13) {
                    ProcessDate();
                    }
        }
    </script>
    <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />        
    </div>
    <!-- [Start] Ajax Loading -->
     <style type="text/css">
        .pnl
        {
            margin: 10px;
        }
        .lbl
        {
            text-align: right;
        }
        .style1
        {
            height: 30px;
        }
        .Panel fieldset
        {
            border: 1px solid black;
            border-width: 1px;
        }
        
    </style>
    <asp:UpdatePanel ID="upt" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table style="width: 100%;">
                <tr>
                    <td style="width: 50%" valign="top">
                        <asp:Panel GroupingText="NPCI Details" CssClass="Panel" runat="server" ID="npci">
                            
                            <div style="margin-top: 25px" style="display:none">
                                <span>
                                    <asp:Label ID="lblUtilityName" CssClass="lbl" Width="95px" runat="server" Text="Utility Name:" Visible="false"></asp:Label></span><span
                                        style="padding-left: 3px"><asp:TextBox ID="txtUtilityName" Width="277px" runat="server"
                                            ReadOnly="true" Visible="false"></asp:TextBox></span></div>
                            <div>
                                 <asp:RadioButtonList ID="rbtNPCI" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtNPCI_SelectedIndexChanged">
                                  <asp:ListItem Text="NPCI User" Value="NPCI" Selected="True"></asp:ListItem>
                                  <asp:ListItem Text="Bank User" Value="Bank"></asp:ListItem>
                              </asp:RadioButtonList>
                            </div>
                                            <div>
                                <span>
                                    <asp:Label ID="lblNPCILoginId" Width="95px" CssClass="lbl" runat="server" Text="NPCI Login Id:"></asp:Label></span><span
                                        style="padding-left: 3px"><asp:TextBox ID="txtNPCILoginId" Width="277px" runat="server"></asp:TextBox></span></div>
                            <div style="margin-top: 5px">
                                <span>
                                    <asp:Label ID="lblNPCIUserCode" CssClass="lbl" Width="95px" runat="server" Text="NPCI UserCode:" Visible="false"></asp:Label></span><span
                                        style="padding-left: 3px"><asp:TextBox ID="txtNPCIUserCode" Width="277px" runat="server"
                                            ReadOnly="true" Visible="false"></asp:TextBox></span></div>
                        </asp:Panel>
                        <asp:Panel ID="Panel1" runat="server" Style="margin-top: 40px; border: 1px solid black;">
                            <div style="margin: 5px; margin-left: 0px; margin-bottom: 10px">
                                <div>
                                    <span style="margin-left: 115px">
                                        <asp:Label ID="Label3" Style="text-align: center" runat="server" Width="112px" Text="Successful"></asp:Label></span>
                                    <span>
                                        <asp:Label ID="Label4" Style="text-align: center" runat="server" Width="112px" Text="Rejected"></asp:Label></span>
                                </div>
                                <div style="margin-top: 5px">
                                    <span>
                                        <asp:Label ID="Label1" runat="server" CssClass="lbl" Width="112px" Text="Create Mandate:"></asp:Label></span>
                                    <span style="padding-left: 3px">
                                        <asp:TextBox ID="txtSucCreate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span><span style="padding-left: 3px">
                                        <asp:TextBox ID="txtRejCreate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span>
                                </div>
                                <div style="margin-top: 5px">
                                    <span>
                                        <asp:Label ID="lblUpdateMndt" runat="server" CssClass="lbl" Width="112px" Text="Update Mandate:"></asp:Label></span>
                                    <span style="padding-left: 3px">
                                        <asp:TextBox ID="txtSucUpdate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span><span style="padding-left: 3px">
                                        <asp:TextBox ID="txtRejUpdate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span>
                                </div>
                                <div style="margin-top: 5px">
                                    <span>
                                        <asp:Label ID="lblCancelMndt" runat="server" CssClass="lbl" Width="112px" Text="Cancel Mandate:"></asp:Label></span>
                                    <span style="padding-left: 3px">
                                        <asp:TextBox ID="txtSucCancel" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span><span style="padding-left: 3px">
                                        <asp:TextBox ID="txtRejCancel" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                    </span>
                                </div>
                            </div>
                        </asp:Panel>
                        <div style="padding: 5px; width: 400px ;margin-top: 10px">
                            <span>
                                <asp:Label ID="lblNofFiles" Width="112px" CssClass="lbl" runat="server" Text="No of Files"></asp:Label></span><span
                                    style="padding-left: 3px">
                                    <asp:TextBox ID="txtFiles" Width="107px" runat="server" ReadOnly="true"></asp:TextBox></span>
                        </div>
                    </td>
                    <td valign="top" style="width: 50%">
                        <asp:Panel GroupingText="Upload Files" CssClass="Panel" runat="server" ID="pnl2"
                            Height="307px">
                            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgProcessDate"
                                runat="server" HeaderText="Following errors occured while performing the action" />
                            <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgProcessDate"
                                Display="None" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblProcessDate" runat="server" Text="Process Date :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProcessDate" runat="server" Width="80px" onkeydown="CallProcessDate(this, event.keyCode);" onblur="ProcessDate();"></asp:TextBox><scop style="color:red">*</scop>
                                        <asp:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="txtProcessDate"
                                            Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                            OnInvalidCssClass="MaskedEditError" MaskType="Date" InputDirection="LeftToRight"
                                            AcceptNegative="Left" DisplayMoney="None" ErrorTooltipEnabled="True" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBatchFr" runat="server" CssClass="lbl" Text="File Name :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged"
                                            Text="Select All" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td height="175" valign="top">
                                        <asp:CheckBoxList ID="chkBatch" runat="server" RepeatLayout="Flow" OnSelectedIndexChanged="chkBatch_CheckedChanged" AutoPostBack="true">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr align="right">
                    <td align="center" class="style1" colspan="2">
                        <asp:Button ID="btnProcess" class="myButton" Width="60px" Height="25px" Text="Process" runat="server" CausesValidation="true"
                            ValidationGroup="vgProcess" OnClick="btnProcess_Click" OnClientClick="return cnfrmtym();" />
                        <asp:Button ID="btnClose" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click" runat="server" Text="Close" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span style="padding: 10px">
                            <asp:Label runat="server" ID="lblFlName" Width="100%"></asp:Label>
                        </span>
                    </td>
                </tr>
            </table>
            <div style="display: none">
                <asp:HiddenField ID="hiddCompareDates" runat="server" Value="" />
                <asp:HiddenField ID="hiddNpciTime" runat="server" Value="" />
                <asp:Button ID="hiddProcessDate" runat="server" CausesValidation="true" ValidationGroup="vgProcessDate"
                 OnClick="hiddProcessDate_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
         <div id="divMain" class="UnFreezePage">
    </div>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    </div>
</asp:Content>

