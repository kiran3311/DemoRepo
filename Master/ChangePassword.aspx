<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.ChangePassword, App_Web_changepassword.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
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
    <script type="text/javascript" language="javascript">
        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }

        //for backspace preventing causes postback
        function preventBackspace(e) {
            var evt = e || window.event;
            if (evt) {
                var keyCode = evt.charCode || evt.keyCode;
                if (keyCode === 8) {
                    if (evt.preventDefault) {
                        evt.preventDefault();
                    } else {
                        evt.returnValue = false;
                    }
                }
            }
        }
        //////////

    </script>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    <asp:UpdatePanel ID="upPnl" runat="server">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                    Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <asp:Panel ID="pnl" GroupingText="Change Password" runat="server" Width="100%">
                                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                                <table width="60%">
                                    <tr>
                                        <td align="right">
                                            User Name:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtName" ReadOnly="true" onKeyDown="preventBackspace();" runat="server"
                                                Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Old Password:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" Width="200px" AutoCompleteType="Disabled"
                                                onkeydown="return MoveNext('MainContent_txtNewPwd',event.keyCode);"></asp:TextBox>
                                        </td>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ForeColor="Red" Display="None"
                                            ErrorMessage="Enter Old Password" ValidationGroup="vgOk" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            New Password:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNewPwd" TextMode="Password" MaxLength="15" runat="server" Width="200px"
                                                AutoCompleteType="Disabled" onkeydown="return MoveNext('MainContent_txtConfPwd',event.keyCode);"></asp:TextBox>
                                        </td>
                                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ForeColor="Red" Display="None"
                                            ErrorMessage="Enter New Password" ValidationGroup="vgOk" ControlToValidate="txtNewPwd"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegexNewPwd" runat="server" ValidationGroup="vgOk"
                                            ControlToValidate="txtNewPwd" Display="None" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                                            ErrorMessage="New Password: Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                            ForeColor="Red" />
                                        <%--   <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtPwd" ValidationGroup="vgOk"
                                            Operator="Equal" ControlToCompare="txtNewPwd" ForeColor="Red" Type="String" Text="Passwords do not match">     
                                        </asp:CompareValidator>--%>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtPwd"
                                            Display="None" ValidationGroup="vgOk" Operator="NotEqual" ControlToCompare="txtNewPwd"
                                            ForeColor="Red" Type="String" ErrorMessage="New password and old Password can not be the same">
                                        </asp:CompareValidator>
                                        <%--<asp:CompareValidator ID="CVNewOld" runat="server" ControlToValidate="txtPwd" ValidationGroup="vgOk"
                                            Display="None" ControlToCompare="txtNewPwd" Type="String" Operator="Equal" ErrorMessage="New password and old Password can not be the same" />--%>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="Label1" Text="(Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character)"
                                                runat="server" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Confirm Password:
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtConfPwd" TextMode="Password" MaxLength="15" runat="server" Width="200px"
                                                onkeydown="return MoveNext('MainContent_ddlCategory',event.keyCode);"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCnfmPassword" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Enter Confirm Password" ValidationGroup="vgOk" ControlToValidate="txtConfPwd"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtNewPwd"
                                                Display="None" ValidationGroup="vgOk" Operator="Equal" ControlToCompare="txtConfPwd"
                                                ForeColor="Red" Type="String" ErrorMessage="Confirm password does not match with New Password">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;" height="30">
                                            <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="OK" ValidationGroup="vgOk"
                                                CausesValidation="true" class="myButton" Width="60px" Height="25px" />
                                            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                                                class="myButton" Width="60px" Height="25px" />
                                            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" class="myButton" Width="60px" Height="25px" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
