<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_AcceptReject, App_Web_acceptreject.aspx.bf0ff4eb" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager> 
    </div>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
        runat="server" />
    <asp:CustomValidator ForeColor="Red" ID="cvOk" OnServerValidate="cvOk_ServerValidate"
        Display="None" runat="server" ValidationGroup="vgOk"></asp:CustomValidator>
    <div style="text-align: center;">
        <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnl" GroupingText="Accept/Reject" runat="server" Width="100%">
                    <div align="center">
                        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                        <table width="80%">
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblFileName" Text="Select Acceptance File :" runat="server"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:FileUpload ID="fileupld" runat="server" Width="450px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td colspan="2" align="center">
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" class="myButton" Width="60px" Height="25px" CausesValidation="true"
                                        ValidationGroup="vgOk" OnClick="btnUpload_Click" />
                                    <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" ID ="lblcntmsg">Total Numbers Of Records In File : </asp:label>
                                    <asp:Label runat="server" ID="lblacceptcount"></asp:Label>
                                </td>
                                <td>
                                    <asp:label runat="server" ID ="lblupdcount">Number Of Records Uploaded : </asp:label>
                                    <asp:Label runat="server" ID="lblupdatecount"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>
        </asp:UpdatePanel>
        <!-- [Start] Ajax Loading -->
        <div id="divProgress" style="display: none;">
            <div class="action-progress" style="font-weight: bold;">
                Processing your request. Please wait....
            </div>
        </div>
        <div id="divMain" class="UnFreezePage">
        </div>
        <!-- [End] Ajax Loading -->
    </div>
</asp:Content>


