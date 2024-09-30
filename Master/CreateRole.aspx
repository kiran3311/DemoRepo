<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_CreateRole, App_Web_createrole.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .hidecol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td style="vertical-align: top; width: 95%;">
                        <fieldset style="width: 98%;">
                            <legend>Create Role</legend>
                            <br />
                            <table width="100%">
                                <tr> 
                                    <td style="text-align: right;">
                                        <span>Role Name :</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRoleName" runat="server" onfocus="this.style.backgroundColor='#FFFBE1'"
                                            onblur="this.style.backgroundColor='#ffffff'" Style="text-transform: uppercase"
                                            AutoCompleteType="Disabled"></asp:TextBox>
                                        <scope style="color:red">*</scope>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtRoleName"
                                            ValidationGroup="g1" Text="Role Name Required!" ForeColor="Red" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <span>Active :</span>
                                    </td>
                                    <td>
                                        <asp:CheckBox runat="server" ID="chkIsActive" Checked="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="3">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="g1" OnClick="btnSave_Click"
                                            class="myButton" Width="60px" Height="25px" />
                                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="myButton"
                                            Width="60px" Height="25px" />
                                        &nbsp;
                                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton"
                                            Width="60px" Height="25px" Style="margin-left: -6px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="grdRole" runat="server" AutoGenerateColumns="False" Width="50%"
                align="center" Style="border: 1px solid black; margin: 0px auto;" DataKeyNames="RoleID"
                AllowPaging="True" OnPageIndexChanging="grdRole_PageIndexChanging" OnRowCommand="grdRole_RowCommand"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" ForeColor="White" Height="20px" HorizontalAlign="Center"
                    Font-Bold="True" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="RoleID" ItemStyle-CssClass="hidecol" HeaderStyle-CssClass="hidecol">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleId" runat="server" Text='<%#Eval("RoleID") %>'>></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="hidecol" />
                        <ItemStyle CssClass="hidecol" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role Name">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleName" runat="server" Text='<%#Eval("RoleName") %>'>></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsActive">
                        <ItemTemplate>
                            <asp:Label ID="lblIsActive" runat="server" Text='<%#Eval("IsActive") %>'>></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Update" ToolTip="Edit" class="myButton"
                                Width="60px" Height="25px" CommandName="EditCommand" CommandArgument='<%#Container.DataItemIndex %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" ToolTip="Delete" Text="Delete" class="myButton"
                                Width="60px" Height="25px" CommandName="DeleteCommand" OnClientClick="return confirm('Are you sure you want to delete this Role?');"
                                CommandArgument='<%#Container.DataItemIndex %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:HiddenField ID="hdn_RoleID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
