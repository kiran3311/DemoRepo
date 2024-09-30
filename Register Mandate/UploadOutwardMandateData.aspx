<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_UploadOutwardMandateData, App_Web_uploadoutwardmandatedata.aspx.bf0ff4eb" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
                 window.onsubmit = function () {
                     if (Page_IsValid) {
                         var updateProgress = $find("<%= UpdateProgress1.ClientID %>");
                         window.setTimeout(function () {
                             updateProgress.set_visible(true);
                         }, 100);
                     }
                 }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upTRNInwardRpt">
    <ProgressTemplate>
    <div class="modal">
        <div class="center">
            <img src="../loader.gif" alt="loader"> 
        </div>
    </div>
 </ProgressTemplate>
   </asp:UpdateProgress>
    <div style="text-align: center;">
        <center>
           <asp:UpdatePanel ID="upTRNInwardRpt" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:Panel ID="pnl" GroupingText="Upload OutWard Mandate Requests-Excel" runat="server"
                        Width="100%">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                            runat="server" HeaderText="Following errors occured while performing the action" />
                        <asp:CustomValidator ForeColor="Red" ID="cvOk" OnServerValidate="cvOk_ServerValidate"
                            Display="None" runat="server" ValidationGroup="vgOk"></asp:CustomValidator>
                        <div align="center">
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblUtilName" Text="Utility Name :" runat="server"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlUtilityName" runat="server" Width="400px">
                                        </asp:DropDownList>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblPrFile" Text="Client Presentation File :" runat="server"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:FileUpload ID="fileupld" runat="server" Width="512px" />
                                        </td>
                                        <td>
                                            <span style="float: right">
                                                <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="fileupld"
                                                    ErrorMessage="Select Only .xls or .xlsx" ValidationGroup="vgOk" ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$|.*\.([Xx][Ll][Ss])$)"
                                                    Display="Dynamic" ForeColor="#FF0066"></asp:RegularExpressionValidator>
                                            </span>
                                        </td>
                                    </tr>
                                <tr style="height: 20px">
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnImport" runat="server" Text="Import" Width="80" OnClick="btnImport_Click"
                                            CausesValidation="true" ValidationGroup="vgOk" />
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" Width="80" OnClick="btnUpload_Click" CausesValidation="true" ValidationGroup="vgOk" />
                                        <asp:Button ID="btnClose" runat="server" Text="Close" Width="80" OnClick="btnClose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTotRecInFile" Text="TotRecord" runat="server">                    
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTotRecUpload" Text="TotRecUpload" runat="server">                    
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRejct" Text="NoOfRecdRejct" runat="server">                    
                                        </asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMsg" Text="Msg" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="Div1" style="display: none" runat="server">
                            <asp:TextBox ID="txtFilePath" runat="server">      
                            </asp:TextBox>
                        </div>
                    </asp:Panel>
               </ContentTemplate>
               <Triggers>
                    <asp:PostBackTrigger ControlID="btnImport" />
                    <asp:PostBackTrigger ControlID="linkExcel" />
                </Triggers>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .Panel fieldset
        {
            border-color: Black;
            border-width: 1px;
        }
        .style1
        {
            height: 28px;
        }

        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            /* background-color :White; */
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
            margin-top:15%;
            margin-left:40%;
        }
    </style>
</asp:Content>



