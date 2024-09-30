<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="ResetPassword, App_Web_resetpassword.aspx.cdcab7d2" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
        .style2
        {
            height: 26px;
        }
        .txt
        {
            padding: 2px;
            border-width: 1px; /* border-color:Black; */
        }
        .txt:focus
        {
            padding: 2px;
            border-width: 1px;
            border-color: Black;
        }
    </style>
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" Display="None" ValidationGroup="vgOK"
                    OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <asp:Panel ID="pnl" GroupingText="Password Reset" runat="server" Width="100%">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table width="60%">
                                    <tr>
                                        <td align="right" class="style2" height="25">
                                            <asp:Label ID="Label3" runat="server" Text="Branch"></asp:Label>
                                        </td>
                                        <td align="left" class="style2">
                                            <asp:DropDownList ID="drpBranch" Style="padding: 2px" runat="server" OnSelectedIndexChanged="drpBranch_SelectedIndexChanged"
                                                Width="200px" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblBranch" ForeColor="Red" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="*" ForeColor="Red"
                                                Font-Bold="False" ControlToValidate="drpBranch">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style2" height="25">
                                            <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700" class="style2">
                                            <asp:DropDownList ID="drpUserID" Style="padding: 2px" runat="server" Width="200px">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblUserID" ForeColor="Red" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="*" ForeColor="Red"
                                                Font-Bold="False" ControlToValidate="drpUserID">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" height="25">
                                            <asp:Label ID="Label1" runat="server" Text="New Password"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700">
                                            <asp:TextBox ID="txtNewPwd" Style="padding: 2px" runat="server" TextMode="Password"
                                                Width="195px"></asp:TextBox>
                                            <asp:Label ID="lblNewPwd" ForeColor="Red" Font-Bold="true" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ErrorMessage="Select New Password"
                                                ForeColor="Red" Font-Bold="False" ControlToValidate="txtNewPwd">*</asp:RequiredFieldValidator>--%>
                                            <asp:RegularExpressionValidator ID="RegexNewPwd" runat="server" ValidationGroup="vgOK"
                                                ControlToValidate="txtNewPwd" Display="None" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                                                ErrorMessage="Password of Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="Label5" Text="(Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character)"
                                                runat="server" ForeColor="Red" Font-Size="XX-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style1" height="25">
                                            <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700" class="style1">
                                            <asp:TextBox ID="txtCpwd" Style="padding: 2px" runat="server" TextMode="Password"
                                                Width="195px"></asp:TextBox>
                                            <asp:Label ID="lblConfirmPwd" ForeColor="Red" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvCnfrmPwd" runat="server" ErrorMessage="Confirm Password"
                                               ForeColor="Red" Font-Bold="False" ControlToValidate="txtCpwd" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblComment" Text="Reset Comment" runat="server"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtComment" runat="server" Width="195px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="25">
                                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" height="25">
                                            <asp:Button ID="btnChange" runat="server" Style="margin-right: 1px" Text="Change"
                                                CausesValidation="true" ValidationGroup="vgOK" OnClick="btnChange_Click" />
                                            <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
