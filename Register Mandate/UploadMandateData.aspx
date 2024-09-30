<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_UploadMandateData, App_Web_uploadmandatedata.aspx.bf0ff4eb" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
  </asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" 
        AsyncPostBackTimeout="360000">
    </asp:ScriptManager>
    <div style="text-align: center;">
        <center>
            <asp:UpdatePanel ID="upTRNInwardRpt" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:Panel ID="pnl" GroupingText="Upload ACH Debit file from Client" runat="server"
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
                                        <asp:DropDownList ID="ddlUtilityName" runat="server" Width="460px">
                                        </asp:DropDownList>
                                    </td>
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
                                                    ErrorMessage="Select Only .xls or .xlsx or .txt" 
                                                ValidationGroup="vgOk" ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$|.*\.([Xx][Ll][Ss])$|.*\.([Tt][Xx][Tt])$)"
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
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" Width="80" OnClick="btnUpload_Click" />
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
    
 

