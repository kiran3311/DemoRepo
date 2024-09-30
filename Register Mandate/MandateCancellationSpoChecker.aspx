<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_MandateCancellationSpoChecker, App_Web_mandatecancellationspochecker.aspx.bf0ff4eb" %>


<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <style type="text/css">
        /*Some CSS*/ * {
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
         //   window.location = "DestInwardMandate.aspx";
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
            <div style="width: 100%">
                <table>
                    <tr>
                        <td>
                          <%--  <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" Width="20px"
                                Visible="false" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="<--Select-->"></asp:ListItem>
                                <asp:ListItem Text="UMRN"></asp:ListItem></asp:DropDownList>
                                <%--<asp:ListItem Text="NAME"></asp:ListItem>
                                <asp:ListItem Text="ACNO"></asp:ListItem>--%>
                            <%--</asp:DropDownList>--%>
                            <asp:Label ID="labelUMRN" Text="Enter UMRN :" runat="server"></asp:Label>
                        </td>
                        <td style="width: 10px"></td>
                        <td>
                           <%-- <asp:TextBox ID="txtSearch" Width="400px" runat="server" autocomplete ="off"></asp:TextBox>--%>
                             <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="true" Width="180px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="<--Select-->"></asp:ListItem>
                               
                            </asp:DropDownList>
                        </td>
                        <td style="width: 5px"></td>
                        <td>
                            <td>
                                <asp:Button ID="btnOk" runat="server" Text="Search" OnClick="btnOk_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button ID="btnAccpt" runat="server" Text="Confirm" OnClick="btnAccpt_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button ID="btnReject" runat="server" Text="Deny" class="myButton" Width="60px" Height="25px" OnClick="btnReject_Click1" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button ID="btnCancel" Text="Clear" runat="server" OnClick="btnCancel_Click"
                                    class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button runat="server" Text="Close" ID="btnClose" OnClick="btnClose_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button runat="server" ID="btnBW" Text="B&amp;W" OnClick="btnBW_Click" class="myButton" Width="60px" Height="25px" />
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <asp:Button ID="btnshow" runat="server" Text="Show Data" OnClick="btnshow_Click" class="myButton" Visible="false" Width="60px" Height="25px" />
                            </td>
                    </tr>
                </table>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPanel1" runat="server">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <div style="display: none;">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" Text="Filter" runat="server"></asp:Label>
                        </td>
                        <%--<td>
                            <asp:DropDownList ID="ddlFilter" runat="server" Width="120px" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Amt < 100000</asp:ListItem>
                                <asp:ListItem>Amt >= 100000</asp:ListItem>
                            </asp:DropDownList>
                        </td>--%>
                        <td>
                            <asp:Label ID="Label1" Text="Date" runat="server"></asp:Label>
                        </td>
                        <%--<td>
                            <asp:DropDownList ID="ddlImportDate" runat="server" Width="90px" OnSelectedIndexChanged="ddlImportDate_SelectedIndexChanged"
                                AutoPostBack="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>--%>
                        <td>
                            <asp:Label ID="lblUtilityName" Text="Utility" runat="server"></asp:Label>
                        </td>
                        <%--<td>
                            <asp:DropDownList ID="ddlUtilityName" runat="server" Width="300px" onkeydown="return MoveNext('MainContent_txtUtilityName',event.keyCode);"
                                OnSelectedIndexChanged="ddlUtilityName_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>--%>
                        <td>
                            <span style="display: none">
                                <asp:TextBox ID="txtUtilityName" runat="server" onkeydown="return MoveNext('MainContent_btnFetchData',event.keyCode);"
                                    ReadOnly="true" Width="150px"></asp:TextBox></span>
                            <asp:Label ID="Label2" Text="Batch" runat="server"></asp:Label>
                        </td>
                        <%--<td>
                            <asp:DropDownList ID="ddlBatch" runat="server" Width="70px" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </td>--%>
                        <%--<td>
                            <asp:ImageButton ID="btnImage" runat="server" ImageUrl="~/Images/images1.jpg" Width="15px"
                                OnClick="btnImage_Click" />
                        </td>--%>
                        <%-- <td>
                            <asp:Button ID="btnFetchData" Text="Show" runat="server" Width="50px" OnClick="btnFetchData_Click" />
                        </td>--%>
                        <%--<td>
                            <asp:Button ID="btnDownloadImage" Text="Download Image" runat="server" Width="100px"
                                OnClick="btnDownloadImage_Click" />
                        </td>--%>
                    </tr>
                </table>
            </div>
            <div style="width: 100%">
                <!-- This is the magnifying glass which will contain the original/large version -->
                <table style="width: 100%; margin-left: 1%">
                    <tr>
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
            <div style="margin-left: 1%; margin-top: -2%;">
                <fieldset style="width: 50%;">
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
                                <asp:TextBox ID="txtAction" runat="server" ReadOnly="true" Width="122px"></asp:TextBox>
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
                                <asp:TextBox ID="txtCollType" Text="" runat="server" Width="140px" ReadOnly="true"></asp:TextBox>
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
                                 <asp:CheckBox ID="chkUntilCancel" runat="server" Text="Until Cancel " Enabled="False" />
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
                                <asp:TextBox ID="txtCustBankName" runat="server" ReadOnly="true" Width="150px"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="form-fld-lbl"  width="6%">
                                <asp:Label ID="lblStatus" Text="Status:" runat="server" Visible="false"></asp:Label></span>
                            </td>
                            <td class="form-fld-val" width="14%">
                                <asp:TextBox ID="txtStatus" runat="server" Width="70px" ReadOnly="true" Visible="false"></asp:TextBox></span>
                            </td>
                            <%--<td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="lblrsn" Text="Reason :" runat="server"></asp:Label></span>
                            
                            </td>
                            <td width="14%" class="form-fld-val">
                                <asp:TextBox ID="txtReason" runat="server" Width="200px" ReadOnly="true"></asp:TextBox></span>
                            </td>--%>
                            <td class="form-fld-lbl" width="8.5%">
                                <asp:Label ID="Label4" Text="Reason:" runat="server" Visible="true"></asp:Label>
                            </td>
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
                        <tr>
                            <td>
                                 <asp:Label ID="lblRemarks" runat="server" Text="Remarks :"></asp:Label>
                            </td>
                            <td>
                                  <asp:TextBox ID="txtRemarks" runat="server" ReadOnly="true" Width="333px"></asp:TextBox>
                            </td>
                        </tr>
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
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <%--<span style="margin-left: 15px;">
                        <asp:Label ID="lblReason" Text="Reason:" runat="server" Visible="true"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlReject" Width="333px" Visible="true" Font-Size="8.8">
                        </asp:DropDownList>
                    </span>--%>
                </div>
                <div style="display: none;">
                    <%--<span style="padding-left: 80px">
                        <asp:Button runat="server" ID="btnAccept" Text="Accept" OnClick="btnAccept_Click" />
                    </span><span>
                        <asp:Button runat="server" ID="btnRejct" Text="Reject" OnClick="btnReject_Click"
                            CausesValidation="true" ValidationGroup="" />
                    </span>--%><%--<span>
                        <asp:Button runat="server" ID="btnSendMail" Text="Send Mail" CausesValidation="true"
                            ValidationGroup="" OnClick="btnSendMail_Click" Visible="false" />
                    </span>--%><%--<span>
                        <asp:Button ID="btnSendall_m" Text="Send All" runat="server" OnClick="btnSendall_m_Click"
                            Visible="false" />
                    </span>--%><span style="display: none">
                        <asp:Label ID="lblIhno" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblCounter" runat="server" Text="Label"></asp:Label>
                    </span>
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div align="left" style="border-style: none; font-family: Verdana; display: none">
                <table style="margin-left: -10px;">
                    <tr>
                        <td style="width: 80%">
                            <asp:Panel ID="PNL12" runat="server" Enabled="true">
                                <span>
                                    <%--<iframe id="imgFinacle" src="http://172.16.64.105:10210/fin23/prelogin.jsp" width="650px"
                                        height="430px" runat="server" frameborder="1"></iframe>   --%>
                                </span><span style="display: none">
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
    <%--<asp:UpdatePanel ID="UpdatePanel155" runat="server">
        <ContentTemplate>
            <div align="left">
                <asp:ListBox ID="ListBox1" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                <div style="width: 100%">
                    <table style="width: 100%; margin-left: 1%">
                        <tr>
                            <td style="width: 100%; height: 240px;">
                                <div class="magnify">
                                    <div id="Div1" class="large" runat="server">
                                    </div>
                                  
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
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

