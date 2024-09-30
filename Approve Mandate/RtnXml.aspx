<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_RtnXml, App_Web_rtnxml.aspx.1f1b7ac7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">   
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>    
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" language="javascript">
         //------for unlocking the batches on pageleave ----------
         // Register the event.
         //window.onbeforeunload = function () {
            // PageMethods.UnlockOnPageLeave();
         //}
    </script>
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
    <div>
       <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnablePageMethods="true" AsyncPostBackTimeout="3600"/>
    </div>
    <center>
        <asp:UpdatePanel ID="upPnl" runat="server">
            <ContentTemplate>
            <uc:ErrorCtrll id="ucErrorCtrll" runat="server"/>
                <asp:Panel ID="pnl" GroupingText="Generate NPCI Upload Files" runat="server" Width="100%">
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                        ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
                    <table width="100%">
                        <tr>
                            <td align="right" width="50%">
                                Utility Name :</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlUtilityName" Width="200px" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                    OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" onkeydown="return MoveNext('MainContent_btnShow',event.keyCode);" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvBatchNo" runat="server" ForeColor="Red" Display="None"
                                    ErrorMessage="Please Select the Utility Name" ValidationGroup="vgOk" ControlToValidate="ddlUtilityName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Utility Code :</td>
                            <td align="left">
                                <asp:TextBox ID="txtUtilityCode" ReadOnly="true" class="ReadOnlyfld" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                               </td>
                            <td align="left">
                                 <asp:RadioButtonList ID="rbtNPCI" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtNPCI_SelectedIndexChanged">
                                  <asp:ListItem Text="NPCI User" Value="NPCI" Selected="True"  ></asp:ListItem>
                                  <asp:ListItem Text="Bank User" Value="Bank" ></asp:ListItem>
                              </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                NPCI Login Id :</td>
                            <td align="left">
                                <asp:TextBox ID="txtNPCILoginId" class="ReadOnlyfld" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Upload Date :</td>
                            <td align="left">
                                <asp:TextBox ID="txtUploadDate" ReadOnly="true" class="ReadOnlyfld" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Accepted :</td>
                            <td align="left">
                                <asp:TextBox ID="txtAccepted" ReadOnly="true" class="ReadOnlyfld" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Rejected :</td>
                            <td align="left">
                                <asp:TextBox ID="txtRejected" ReadOnly="true" class="ReadOnlyfld" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnShow" runat="server" Text="OK" class="myButton" Width="60px" Height="25px" OnClick="btnShow_Click"
                                    CausesValidation="true" ValidationGroup="vgOK" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click" />
                            </td>
                        </tr>
                        <tr>
                           <td colspan="4">
                            <asp:Label ID="lblmsg" Text="" runat="server"></asp:Label>
                           </td>
                        </tr>
                    </table>
                </asp:Panel>
                <%--<div id="Div1" style="display:none" runat="server">
       <asp:Button ID="hiddBtnOk" runat ="server" ValidationGroup="vgCustom" CausesValidation="true" />              
    </div>--%>
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
    </center>
</asp:Content>
