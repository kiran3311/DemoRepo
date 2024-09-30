<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_UploadOutwardImageData, App_Web_uploadoutwardimagedata.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit" TagPrefix="asp"%>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript" language="javascript">

        function EnablefldManData() {
            var x = document.getElementById("MainContent_chkManData").checked;

            if (x) {

                document.getElementById('MainContent_flUpldManData').disabled = false;
            } else {

                document.getElementById('MainContent_flUpldManData').disabled = true;
            }
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

    </script>
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
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upTRNInwardRpt">
    <ProgressTemplate>
    <div class="modal">
        <div class="center">
            <img src="../loader.gif" alt="loader"> 
        </div>
    </div>
 </ProgressTemplate>
   </asp:UpdateProgress>

    <div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    </div>

    <asp:UpdatePanel ID="upTRNInwardRpt" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel ID="pnl" GroupingText="Upload Mandate Image" CssClass="Panel" runat="server"
                Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" OnServerValidate="cvOk_ServerValidate"
                    Display="None" runat="server" ValidationGroup="vgOk"></asp:CustomValidator>
                <div align="center">
                    <table width="80%">
                        <tr>
                            <td align="right" class="style1">
                                <asp:Label ID="lblinwdate" runat="server" Text="Inw Date"></asp:Label>
                            </td>
                            <td align="left" class="style1">
                                <asp:TextBox ID="txtinwdate" onkeydown="return MoveNext('MainContent_btninwarddate',event.keyCode);"
                                    runat="server"></asp:TextBox>
                                <asp:MaskedEditExtender ID="mskDate" TargetControlID="txtinwdate" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvinwDate" runat="server" Display="None" ErrorMessage="Please Enter Inward Date"
                                    CausesValidation="true" ValidationGroup="vgOK" ControlToValidate="txtinwdate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                <asp:Label ID="lblSoleId" Text="Sol Id" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="style2">
                                <asp:TextBox ID="txtSolId" runat="server" onkeypress="return NumberOnly()" MaxLength="4"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                                    <td align="right">
                                        <asp:Label ID="lblUtilName" Text="Utility Name :" runat="server"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlUtilityName" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" >
                                        </asp:DropDownList>
                                    </td>
                                    </tr>
                         <tr>
                            <td align="right" class="style2">
                                <asp:Label ID="lblUploadDate" Text="Mandate Upload Date :" runat="server"></asp:Label>
                            </td>
                            <td align="left" colspan="2">
                                <asp:DropDownList ID="ddlUploadDate" runat="server" Width="300px" AutoPostBack="True"  OnSelectedIndexChanged="ddlUploadDate_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                <asp:Label ID="lblBatchNo" Text="Mandate Batch No :" runat="server"></asp:Label>
                            </td>
                            <td align="left" colspan="2">
                                 <asp:DropDownList ID="ddlBatchNo" runat="server" Width="300px"  AutoPostBack="True" OnSelectedIndexChanged="ddlBatchNo_SelectedIndexChanged">
                                        </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                 <asp:Label ID="filename" Text="File Name :" runat="server"></asp:Label>
                            </td>
                             <td align="left" colspan="2">
                        <asp:Label ID="lblfilename" Text="" runat="server"></asp:Label> </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                <asp:Label ID="lblImgPath" Text="Mandate Image Path :" runat="server"></asp:Label>
                            </td>
                            <td align="left" colspan="2">
                                <asp:FileUpload ID="flUpld" runat="server" Width="512px" onkeydown="return MoveNext('MainContent_flUpldManData',event.keyCode);" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:CheckBox runat="server" ID="chkfb" Text="Flatbed Scanner" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:CheckBox runat="server" ID="chkManData" Text="Mandate Data" onclick="EnablefldManData();" />
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flUpldManData" runat="server" Width="512px" />
                            </td>
                            <td>
                                <span style="float: right">
                                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="flUpldManData"
                                        ErrorMessage="Select Only .xls or .Xlsx" ValidationGroup="vgOk" ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$)"
                                        Display="Dynamic" ForeColor="#FF0066"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="btnupld" runat="server" Text="Upload" class="myButton" Width="60px" Height="25px" OnClick="btnUpld_Click"
                                    CausesValidation="true" ValidationGroup="vgOk" />
                                <asp:Button ID="btnCancel" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblMandate" Text="" runat="server">                    
                                </asp:Label>
                            </td>
                            <td align="left">
                                <div>
                                    <span style="margin-left: 100px">
                                        <asp:Label ID="lblBatch" Text="" runat="server">                    
                                        </asp:Label>
                                    </span><span style="margin-left: 150px">
                                        <asp:Label ID="lblBatchNos" Text="" runat="server">                    
                                        </asp:Label>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style2">
                                <asp:Label ID="lblMsg" Text="Download log file:- " runat="server" Font-Bold="true"></asp:Label>
                                <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="Div1" style="display: none" runat="server">
                    <asp:TextBox ID="txtFilePath" runat="server">      
                    </asp:TextBox>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnupld" />
            <asp:PostBackTrigger ControlID="linkExcel" />
           
        </Triggers>
    </asp:UpdatePanel>
    <div id="divHidd" runat="server">
    </div>
    <div id="Div3" style="display: none" runat="server">
        <asp:Button ID="btninwarddate" runat="server" CausesValidation="true" ValidationGroup="vgOK" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .Panel fieldset
        {
            border-color: Black;
            border-width: 1px;
        }
        .style1
        {
            height: 28px;
        }

        .modal1 {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            /* background-color :White; */
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
            display:flex;
            justify-content:center;
            align-items:center;
         
        }
        
        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            /* background-color :White; */
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
            margin-top:15%;
            margin-left:40%;
        }


    </style>
</asp:Content>

