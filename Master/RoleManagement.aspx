<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.RoleManagement, App_Web_rolemanagement.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" language="javascript">
        function UpdateStatus() {
            alert("Update Successfully");
        }

    </script>
    <asp:Panel ID="pnl" GroupingText="Roll Management" runat="server" Width="100%">
        <div style="text-align: center;">
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
                runat="server" HeaderText="Following errors occured while performing the action" />
            <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
            <asp:CustomValidator ForeColor="Red" ID="cvsave" runat="server" ValidationGroup="vgsave" OnServerValidate="cvsave_ServerValidate"></asp:CustomValidator>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <div style="height: 30px">
            </div>
            <center>
                <table>
                    <tr>
                        <td>
                            User Name
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUserName" runat="server" Width="150px"> 
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Select the User Name" ValidationGroup="vgsave" ControlToValidate="ddlUserName"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" CausesValidation="true" ValidationGroup="vgOk" Text="OK" Width="80" />
                        </td>
                    </tr>
                </table>
            </center>
            <asp:Panel ID="pnlGrid" runat="server" Width="100%">
            <center>
                <table id="tblRoleMgnt" runat="server" border="1">
                    <tr style="padding: 20px">
                        <td style="width: 200px">
                        </td>
                        <td>
                            <asp:Label ID="lblCreate" Font-Bold="true" Text="Create" runat="server"> </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblApprove" Font-Bold="true" Text="Aprove" runat="server"> </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblImport" Font-Bold="true" Text="Import" runat="server"> </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblExport" Font-Bold="true" Text="Export" runat="server"> </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px; font-weight: bold">
                            Register Mandate
                        </td>
                        <td style="width: 100px;">
                            <asp:CheckBox ID="chkRMCr" runat="server" />
                        </td>
                        <td style="width: 100px;">
                            <asp:CheckBox ID="chkRMApr" runat="server" />
                        </td>
                        <td style="width: 100px;">
                            <asp:CheckBox ID="chkRMImp" runat="server" />
                        </td>
                        <td style="width: 100px;">
                            <asp:CheckBox ID="chkRMExp" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">
                            Approve Mandate
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAMCr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAMApr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAMImp" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAMExp" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">
                            Request Payment
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRPCr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRPApr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRPImp" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRPExp" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">
                            Approve Payment
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAPCr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAPApr" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAPImp" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAPExp" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">
                            User Management
                        </td>
                        <td>
                            <asp:CheckBox ID="chkUserMgnt" runat="server" />
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">
                            Role Management
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRoleMgnt" runat="server" />
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <%--</asp:Panel>--%>
                <table>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CausesValidation="true"
                                ValidationGroup="vgsave" Width="80" />
                            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" Width="80" />
                        </td>
                    </tr>
                </table>
            </center>
            </asp:Panel>
        </div>
    </asp:Panel>
</asp:Content>
