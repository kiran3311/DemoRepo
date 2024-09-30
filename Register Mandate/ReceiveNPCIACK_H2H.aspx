<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_ReceiveNPCIACK_H2H, App_Web_receivenpciack_h2h.aspx.bf0ff4eb" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
     <script type="text/javascript" src="../Scripts/1.8.3jquery.min.js"></script>
     <script src="../Scripts/1.9.1jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />    
    <%--<link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>--%>
    <div>
        <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </div>
    <div style="text-align: center;">
        <center>
            <asp:UpdatePanel ID="upPnl" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <asp:Panel ID="pnl" GroupingText="Receive NPCI Ack" runat="server" Width="100%">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                            runat="server" HeaderText="Following errors occured while performing the action" />
                        <asp:CustomValidator ForeColor="Red" Display="None" ID="cvOk" runat="server" ValidationGroup="vgOK"
                            OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                        <div align="center">
                            <table width="80%">
                                <tr>
                                    <td align="right" class="style2" style="width: 50%">
                                        <asp:Label ID="lblUploadDate" runat="server" Text="Settlement Date :"></asp:Label>
                                    </td>
                                    <td class="form-fld-val" style="width: 50%" align="left">
                                        <asp:TextBox ID="txtDate" Width="80px" runat="server" OnTextChanged="txtDate_TextChanged"
                                            AutoPostBack="true"> </asp:TextBox>

                                        <%--onblur="fill()" --%>

                                        <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtDate" Mask="99/99/9999"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" />
                                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                        <%--<asp:CalendarExtender OnClientDateSelectionChanged="dateSelectionChanged" PopupButtonID="ImageButton2"
                                            Format="dd-MM-yyyy" runat="server" ID="CalendarExtender1" TargetControlID="txtDate">
                                        </asp:CalendarExtender>--%>
                                        <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                            ID="CalendarExtender1" TargetControlID="txtDate">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <div id="dvDataFound" style="padding: 5px;" align="center">
                                            <asp:GridView ID="dgvData" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" Width="70%" 
                                                 OnPageIndexChanging="dgvData_PageIndexChanging">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkEmp" runat="server" 
                                                                OnCheckedChanged="chkEmp_CheckedChanged" AutoPostBack="true" >
                                                            </asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="File" HeaderText="File Name" />
                                                    <%--<asp:BoundField DataField="Action" HeaderText="File Name" />--%>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" CausesValidation="False"
                                                                CommandName="Select" Text="Select"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        </div>
                                        <div id="dvNoData" runat="server" style="font-size: 15px; font-weight: bold; color: Red" align="center">
                                            No Data Found
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr style="height: 20px">
                                    <td colspan="2" align="center">
                                        <%--<asp:Button runat="server" ID="btnUpdate" Text="Update" class="myButton" Width="60px" Height="25px" OnClick="btnUpdate_Click"
                                            CausesValidation="true" ValidationGroup="vgOK" />--%>
                                        <asp:Button ID="btnUpload" runat="server" CausesValidation="true" Text="Upload" ValidationGroup="vgUpload"
                                            class="myButton" Width="60px" Height="25px" OnClick="btnUpload_Click" />
                                        <asp:Button runat="server" ID="btnClose" Text="Close" class="myButton" Width="60px"
                                            Height="25px" OnClick="btnClose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblSuccess" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblFailed" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblTotal" Text="" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblMsg" Text="Msg" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <!-- [Start] Ajax Loading -->
                    <%--<div id="divProgress" style="display: none;">
                        <div class="action-progress" style="font-weight: bold;">
                            Processing your request. Please wait....
                        </div>
                    </div>
                    <div id="divMain" class="UnFreezePage">
                    </div>--%>
                    <!-- [End] Ajax Loading -->
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnUpload" />                    
                </Triggers>
            </asp:UpdatePanel>
        </center>
    </div>
    <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
        <div id="divMain" class="UnFreezePage">
        </div>
       <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
       <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
       
    </div>
</asp:Content>
