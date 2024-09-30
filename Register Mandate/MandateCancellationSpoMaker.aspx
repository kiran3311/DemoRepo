<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_MandateCancellationSpoMaker, App_Web_mandatecancellationspomaker.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>

    <%--16-04-2019 Rutuja   --%>
    <%--<link href="../Styles/ProgressCtrl.css" rel="Stylesheet" type="text/css" />--%>

    <style type="text/css">
        /*Some CSS*/ * {
            padding: 0;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
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
            height: 28px;
        }

        .auto-style2 {
            /*background-color: rgb(235,235,235);*/
            background-color1: rgb(232,232,232);
            height: 28px;
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
        //$(document).on("keydown", function (e) {
        //    if (e.which === 8) {
        //        return false;
        //    }
        //});

        function ImageNotFound() {
            alert('Image is not available');
            // window.location = "MandateCancellationSpoMaker.aspx";
        }
        function EmailIdcc() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 64 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 59) || (AsciiValue == 46))
                return true;
            else
                return false;
        }

    </script>

    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>

    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgView"
        runat="server" />
    <asp:CustomValidator ForeColor="Red" ID="cvView" runat="server" ValidationGroup="vgView"
        OnServerValidate="cvView_ServerValidate"></asp:CustomValidator>
    <asp:UpdatePanel ID="updPanel3" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div style="width: 100%; margin-left: 1%;">
                <table>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" Width="20px"
                                Visible="false" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="<--Select-->"></asp:ListItem>
                                <asp:ListItem Text="UMRN"></asp:ListItem>
                                <%--<asp:ListItem Text="NAME"></asp:ListItem>
                                <asp:ListItem Text="ACNO"></asp:ListItem>--%>
                            </asp:DropDownList>
                            <asp:Label ID="labelUMRN" Text="Enter UMRN :" runat="server"></asp:Label>
                        </td>
                        <td style="width: 10px"></td>
                        <td>
                            <asp:TextBox ID="txtSearch" Width="400px" runat="server" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblCustRefnoSearch" Text="Enter Cust RefNo :" runat="server"></asp:Label>
                        </td>
                         <td style="width: 10px"></td>
                        <td>
                            <asp:TextBox ID="txtCustRefnoSearch" Width="200px" runat="server" autocomplete="off"></asp:TextBox>
                        </td>
                        <td style="width: 5px"></td>
                        <td>
                            <td>
                                  <asp:Button ID="btnOk" runat="server" Text="Search" OnClick="btnOk_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                            </td>
                            <td style="width: 5px"></td>
                            <td style="display: none;">
                                <asp:Button ID="btnReject" runat="server" Text="Reject" class="myButton" Width="60px" Height="25px" OnClick="btnReject_Click" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button ID="btnCancel" Text="Clear" runat="server" OnClick="btnCancel_Click"
                                    class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <%-- <asp:Button runat="server" Text="Close" ID="btnClose" OnClick="btnClose_Click" class="myButton" Width="60px" Height="25px" />--%>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button runat="server" ID="btnBWimage" Text="B&amp;W" OnClick="btnBW_Click" class="myButton" Width="60px" Height="25px" />
                            </td>

                            <td style="width: 5px"></td>
                    </tr>

                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table>
        <tr style="display: none;">

            <td>
                <asp:FileUpload ID="fuFileUploader" runat="server" AllowMultiple="true" />

                <asp:Button ID="btnUploadFiles" runat="server" Text="Upload"
                    OnClick="btnUploadFiles_Click" EnableTheming="false" />
            </td>

        </tr>
    </table>
    <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />

            <div style="display: none;">
            </div>
            <div style="width: 100%">
                <!-- This is the magnifying glass which will contain the original/large version -->
                <%--<table style="width: 100%; margin-left: 1%">--%>
                <table style="width: 100%; margin-left: 1%">

                    <tr st>
                        <td style="width: 100%; height: 240px;">
                            <div class="magnify">
                                <div id="zoom" class="large" runat="server">
                                </div>
                                <asp:Image ID="chkImag" CssClass="small" Width="700px" Height="240px" runat="server"
                                    BorderWidth="1px" />
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div>
                <fieldset style="width: 99%;">
                    <legend>Cancel Mandate (Maker):</legend>
                    <table style="width: 80%">
                        <tr>

                            <td class="form-fld-lbl" style="display: none;">
                                <asp:Label ID="lblUMRN" runat="server" Text="UMRN :"></asp:Label>

                            </td>
                            <td class="form-fld-val" style="display: none;">
                                <asp:TextBox ID="txtUmrn" runat="server" ReadOnly="true" Text="" Width="170px"></asp:TextBox>
                            </td>

                            <td class="form-fld-lbl">
                                <asp:Label ID="lblUmrn1" runat="server" Text="UMRN :"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtumrn1" Text="" runat="server" Width="170px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="form-fld-val" style="text-align: right;">
                                <asp:Label ID="lblCustName" runat="server" Text="Client Name :" Width="100px"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCustName" Text="" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblAction" runat="server" Text="Action :"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtAction" runat="server" ReadOnly="true" Width="155px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblAcno" Text="Account No:" runat="server" Width="90px"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtAccNo" runat="server" ReadOnly="true" Width="170px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblActype" Text="A/c Type :" runat="server"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtAcType" runat="server" ReadOnly="true" Width="105px"></asp:TextBox>

                            </td>
                            <td class="form-fld-lbl" align="right">
                                <asp:Label ID="lblAmt" Text="Amount :" runat="server"></asp:Label>

                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtAmount" Text="" runat="server" Width="155px" ReadOnly="true"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblfreq" Text="Frequency :" runat="server"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtFrequency" runat="server" ReadOnly="true" Text="" Width="170px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblstartdate" Text="Start Date :" runat="server"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtStartDate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                            </td>
                            <td class="form-fld-lbl" align="right">
                                <asp:Label ID="lblenddate" Text="End Date :" runat="server" Width="100px"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtEnddate" runat="server" ReadOnly="true" Text="" Width="90px"></asp:TextBox>
                                <asp:CheckBox ID="chkUntilCancel" runat="server" Text="Until Cancel " Enabled="False" />
                            </td>

                        </tr>
                        <tr>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblcolltype" Text="Collection Type :" runat="server" Width="100px"></asp:Label>
                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtCollType" Text="" runat="server" Width="100px" ReadOnly="true"></asp:TextBox>
                                <asp:Label ID="lblmsgmail" runat="server" Font-Bold="true" Text="&#8730; Mail Sent"
                                    Visible="false"></asp:Label>
                            </td>
                            <td class="form-fld-lbl">
                                <asp:Label ID="lblRef1" runat="server" Text="Reference 1 :"></asp:Label>

                            </td>
                            <td class="form-fld-val">
                                <asp:TextBox ID="txtCustRefnNO" runat="server" ReadOnly="true" Width="160px"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="lblRef2" runat="server" Text="Reference 2 :"></asp:Label>

                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtSchRefNo" runat="server" ReadOnly="true" Text="" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="lblMail" Text="Mail Id :" runat="server"></asp:Label>

                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtMail" Text="" runat="server" Width="250px" ReadOnly="true"></asp:TextBox>
                            </td>

                            <td class="auto-style1" align="right">
                                <asp:Label ID="lblMobile" Text="Mobile :" runat="server"></asp:Label>

                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtMobile" Text="" runat="server" Width="112px" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="lblCustBankName" runat="server" Text="Bank Name :"></asp:Label>

                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtCustBankName" runat="server" ReadOnly="true" Width="185px"></asp:TextBox>
                            </td>
                            </tr>
                            <%--<caption>
                                <br />--%>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="lblReject1" runat="server" Text="Reason:" Visible="true"></asp:Label>
                                    </td>
                                    <td class="auto-style2">
                                        <asp:DropDownList ID="ddlReject1" runat="server" Font-Size="8.8" Visible="true" Width="333px">
                                        </asp:DropDownList>
                                    </td>
                                   <%-- <caption>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lblcc" runat="server" Text="CC : " Visible="false"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txtaddcc" runat="server" Font-Names="Verdana" Font-Size="Small" onkeypress="return EmailIdcc()" Visible="false" Width="250px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </caption>--%>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="lblRemarks" runat="server" Text="Remarks:" Visible="true"></asp:Label>
                                    </td>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txtRemarks" Text="" runat="server" Width="333px" maxLength="200"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td style="width:5px">
                                         <asp:Button ID="btnAccpt" runat="server" Text="Save" OnClick="btnAccpt_Click" class="myButton" Width="60px" Height="25px" />
                                    <td style="width:5px">
                                        <asp:Button runat="server" Text="Close" ID="btnClose" OnClick="btnClose_Click" class="myButton" Width="60px" Height="25px" /></td>
                                </tr>
                            <%--</caption>
                        </tr>--%>

                    </table>
                </fieldset>



                <div>
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table style="display: none;">
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
                                        <%--<td style="float: right;">
                                            <asp:Button runat="server" ID="btnPrev" Text="Prev" OnClick="btnPrev_Click" />
                                        </td>
                                        <td>
                                            <asp:Button runat="server" ID="btnNext" Text="Next" OnClick="btnNext_Click" />
                                        </td>--%>
                                        <td>
                                            <asp:Button runat="server" ID="btnBW" Text="B&amp;W" OnClick="btnBW_Click" Width="40px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <span style="margin-left: 15px;">
                        <asp:Label ID="lblReason" Text="Reason:" runat="server" Visible="false"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlReject" Width="333px" Visible="false" Font-Size="8.8">
                        </asp:DropDownList>
                    </span>
                </div>

                <div style="display: none;">
                    <span style="display: none">
                        <asp:Label ID="lblIhno" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblCounter" runat="server" Text="Label"></asp:Label>
                    </span>
                    <asp:RequiredFieldValidator ID="rfvReject" runat="server" ForeColor="Red" Display="None"
                        ErrorMessage="Please Select Reason Code" ValidationGroup="vgView" ControlToValidate="ddlReject"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <%--<span>
                                <asp:Label ID="lblIfsc" Text="IFSC/MICR :" runat="server"></asp:Label>
                                <asp:TextBox ID="txtIfsc" Text="" runat="server" Width="100px" ReadOnly="true"></asp:TextBox>
                            </span>--%>
                    <span style="padding-left: 30px">
                        <%--<asp:TextBox ID="txtmsgmail" Text="&#8730;" runat="server" Width="20px" ReadOnly="true" Visible="false"></asp:TextBox>--%>
                    </span>
                </div>
                <div>
                    <span style="margin-left: 15px;">
                        <asp:Label ID="lblStatus" Text="Status:" Width="47px" runat="server" Visible="false"></asp:Label></span>
                    <asp:TextBox ID="txtStatus" runat="server" Width="17px" ReadOnly="true" Visible="false"></asp:TextBox></span>
                    <asp:TextBox ID="txtReason" runat="server" Width="303px" ReadOnly="true" Visible="false"></asp:TextBox></span>
                    </span>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div align="left" style="border-style: none; font-family: Verdana; display: none;">
                <!---->
                <table style="margin-left: -10px;">
                    <tr>
                        <td style="width: 80%">
                            <asp:Panel ID="PNL12" runat="server" Enabled="true">
                                <span>
                                    <%--<iframe id="imgFinacle" src="http://172.16.64.105:10210/fin23/prelogin.jsp" width="650px"
                                        height="430px" runat="server" frameborder="1"></iframe>   --%>
                                </span><span style="display: none">
                                    <!-- -->
                                    <asp:GridView ID="grvOutData" runat="server">
                                    </asp:GridView>
                                </span>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div align="center">
    </div>
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

    <script type="text/javascript">
        $('#btnUploadFiles').click(function () {
            if (fileUpload.value.length == 0) {    // CHECK IF FILE(S) SELECTED.
                alert('No files selected.');
                return false;
            }
        });
    </script>


</asp:Content>

