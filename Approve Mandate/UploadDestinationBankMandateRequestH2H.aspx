<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_UploadDestinationBankMandateRequestH2H, App_Web_uploaddestinationbankmandaterequesth2h.aspx.1f1b7ac7" %>


<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <script type="text/javascript" src="../Scripts/1.8.3jquery.min.js"></script>
     <script src="../Scripts/1.9.1jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600">
    </asp:ToolkitScriptManager>
   <%--  <link href="../Styles/ProgressCtrl.css" rel="stylesheet" type="text/css" />--%>
   <%-- <asp:UpdateProgress ID="UpdateProgress" AssociatedUpdatePanelID="upUpldACHTrnAck"
        runat="server">
        <ProgressTemplate>
            <div class="modal" style="display: none">
                <div class="center" style="margin-top: 150px">
                    <asp:Label ID="label1" Text="Please Wait while the file is being uploaded..." Font-Bold="true"
                        Font-Size="Medium" runat="server"></asp:Label>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <div style="text-align: justify;">
        <center>
            <asp:UpdatePanel ID="upUpldACHTrnAck" runat="server">
                <ContentTemplate>
                    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                    <div>
                        <asp:Panel ID="pnl" GroupingText="Import Destination Bank Inward Transactions" runat="server"
                            Width="100%">
                            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgUpload"
                                runat="server" HeaderText="Following errors occured while performing the action" />
                            <%--<asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                                ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>--%>
                            <table width="80%">
                                <tr>
                                    <td style="height: 15px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2">
                                        <asp:Label ID="lblUploadDate" runat="server" Text="Settlement Date :"></asp:Label>
                                    </td>
                                    <td class="form-fld-val" style="width: 70%" align="left">
                                        <asp:TextBox  ID="txtDate" Width="80px" runat="server" OnTextChanged="txtDate_TextChanged"
                                            AutoPostBack="true"> </asp:TextBox>
                                        <%--onblur="fill()"--%>
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
                                    <td align="right" width="35%">
                                        Type :
                                    </td>
                                    <td style="width: 70%" align="left">
                                        <asp:TextBox ID="txtType" runat="server" Text="MMS" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                    <div id="dvDataFound" style="padding: 5px;" align="center">
                                        <asp:GridView ID="dgvData" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                            PageSize="10" CellPadding="4" ForeColor="#333333" GridLines="None" Width="70%"
                                            OnPageIndexChanging="dgvData_PageIndexChanging">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged"/>
                                                    </HeaderTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkEmp" AutoPostBack="true" runat="server" OnCheckedChanged="chkEmp_CheckedChanged"></asp:CheckBox>
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
                                        <div id="dvNoData" runat="server" style="font-size: 15px; font-weight: bold; color: Red">
                                            No Data Found
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnUpload" runat="server" CausesValidation="true" 
                                            Text="Upload" ValidationGroup="vgUpload" class="myButton"
                                            Width="60px" Height="25px" onclick="btnUpload_Click" />
                                        <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton"
                                            Width="60px" Height="25px" onclick="btnClose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                    </td>
                                    <%--<td class="style1">
                                    <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download Error Log file</asp:LinkButton>
                                </td>--%>
                                </tr>
                                
                            </table>
                             <table>
                                <tr>
                                    <td>
	
                                        <iframe ID="KeepAliveFrame" src="KeepSessionAlive.aspx" frameBorder="0" width="0" height="0" runat="server"></iframe>
                                    </td>
                                </tr>
                              </table>
                            <%--<asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgUpload"
                                Display="None" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>--%>
                            <asp:CustomValidator ForeColor="Red" Display="None" ID="cvOk" runat="server"
                                ValidationGroup="vgUpload" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                            <div align="center">
                            </div>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:PostBackTrigger ControlID="btnUpload" />--%>
                </Triggers>
            </asp:UpdatePanel>
           <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table>
                                <tr>
                                    <td>
	
                                        <iframe ID="KeepAliveFrame" src="KeepSessionAlive.aspx" frameBorder="0" width="0" height="0" runat="server"></iframe>
                                    </td>
                                </tr>
                     </table>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
            <div>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <br />
                <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download Error Log file</asp:LinkButton>
            </div>
            <div id="Div2" style="display: none" runat="server">
                <asp:TextBox ID="txtFilePath" runat="server">      
                </asp:TextBox>
            </div>
            <div id="Div1" style="display: none" runat="server">
                <%-- <asp:Button ID="hiddBtnValidation" runat ="server" ValidationGroup="vgUpload" CausesValidation="true" />    --%>
            </div>
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



