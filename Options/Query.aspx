<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Options_Query, App_Web_query.aspx.d613b7e9" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .panel {
            width: 800px;
            padding-right: -5px;
            min-height: 20px;
            border: 0px solid #dcdcdc;
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" />

  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

    <ContentTemplate>
          <div id="ImgData" runat="server">
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <div style="width: 100%" align="center">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:ImageButton ID="btnImgPrev" runat="server" Height="29px" ImageUrl="~/Images/1415545561_circle_back_arrow-128.png"
                                    OnClick="btnImgPrev_Click" Width="32px" />
                            </td>
                            <td class="style8">
                                <asp:Label ID="Label28" Text="Search Criteria :" runat="server" Width="112px"></asp:Label>
                            </td>
                            <td class="style9">
                                <asp:DropDownList ID="cboSearch" runat="server" Width="160px" AutoPostBack="True"
                                    OnSelectedIndexChanged="cboSearch_SelectedIndexChanged">
                                    <asp:ListItem><--Select--></asp:ListItem>
                                    <asp:ListItem>UMRN</asp:ListItem>
                                    <asp:ListItem>MANDATE_NO</asp:ListItem>
                                    <asp:ListItem>CUST_NAME</asp:ListItem>
                                    <asp:ListItem>CUST_REFNO</asp:ListItem>
                                    <asp:ListItem>SCH_REFNO</asp:ListItem>
                                    <asp:ListItem>ACNO</asp:ListItem>
                                    <asp:ListItem>PROCESS_DATE</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style10">
                                <table id="tbldll" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label29" Text="Search Value :" runat="server" Width="106px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSearchVal" runat="server" Style="text-transform: uppercase" Width="288px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="chkArchive" Text="Include Archived" AutoPostBack="true" OnCheckedChanged="chkArchive_CheckedChanged" /></td>

                                         <td>
                                            <asp:CheckBox runat="server" ID="chkAPIEmandate" Text="Include API Emandate" AutoPostBack="true" OnCheckedChanged="chkAPIEmandate_CheckedChanged"/></td>
                                    </tr>
                                </table>
                                <table id="tbFrmTO" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label39" Text="From Date :" runat="server" Width="80px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFromDate" runat="server" Style="text-transform: uppercase" Width="75px"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtFromDate" Mask="99/99/9999"
                                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                ErrorTooltipEnabled="True" runat="server" />
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/calender.png" runat="server" />
                                            <asp:CalendarExtender PopupButtonID="ImageButton1" Format="dd-MM-yyyy" runat="server"
                                                ID="ToDateExtender" TargetControlID="txtFromDate">
                                            </asp:CalendarExtender>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label40" Text="To Date :" runat="server" Width="80px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtToDate" runat="server" Style="text-transform: uppercase" Width="75px"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="txtToDate" Mask="99/99/9999"
                                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                ErrorTooltipEnabled="True" runat="server" />
                                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                            <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                                ID="CalendarExtender1" TargetControlID="txtToDate">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                                    Style="height: 26px" class="myButton" Width="60px" />
                            </td>
                            <td>
                                <asp:ImageButton ID="btnImgNxt" runat="server" Height="29px" ImageUrl="~/Images/1415545553_circle_next_arrow_disclosure-128.png"
                                    OnClick="btnImgNxt_Click" Width="32px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="errorMsg" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div align="center">
                    <asp:Image ID="imgCheque" runat="server" Height="213px" Width="857px" />
                    <asp:Label ID="lblCategory" Text="" runat="server" Style="font-size: large; margin-left: 31px"></asp:Label>
                </div>
                <table style="width: 100%; border: 1px solid #ccc;">
                </table>
                <table style="width: 100%; border: 1px solid #ccc;">
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label41" Text="Utility:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUtilityCode" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="txtUtilityName" Text="" runat="server" ReadOnly="true" Width="90%"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <%--<td>
                            <asp:Label ID="lblCategory" Text="" runat="server"></asp:Label>
                        </td>--%>

                        <td align="right">
                            <asp:Label ID="Label42" Text="Batch:" Style="text-align: right" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBatch" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label43" Text="Mandate no.:" Style="text-align: right" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIHNO" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label5" Style="text-align: right;" Text="Umrn :" runat="server"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtUMRN" Text="" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label6" Text="Mandate Date :" runat="server"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="mskMandateDT" Text="" runat="server" ReadOnly="true" Width="167px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label3" Text="Bank :" runat="server"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="txtBank" Text="" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label8" Text="Mandate_ID :" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMandateID" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label1" Text="Name :" runat="server"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtName" Text="" runat="server" ReadOnly="true" Enabled="False" Width="83%"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label2" Text="MICR/IFSC :" runat="server"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtMicrCode" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label7" Text="A/C Type :" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAcType" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label4" Text="A/C No :" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAcNo" Text="" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1">
                            <asp:Label ID="Label10" Text="Cust Ref No:" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtConsumerNo" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="auto-style1">
                            <asp:Label ID="Label11" Text="Scheme Ref No:" Style="text-align: right" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtSchemeRefNo" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="auto-style1">
                            <asp:Label ID="Label12" Text="Frequency:" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtFrequency" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:CheckBox ID="chkUntilCancel" runat="server" Text="Until Cancelled" Enabled="False"
                                EnableTheming="True" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label13" Text="Start Date:" Style="text-align: right" runat="server"></asp:Label>
                        </td>
                        <td class="style7">
                            <asp:TextBox ID="mskStartDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label14" Text="End Date:" runat="server" Width="61px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskEndDate" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label30" Text="Amount:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAmount" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="lblCollType" Text="Collection Type:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtColType" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label15" Text="Add Cust ID:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCustID" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label16" Text="Phone:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" Text="" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label20" Text="Live Status:" runat="server"></asp:Label>
                        </td>
                        <td class="style12"colspan="5">
                            <asp:TextBox ID="txtLivestatus" Text="" runat="server" ReadOnly="true" Width="171px" 
                                Enabled="False"></asp:TextBox>
                        </td>
                      
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label18" Text="Maker:" Style="text-align: right" runat="server"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtMaker" Text="" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label19" Text="Entry DT:" runat="server"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="mskEntryDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label17" Text="Mail ID:" runat="server"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtMail" Text="" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                          <td align="right">
                            <asp:Label ID="Label9" Text="Mob No.:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtmob" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label21" Text="Checker:" runat="server"></asp:Label>
                        </td>
                        <td class="style7">
                            <asp:TextBox ID="txtChecker" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label22" Text="Checker DT:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskCheckerDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label24" Text="NPCI Upload DT:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskUploadDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label23" Text="NPCI Res Upd DT:" runat="server"
                                Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskUpdateDT" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label44" Text="Cancel Maker:" runat="server"></asp:Label>
                        </td>
                        <td class="style7">
                            <asp:TextBox ID="txtCancelMaker" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label45" Text="Cancel Maker DT:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskCancelMakerDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label46" Text="Cancel Checker:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCancelCheckerUser" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label47" Text="Cancel Checker DT:" runat="server"
                                Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskCancelCheckerDT" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                           <td align="right">
                            <asp:Label ID="Label49" Text="Cancel NPCI Upload DT:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskCancelUploadDT" Text="" runat="server" ReadOnly="true"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" >
                            <asp:Label ID="Label48" Text="Remarks:" runat="server" Width="96px" Height="17px"></asp:Label>
                        </td>
                        <td colspan="5">
                             <asp:TextBox ID="txtRemarks" runat="server" Width="678px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table style="border: 1px solid #ccc;" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label25" Text="Return Reason:" runat="server" Width="96px" Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstRetReason" runat="server" Width="500px" Enabled="False" ></asp:ListBox>
                        </td>
                        <td style="display: none">
                            <asp:Label ID="Label26" Text="Status:" runat="server" Width="53px" Height="17px"></asp:Label>
                        </td>
                        <td style="display: none">
                            <asp:ListBox ID="lstStatus" runat="server" Width="225px" Enabled="False"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Label ID="Label27" Text="Remark:" runat="server" Width="78px" Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstRemark" runat="server" Width="500px" Enabled="False"></asp:ListBox>
                        </td>
                    </tr>
                  
                </table>
                <table style="width: 100%;">
                    <tr>
                        <td align="left">
                            <span style="padding-right: 15px">
                                <asp:Label ID="lblAckRejCode" Text="Ack Reason:" runat="server"></asp:Label>
                            </span><span style="padding-right: 15px">
                                <asp:TextBox ID="txtAckRejCode" runat="server" ReadOnly="true" Width="300px"></asp:TextBox></span>
                        </td>
                        <td style="text-align: center">
                            <span>
                                <asp:Button ID="btnPrev" runat="server" class="myButton" Width="60px" Text="Prev"
                                    Enabled="False" OnClick="btnPrev_Click" /></span> <span>
                                        <asp:Button ID="btnNext" runat="server" class="myButton" Width="60px" Text="Next"
                                            Enabled="False" OnClick="btnNext_Click" /></span>
                        </td>
                        <td style="padding-right: 40px; text-align: right">
                            <span>
                                <asp:Button ID="btnEdit" class="myButton" Width="70px" runat="server" Text="Re-Entry"
                                    OnClick="btnEdit_Click" />

                                <asp:Button ID="btnDownloadImage" runat="server" Text="Download Image" class="myButton"
                                    Width="120px" OnClick="btnDownloadImage_Click" />
                            </span>
                            <span>

                                <asp:Button ID="btnInwardDet" runat="server" Text="Transaction Details" class="myButton"
                                    Width="140px" OnClick="btnInwardDet_Click" Enabled="False" />

                                <asp:Button ID="btnholdclosure" runat="server" Text="Hold/Closure Details" class="myButton"
                                    Width="200px" Enabled="False" OnClick="btnholdclosure_Click" />

                            </span>
                            <span>
                                <asp:Button ID="btnCLoseMain" class="myButton" Width="60px" runat="server" Text="Close"
                                    OnClick="btnCLoseMain_Click" />

                            </span>

                        </td>
                    </tr>
                </table>
            </div>


            <div id="Trancation" style="display: none" runat="server" align="center">
                <table style="width: 80%">
                    <tr>
                        <td>
                            <asp:Label ID="lbl1" runat="server">NPCI UserCode :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNPCIUserCode" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label31" runat="server">NPCI UserName :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNPCIUserName" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblCatgry" Text="" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label32" runat="server">UMRN :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTRANUMRN" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label33" runat="server">Name :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTRANName" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label34" runat="server">Consumer Ref No :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTranCustRefNo" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label35" runat="server">Scheme Ref No :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTranSchRefNo" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <%--  </table>
                <table>--%>
                  <tr>
                        <td>
                            <asp:Label ID="Label36" runat="server">Start Date :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskTRANStartDT" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label37" runat="server">End Date :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskTRANEndDT" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        </td>
                 </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label38" runat="server">Frequency :</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTRANFrequency" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="pnlGrid" CssClass="panel" runat="server">
                    <div style="text-align: center">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:GridView ID="dgvTransaction" runat="server" AllowPaging="True" PageSize="10"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="dgvTransaction_PageIndexChanging">
                                        <AlternatingRowStyle BackColor="White" />
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
                            <tr>
                                <td>
                                    <span>
                                        <asp:Button ID="btnClose" runat="server" Text="Back" OnClick="btnClose_Click" />
                                    </span><span>
                                        <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" /></span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblRocordNotFound" Font-Size="Medium" ForeColor="Red" Visible="false"
                                        runat="server">No Records Found :</asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownloadImage" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
