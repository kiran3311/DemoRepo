<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_BulkDestInwardMandateFinacle, App_Web_bulkdestinwardmandatefinacle.aspx.1f1b7ac7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <style type="text/css">
body
{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
.modal
{
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 100%;
    top: 0;
   /* background-color :White; */
    filter: alpha(opacity=60);
    opacity: 0.6;
    -moz-opacity: 0.8;
}
.center
{
    z-index: 1000;
    margin: 300px auto;
    padding: 10px;
    width: 130px;
   /* background-color: White; */
    border-radius: 10px;
    filter: alpha(opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
.center img
{
    height: 110px;
    width: 110px;
}
</style>
     
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
    <div class="modal">
        <div class="center">
           <%-- <img src="../loader.gif" />--%>
            <img src="../loader.gif" /> 
        </div>
    </div>
 </ProgressTemplate>
   </asp:UpdateProgress>
    <center>

    <asp:ToolkitScriptManager ID="ScriptManager12" runat="Server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

     <asp:Panel ID="pnl" GroupingText="Bulk Maker" CssClass="Panel" runat="server"   Width="100%"> 
              
        <div id="BulkMaker"  runat="server" align="center" >
         
          <table>
              
             <tr>
                 <td>
                     Select Inward Date :
                 </td>
                 <td>
                     <asp:DropDownList ID="ddlInwDate" runat="server" Height="25px" Width="180px" AutoPostBack="true" OnSelectedIndexChanged="ddlInwDate_SelectedIndexChanged"></asp:DropDownList>
                 </td>
             </tr>

             <tr>
                 <td>
                      Batch Code :
                 </td>
                 <td>
                     <asp:DropDownList ID="ddlBatch" runat="server" Height="25px" Width="180px" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                 </td>
             </tr>
              
             <tr>
                 <td colspan="2">

                   

                 </td>
                
             </tr>
             <tr>
                 <td colspan ="2" align="center">
                     <asp:Button ID="btnok" runat="server" text="OK"  Height="25px" Width="80px" ForeColor="Blue" OnClick="btnok_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Button ID="btnClose" runat="server" text="Close" ForeColor="Red"   Height="25px" Width="80px" OnClick="btnClose_Click" />
                 </td>
             </tr>
         </table>
             <table >
              <tr>
                        <td colspan="2">
                            <asp:GridView ID="gridUMRN" runat="server" align="center" Visible="false" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="umrn" ForeColor="#333333" 
                                GridLines="None" OnPageIndexChanging="gridUMRN_PageIndexChanging" PageSize="10"  Style="border: 1px solid black; margin: 0px auto;" Width="90%">
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="20px" HorizontalAlign="Center" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="UMRN">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
                                        <ItemTemplate>
                                           <asp:LinkButton ID="lblUMRNumber" runat="server"   Text='<%# Bind("umrn") %>' OnClick="lblUMRNumber_Click"></asp:LinkButton>
                                          <%--    <asp:LinkButton ID="lbStockNumber" runat="server"   Text='<%#Eval("batch") %>' OnClick="lblUMRNumber_Click"></asp:LinkButton>--%>
                                          
                                        </ItemTemplate>
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
                        </td>
                    </tr>
        </table>
        <table>
            <tr>
                <td>
                      <asp:Label ID="lblAutoRej" runat="server" Font-Bold="true" ForeColor="Red" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                      <asp:Label ID="lblManualRej" runat="server" Font-Bold="true" ForeColor="Red" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                      <asp:Label ID="lblAutoRejAcno" runat="server" Font-Bold="true" ForeColor="Red" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label ID="lblAutoMaker" runat="server" Font-Bold="true" ForeColor="Blue" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                     <asp:Label ID="lblTotal" runat="server" Font-Bold="true" ForeColor="Blue" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                     <asp:Label ID="lblInwDate" runat="server" Font-Bold="true" ForeColor="Blue" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>

       



        </div>

         </asp:Panel>
            
    <asp:Panel ID="pnl2" GroupingText="Inward Batch" CssClass="Panel" runat="server" Visible="false"    Width="100%"> 
         <div id="UpdateInwBatch" runat="server" align="center"  >   <%--style="display: none"--%>

               <table>
             
                <tr>
                    <th colspan="2">
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Blue" Text="BATCHES SPLIT"></asp:Label>
                    </th>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="grdbatch" runat="server" align="center" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="batch" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdbatch_PageIndexChanging" PageSize="10" Style="border: 1px solid black; margin: 0px auto;" Width="90%">
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="20px" HorizontalAlign="Center" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkBatch" runat="server" AutoPostBack="true" OnCheckedChanged="chBatch_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Batches">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbatch" runat="server" Text='<%#Eval("batch") %>'></asp:Label>
                                        </ItemTemplate>
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Bold="true" ForeColor="Black" Text="SELECT ALL"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkAllFile" runat="server" AutoPostBack="true" Font-Bold="true" OnCheckedChanged="chkAllFile_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnUpdInw" runat="server" Font-Bold="true" ForeColor="Blue" Height="25px" OnClick="btnUpdInw_Click" text="OK" Width="80px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" ForeColor="Red" Height="25px" OnClick="btnClose_Click" text="Close" Width="80px" />
                        </td>
                    </tr>
                </tr>
         </table>
        <table>
            <tr>
                <td>
                      <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="Red" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>

         
        </div>

     </asp:Panel>

   <asp:Panel ID="pnl3" GroupingText="UMRN Details" CssClass="Panel" runat="server" Visible="false"   Width="100%"> 

            <div id="Div1" runat="server" align="center" >    <%--style="display: none"--%>
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <div style="width: 100%" align="center">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:ImageButton ID="btnImgPrev" runat="server" Height="29px" ImageUrl="~/Images/1415545561_circle_back_arrow-128.png"
                                    OnClick="btnImgPrev_Click" Width="32px" Visible="false" />
                            </td>
                            <td class="style8">
                                <asp:Label ID="Label28" Text="Search Criteria :" runat="server" Width="112px" Visible="false"></asp:Label>
                            </td>
                            <td class="style9">
                                <asp:DropDownList ID="cboSearch" runat="server" Width="160px" AutoPostBack="True" Visible="false"
                                    OnSelectedIndexChanged="cboSearch_SelectedIndexChanged">
                                    <asp:ListItem><--Select--></asp:ListItem>
                                    <asp:ListItem>UMRN</asp:ListItem> 
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
                                            <asp:Label ID="Label29" Text="UMRN :" runat="server" Width="106px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSearchVal" runat="server" Style="text-transform: uppercase" Width="288px"></asp:TextBox>
                                        </td>
                                        <td><asp:CheckBox runat="server" ID="chkArchive" Text="Include Archived" Visible="false" /></td>
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
                                    Style="height: 26px" class="myButton" Width="60px"  Visible="false"/>
                                 <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click"
                                    Style="height: 26px" class="myButton" Width="60px" />
                            </td>
                            <td>
                                <asp:ImageButton ID="btnImgNxt" runat="server" Height="29px" ImageUrl="~/Images/1415545553_circle_next_arrow_disclosure-128.png"
                                    OnClick="btnImgNxt_Click" Width="32px" Visible="false" />
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
                </div>
                <table style="width: 100%; border: 1px solid #ccc;">
                </table>
                 <table style="width: 100%; border: 1px solid #ccc;">
                    <tr>
                        <td >
                            <asp:Label ID="Label33" Text="Reject Reason" Font-Size="11.1" runat="server" ForeColor="Blue"></asp:Label>
                         
                           <asp:DropDownList runat="server" ID="ddlReject" Font-Size="11.1" Width="40%"> </asp:DropDownList>
                                   
                    
                            
                              <asp:Button ID="bbtn" runat="server" Text="Reject" OnClick="bbtnReject_Click"  Style="height: 26px" class="myButton" Width="60px" />
                                   
                            
                        </td>                        
                        </tr>
                    </table>
                <table style="width: 100%; border: 1px solid #ccc;">
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label41" Text="Utility:" runat="server" Width="77px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUtilityCode" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                            <asp:TextBox ID="txtUtilityName" Text="" runat="server" ReadOnly="true" Width="92px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="lblCategory" Text="" runat="server"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label42" Text="Batch:" Style="text-align: right" runat="server" Width="86px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBatch" runat="server" Width="50px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label43" Text="Mandate no.:" Style="text-align: right" runat="server"
                                Width="204px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIHNO" runat="server" Width="50px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 78px">
                            <asp:Label ID="Label5" Style="text-align: right; width: 78px" Text="Umrn :" runat="server"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtUMRN" Text="" runat="server" ReadOnly="true" Width="200px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label6" Text="Mandate Date :" runat="server" Width="130px"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="mskMandateDT" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label3" Text="Bank :" runat="server" Width="50px"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="txtBank" Text="" runat="server" ReadOnly="true" Width="169px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label8" Text="Mandate_ID :" runat="server" Width="85px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMandateID" Text="" runat="server" ReadOnly="true" Width="91px"
                                Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 78px;">
                            <asp:Label ID="Label4" Text="Name :" runat="server"></asp:Label>
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtName" Text="" runat="server" ReadOnly="true" Width="200px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label7" Text="MICR/IFSC :" runat="server" Width="73px"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtMicrCode" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label9" Text="A/C Type :" runat="server" Width="119px"></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:TextBox ID="txtAcType" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label10" Text="A/C No :" runat="server" Width="60px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAcNo" Text="" runat="server" ReadOnly="true" Width="160px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="50">
                            <asp:Label ID="Label11" Text="Cust Ref No:" Style="text-align: right" runat="server"
                                Width="77px"></asp:Label>
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtConsumerNo" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label12" Text="Scheme Ref No:" Style="text-align: right" runat="server"
                                Width="95px"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtSchemeRefNo" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label13" Text="Frequency:" runat="server" Width="167px"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtFrequency" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkUntilCancel" runat="server" Text="Until Cancelled" Enabled="False"
                                EnableTheming="True" />
                        </td>
                    </tr>
                    <tr>
                        <td width="55px">
                            <asp:Label ID="Label14" Text="Start Date:" Style="text-align: right" runat="server"
                                Width="77px"></asp:Label>
                        </td>
                        <td class="style7">
                            <asp:TextBox ID="mskStartDT" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label15" Text="End Date:" runat="server" Width="61px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskEndDate" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label30" Text="Amount:" runat="server" Width="55px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAmount" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="lblCollType" Text="Collection Type:" runat="server" Width="100px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtColType" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label16" Text="Add Cust ID:" Style="text-align: right" runat="server"
                                Width="75px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCustID" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label17" Text="Phone:" runat="server" Width="41px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" Text="" runat="server" Width="150px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" width="55" class="style12">
                            <asp:Label ID="Label20" Text="Live Status:" runat="server"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtLivestatus" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label18" Text="Mob No.:" runat="server" Width="70px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtmob" runat="server" Width="100px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label19" Text="Maker:" Style="text-align: right" runat="server" Width="74px"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtMaker" Text="" runat="server" ReadOnly="true" Width="150px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label21" Text="Entry DT:" runat="server" Width="57px"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="mskEntryDT" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right" class="style12">
                            <asp:Label ID="Label22" Text="Mail ID:" runat="server" Width="64px"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtMail" Text="" runat="server" ReadOnly="true" Width="169px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label23" Text="Checker:" Style="text-align: right" runat="server"
                                Width="74px"></asp:Label>
                        </td>
                        <td class="style7">
                            <asp:TextBox ID="txtChecker" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label24" Text="Checker DT:" runat="server" Width="95px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskCheckerDT" Text="" runat="server" ReadOnly="true" Width="150px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label25" Text="NPCI Upload DT:" runat="server" Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskUploadDT" Text="" runat="server" ReadOnly="true" Width="100px"
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label26" Text="NPCI Res Upd DT:" Style="width: 107px" runat="server"
                                Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mskUpdateDT" runat="server" Width="100px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                      
                </table>
                  <div>
                               <%-- <table width="100%">
                                    <tr>
                                        <td align="right" width="25%">
                                            <asp:Label ID="lblReason" Text="Reason:" runat="server"></asp:Label>
                                        </td>
                                        <td width="left" width="75%"><asp:DropDownList runat="server" ID="ddlReject" Width="100%" Font-Size="8.8">
                                    </asp:DropDownList></td>
                                    </tr>
                                </table>--%>
                 </div>
                <div >  <%--style="display:none"--%>
                <table style="border: 1px solid #ccc;" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label27" Text="Reject Reason:" runat="server" Width="96px" Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstRetReason" runat="server"   Width="225px" Enabled="False"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Label ID="Label31" Text="Status:" runat="server"  Width="53px" Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstStatus" runat="server" Width="225px"    Enabled="False"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Label ID="Label32" Text="Remark:" runat="server" Width="78px"   Height="17px"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstRemark" runat="server" Width="225px"   Enabled="False"></asp:ListBox>
                        </td>
                    </tr>
                </table>
                </div>
              <%--  <div  style="display:none">--%>
                <table style="width: 100%;" >
                    <tr>
                        <td align="left"  style="display:none">
                            <span style="padding-right: 15px">
                                <asp:Label ID="lblAckRejCode" Text="Ack Reason:" runat="server"></asp:Label>
                            </span><span style="padding-right: 15px">
                                <asp:TextBox ID="txtAckRejCode" runat="server" ReadOnly="true" Width="300px"></asp:TextBox></span>
                        </td>
                        <td style="text-align:center">
                            <span>
                                <asp:Button ID="btnPrev" runat="server" class="myButton" Width="60px" Text="Prev"
                                    Enabled="False" OnClick="btnPrev_Click" /></span> <span>
                                        <asp:Button ID="btnNext" runat="server" class="myButton" Width="60px" Text="Next"
                                            Enabled="False" OnClick="btnNext_Click" /></span>
                        </td>
                        <td style="padding-right:15px;text-align:right" >
                            <span>
                                <%--<asp:Button ID="btnDownloadImage" runat="server" Text="Download Image" class="myButton"
                                    Width="120px" OnClick="btnDownloadImage_Click" />--%>
                               <%-- <asp:Button ID="btnInwardDet" runat="server" Text="Transaction Details" class="myButton"
                                    Width="140px" OnClick="btnInwardDet_Click" Enabled="False" /></span><span>
                                        <asp:Button ID="btnCLoseMain" class="myButton" Width="60px" runat="server" Text="Close"
                                            OnClick="btnCLoseMain_Click" /></span>--%>
                        </td>
                    </tr>
                </table>
                  
                </div>
            </div>


    
          </asp:Panel>
 </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnok"/>
        </Triggers>
    </asp:UpdatePanel>
    </center>
         <script type="text/javascript">
              window.onsubmit = function () {
                  if (Page_IsValid) {
                      var updateProgress = $find("<%= UpdateProgress1.ClientID %>");
                   window.setTimeout(function () {
                       updateProgress.set_visible(true);
                   }, 100);
               }
           }
    </script>
</asp:Content>

