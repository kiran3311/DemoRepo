<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_CircleMasterNew, App_Web_circlemasternew.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    <script type="text/javascript" language="javascript">

        function dateSelectionChanged(sender, args) {
            FillUtility();
        }

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });

        function MoveNextWithServer(ctrl, _key) {
            var mCtrl;
            if (_key == 13) {
                if (ctrl.id == "MainContent_txtToDate") {
                    FillUtility();
                }
            }
        }
        function FillUtility() {
            var vbtnFillUtility = document.getElementById('MainContent_hiddBtnFillUtility');
            vbtnFillUtility.click();
        }

        function SoleIDCheck() {
            var vbtnChkSoleID = document.getElementById('MainContent_hiddnbtnChkSolId');
            vbtnChkSoleID.click();
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

    </script>

    <script src="../Scripts/1.8.3jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/1.9.1jquery-ui.min.js" type="text/javascript"></script>
    <script src="../Scripts/quicksearch.js" type="text/javascript"></script>
    <script src="../Scripts/gridviewScroll.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <div>
        <%--<asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />--%>
    </div>
    <center>
        <%--<asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
        <asp:Panel ID="pnl" GroupingText="DB Circle Details " runat="server" Width="100%">
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                runat="server" HeaderText="Following errors occured while performing the action" />
            <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
            <table>
                <%-- <tr>
                    <td style="text-align: right">
                       
                    </td>
                    <td style="text-align: left">
                         <asp:RadioButtonList ID="RbtMandate" runat="server" AutoPostBack="true" 
                             RepeatDirection="Horizontal" 
                             onselectedindexchanged="RbtMandate_SelectedIndexChanged">
                            <asp:ListItem  Text="OutWardMandate" Selected="True" Value="OutWardMandate"></asp:ListItem>
                            <asp:ListItem Text="InWardMandate" Selected="False" Value="InWardMandate"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>--%>
                <tr>
                    <td align="right">
                        Utility Name :
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlAPPMUtilityNM" runat="server" AutoPostBack="true" onkeydown="return MoveNext('MainContent_btnOk',event.keyCode);"
                            Width="260px" 
                            onselectedindexchanged="ddlAPPMUtilityNM_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="lblCircle" Text="Circle Name:" runat="server"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtcircle" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <%-- <tr>
                    <td style="text-align: right">
                        From Date :
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtFromDate" onblur="FillUtility();" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                            runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                            ErrorTooltipEnabled="True" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" Display="None" ErrorMessage="Please Enter From Date"
                            ValidationGroup="vgOk" ControlToValidate="txtFromDate"></asp:RequiredFieldValidator>
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                        <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton1"
                            Format="dd-MM-yyyy" runat="server" ID="ToDateExtender" TargetControlID="txtFromDate">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        To :
                    </td>
                    <td>
                        <asp:TextBox ID="txtToDate" onkeydown="MoveNextWithServer(this, event.keyCode)" onblur="FillUtility();"
                            runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                            ErrorTooltipEnabled="True" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                            ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                        <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton2"
                            Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtToDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>--%>
                 <%--<tr>
                    <td align="right" style="width: 40%">
                        <asp:Label ID="lblCircleCode" Text="Circle Code:" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCircleCode" MaxLength="4" AutoCompleteType="Disabled" runat="server" 
                        Width="150px" onkeypress="return NumberOnly();" ></asp:TextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td colspan="2" align="center" class="style1">
                        <asp:Button ID="btnAdd" Style="padding: 2px" runat="server" Text="Add" CausesValidation="true"
                            ValidationGroup="vgsave" Width="70px" OnClick="btnAdd_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnEdit" Style="padding: 2px" runat="server" Text="Update" CssClass="btnpadd"
                            Enabled="False" Width="70px" OnClick="btnEdit_Click" CausesValidation="true"
                            ValidationGroup="vgsave" />&nbsp;&nbsp;
                        <asp:Button ID="btnDelete" Style="padding: 2px" runat="server" Text="Delete" CssClass="btnpadd"
                            Enabled="False" Width="70px" OnClick="btnDelete_Click" CausesValidation="true"
                            ValidationGroup="vgsave" />&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" Style="padding: 2px" runat="server" Text="Cancel" CssClass="btnpadd"
                            OnClick="btnCancel_Click" CausesValidation="False" Width="70px" />&nbsp;&nbsp;
                        <asp:Button ID="btnClose" Style="padding: 2px" runat="server" Text="Close" CssClass="btnpadd"
                            OnClick="btnReset_Click" CausesValidation="False" Width="70px" />
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
                        <%--<asp:GridView ID="gvCircleDetails" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                            CellPadding="4" ForeColor="#333333" GridLines="None" BorderStyle="None" OnDataBound="gvCircleDetails_DataBound"
                            Width="100%" AllowPaging="True" OnPageIndexChanging="gvCircleDetails_PageIndexChanging" PageSize="5">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                            <asp:BoundField HeaderText="SrNo" DataField="SRNO" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />

                           <asp:BoundField HeaderText="CIRCLE CODE" DataField="CIRCLE_CODE" ItemStyle-CssClass="breakword"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="CIRCLE" DataField="CIRCLE" ItemStyle-CssClass="breakword"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="UTILITY_CODE" DataField="UTILITY_CODE" ItemStyle-HorizontalAlign="Left"
                                    ItemStyle-CssClass="Left" />
                                <asp:BoundField HeaderText="UTILITY_NAME" DataField="UTILITY_NAME" ItemStyle-HorizontalAlign="Left" />
                                <asp:CommandField SelectText="EDIT" HeaderText="EDIT" ShowSelectButton="True" ItemStyle-HorizontalAlign="Left" />
                                
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
                        </asp:GridView>--%>

                        <asp:GridView ID="gvCircleDetails" runat="server" 
                                        AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    OnDataBound="gvCircleDetails_DataBound" Width="100%" AllowPaging="True" OnPageIndexChanging="gvCircleDetails_PageIndexChanging1">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField HeaderText="CIRCLE CODE" DataField="CIRCLE_CODE" />
                                            <asp:BoundField HeaderText="CIRCLE" DataField="CIRCLE" />
                                            <asp:BoundField HeaderText="UTILITY_CODE" DataField="UTILITY_CODE" />
                                            <asp:BoundField HeaderText="UTILITY_NAME" DataField="UTILITY_NAME" />
                                            <%--<asp:BoundField HeaderText="SrNo" DataField="SRNO" ItemStyle-HorizontalAlign="Left"
                                                HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                        --%>    <asp:CommandField HeaderText="Action" SelectText="Edit" ShowSelectButton="True" />
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

        </asp:Panel>
      <%--  <div id="Div2" style="display: none" runat="server">
            <asp:Button ID="hiddBtnFillUtility" runat="server" OnClick="hiddBtnFillUtility_Click" />
           </div>--%>
               <script type="text/javascript">
                   $(function () {
                       $('.search_textbox').each(function (i) {
                           $(this).quicksearch("[id*=gvCircleDetails] tr:not(:has(th))", {
                               'testQuery': function (query, txt, row) {
                                   return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                               }
                           });
                       });
                   });
    </script>

        <div id="divMain" class="UnFreezePage">
        </div>
      
    </center>

</asp:Content>

