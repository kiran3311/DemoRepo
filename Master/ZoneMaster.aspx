<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="BranchMaster, App_Web_zonemaster.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
            height: 29px;
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
            /*border-width: 1px;*/ /* border-color:Black; */
        }
        .txt:focus
        {
            padding: 2px;
            border-width: 1px;
            border-color: Black;
        }
        .breakword
        {
            width: 150px;
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>

   


    <script src="../Scripts/1.8.3jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/1.9.1jquery-ui.min.js" type="text/javascript"></script>
    <script src="../Scripts/quicksearch.js" type="text/javascript"></script>
    <script src="../Scripts/gridviewScroll.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=gvZoneDetails.ClientID%>').gridviewScroll({
                height: 200,
                width: 500,
                horizontalbar: "hidden"
            });
        } 

         function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;


    </script>

   

    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=gvZoneDetails] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
    <asp:Panel ID="pnl" GroupingText="Zone Details" runat="server" Width="100%">
        <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
            OnServerValidate="cvCustInfo_ServerValidate" Display="None"></asp:CustomValidator>
        <div align="center" style="width: 100%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table width="50%">
                <tr>
                    <td align="right" style="width: 40%">
                        <asp:Label ID="lblCircle" Text="Circle:" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlCircle" runat="server" AutoPostBack="true" Width="150px"
                            OnSelectedIndexChanged="ddlCircle_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 40%">
                        <asp:Label ID="lblZone" Text="Zone:" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtZone" MaxLength="20" AutoCompleteType="Disabled"
                            runat="server" Width="150px" Style="text-transform: uppercase"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdQuestion" runat="server" ErrorMessage="Zone cannot be Blank"
                            ControlToValidate="txtZone" Display="None" ValidationGroup="vgsave"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 40%">
                        <asp:Label ID="lblZoneCode" Text="Zone Code:" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtZoneCode" MaxLength="4" AutoCompleteType="Disabled" runat="server"
                            Width="150px"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="style1">
                        <asp:Button ID="btnAdd" Style="padding: 2px" runat="server" Text="Add" CausesValidation="true"
                            ValidationGroup="vgsave" OnClick="btnAdd_Click" class="myButton" Width="60px" Height="25px" />
                        <asp:Button ID="btnEdit" Style="padding: 2px" runat="server" Text="Edit" CssClass="btnpadd"
                            Enabled="False"  OnClick="btnEdit_Click" CausesValidation="true"
                            ValidationGroup="vgsave"  Width="60px" Height="25px" />
                        <asp:Button ID="btnDelete" Style="padding: 2px" runat="server" Text="Delete" CssClass="btnpadd"
                            Enabled="False" Width="60px" Height="25px" OnClick="btnDelete_Click" CausesValidation="true"
                            ValidationGroup="vgsave" />
                        <asp:Button ID="btnCancel" Text="Cancel" Style="padding: 2px"  Width="60px" Height="25px" CssClass="btnpadd myButton"
                            runat="server" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnClose" Style="padding: 2px" runat="server" Text="Close" CssClass="btnpadd myButton"
                            OnClick="btnReset_Click" CausesValidation="False" Width="60px" Height="25px" />
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
                        <asp:GridView CssClass="EU_DataTable" ID="gvZoneDetails" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change" CellPadding="4"
                            ForeColor="#333333" OnDataBound="gvZoneDetails_DataBound" GridLines="None" OnPageIndexChanging="gvZoneDetails_PageIndexChanging"
                            BorderStyle="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Zone" DataField="ZONE" ItemStyle-CssClass="breakword"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="Zone CODE" DataField="ZONE_CODE" ItemStyle-CssClass="breakword"
                                    ItemStyle-HorizontalAlign="Left" />
                                <%--<asp:BoundField HeaderText="CIRCLE" DataField="CIRCLE" ItemStyle-CssClass="breakword" ItemStyle-HorizontalAlign="Left" />--%>
                                <asp:BoundField HeaderText="SrNo" DataField="SRNO" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                <asp:CommandField SelectText="EDIT" HeaderText="Action" ShowSelectButton="True" ItemStyle-HorizontalAlign="Left" />
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
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
