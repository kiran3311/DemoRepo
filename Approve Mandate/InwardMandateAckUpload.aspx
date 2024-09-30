<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_InwardMandateAckUpload, App_Web_inwardmandateackupload.aspx.1f1b7ac7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnablePageMethods="true" />
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function ZipFileMsg() {
            alert("Please Select the ZIP file for ACK Updation");
        }

        function NPCIBnkCode_Mismatch() {
            alert("Login NPCI Bank Code not matching with selected zip file");
        }
        function AlreadyImported() {
            alert("This File is already imported,select another zip file");
        }
        function FileUploadSuccess() {

            alert("File Sucesfully Uploaded");
        }
        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl); 
                _next.focus();
                return false;
            }
        }
    </script>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" runat="server" ValidationGroup="vgOk"
        HeaderText="Following errors occured while performing the action" />
    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
    <div style="text-align: Center;">
        <center>
            <asp:UpdatePanel ID="upUpldACHTrnAck" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <div>
                        <asp:Panel ID="pnl1" runat="server" GroupingText="Inward Ack Upload" Width="100%">
                            <table>
                                <tr align="left">
                                    <td align="left">
                                        <asp:Label ID="lblselectfile" runat="server" Text="Select Acknowledgement File :"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:FileUpload ID="FileUpload1" Width="250px" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <asp:Button ID="btnupld" runat="server" Text="Upload" class="myButton" Width="60px" Height="25px" ValidationGroup="vgOk"
                                            CausesValidation="true" OnClick="btnupld_Click" />
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="btnclose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnclose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblTotal" runat="server" Text="Total Records:" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="lbltot" runat="server" Text="" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblAccepted" runat="server" Text="Uploaded Records:" ForeColor="Red"
                                            Font-Bold="true"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="lblacc" runat="server" Text="" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnupld" />
                </Triggers>
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
    </div>
</asp:Content>

