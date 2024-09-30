<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_DashBoardApprMan, App_Web_dashboardapprman.aspx.1f1b7ac7" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajct" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    &nbsp;&nbsp;&nbsp;
    <script type="text/javascript" language="javascript">

        function dateSelectionChanged(sender, args) {
            //  FillUtility();
        }

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }

        //        $(document).keypress(function (e) {
        //            if (e.keyCode === 13) {
        //                e.preventDefault();
        //                return false;
        //            }
        //        });


        function MoveNextWithServer(ctrl, _key) {
            var mCtrl;
            if (_key == 13) {
                if (ctrl.id == "MainContent_txtToDate") {
                    //                    FillUtility();
                }
            }
        }
        //        function FillUtility() {
        //            var vbtnFillUtility = document.getElementById('MainContent_hiddBtnFillUtility');
        //            vbtnFillUtility.click();
        //        }

        function SoleIDCheck() {
            var vbtnChkSoleID = document.getElementById('MainContent_hiddnbtnChkSolId');
            //            vbtnChkSoleID.click();
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }
        function ValidateDate() {
            debugger;
            var vbtn = document.getElementById('MainContent_btnhidd');
            var txt = vbtn.value;
            vbtn.click();
        }

    </script>
    <div>
        <ajct:ToolkitScriptManager ID="ScriptManager1" runat="Server" />
    </div>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
        runat="server" HeaderText="Following errors occured while performing the action" />
   <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk" Display="None"
                    OnServerValidate="cvOk_ServerValidate" ></asp:CustomValidator>
    <div align="center"> 
                
    <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel ID="pnl" GroupingText="Approve Mandate" runat="server" Width="100%">
                <table style="width: 100%">
                    <tr style="width: 100%">
                        <td style="width:100%" valign="top">
                            <%-- <ajct:TabContainer ID="tabCont" runat="server">        
    <ajct:TabPanel ID="tpApprMan" Style="margin-top: 15px;" runat="server" ScrollBars="Auto"
                Width="100%">
                <HeaderTemplate>
                   Approve Mandate
                </HeaderTemplate>
                <ContentTemplate>--%>
                           <%-- <div id="div1" runat="server">--%>
                                <table id="Table1" class="ey-dataTable" border="0" cellpadding="0" cellspacing="1"
                                    width="100%">
                                    <table width="80%">
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="lblCircle" runat="server" Text="Circle:"></asp:Label>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="ddlCircle" runat="server" Width="200px" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlCircle_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="lblZone" Text="Zone:" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="ddlZone" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="lblSoleId" runat="server" Text="Sol Id:"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtSolId" MaxLength="4" onkeypress="return NumberOnly();" onblur="SoleIDCheck();"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <tr>
                                                <td style="text-align: right">
                                                    From Date :
                                                </td>
                                                <td align="left" style="width: 12%;">
                                                    <asp:TextBox ID="txtFromDate" width="80px" onkeydown="return MoveNext('MainContent_txtToDate',event.keyCode);"
                                                        runat="server" ontextchanged="txtFromDate_TextChanged"></asp:TextBox>
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
                                                <td style="text-align: left;width:52px;">
                                                    To Date:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtToDate" width="80px" onkeydown="MoveNextWithServer(this, event.keyCode)" runat="server" onchange="ValidateDate();" ValidationGroup="vgOk" CausesValidation="true"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="mskToDate" TargetControlID="txtToDate" Mask="99/99/9999"
                                                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                        ErrorTooltipEnabled="True" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" Display="None" ErrorMessage="Please Enter To Date"
                                                        ValidationGroup="vgOk" ControlToValidate="txtToDate"></asp:RequiredFieldValidator>
                                                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                                    <asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton2"
                                                        Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtToDate">
                                                    </asp:CalendarExtender>
                                                </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <tr style="width: 100%; vertical-align: top;">
                                        <td>
                                            <br />
                                            <%--<tbody style="background-color: white">--%>
                                            <table width="100%">
                                                <tr style="padding-top: 3px; padding-bottom: 3px" valign="top" width="100%">
                                                    <td class="ey-editorPartTitle" colspan="4">
                                                        <table border="0px;" width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:RadioButtonList ID="rbtApprMandate" runat="server" RepeatDirection="Horizontal"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="rbtApprMandate_SelectedIndexChanged" CausesValidation="true" ValidationGroup="vgOk">
                                                                        <asp:ListItem Text="Pending for NCPI Upload" Value="Pending for NCPI Upload"></asp:ListItem>
                                                                        <asp:ListItem Text="Pending for Approval" Value="Pending for Approval"></asp:ListItem>
                                                                        <asp:ListItem Text="Pending Acknowledgement" Value="Pending Acknowledgement"></asp:ListItem>
                                                                        <%--<asp:ListItem Text="Pending for CBS Upload" Value="Pending for CBS Upload"></asp:ListItem>
                                                                        <asp:ListItem Text="Pending CBS Response" Value="Pending CBS Response"></asp:ListItem>--%>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:15px;">
                                                            <td>
                                                            
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:UpdatePanel ID="upApprMan" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:GridView ID="DgvDataApprMan" runat="server" AllowPaging="True" CellPadding="4"
                                                                                ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvList_PageIndexChanging"
                                                                                PageSize="10" Width="100%">
                                                                                <AlternatingRowStyle BackColor="White" />
                                                                                <EditRowStyle BackColor="#2461BF" />
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <table  border="0px;" width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="notification" runat="server" Visible="false">
                                                                        <table>
                                                                            <tr>
                                                                                <td bgcolor="PaleGoldenrod" height="25px" width="25px">
                                                                                </td>
                                                                                <td>
                                                                                    Pending
                                                                                </td>
                                                                                <td bgcolor="#99FF66" height="25px" width="25px">
                                                                                </td>
                                                                                <td>
                                                                                    Done
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Chart ID="chart1" runat="server" Visible="False">
                                                                        <Series>
                                                                            <asp:Series ChartType="Pie" Name="Series1">
                                                                            </asp:Series>
                                                                        </Series>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="ChartArea1">
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnPrint" Style="padding: 5px" runat="server" Visible="false"
                                                Text="Print" OnClick="btnPrint_Click" Enabled="False" class="myButton" Width="60px" Height="25px" />
                                            <asp:Button ID="Button1" Style="margin-right: 10px; padding: 5px" runat="server"
                                                Text="Exit" OnClick="Button1_Click" class="myButton" Width="60px" Height="25px" />
                                        </td>
                                    </tr>
                                </table>
                            <%--</div> --%>
                            
                             <div style="display:none;">
                                <asp:Button ID="btnhidd" runat="server" text="btnhidd"  CausesValidation="true" ValidationGroup="vgOk"/>
                             </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
     </div>
</asp:Content>


