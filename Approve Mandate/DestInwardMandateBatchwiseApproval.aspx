﻿<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_DestInwardMandateBatchwiseApproval, App_Web_destinwardmandatebatchwiseapproval.aspx.1f1b7ac7" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>--%>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script> 
    <style type="text/css">
        /*Some CSS*/*
        {
            margin: 0;
            padding: 0;
        }
        .magnify
        {
            width: 100%;
            position: relative; /*height: 255px;*/
            height: 348px;
            top: 0px;
            left: 0px;
        }
        /*Lets create the magnifying glass*/.large 
        { 
            width: 475px;
            height: 100px;
            position: absolute;
            border-radius: 100%; /*Multiple box shadows to achieve the glass effect*/
            box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25); /*Lets load up the large image first*/ /*background: url('') no-repeat; /*hide the glass by default*/
            display: none;
        }
        /*To solve overlap bug at the edges during magnification*/.small
        {
            display: block;
        }
        .style1
        {
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
        });
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
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
    </div>
    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgView"
        runat="server" />
    <asp:CustomValidator ForeColor="Red" ID="cvView" runat="server" ValidationGroup="vgView"
        OnServerValidate="cvView_ServerValidate"></asp:CustomValidator>
    <%--  <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>--%>
    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <div>
        <fieldset>
            <table>
                <tr>
                    <td style="text-align: right; padding-right: 9px; width: 12%">
                        <asp:Label ID="Label3" Text="Filter:" runat="server"></asp:Label>
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
                        <asp:Label ID="Label1" Text="Date:" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlImportDate" runat="server" Width="120px" OnSelectedIndexChanged="ddlImportDate_SelectedIndexChanged"
                            AutoPostBack="true">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="display: none">
                        <asp:Label ID="lblUtilityName" Text="Utility:" runat="server"></asp:Label>
                    </td>
                    <%--style="display: none"--%>
                    <td style="display: none">
                        <asp:DropDownList ID="ddlUtilityName" runat="server" Width="300px" onkeydown="return MoveNext('MainContent_txtUtilityName',event.keyCode);"
                            OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <span style="display: none">
                            <asp:TextBox ID="txtUtilityName" runat="server" onkeydown="return MoveNext('MainContent_btnFetchData',event.keyCode);"
                                ReadOnly="true" Width="150px"></asp:TextBox></span>
                        <asp:Label ID="Label2" Text="Batch:" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBatch" runat="server" Width="70px" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:ImageButton ID="btnImage" runat="server" ImageUrl="~/Images/images1.jpg" Width="15px"
                            OnClick="btnImage_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnFetchData" Text="Show" runat="server" class="myButton" Width="60px"
                            OnClick="btnFetchData_Click" />
                    </td>
                    <td>
                         <asp:Button ID="btnBatchAccept" runat="server" Text="Batch Approval" CausesValidation="true" class="myButton" Width="110px"
                                Height="25px" OnClick="btnBatchAccept_Click"/>
                    </td>
                    <%--<td>
                        <asp:Button ID="btnDownloadImage" Text="Download Image" runat="server" class="myButton"
                            Width="120px" Height="25px" Visible="false" OnClick="btnDownloadImage_Click" />
                    </td>--%>
                </tr>
            </table>
        </fieldset>
    </div>
    <!-- This is the magnifying glass which will contain the original/large version -->
    <table style="width: 100%;">
        <tr>
            <td style="width: 50%;">
                <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" Height="310px">
                    <div style="margin-top: 20px;">
                        <span style="text-align: left; margin-left: 5px; margin-top: 5px">
                            <asp:Label ID="lblUMRN" runat="server" Style="text-align: right" Height="16px" Text="UMRN :"
                                Width="119px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtUmrn" runat="server" ReadOnly="true" Text="" Width="215px"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblAction" runat="server" Height="16px" Text="Action :" Style="text-align: right; margin-left: 50px"
                                Width="82px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtAction" runat="server" ReadOnly="true" Style="text-align: left"
                            Width="132px"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblCustName" runat="server" Height="16px" Text="Customer Name :" Style="text-align: right"
                                Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtCustName" Text="" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblAcno" Text="A/c No :" Style="display: inline; width: 27%;margin-left: 50px" runat="server"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtAccNo" runat="server" Width="120px" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblAC" runat="server" Height="16px" Text="A/C Type :" Style="text-align: right"
                                Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtAcType" runat="server" ReadOnly="true" Width="105px"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblAmt" Text="Amt :" runat="server" Style="text-align: right; margin-left: 50px" Width="192px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtAmount" Text="" runat="server" Width="120px" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblType" runat="server" Height="16px" Text="Type :" Style="text-align: right"
                                Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtCollType" Text="" runat="server" Width="160px" ReadOnly="true"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblFrequency" runat="server" Height="16px" Text="Frequency :" Style="text-align: right; margin-left: 50px"
                                Width="137px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtFrequency" runat="server" ReadOnly="true" Text="" Width="140px"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblStrtDate" runat="server" Height="16px" Text="StartDate :" Style="text-align: right"
                                Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtStartDate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblEnddate" runat="server" Height="16px" Text="EndDate :" Style="text-align: right; margin-left: 50px"
                                Width="207px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtEnddate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblRef1" runat="server" Text="Ref1 :" Style="text-align: right" Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtCustRefnNO" runat="server" ReadOnly="true" Width="216px"></asp:TextBox>
                        <span style="margin-left: 5px;"></span>
                        <asp:CheckBox ID="chkUntilCancel" runat="server" Style="text-align: right; margin-left: 50px" Width="160px"
                            Text=" Until Cancel " Enabled="False" />
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblRef2" runat="server" Text="Ref2 :" Style="text-align: right" Width="124px">
                            </asp:Label>
                        </span>
                        <asp:TextBox ID="txtSchRefNo" runat="server" ReadOnly="true" Text="" Width="216px"></asp:TextBox>
                        <span style="margin-left: 5px;">
                            <asp:Label ID="lblCustBankName" runat="server" Height="16px" Text="Bank:" Style="text-align: right; margin-left: 50px"
                                Width="74px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtCustBankName" runat="server" ReadOnly="true" Style="text-align: left"
                            Width="140px"></asp:TextBox>
                    </div>
                    <div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblMobile" Text="Mobile :" runat="server" Style="text-align: right"
                                Width="124px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtMobile" Text="" runat="server" Width="112px" ReadOnly="true"></asp:TextBox>
                        <span style="text-align: left; margin-top: 5px">
                            <asp:Label ID="lblmsgmail" runat="server" Font-Bold="true" Text="&#8730; Mail Sent"
                                Visible="false"></asp:Label>
                        </span><span style="padding-left: 30px">
                            <asp:Label ID="lblMail" Text="Mail Id :" runat="server" Style="text-align: right; margin-left: 50px"
                                Width="153px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtMail" Text="" runat="server" Style="text-align: right" Width="140px"
                            ReadOnly="true"></asp:TextBox>
                    </div>

                    <div>
                        <span  style="text-align: left; margin-left: -30px; margin-top: 5px">
                            <asp:Label ID="lblProdCategory" Text="Category :" runat="server" Style="text-align: right"
                                Width="153px"></asp:Label>
                        </span>
                        <asp:TextBox ID="txtProdCategory" Text="" runat="server" Style="text-align: left" Width="250px"
                            ReadOnly="true"></asp:TextBox>
                    </div>

                    <%--<div>
                        <span style="text-align: left; margin-left: 0px; margin-top: 5px">
                            <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                            <asp:TextBox ID="txtCategory" ReadOnly="true" runat="server"></asp:TextBox>
                        </span>
                    </div>--%>
                    <p>
                    </p>
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
                                            <td style="width: 15px;">
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="btnPrev" Text="Prev" class="myButton" Width="60px"
                                                    Height="25px" OnClick="btnPrev_Click" />
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="btnNext" class="myButton" Width="60px" Height="25px"
                                                    Text="Next" OnClick="btnNext_Click" />
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
                    <p>
                    </p>
                    <div>
                        <span style="margin-left: 5px;">
                            <asp:Label ID="lblReason" Text="Reason:" runat="server" Style="text-align: right"
                                Width="119px"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlReject" Width="333px" Font-Size="8.8">
                            </asp:DropDownList>
                        </span>
                    </div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <div style="margin-top: 3px; text-align: center">
                        <span style="padding-left: 80px">
                            <asp:Button runat="server" ID="btnAccept" class="myButton" Width="60px" Height="25px"
                                Text="Accept" OnClick="btnAccept_Click" />
                        </span><span>
                            <asp:Button runat="server" ID="btnReject" Text="Reject" class="myButton" Width="60px"
                                Height="25px" OnClick="btnReject_Click" CausesValidation="true" ValidationGroup="" />
                        </span><span>
                            <asp:Button runat="server" ID="btnSendMail" Text="Send Mail" CausesValidation="true"
                                ValidationGroup="" OnClick="btnSendMail_Click" Visible="false" class="myButton"
                                Width="90px" Height="25px" />
                        </span><span>
                            <asp:Button ID="btnSendall_m" Text="Send All" class="myButton" Width="60px" Height="25px"
                                runat="server" OnClick="btnSendall_m_Click" Visible="false" />
                        </span><span style="display: none">
                            <asp:Label ID="lblIhno" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="lblCounter" runat="server" Text="Label"></asp:Label>
                        </span>
                        <asp:RequiredFieldValidator ID="rfvReject" runat="server" ForeColor="Red" Display="None"
                            ErrorMessage="Please Select Reason Code" ValidationGroup="vgView" ControlToValidate="ddlReject"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <span style="margin-left: 5px;">
                            <asp:Label ID="lblcc" runat="server" Text="CC : " Visible="false"></asp:Label>
                        </span><span>
                            <asp:TextBox ID="txtaddcc" runat="server" Width="250px" onkeypress="return EmailIdcc()"
                                Font-Names="Verdana" Font-Size="Small" Visible="false"></asp:TextBox>
                        </span>
                    </div>
                </asp:Panel>
            </td>
            <%-- <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>--%>
            <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
            <td style="width: 50%">
                <div> <%--  class="magnify" --%>
                    <div id="zoom" class="large" runat="server">
                    </div>
                    <span style="padding-left: 130px">
                        <asp:Label ID="lblTitle" Text="MARK MANDATE APPROVAL" Width="265px" runat="server"
                            Height="18px" Font-Bold="True" Font-Size="small"></asp:Label></span>
                    <asp:Image ID="chkImag" CssClass="small" Width="643px" Height="310px" runat="server"
                        BorderWidth="1px" />
                </div>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td style="width: 100%">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div align="left" style="border-style: none; font-family: Verdana;">
                            <table style="margin-left: -4px; width:100%;">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel3" runat="server" Enabled="true">
                                            <span>
                                            <%--<iframe id="imgFinacle" src="http://172.31.12.121:8888/ubibio/ubi.jsp" width="750px"
                                                    height="400px" runat="server" frameborder="1" name="search_iframe"></iframe>--%>
                                                    <iframe id="imgFinacle" width="100%"
                                                    height="400px" runat="server" frameborder="1" name="search_iframe"></iframe>
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
    <table width="100%" style="border: 1px solid black; display: none">
        <tr>
            <td>
                <asp:Label ID="lblcdtrbnkname" runat="server" Text="Creditor Bank:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcdtrbnkname" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblcdtrname" runat="server" Text="Creditor Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcdtrname" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblCdtrUtilityCode" runat="server" Text="Creditor Utility Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcreditorutilitycode" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lbldbtrbnkname" runat="server" Text="Debtor Bank Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtdbtrbnkname" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCategory" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblPaymnttype" runat="server" Text="Payment Type:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpaymnttype" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblCurrency" runat="server" Text="Currency:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCurrency" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblmsgref" runat="server" Text="Message Reference:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtmsgref" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div style="display: none">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div>
                <asp:Panel ID="Panel2" runat="server" BorderWidth="1px" Width="100%" Height="250px">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 30%;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnApi" runat="server" class="myButton" OnClick="btnApi_Click" Text="Fetch Signature" />
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblApiAccountNo" runat="server" Text="Acc No:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApiAccountNo" runat="server"  Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblApiAccountType" runat="server" Text="Acc Type:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApiAccountType" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblApiAccountStatus" runat="server" Text="Acc Status:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApiAccountStatus" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblApiNofAccountHolders" runat="server" Text="Acc Holders:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApiNofAccountHolders" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td>
                                            <asp:Label ID="lblApiTranRefNo" runat="server" Text="TranRef No:" Visible="false"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApiTranRefNo" runat="server" Visible="false"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblOperationMode" runat="server" Text="Mode:" Visible="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOperationMode" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>
                                                <asp:Label ID="lblAPIStatus" runat="server" ForeColor="Red"></asp:Label></b>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 70%;">
                                <table>
                                    <tr>
                                        <%--<td>
                                      <asp:pictureBox>
                                      </asp:pictureBox>

                                     </td>--%>
                                        <td>
                                            <asp:Image ID="imgSignature" runat="server" BorderWidth="1px" Height="200px" Width="450px" />
                                        </td>
                                        <td style="width: 60px;">
                                        </td>
                                        <td style="margin-top:0px">
                                            <div>
                                                <asp:GridView ID="gvSingnatureData" runat="server" AutoGenerateColumns="false">
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="20"/>
                                                    <Columns>
                                                        <asp:BoundField DataField="customerName" HeaderText="Customer Name" ItemStyle-Width="300"
                                                            ItemStyle-Height="20" />
                                                    </Columns>
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#87CEFA" Font-Bold="True" ForeColor="Navy" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table style="width: 450px;">
                                                <tr>
                                                    <td style="width: 50%;">
                                                        <asp:Button ID="btnAPIPrev" runat="server" OnClick="btnAPIPrev_Click" Text="&lt;"
                                                            Width="25px" />
                                                    </td>
                                                    <td align="right" style="width: 50%;">
                                                        <asp:Button ID="btnAPINext" runat="server" OnClick="btnAPINext_Click" Text="&gt;"
                                                            Width="25px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="Imageid" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    <table width="100%" style="display: none">
        <tr>
            <td style="width: 80%">
                <asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updPanel3" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div style="visibility:hidden">
                <table>
                    <tr>
                        <td style="width: 20%" align="left" valign="top">
                            <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" Width="120px"
                                OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="<--Select-->"></asp:ListItem>
                                <asp:ListItem Text="UMRN"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10px">
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearch" Width="500px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnOk" runat="server" Text="OK" class="myButton" Width="60px" OnClick="btnOk_Click" />
                        </td>
                        <td style="width: 5px">
                        </td>
                        <td>
                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" class="myButton" Width="60px"
                                OnClick="btnCancel_Click" />
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
</asp:Content>

