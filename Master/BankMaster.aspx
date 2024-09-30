<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.BankMaster, App_Web_bankmaster.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updPanel" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel ID="panel1" GroupingText="Bank Details" runat="server" Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" OnServerValidate="cvOk_ServerValidate"
                    Display="None" runat="server" ValidationGroup="vgOk"></asp:CustomValidator>
                <div align="center">
                    <table>
                        <tr>
                            <td align="right"> 
                                <asp:Label ID="lblUplaodFile" Text="Upload File Name :" Font-Bold="true" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="UploadFile" Width="500px" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btnAdd" Text="Add" class="myButton" Width="60px" Height="25px" CausesValidation="true" ValidationGroup="vgOk"
                                    runat="server" OnClick="btnAdd_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnClose" Text="Close" class="myButton" Width="60px" Height="25px" runat="server" OnClick="btnClose_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblNoRecords" Text="No Of Records Uploaded" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblRecords" Text="" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
