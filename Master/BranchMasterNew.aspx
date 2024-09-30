<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_BranchMasterNew, App_Web_branchmasternew.aspx.28963a75" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       <style type="text/css">
        .btnpadd
        {
            /*margin-left: 15px;*/
        }
        .style1
        {
            height: 30px;
        }
        .style2
        {
            height: 21px;
        }
        .style3
        {
            height: 21px; 
        }
        
        .hidden
        {
            display: none;
        }
        
        .EU_DataTable tr td
        {
            padding: 5px 10px 5px 10px;
            color: #454545;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            border: 1px solid #cccccc;
            vertical-align: middle;
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
        .divgrid
        {
            height: 200px;
        }
        .divgrid table
        {
        }
        .divgrid table th
        {
        }
    </style>

     <%-- <script type="text/javascript">
        $(document).ready(function () {
            $('#txtSolID').bind('paste', function (e) {
                e.preventDefault();
                alert("You cannot paste text into this textbox!");
            });
        });
    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div align="center" style="width: 100%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:ScriptManager runat="server" ID="mgr">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="updpanel1" runat="server">
                <ContentTemplate>
                    <table width="100%">
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblZone" Text="Zone:" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlZone" runat="server" AutoPostBack="true" Width="205px" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblCircle" Text="Circle:" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCircle" runat="server" AutoCompleteType="Disabled" Width="200px"
                                    Enabled="false"></asp:TextBox>
                                <asp:HiddenField ID="hiddCircle" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Sol ID:
                            </td>
                            <td align="left" class="style2">
                                <asp:TextBox ID="txtSolID" runat="server" Width="200px" MaxLength="4" AutoCompleteType="Disabled"
                                    onkeypress="return NumberOnly();" oncopy="return false" onpaste="return false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Branch Name:
                            </td>
                            <td align="left" class="style2">
                                <asp:TextBox ID="txtBranchName" runat="server" Width="200px" Style="text-transform: uppercase"
                                    AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vgAdd"
                                    ControlToValidate="txtBranchName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%--<tr>
                            <td align="right">
                                Role ID:
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlRoleId" runat="server" AutoPostBack="true" Width="205px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="vgAdd"
                                    ControlToValidate="ddlRoleId" ErrorMessage="*Fill Details" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblIfsc" Text="IFSC:" runat="server" Width="200px"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtIfsc" runat="server" MaxLength="11" Width="200px" AutoCompleteType="Disabled"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblMicr" Text="MICR:" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMicr" runat="server" MaxLength="9" Width="200px" onkeypress="return NumberOnly();"
                                    AutoCompleteType="Disabled" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Status:
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkYes" runat="server" Text="Active" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" class="style1">
                                <asp:Button ID="btnInsert" Style="padding: 2px" runat="server" Text="Add" OnClick="btnInsert_Click"
                                    CausesValidation="true" ValidationGroup="vgAdd" class="myButton" Width="60px" Height="25px" />
                                <asp:Button ID="btnDelete" Style="padding: 2px" runat="server" Text="Delete" CssClass="btnpadd"
                                    Enabled="False" OnClick="btnDelete_Click" class="myButton" Width="60px" Height="25px" />
                                <asp:Button ID="btnReset" Style="padding: 2px" runat="server" Text="Cancel" CssClass="btnpadd myButton"
                                    OnClick="btnReset_Click" CausesValidation="False"  Width="60px" Height="25px" />
                                <asp:Button ID="btnClose" Text="Close" runat="server" class="myButton" Width="60px" Height="25px" Style="padding: 2px"
                                    OnClick="btnClose_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" class="style3">
                                <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:GridView ID="gvBranchDetails" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvBranchDetails_DataBound"
                                    Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Branch Name" DataField="BRANCH_NAME" />
                                        <asp:BoundField HeaderText="Sole Id" DataField="SOLE_ID" />
                                        <%--<asp:BoundField HeaderText="City Code" DataField="CITY_CODE" />
                                <asp:BoundField HeaderText="Bank Code" DataField="BANK_CODE" />
                                <asp:BoundField HeaderText="Branch ID" DataField="BRANCH_ID" />--%>
                                        <asp:BoundField HeaderText="MICR" DataField="MICR" />
                                        <asp:BoundField HeaderText="IFSC" DataField="IFSC" />
                                        <%--<asp:BoundField HeaderText="ROLENAME" DataField="ROLENAME" />--%>
                                        <asp:BoundField HeaderText="Status" DataField="STATUS" />
                                        <asp:BoundField HeaderText="SrNo" DataField="BRANCH_SRNO" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                        <asp:CommandField HeaderText="Action" SelectText="Edit" ShowSelectButton="True" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    <HeaderStyle CssClass="GridviewScrollHeader" />
                                    <RowStyle CssClass="GridviewScrollItem" />
                                    <PagerStyle CssClass="GridviewScrollPager" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
       <%--<script type="text/javascript" language="javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=gvBranchDetails] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>--%>
</asp:Content>

