<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_ReceiveNPCIACK, App_Web_receivenpciack.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
   
    <div style="text-align: center;">
        <center> 
            <asp:UpdatePanel ID="upPnl" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:Panel ID="pnl" GroupingText="Receive NPCI Ack"  runat="server" Width="100%">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                            runat="server" HeaderText="Following errors occured while performing the action" />
                        <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                            ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
                        <div align="center">
                            <table width="80%">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblFileName" Text="ACK Filename :" ToolTip="" runat="server"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:FileUpload runat="server" ID="fileupld" Width="512" />
                                    </td>                                   
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr style="height: 20px">
                                    <td colspan="2" align="center">
                                        <asp:Button runat="server" ID="btnUpdate" Text="Upload" class="myButton" Width="60px" Height="25px" OnClick="btnUpdate_Click"
                                            CausesValidation="true" ValidationGroup="vgOK" />
                                        <asp:Button runat="server" ID="btnClose" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblSuccess" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblFailed" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblTotal" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblMsg" Text="Msg" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <!-- [Start] Ajax Loading -->
                    <div id="divProgress" style="display: none;">
                        <div class="action-progress" style="font-weight: bold;">
                            Processing your request. Please wait....
                        </div>
                    </div>
                    <div id="divMain" class="UnFreezePage">
                    </div>
                    <!-- [End] Ajax Loading -->
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnUpdate" />
                </Triggers>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>


