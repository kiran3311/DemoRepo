<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_UploadDestinationBankMandateRequest, App_Web_uploaddestinationbankmandaterequest.aspx.1f1b7ac7" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/1.8.3jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/1.9.1jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
 <asp:ScriptManager ID="ScriptManager1" runat="server">  <%--EnablePageMethods="true" AsyncPostBackTimeout="3600"--%>
    </asp:ScriptManager>
    <div style="text-align: center;">
        <center>
         <asp:UpdatePanel ID="upDestBnkMndReq" runat="server">
                <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel ID="pnl" GroupingText="Upload Destination Bank Mandate Requests" runat="server"
                Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk" Display="None"
                    OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <div align="center">
                    <table width="80%" > 
                        <tr>
                            <td align="right" id=" " width="25%">
                                <asp:Label ID="lblFilename" Text="Inward File :" runat="server" Font-Names="Verdana"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="fileupld" runat="server" Font-Names="Verdana" Width="512px" />
                                <%--<asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="fileupld"
                                    ErrorMessage="Select Only .zip or .ZIP" ValidationGroup="vgOk" ValidationExpression="(.*\.([Zz][Ii][Pp])$)"
                                    ForeColor="#FF0066"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="btnOK" runat="server" Text="OK" class="myButton" Width="60px" Height="25px" CausesValidation="true"
                                    ValidationGroup="vgOk" OnClick="btnOK_Click" />
                                <asp:Button ID="btnclose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click" />
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <asp:Label ID="lblMsg" Text="" runat="server" Font-Bold="true"></asp:Label>
                    <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                </div>
                <div id="Div1" style="display: none" runat="server">
                    <asp:TextBox ID="txtFilePath" runat="server">      
                    </asp:TextBox>
                </div>
            </asp:Panel>
             </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnOK" />
                    <asp:PostBackTrigger ControlID="linkExcel" />
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


