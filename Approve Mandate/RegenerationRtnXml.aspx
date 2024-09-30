<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_RegenerationRtnXml, App_Web_regenerationrtnxml.aspx.1f1b7ac7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .normalfld
        {
            background-color: #FFFFFF;
        }
        .ReadOnlyfld
        {
            background-color: #FFFFCC;
        }
    </style>
    <script type="text/javascript">
        function ProcessDate() {
            //var close = document.getElementById('MainContent_btnClose');
            //var curElement = document.activeElement;
            //if (!close.click) {
            //alert(curElement.id);
                var btnProcessDate = document.getElementById('MainContent_btnProcessDate');
                btnProcessDate.click();
            //}
        }
        //------for unlocking the Utility on pageleave ----------
        // Register the event.
        window.onbeforeunload = function () { 
            PageMethods.UnlockOnPageLeave();
        }
    </script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
    <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnablePageMethods="true" />
    </div>
    <%--<center>--%>
    <asp:UpdatePanel ID="upPnl" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                runat="server" HeaderText="Following errors occured while performing the action" />
            <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>

            <asp:CustomValidator ForeColor="Red" ID="cvProcessDate" runat="server" Display="None"
                ValidationGroup="vgProcessDate" OnServerValidate="cvProcessDate_ServerValidate"></asp:CustomValidator>

            <asp:Panel ID="pnl" GroupingText="Upload Files" runat="server" Width="500px">
                <div align="center">
                    <table width="100%">
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblProcessDate" runat="server" Text="Process Date:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtProcessDate" runat="server" Width="80px" onblur="ProcessDate()"></asp:TextBox>
                                <asp:MaskedEditExtender ID="mskProcessDate" TargetControlID="txtProcessDate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <%--<asp:RequiredFieldValidator ID="rfvProcessDate" runat="server" Display="None" ErrorMessage="Please Enter Process Date"
                                    CausesValidation="true" ValidationGroup="vgOK" ControlToValidate="txtProcessDate"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                               </td>
                            <td align="left">
                                 <asp:RadioButtonList ID="rbtNPCI" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtNPCI_SelectedIndexChanged">
                                  <asp:ListItem Text="NPCI User" Value="NPCI" Selected="True"></asp:ListItem>
                                  <asp:ListItem Text="Bank User" Value="Bank" ></asp:ListItem>
                              </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblNPCILoginId" Text="NPCI LoginId :" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNPCILoginId" runat="server" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-fld-lbl" align="right">
                                <asp:Label ID="lblUtilityName" runat="server" Text="Utility Name:"></asp:Label>
                            </td>
                            <td class="form-fld-val" align="left">
                                <asp:DropDownList ID="ddlUtilityName" Width="250px" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" onkeydown="return MoveNext('MainContent_btnShow',event.keyCode);">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvBatchNo" runat="server" ForeColor="Red" Display="None"
                                    ErrorMessage="Please Select the Utility Name" ValidationGroup="vgOk" ControlToValidate="ddlUtilityName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblUtilityCode" runat="server" Text="Utility Code:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtUtilityCode" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblAccept" runat="server" Text="Accepted:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAccepted" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblRejected" runat="server" Text="Rejected:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtRejected" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblFileName" Text="File Name:" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <div style="height: 200px; width: 350px; overflow: auto; border-style: solid; border-width: 1px">
                                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged"
                                        Text="Select All" />
                                    <br>
                                    <asp:CheckBoxList ID="chkFilename" runat="server" AutoPostBack="true" RepeatLayout="Flow" OnSelectedIndexChanged="chkFilename_SelectedIndexChanged">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center;">
                                <asp:Button ID="btnShow" runat="server" Text="OK" class="myButton" Width="60px" Height="25px" OnClick="btnShow_Click"
                                    CausesValidation="true" ValidationGroup="vgOK" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click"  CausesValidation="false"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblmsg" Text="" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <div id="Div1" style="display: none" runat="server">
                <asp:Button ID="btnProcessDate" runat="server"
                    OnClick="btnProcessDate_Click" CausesValidation="true" ValidationGroup="vgOK"/> <%--  --%>
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


