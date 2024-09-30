<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_DestInwMandateView_API, App_Web_destinwmandateview_apinew.aspx.1f1b7ac7" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <link href="../Styles/ProgressCtrl.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        /*Some CSS*/ * {
            margin: 0;
            padding: 0;
        }

        .magnify {
            width: 100%;
            position: relative;
            height: 348px;
            top: 0px;
            left: 0px;
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

        .style1 {
            width: 50%;
            height: 412px;
        }
    </style>
    <script type="text/javascript">
        function viewImage(val) {
            var edit_save = document.getElementById("<%= chkImag.ClientID %>");
            // alert(edit_save);
            //var edit_save = document.getElementById("chkImag");
            //var str = '' + val.value;
            var str = val;
            //            alert(edit_save);
            while (str.length < 8) {
                str = '0' + str;
            }
            //dalert(str);
            edit_save.src = "../Images/InwardImages/" + str + ".jpg";
            //document.getElementById("hiddentval").value = str;
            //alert(edit_save.src);
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
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            var native_width = 0;
            var native_height = 0;

            //Now the mousemove function
            $(".magnify").mousemove(function (e) {
                // alert('hii');
                //When the user hovers on the image, the script will first calculate
                //the native dimensions if they don't exist. Only after the native dimensions
                //are available, the script will show the zoomed version.
                if (!native_width && !native_height) {
                    //alert('here');
                    //This will create a new image object with the same image as that in .small
                    //We cannot directly get the dimensions from .small because of the 
                    //width specified to 200px in the html. To get the actual dimensions we have
                    //created this image object.
                    var image_object = new Image();
                    image_object.src = $(".small").attr("src");

                    //This code is wrapped in the .load function which is important.
                    //width and height of the object would return 0 if accessed before 
                    //the image gets loaded.
                    native_width = image_object.width;
                    native_height = image_object.height;
                    //alert(native_height + " " + native_width);
                }
                else {
                    //x/y coordinates of the mouse
                    //This is the position of .magnify with respect to the document.
                    var magnify_offset = $(this).offset();
                    //We will deduct the positions of .magnify from the mouse positions with
                    //respect to the document to get the mouse positions with respect to the 
                    //container(.magnify)
                    //alert(magnify_offset);
                    var mx = e.pageX - magnify_offset.left;
                    var my = e.pageY - magnify_offset.top;
                    //alert(mx+" "+my);
                    //Finally the code to fade out the glass if the mouse is outside the container
                    if (mx < $(this).width() && my < $(this).height() && mx > 0 && my > 0) {
                        $(".large").fadeIn(100);
                    }
                    else {
                        $(".large").fadeOut(100);
                    }
                    if ($(".large").is(":visible")) {
                        //The background position of .large will be changed according to the position
                        //of the mouse over the .small image. So we will get the ratio of the pixel
                        //under the mouse pointer with respect to the image and use that to position the 
                        //large image inside the magnifying glass
                        var rx = Math.round(mx / $(".small").width() * native_width - $(".large").width() / 2) * -1;
                        var ry = Math.round(my / $(".small").height() * native_height - $(".large").height() / 2) * -1;
                        var bgp = rx + "px " + ry + "px";
                        //alert(rx);
                        //Time to move the magnifying glass with the mouse
                        var px = mx - $(".large").width() / 2;
                        var py = my - $(".large").height() / 2;
                        //Now the glass moves with the mouse
                        //The logic is to deduct half of the glass's width and height from the 
                        //mouse coordinates to place it with its center at the mouse coordinates

                        //If you hover on the image now, you should see the magnifying glass in action
                        $(".large").css({ left: px, top: py, backgroundPosition: bgp });
                        // $("#txtval").val('X:' + px + ', Y:' + py + ', BGP:' + bgp);
                        //                    var magnify_offset1 = $(this).offset();
                        //                    var mx1 = e.pageX - magnify_offset.left;
                        //                    var my1 = e.pageY - magnify_offset.top;
                        //                   alert()
                    }
                }
            })
        })
    </script>
    <script type="text/javascript">
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
        //------for unlocking the batches on pageleave ----------
        // Register the event.
        //window.onbeforeunload = function () {
        //PageMethods.UnlockOnPageLeave();
        //}
    </script>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
    </div>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgView"
        runat="server" />
    <asp:CustomValidator ForeColor="Red" ID="cvView" runat="server" ValidationGroup="vgView"
        OnServerValidate="cvView_ServerValidate"></asp:CustomValidator>
    <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <div>
                <%--<table width="100%">--%>
                <fieldset>
                    <table style="margin-left: -13px">
                        <tr>
                            <td style="text-align: right; padding-right: 9px; width: 12%">
                                <asp:Label ID="Label3" Text="Filter :" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFilter" runat="server" Width="120px" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Amt < 300000</asp:ListItem>
                                    <asp:ListItem>Amt >= 300000</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label1" Text="Date :" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlImportDate" runat="server" Width="120px" OnSelectedIndexChanged="ddlImportDate_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="display: none">
                                <asp:Label ID="lblUtilityName" Text="Utility :" runat="server"></asp:Label>
                            </td>
                            <td style="display: none">
                                <asp:DropDownList ID="ddlUtilityName" runat="server" Width="300px" onkeydown="return MoveNext('MainContent_txtUtilityName',event.keyCode);"
                                    OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <span style="display: none">
                                    <asp:TextBox ID="txtUtilityName" runat="server" onkeydown="return MoveNext('MainContent_btnFetchData',event.keyCode);"
                                        ReadOnly="true" Width="150px"></asp:TextBox></span>
                            </td>
                            <td>
                                <asp:Label ID="Label2" Text="Batch :" runat="server"></asp:Label>
                                <asp:DropDownList ID="ddlBatch" runat="server" Width="70px" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnFetchData" Text="Show" runat="server" class="myButton" Width="60px"
                                    Height="25px" OnClick="btnFetchData_Click" />
                            </td>
                            <td>
                                <span>
                                    <asp:Label ID="lblTotal" Text="Total" runat="server"></asp:Label>
                                </span><span>
                                    <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true" Width="25px"></asp:TextBox></span>
                                <span>
                                    <asp:Label ID="lblAccept" Text="&#8730;" runat="server"></asp:Label>
                                </span><span>
                                    <asp:TextBox ID="txtAccepted" runat="server" ReadOnly="true" Width="25px"></asp:TextBox></span>
                                <span>
                                    <asp:Label ID="lblRejected" Text="X" runat="server"></asp:Label></span> <span>
                                        <asp:TextBox ID="txtRejected" runat="server" ReadOnly="true" Width="25px"></asp:TextBox></span>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div>
                <!-- This is the magnifying glass which will contain the original/large version -->
                <!-- This is the magnifying glass which will contain the original/large version -->
                <table width="100%">
                    <tr>
                        <td style="width: 45%;">
                            <asp:Panel ID="Panel1" runat="server" BorderWidth="1px">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <table width="100%">
                                                <tr>
                                                    <td width="25%" align="right">
                                                        <asp:Label ID="lblCusName" runat="server" Text="Customer Name :"></asp:Label></td>
                                                    <td width="75%" align="left">
                                                        <asp:TextBox ID="txtCustName" Text="" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="44%" valign="top">
                                            <table width="100%">
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblUMRN" runat="server" Text="UMRN :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtUmrn" runat="server" ReadOnly="true" Text="" Width="100%"></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblAcType" runat="server" Text="A/C Type :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtAcType" runat="server" ReadOnly="true" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblRef1" runat="server" Text="Ref1 :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtCustRefnNO" runat="server" ReadOnly="true" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblRef2" runat="server" Text="Ref2 :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtSchRefNo" runat="server" ReadOnly="true" Text="" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblMobile" Text="Mobile :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtMobile" Text="" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblMail" Text="Mail Id :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtMail" Text="" runat="server" Style="text-align: right" Width="100%" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right"></td>
                                                    <td width="65%" align="left">
                                                        <asp:Label ID="lblmsgmail" runat="server" Font-Bold="true" Text="&#8730; Mail Sent"
                                                            Visible="false" Width="100%"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblCustBankName" runat="server" Text="Bank :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtCustBankName" runat="server" ReadOnly="true" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblProdCategory" Text="Cat :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtProdCategory" Text="" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblStatus" Text="Status :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtStatus" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="56%" valign="top">
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblActn" runat="server" Text="Action :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtAction" runat="server" ReadOnly="true" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblAcno" Text="A/c No :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtAccNo" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblAmt" Text="Amt :" runat="server"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtAmount" Text="" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblFre" runat="server" Text="Frequency :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtFrequency" runat="server" ReadOnly="true" Text="" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblColty" runat="server" Height="16px" Text="Type :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtCollType" Text="" runat="server" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblStrt" runat="server" Height="16px" Text="StartDate :" Style="text-align: right"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtStartDate" runat="server" ReadOnly="true" Text="" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblEnd" runat="server" Text="EndDate :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtEnddate" runat="server" ReadOnly="true" Text="" Width="100%"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">&nbsp;</td>
                                                    <td width="65%" align="left">
                                                        <asp:CheckBox ID="chkUntilCancel" runat="server" Text=" Until Cancel " Enabled="False" Width="100%" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%" align="right">
                                                        <asp:Label ID="lblResaon" runat="server" Height="16px" Text="Reason :"></asp:Label></td>
                                                    <td width="65%" align="left">
                                                        <asp:TextBox ID="txtReason" runat="server" Style="text-align: left" Width="100%" ReadOnly="true"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <div>
                                    <table width="100%">
                                        <tr>
                                            <td align="center">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblNoofRec" runat="server" Font-Bold="true" Style="text-align: right"
                                                                Visible="false"></asp:Label>
                                                            <asp:Label ID="lblserialcnt" runat="server" Font-Bold="true" Style="text-align: right"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblSlash" runat="server" Text="/" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblTotalCnt" runat="server" Font-Bold="true" Style="text-align: left"></asp:Label>
                                                        </td>
                                                        <td style="width: 15px;"></td>
                                                        <td>
                                                            <asp:Button runat="server" ID="btnPrev" Text="Prev" class="myButton" Width="60px"
                                                                Height="25px" OnClick="btnPrev_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button runat="server" ID="btnNext" Text="Next" class="myButton" Width="60px"
                                                                Height="25px" OnClick="btnNext_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button runat="server" ID="btnBW" Text="B&amp;W" class="myButton" Width="60px"
                                                                Height="25px" OnClick="btnBW_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button runat="server" Text="Close" ID="btnClose" class="myButton" Width="60px"
                                                                Height="25px" OnClick="btnClose_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <table width="100%">
                                        <tr>
                                            <td width="25%" align="right">
                                                <asp:Label ID="lblReason" Text="Reason:" runat="server" Style="text-align: right"></asp:Label></td>
                                            <td width="75%">
                                                <asp:DropDownList runat="server" ID="ddlReject" Width="100%" Font-Size="8.8">
                                                </asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="margin-top: 3px; text-align: center;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="btnAccept" Text="Accept" class="myButton" Width="60px" OnClick="btnAccept_Click" />
                                                <asp:Button runat="server" ID="btnReject" Text="Reject" class="myButton" Width="60px"
                                                    Height="25px" OnClick="btnReject_Click" CausesValidation="true" ValidationGroup="" />
                                                <asp:Button runat="server" ID="btnRefresh" Text="Release Batch" class="myButton"
                                                    Width="107px" Height="25px" OnClick="btnRefresh_Click" />
                                                <span style="display: none">
                                                    <asp:Label ID="lblIhno" runat="server" Text="Label"></asp:Label>
                                                    <asp:Label ID="lblCounter" runat="server" Text=""></asp:Label>
                                                </span>
                                                <asp:RequiredFieldValidator ID="rfvReject" runat="server" ForeColor="Red" Display="None"
                                                    ErrorMessage="Please Select Reason Code" ValidationGroup="vgView" ControlToValidate="ddlReject"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </td>
                        <td style="width: 55%">
                            <div>
                                <%--class="magnify"--%>
                                <div id="zoom" class="large" runat="server">
                                </div>
                                <span style="padding-left: 130px">
                                    <asp:Label ID="lblTitle" Text="AUTHORISE MANDATE APPROVAL" Width="265px" runat="server"
                                        Height="18px" Font-Bold="True" Font-Size="small"></asp:Label></span>
                                <asp:Image ID="chkImag" CssClass="small" Width="100%" Height="310px" runat="server"
                                    BorderWidth="1px" />
                            </div>
                        </td>
                    </tr>
                </table>



            </div>
            <div>
                <table width="100%">
                    <tr>
                        <td style="width: 100%">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div align="left" style="border-style: none; font-family: Verdana;">
                                        <table style="margin-left: -4px; width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel3" runat="server" Enabled="true">
                                                        <span>
                                                            <%--<iframe id="imgFinacle" src="http://172.31.12.121:8888/ubibio/ubi.jsp" width="750px"
                                                    height="400px" runat="server" frameborder="1" name="search_iframe"></iframe>--%>
                                                            <iframe id="imgFinacle" width="0%" height="0px" runat="server" frameborder="1" name="search_iframe">                                                    
                                                </iframe>
                                                            <div class="container" style="width: 100%;">
                                                                <div class="row-fluid">
                                                                    <table style="width: 100%;" border="1">
                                                                        <tr>

                                                                            <td>
                                                                                <table cellspacing="10">
                                                                                    <tr>
                                                                                        <td valign="top" colspan="4">
                                                                                            <h2>Account Service</h2>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Account No</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIAccno" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="text-align: right" colspan="2">
                                                                                            <asp:Label ID="lblAPImsg" runat="server"></asp:Label></td>

                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API CustID No</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPICustID" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>Acc Status</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAccStatus" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Cust Name</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPICustName" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>Acc Type</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAccType" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Request ID</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIReqID" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>API Error</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIErr" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Error</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIErrMsg" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>Status</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="TextBox1" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Effective Balance</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtEFCBAL" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>

                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="4">
                                                                                            <h2>Signature Service</h2>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Request ID</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIReqID_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>API Error</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIErr_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>API Error</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtAPIErrMsg_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                        <td>Status</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtStatus_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                    </tr>
                                                                                    <tr>

                                                                                        <td colspan="4">
                                                                                            <asp:Button ID="btnAccAPI" Text="Account API" class="myButton" runat="server" OnClick="btnAccAPI_Click" /><asp:Button ID="btnReset" Text="Reset" class="myButton" runat="server" OnClick="btnReset_Click" /><asp:Button ID="btnSign_API" Text="Signature API" class="myButton" runat="server" Visible="false" /></td>
                                                                                    </tr>

                                                                                </table>
                                                                            </td>
                                                                            <td colspan="2" rowspan="2" style="width: 50%;">
                                                                                <asp:Panel ID="Panel4" runat="server" Enabled="true">
                                                                                    <asp:Image ID="Image1" CssClass="small" Width="100%" runat="server" />
                                                                                </asp:Panel>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td style="border: 1px solid red; height: 200px;">

                                                                                <asp:GridView ID="GridView2" runat="server" DataKeyNames="CustomerName" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                                                                                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                                                                                        <asp:BoundField DataField="IsExpired" HeaderText="IsExpired" />
                                                                                        <asp:BoundField DataField="IsMandatory" HeaderText="IsMandatory" />
                                                                                        <asp:BoundField DataField="PhotoIsMandatory" HeaderText="PhotoIsMandatory" />
                                                                                        <asp:BoundField DataField="SignatureGroupName" HeaderText="Sign Group" />
                                                                                        <asp:BoundField DataField="ReturnedSignature" HeaderText="ReturnedSignature" Visible="false" />
                                                                                        <asp:TemplateField ShowHeader="False">

                                                                                            <ItemTemplate>
                                                                                                <asp:Button Text="Select" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>


                                                                                </asp:GridView>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </span><span style="display: none">
                                                            <asp:GridView ID="GridView1" runat="server">
                                                            </asp:GridView>
                                                        </span>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <table width="100%" style="display: none">
        <tr>
            <td style="width: 80%">
                <%--<asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                <div align="left" style="border-style: none; font-family: Verdana;">
                    <table style="margin-left: -10px;">
                        <tr>
                            <td class="style1">
                                <asp:Panel ID="PNL12" runat="server" Enabled="true">
                                    <span style="display: none">
                                        <asp:GridView ID="grvInwData" runat="server">
                                        </asp:GridView>
                                    </span>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </td>
            <td style="width: 20%" valign="top">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblcdtrbnkname" runat="server" Text="Creditor Bank:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtcdtrbnkname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblcdtrname" runat="server" Text="Creditor Name:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtcdtrname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCdtrUtilityCode" runat="server" Text="Creditor Utility Code:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtcreditorutilitycode" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbldbtrbnkname" runat="server" Text="Debtor Bank Name:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtdbtrbnkname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPaymnttype" runat="server" Text="Payment Type:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtpaymnttype" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCurrency" runat="server" Text="Currency:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtCurrency" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsgref" runat="server" Text="Message Reference:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtmsgref" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updPanel3" runat="server" UpdateMode="Always" Visible="false">
        <ContentTemplate>
            <div>
                <table style="margin-left: 1%;">
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rbtnDsplay" runat="server" RepeatDirection="Horizontal"
                                OnSelectedIndexChanged="rbtnDsplay_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                                <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged"
                                Width="120px">
                                <asp:ListItem Text="<--Select-->"></asp:ListItem>
                                <asp:ListItem Text="UMRN"></asp:ListItem>
                                <asp:ListItem Text="NAME"></asp:ListItem>
                                <asp:ListItem Text="ACNO"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 0px"></td>
                        <td>
                            <asp:TextBox ID="txtSearch" Width="400px" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 5px"></td>
                        <td>
                            <asp:Button ID="btnOk" runat="server" Text="OK" OnClick="btnOk_Click" class="myButton"
                                Width="60px" Height="25px" />
                        </td>
                        <td style="width: 0px"></td>
                        <td>
                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click"
                                class="myButton" Width="60px" Height="25px" />
                        </td>
                    </tr>
                </table>
                <table style="margin-left: 1%;">
                    <tr>
                        <td>
                            <asp:Label ID="lbl1" runat="server" Font-Bold="true" Text="Reject Mandates before"></asp:Label>
                            <asp:TextBox ID="txtexpirydate" Width="40px" runat="server"></asp:TextBox>
                            <asp:Label ID="lbl2" runat="server" Font-Bold="true" Text=" days"></asp:Label>
                            <span style="width: 10px;"></span>
                            <asp:Button ID="btnrej_prev" runat="server" Text="Reject" OnClick="btnrej_prev_Click"
                                class="myButton" Width="60px" Height="25px" />
                            <asp:Button ID="btnrej_cancel" Text="Cancel" runat="server" OnClick="btnrej_cancel_Click"
                                class="myButton" Width="60px" Height="25px" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--   <div align="center">
    </div>--%>
    <div style="display: none">
        <asp:HiddenField ID="hiddField" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddImgPath" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddUtilityCode" Value="" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddUtilityName" Value="" runat="server"></asp:HiddenField>
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

