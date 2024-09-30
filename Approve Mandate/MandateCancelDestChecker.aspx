<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_MandateCancelDestChecker, App_Web_mandatecanceldestchecker.aspx.1f1b7ac7" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
   
    <script src="~/Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="~/Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
   
     <style type="text/css">
         * {
            margin: 0;
            padding: 0;
        }

        #dvImage {
            float: left;
            /*width: 70%;*/
            overflow: hidden;
            border: 1px solid #ccc;
            width: 920px;
            height: 300px;
        }

        #dvOpen {
            /* float: left; */
            /* width: 0px; */
            overflow: hidden;
            height: 300px;
            border: 1px solid #ccc;
            /*float: left;
            width: 29%;
            overflow: hidden;*/
            height: 300px;
            border: 1px solid #ccc;
        }

        .magnify {
            width: 100%;
            height: 300px;
            margin: 0px auto;
            position: relative;
        }

        /*Lets create the magnifying glass*/ .large {
            width: 475px;
            height: 100px;
            position: absolute;
            border-radius: 100%; /*Multiple box shadows to achieve the glass effect*/
            box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25); /*Lets load up the large image first*/ /*background: url('') no-repeat; /*hide the glass by default*/
            display: none;
        }
        /*To solve overlap bug at the edges during magnification*/ .small {
            display: block;
        }

        .auto-style1 {
            text-align: right;
            background-color1: rgb(232,232,232);
            height: 23px;
        }

        .auto-style2 {
            /*background-color: rgb(235,235,235);*/
            background-color1: rgb(232,232,232);
            height: 23px;
        }
    </style>
     <script type="text/javascript">



        function viewImage(val) {
            var edit_save = document.getElementById("<%= chkImag.ClientID %>");            
            var str = val;          
            while (str.length < 8) {
                str = '0' + str;
            }           
            edit_save.src = "../Images/InwardImages/" + str + ".jpg";            
        }
        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
        function fnJumpSize(cmbDrop) {

            if (cmbDrop.style.width != "390px") {
                cmbDrop.style.width = "390";
            }
            else {
                cmbDrop.style.width = "200";
            }

        }
   
         $(document).ready(function () {
             var native_width = 0;
             var native_height = 0;             
             $(".magnify").mousemove(function (e) {                
                 if (!native_width && !native_height) {                     
                     var image_object = new Image();
                     image_object.src = $(".small").attr("src");                    
                     native_width = image_object.width;
                     native_height = image_object.height;                 
                 }
                 else {     
                     var magnify_offset = $(this).offset();                     
                     var mx = e.pageX - magnify_offset.left;
                     var my = e.pageY - magnify_offset.top;                    
                     if (mx < $(this).width() && my < $(this).height() && mx > 0 && my > 0) {
                         $(".large").fadeIn(100);
                     }
                     else {
                         $(".large").fadeOut(100);
                     }
                     if ($(".large").is(":visible")) {
                      
                         var rx = Math.round(mx / $(".small").width() * native_width - $(".large").width() / 2) * -1;
                         var ry = Math.round(my / $(".small").height() * native_height - $(".large").height() / 2) * -1;
                         var bgp = rx + "px " + ry + "px";
                        
                         var px = mx - $(".large").width() / 2;
                         var py = my - $(".large").height() / 2;
                        
                         $(".large").css({ left: px, top: py, backgroundPosition: bgp });                        
                     }
                 }
             })
         })

         $(document).on("keydown", function (e) {
             if (e.which === 8) {
                 return false;
             }
         });

         function ImageNotFound() {
             alert('Image is not available');
             window.location = "DestInwardMandate.aspx";
         }
         function EmailIdcc() {
             var AsciiValue = event.keyCode;
             if ((AsciiValue >= 64 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 59) || (AsciiValue == 46))
                 return true;
             else
                 return false;
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
     <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgView"
        runat="server" />
   
    <asp:UpdatePanel ID="updPanel3" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div style="width: 100%">
                <table>
                    <tr>
                        <td>                             
                            <asp:Label ID="labelUMRN" Text="Enter UMRN :" runat="server"></asp:Label>
                        </td>
                        <td style="width: 10px"></td>
                        <td>
                            <asp:TextBox ID="txtSearch" Width="260px" runat="server" autocomplete ="off" Height="25px"></asp:TextBox>
                        </td>
                        <td style="width: 5px"></td>
                        <td>
                            <td>
                                <asp:Button ID="btnOk" runat="server" Text="Search" OnClick="btnOk_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                           
                    </tr>
                </table>
            </div>
             <span style="display: none">
                                    <asp:GridView ID="grvInwData" runat="server">
                                    </asp:GridView>
                                </span>

       
           
            <div style="display: none;">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" Text="Filter" runat="server"></asp:Label>
                        </td>
                       
                        <td>
                            <asp:Label ID="Label1" Text="Date" runat="server"></asp:Label>
                        </td>
                       
                        <td>
                            <asp:Label ID="lblUtilityName" Text="Utility" runat="server"></asp:Label>
                        </td>
                     
                        <td>
                            <span style="display: none">
                                <asp:TextBox ID="txtUtilityName" runat="server" onkeydown="return MoveNext('MainContent_btnFetchData',event.keyCode);"
                                    ReadOnly="true" Width="150px"></asp:TextBox></span>
                            <asp:Label ID="Label2" Text="Batch" runat="server"></asp:Label>
                        </td>
                       
                    </tr>
                </table>
            </div>
            <div style="width: 100%">
                <!-- This is the magnifying glass which will contain the original/large version -->
                <table style="width: 100%;margin-left:10%; margin-right:5%;">
                    <tr>
                        <td style="width: 100%;  height: 260px;">
                            <div class="magnify">
                                <div id="zoom" class="large" runat="server">
                                </div>
                                <asp:Image ID="chkImag" CssClass="small" Width="900px" Height="260px" runat="server"  BorderWidth="1px" />
                                 
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-left: 1%; margin-top: -2%;">
                <fieldset style="width: 99%;">
                    <legend>Cancel Mandate (Checker):</legend>
                    <table>
                        <tr>
                            <div>
                                <td class="form-fld-lbl" style="display: none">
                                    <asp:Label ID="lblUMRN" runat="server" Text="UMRN :" Width="90px"></asp:Label>
                                </td>
                                <td class="form-fld-val" style="display: none">
                                    <asp:TextBox ID="txtUmrn" runat="server" ReadOnly="true" Text="" Width="170px"></asp:TextBox>
                                </td>
                            </div>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblUmrn1" runat="server" Text="UMRN :"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtumrn1" Text="" runat="server" Width="170px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="form-fld-val" style="text-align: right;">
                                <asp:Label ID="lblCustName" runat="server" Text="Client Name:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCustName" Text="" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" style="width: 5px">
                                <asp:Label ID="lblAction" runat="server" Text="Action :"></asp:Label>
                            </td>
                            <td style="padding-right: 20px" class="form-fld-val">
                                <asp:TextBox ID="txtAction" runat="server" ReadOnly="true" Width="155px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="lblAcno" Text="Account No:" runat="server"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtAccNo" runat="server" ReadOnly="true" Width="170px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" width="6%">
                                <asp:Label ID="lblActype" Text="A/c Type:" runat="server"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtAcType" runat="server" ReadOnly="true" Width="105px"></asp:TextBox>
                                <asp:CheckBox ID="chkUntilCancel" runat="server" Text="Until Cancel " Enabled="False" />
                            </td>
                            <td class="form-fld-lbl" width="6%" align="right">
                                <asp:Label ID="lblAmt" Text="Amount :" runat="server"></asp:Label>

                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtAmount" Text="" runat="server" Width="155px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" width="20%">
                                <asp:Label ID="lblcolltype" Text="Collection Type:" runat="server" Width="95px"></asp:Label>
                            </td>
                            <td class="form-fld-val" width="14%">
                                <asp:TextBox ID="txtCollType" Text="" runat="server" Width="160px" ReadOnly="true"></asp:TextBox>
                                <asp:Label ID="lblmsgmail" runat="server" Font-Bold="true" Text="&#8730; Mail Sent"
                                    Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="lblfreq" Text="Frequency :" runat="server"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtFrequency" runat="server" ReadOnly="true" Text="" Width="170px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblstartdate" Text="Start Date:" runat="server" Width="100px"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtStartDate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" width="6%" align="right">
                                <asp:Label ID="lblenddate" Text="End Date :" runat="server" Width="100px"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtEnddate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" width="6%">
                                <asp:Label ID="lblRef1" runat="server" Text="Reference 1 :"></asp:Label>


                            </td>
                            <td class="form-fld-val" width="14%">
                                <asp:TextBox ID="txtCustRefnNO" runat="server" ReadOnly="true" Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1" width="8.5%">
                                <asp:Label ID="lblMail" Text="Mail Id :" runat="server"></asp:Label>
                            </td>
                            <td width="14%" class="auto-style2">
                                <asp:TextBox ID="txtMail" Text="" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="auto-style1" width="7%">
                                <asp:Label ID="lblRef2" runat="server" Text="Reference 2 :"></asp:Label>
                            </td>
                            <td width="14%" class="auto-style2">
                                <asp:TextBox ID="txtSchRefNo" runat="server" ReadOnly="true" Text="" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style1" width="6%" align="right">
                                <asp:Label ID="lblMobile" Text="Mobile :" runat="server"></asp:Label>
                            </td>
                            <td width="14%" class="auto-style2">
                                <asp:TextBox ID="txtMobile" Text="" runat="server" Width="112px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="auto-style1" width="6%">
                                <asp:Label ID="lblCustBankName" runat="server" Text="Bank Name :"></asp:Label>
                            </td>
                            <td class="auto-style2" width="14%">
                                <asp:TextBox ID="txtCustBankName" runat="server" ReadOnly="true" Width="200px"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="form-fld-lbl" width="6%">
                                <asp:Label ID="lblStatus" Text="Status:" runat="server"></asp:Label></span>
                            </td>
                            <td class="form-fld-val" width="14%">
                                <asp:TextBox ID="txtStatus" runat="server" Width="70px" ReadOnly="true"></asp:TextBox></span>
                            </td>
                            <td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="lblrsn" Text="Reason :" runat="server"></asp:Label></span>
                            
                            </td>
                           <%-- <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtReason" runat="server" Width="200px" ReadOnly="true"></asp:TextBox></span>
                            </td>
                            <td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="Label4" Text="Reason:" runat="server" Visible="true"></asp:Label>
                            </td>--%>
                            <td class="form-fld-val">
                                <asp:DropDownList runat="server" ID="ddlReject1" Width="333px" Visible="true" Font-Size="8.8">
                                </asp:DropDownList>
                            </td>

                            <td class="form-fld-lbl" width="7%">
                                <asp:Label ID="lblcc" runat="server" Text="CC : " Visible="false"></asp:Label>
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtaddcc" runat="server" Width="250px" onkeypress="return EmailIdcc()"
                                    Font-Names="Verdana" Font-Size="Small" Visible="false"></asp:TextBox>
                            </td>

                        </tr>
                    </table>

                     <div style="width: 100%; margin-left: 1%;">

                            <div style="width: 10px; height:25px"> </div>

                    </div>   

                    <table style="margin-left: 50%;" >
                         <tr>
                             <td>
                                 <asp:Button ID="btnAccpt" runat="server" class="myButton" Height="25px" OnClick="btnAccpt_Click" Text="Confirm" Width="120px" />
                             </td>
                             <td style="width: 5px"></td>
                             <td>
                                 <asp:Button ID="btnReject" runat="server" class="myButton" Height="25px" OnClick="btnReject_Click1" Text="Deny" Width="120px" />
                             </td>
                             <td style="width: 5px"></td>
                             <td>
                                 <asp:Button ID="btnCancel" runat="server" class="myButton" Height="25px" OnClick="btnCancel_Click" Text="Clear" Width="60px" />
                             </td>
                             <td style="width: 5px"></td>
                             <td>
                                 <asp:Button ID="btnClose" runat="server" class="myButton" Height="25px" OnClick="btnClose_Click" Text="Close" Width="80px" />
                             </td>
                             <td style="width: 5px"></td>
                             <td>
                                 <asp:Button ID="btnBW" runat="server" class="myButton" Height="25px" OnClick="btnBW_Click" Text="B&amp;W" Width="80px" />
                             </td>
                         </tr>
                           
                            
                    </table>

                </fieldset>
                
                <div>
                    
                </div>
                <div style="display: none;">
                    <span style="display: none">
                        <asp:Label ID="lblIhno" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblCounter" runat="server" Text="Label"></asp:Label>
                    </span>
                   
                </div>
                <div>
                   
                    <span style="padding-left: 30px">
                       
                    </span>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
  
                               
                           
 
    <div style="display: none">
        <asp:HiddenField ID="hiddField" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddImgPath" runat="server"></asp:HiddenField>
    </div>
    <script type="text/javascript">
        var val;
        function viewImage(val, n) {
            var edit_save = document.getElementById("<%= chkImag.ClientID %>");
            str = val;
            while (n < 8) {
                str = '0' + str;
                n++;
            }
            edit_save.src = "../Images/InwardImages/" + str + ".jpg";

        }
    </script>
    
</asp:Content>

