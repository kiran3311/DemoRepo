<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_ACKEntry, App_Web_ackentry.aspx.bf0ff4eb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        /*Some CSS*/
        * {
            margin: 0;
            padding: 0;
        }

        .magnify {
            width: 100%;
            height: 300px;
            margin: 0px auto;
            position: relative;
        }

        /*Lets create the magnifying glass*/
        .large {
            width: 300px;
            height: 60px;
            position: absolute;
            border-radius: 10%; /*Multiple box shadows to achieve the glass effect*/ /* box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25); /*Lets load up the large image first*/ /*background: url('../Images/1/00000002.jpg') no-repeat;*/ /*hide the glass by default*/
            display: none;
            border-style: solid;
            border-color: Red;
        }

        /*To solve overlap bug at the edges during magnification*/
        .small {
            display: block;
        }

        .normalfld {
            background-color: #FFFFFF;
        }

        .focusfld {
            background-color: #FFFFCC;
        }

        .uppercase {
            text-transform: uppercase;
        }

        .style1 {
            background-color1: rgb(232,232,232);
            width: 10%;
        }

        .style3 {
            height: 28px;
        }

        .style4 {
            text-align: right;
            background-color1: rgb(232,232,232);
            height: 28px;
        }

        .style5 {
            background-color1: rgb(232,232,232);
            height: 28px;
        }
        /*#dvImage
        {
            float: left;
            width: 70%;
            overflow: hidden;
            border:1px solid #ccc;
        }
        #dvOpen
        {
            float: left;
            width: 29%;
            overflow: hidden;
            height:300px;
            border:1px solid #ccc;
        }*/
        #dvImage {
            float: left;
            /*width: 70%;*/
            overflow: hidden;
            border: 1px solid #ccc;
            width: 100%;
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

        td.padd {
            padding-left: 10px;
            padding-top: 15px;
        }

        .utilityColor {
            width: 80%;
            background-color: rgb(186, 192, 255);
            margin-top: 30px;
        }

        .form-fld-lbl, .form-fld-val {
            font-size: 10px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
    <link href="../Resx/Autocomplate/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="../Resx/Autocomplate/jquery.autocomplete.min.js" type="text/javascript"></script>
    <script src="../Resx/Autocomplate/xLkp_v1.js" type="text/javascript"></script>
    <link href="../Resx/Autocomplate/Lkp_v1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
    </script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
        })
        function Magnify(vobj, xp, yp, bgp1, bgp2, width, height) {
            $(".large").fadeIn(100);
            var px = xp;
            var py = yp;
            var bgp = bgp1 + 'px' + ' ' + bgp2 + 'px';
            $(".large").css({ left: px, top: py, backgroundPosition: bgp, height: height, width: width });

            var setfocusObj = document.getElementById(vobj);
            DoFocus(setfocusObj);

        }

    </script>
    <script type="text/javascript">

        function AckBatchDisplay() {
            debugger;
            var btnBatchDisplay = document.getElementById('MainContent_hiddnbtnBatchDisplay');
            var txtAckDate = document.getElementById('<%= txtACKDate.ClientID%>').value;
            //if (txtAckDate == '' || txtAckDate == null || txtAckDate == '__-__-____') {
            //    alert('Please enter ACK date');
            //    return false;
            //}
            //else {
            btnBatchDisplay.click();
            //}
        }

        function UMRN() {
            if (document.getElementById("MainContent_txtumrn").readOnly == true) {
                var _ddldate = document.getElementById("MainContent_txtdate");
                _ddldate.focus();
            }
            else {
                var vbtnUMRN = document.getElementById('MainContent_hiddBtnUMRN');
                vbtnUMRN.click();
            }
        }
        function Action() {
            if (document.getElementById("MainContent_txtaction").readOnly == true) {
                var _ddlumrn = document.getElementById("MainContent_txtumrn");
                _ddlumrn.focus();
            }
            else {
                var vbtnAction = document.getElementById('MainContent_hiddAction');
                vbtnAction.click();
            }
        }
        function CustID() {
            if (document.getElementById("MainContent_txtcustID").readOnly == true) {
                var vbtnstdcode = document.getElementById('MainContent_txtstdcode');
                vbtnstdcode.focus();
            }
            else {
                var vCustID = document.getElementById('MainContent_hiddCustID');
                vCustID.click();
            }
        }
        function MAILID() {
            if (document.getElementById("MainContent_txtmailid").readOnly == true) {
                var vbtnSave = document.getElementById('MainContent_btnSave');
                vbtnSave.focus();
            }
            else {
                var vbtnMAILID = document.getElementById('MainContent_hiddMailID');
                vbtnMAILID.click();
            }
        }
        function MICR() {
            if (document.getElementById("MainContent_txtcode").readOnly == true) {
                var vbank = document.getElementById('MainContent_txtbank');
                vbank.focus();
            }
            else {
                var vbtnMICR = document.getElementById('MainContent_hiddMICR');
                vbtnMICR.click();
            }
        }

        function Open() {
            var vbtnOpen = document.getElementById('MainContent_btnopen');
            vbtnOpen.click();
        }
        function ConfirmUtilityCodeChange() {

            var retVal = confirm("Are you Sure, Do you want to make the changes ?");
            if (retVal == true) {

                //Save();
                return true;
            } else {

                return false;
            }
        }
        function Save() {
            ConfirmUtilityCodeChange();
            var vbtnSave = document.getElementById('MainContent_btnSave');
            vbtnSave.click();
        }

        function DoBlur(fld) {
            fld.className = 'normalfld';
        }
        function MagnifyImage(fld) {
            var checkbox = document.getElementById("MainContent_chkMandateFormat");
            var checkZoom = document.getElementById("MainContent_chkZoom");
            if (checkZoom.checked) {
                if (checkbox.checked) {
                    var getHiddSetFocus = document.getElementById('MainContent_hiddSetFocus');
                    var btnBW = document.getElementById("MainContent_btnBW");
                    if (btnBW.value != "B&W Image") {  // for showing TIF (1600 pxl) 

                        //===============UCO BAnk format================
                        if (getHiddSetFocus.value == "MandateID") {
                            if (fld.id == "MainContent_txtMandateNo") {
                                Magnify(fld.id, 500, 180, 775, -610, 300, 125); //UCO 1600
                            }
                        }
                        //================================================
                        //--------New Mandate Formate-------------------
                        if (fld.id == "MainContent_txtaction") {
                            Magnify(fld.id, 1, 20, 4, -80, 200, 175);  //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtumrn") {

                            Magnify(fld.id, 100, 0, -310, -40, 950, 110);  // New 1600       
                        }
                        else if (fld.id == "MainContent_txtdate") {

                            Magnify(fld.id, 600, 1, 440, -25, 440, 110); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtaccno") {

                            Magnify(fld.id, -10, 30, -200, -150, 1050, 110); //UCO 1600
                        }
                        else if (fld.id == "MainContent_ddlactype") {
                            Magnify(fld.id, 450, 30, 610, -120, 595, 85); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtcode") {

                            Magnify(fld.id, 100, 90, 950, -220, 940, 85); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtbank") {

                            Magnify(fld.id, 1, 90, 10, -230, 800, 80); //UCO 1600
                        }

                        else if (fld.id == "MainContent_ddlcoltype") {

                            Magnify(fld.id, 100, 125, 720, -330, 700, 80); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtamt") {

                            Magnify(fld.id, -215, 50, -260, -280, 1400, 80); //UCO 1600
                        }

                        else if (fld.id == "MainContent_txtcustref") {

                            Magnify(fld.id, 1, 150, -20, -380, 930, 120); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtscheme") {

                            Magnify(fld.id, 1, 150, -20, -380, 930, 120); //UCO 1600
                        }
                        else if (fld.id == "MainContent_ddlfrequency") {

                            Magnify(fld.id, 1, 150, -20, -330, 950, 80); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtstartdate") {

                            Magnify(fld.id, 1, 130, -30, -460, 500, 190); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtenddate") {

                            Magnify(fld.id, 1, 130, -30, -460, 500, 190); //UCO 1600
                        }
                        else if (fld.id == "MainContent_chkunitcancelled") {

                            Magnify(fld.id, 1, 130, -30, -460, 500, 190); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtstdcode") {

                            Magnify(fld.id, 350, 130, 660, -370, 635, 125); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtphone") {

                            Magnify(fld.id, 350, 130, 660, -370, 635, 125); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtmob") {

                            Magnify(fld.id, 350, 130, 660, -370, 635, 125); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtmailid") {

                            Magnify(fld.id, 350, 130, 660, -370, 635, 125); //UCO 1600
                        }
                        else if (fld.id == "MainContent_txtcustname") {

                            Magnify(fld.id, -100, 90, 1150, -460, 1150, 200); //UCO 1600
                        }
                    }
                    else { //if jpg (800 pxl)
                        //===============UCO BAnk format================
                        if (getHiddSetFocus.value == "MandateID") {
                            if (fld.id == "MainContent_txtMandateNo") {

                                Magnify(fld.id, 437.5, 213, -370, -276, 225, 80);
                            }
                        }
                        //==============================================
                        if (fld.id == "MainContent_txtaction") {

                            Magnify(fld.id, -1.5, 28, 9, -48, 125, 100);
                        }
                        else if (fld.id == "MainContent_txtumrn") {
                            Magnify(fld.id, 173.5, -3, -130, -2, 575, 80);
                        }
                        else if (fld.id == "MainContent_txtdate") {

                            Magnify(fld.id, 586, -2, -492, -7, 350, 70);
                        }
                        else if (fld.id == "MainContent_txtaccno") {
                            Magnify(fld.id, 80, 53, -33, -77, 600, 80);
                        }
                        else if (fld.id == "MainContent_ddlactype") {

                            Magnify(fld.id, 531, 30, -442, -48, 380, 80);
                        }
                        else if (fld.id == "MainContent_txtcode") {

                            Magnify(fld.id, 338, 69, -260, -97, 580, 80);
                        }
                        else if (fld.id == "MainContent_txtbank") {

                            Magnify(fld.id, 4, 68, 24, -97, 450, 90);
                        }

                        else if (fld.id == "MainContent_ddlcoltype") {

                            Magnify(fld.id, 517, 75, -429, -150, 400, 80);
                        }
                        else if (fld.id == "MainContent_txtamt") {

                            Magnify(fld.id, 9, 83, 48, -115, 900, 90);
                        }
                        else if (fld.id == "MainContent_ddlfrequency") {

                            Magnify(fld.id, -2, 103, 36, -140, 550, 90);
                        }
                        else if (fld.id == "MainContent_txtcustref") {

                            Magnify(fld.id, 1, 121, 36, -164, 600, 100);
                        }
                        else if (fld.id == "MainContent_txtscheme") {

                            Magnify(fld.id, 1, 121, 36, -164, 600, 100);
                        }
                        else if (fld.id == "MainContent_txtstartdate") {

                            Magnify(fld.id, 2.5, 143, 18, -198, 325, 150);
                        }
                        else if (fld.id == "MainContent_txtenddate") {

                            Magnify(fld.id, 2.5, 143, 18, -198, 325, 150);
                        }
                        else if (fld.id == "MainContent_chkunitcancelled") {

                            Magnify(fld.id, 2.5, 143, 18, -198, 325, 150);
                        }
                        else if (fld.id == "MainContent_txtstdcode") {

                            Magnify(fld.id, 517, 104, -429, -145, 400, 120);
                        }
                        else if (fld.id == "MainContent_txtphone") {

                            Magnify(fld.id, 517, 104, -429, -145, 400, 120);
                        }
                        else if (fld.id == "MainContent_txtmob") {

                            Magnify(fld.id, 517, 104, -429, -145, 400, 120);
                        }
                        else if (fld.id == "MainContent_txtmailid") {

                            Magnify(fld.id, 517, 104, -429, -145, 400, 120);
                        }
                        else if (fld.id == "MainContent_txtcustname") {

                            Magnify(fld.id, 217, 168, -147, -225, 700, 120);
                        }

                    }  //end of if jpg (800 pxl)
                }

                else {

                    //Old Mandate Formate 
                    if (fld.id == "MainContent_txtaction") {
                        Magnify(fld.id, 504.5, -2.48, -445, -14, 300, 150);

                    }
                    else if (fld.id == "MainContent_txtumrn") {
                        Magnify(this.id, 192.5, -13.479, -133, 8, 550, 80)
                    }
                    else if (fld.id == "MainContent_txtdate") {
                        Magnify(this.id, 670.5, -6.479, -568, -1, 300, 70)
                    }

                    else if (fld.id == "MainContent_txtaccno") {
                        Magnify(this.id, 43, 53.52, 15, -76, 825, 100)
                    }
                    else if (fld.id == "MainContent_ddlactype") {
                        Magnify(this.id, 693, 21.52, -590, -37, 250, 100)
                    }
                    else if (fld.id == "MainContent_txtcode") {
                        Magnify(this.id, 449.5, 71.52, -376, -98, 250, 100)
                    }
                    else if (fld.id == "MainContent_txtbank") {
                        Magnify(this.id, 51.5, 70.52, -19, -97, 400, 90)
                    }

                    else if (fld.id == "MainContent_ddlcoltype") {
                        Magnify(this.id, 674, 75.52, -573, -103, 275, 70)
                    }
                    else if (fld.id == "MainContent_txtamt") {
                        Magnify(this.id, 75.5, 86.52, -15, -125, 850, 90)
                    }
                    else if (fld.id == "MainContent_ddlfrequency") {
                        Magnify(this.id, 13.5, 144.52, 7, -199, 345, 150)
                    }
                    else if (fld.id == "MainContent_txtcustref") {
                        Magnify(this.id, 256.5, 121.52, -150, -162, 670, 100)
                    }
                    else if (fld.id == "MainContent_txtscheme") {
                        Magnify(this.id, 256.5, 121.52, -150, -162, 670, 100)
                    }
                    else if (fld.id == "MainContent_txtstartdate") {
                        Magnify(this.id, 312.5, 147.52, -253, -203, 325, 150)
                    }
                    else if (fld.id == "MainContent_txtenddate") {
                        Magnify(this.id, 312.5, 147.52, -253, -203, 325, 150)
                    }
                    else if (fld.id == "MainContent_chkunitcancelled") {
                        Magnify(this.id, 312.5, 147.52, -253, -203, 300, 150)
                    }
                    else if (fld.id == "MainContent_txtstdcode") {
                        Magnify(this.id, 569.5, 219.52, -474, -286, 375, 90);
                    }
                    else if (fld.id == "MainContent_txtphone") {
                        Magnify(this.id, 569.5, 219.52, -474, -286, 375, 90);
                    }
                    else if (fld.id == "MainContent_txtmob") {
                        Magnify(this.id, 569.5, 219.52, -474, -286, 375, 90);
                    }
                    else if (fld.id == "MainContent_txtmailid") {
                        Magnify(this.id, 569.5, 219.52, -474, -286, 375, 90)
                    }
                    else if (fld.id == "MainContent_txtcustname") {
                        Magnify(this.id, 575.5, 141.52, -479, -196, 375, 150)
                    }
                    else if (fld.id == "MainContent_txtcustID") {
                        Magnify(this.id, 569.5, 219.52, -474, -286, 375, 90)
                    }
                }
            }
        }

        function DoFocus(fld) {
            if (fld != null) {
                fld.className = 'focusfld';
            }

        }
        function IsChecked(obj) {
            var checkbox = document.getElementById("MainContent_chkMandateFormat");
            if (checkbox.checked) {

                var getHiddMndtFormat = document.getElementById('MainContent_hiddMndtFormat');
                getHiddMndtFormat.value = "Checked";
            }
            else {

                var getHiddMndtFormat = document.getElementById('MainContent_hiddMndtFormat');
                getHiddMndtFormat.value = "UnChecked";
            }

        }

        //------------New functions End----------------         
        function SetFocus() {

            var getFocusElement;
            var checkZoom = document.getElementById("MainContent_chkZoom");
            var getHiddSetFocus = document.getElementById('MainContent_hiddSetFocus');
            if (getHiddSetFocus.value == "MandateID") {
                getFocusElement = document.getElementById('MainContent_txtMandateNo');
                DoFocus(getFocusElement);
                if (checkZoom.checked) {
                    Magnify(fld.id, 500, 180, 775, -550, 250, 100);
                }
            }
            if (getHiddSetFocus.value == "Action") {
                getFocusElement = document.getElementById('MainContent_txtaction');
                DoFocus(getFocusElement);
                if (checkZoom.checked) {

                    Magnify(fld.id, 1, 20, 4, -80, 200, 175);
                }
            }
            if (getHiddSetFocus.value == "UMRN") {
                getFocusElement = document.getElementById('MainContent_txtumrn');
                DoFocus(getFocusElement);
            }
            if (getHiddSetFocus.value == "Date") {
                getFocusElement = document.getElementById('MainContent_txtdate');
                DoFocus(getFocusElement);
            }

        }

        function ImageNotFound() {
            alert('Image is not available');
            window.location = "ACKEntry.aspx";
        }
        function MoveNextActype(_key) {
            if (_key == 13) {
                var _next = document.getElementById("MainContent_ddlactype");
                if ($('#MainContent_ddlactype').is(':visible')) {
                    var _txtactype = document.getElementById("MainContent_ddlactype");
                    _txtactype.focus();
                }
                else {
                    var _ddlactype = document.getElementById("MainContent_txtactype");
                    _ddlactype.focus();
                }
                return false;
            }
        }

        function MoveNextFrequency(_key) {
            if (_key == 13) {
                var _next = document.getElementById("MainContent_ddlfrequency");
                if ($('#MainContent_ddlfrequency').is(':visible')) {
                    var _txtfrequency = document.getElementById("MainContent_ddlfrequency");
                    _txtfrequency.focus();

                }
                else {
                    var _ddlfrequency = document.getElementById("MainContent_txtfrequency");
                    _ddlfrequency.focus();
                }
                return false;
            }
        }

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
        function MoveNextWithServer(ctrl, _key) {
            var mCtrl;
            if (_key == 13) {
                if (ctrl.id == "MainContent_txtaction") {
                    Action();
                }
                if (ctrl.id == "MainContent_txtumrn") {
                    UMRN();
                }
                if (ctrl.id == "MainContent_txtcode") {
                    MICR();
                }
                if (ctrl.id == "MainContent_txtcustID") {
                    CustID();
                }
                if (ctrl.id == "MainContent_txtmailid") {
                    MAILID();
                }

            }
        }
        function RestrictCharsForAction() {
            var AsciiValue = event.keyCode; //109-M,77-m
            if ((AsciiValue == 109 || AsciiValue == 77 || AsciiValue == 67 || AsciiValue == 99 || AsciiValue == 110 || AsciiValue == 78))
                return true;
            else
                return false;

        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

        function NumberOnly1() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 46))
                return true;
            else
                return false;
        }

        function RestrictAllSpecialChars() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57))
                return true;
            else
                return false;
        }

        function RestrictSpecialCharsExcludingSpace() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57))
                return true;
            else
                return false;
        }

        function RestrictSpecialCharsExcludingSpaceDot() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || k == 46)
                return true;
            else
                return false;
        }

        function IsZoomChecked(obj) {

            var checkbox = document.getElementById("MainContent_chkZoom");
            if (checkbox.checked) {

                var getHiddZoom = document.getElementById('MainContent_hiddZoom');

                getHiddZoom.value = "Checked";

            }
            else {

                var getHiddZoom = document.getElementById('MainContent_hiddZoom');

                getHiddZoom.value = "UnChecked";

            }

        }
        function SetCheckUncheck() {
            var getHiddMndtFormat = document.getElementById("MainContent_hiddMndtFormat");
            if (getHiddMndtFormat.value == "Checked") {
                document.getElementById("MainContent_chkMandateFormat").checked = true;
            }
            else {
                document.getElementById("MainContent_chkMandateFormat").checked = false;
            }

        }
        function SetCheckUncheckZoom() {

            var getHiddZoom = document.getElementById("MainContent_hiddZoom");
            if (getHiddZoom.value == "Checked") {
                document.getElementById("MainContent_chkZoom").checked = true;
            }
            else {
                document.getElementById("MainContent_chkZoom").checked = false;
            }

        }
        function BatchDisplay() {
            var vbtnBatch = document.getElementById('MainContent_hiddBatchFill');
            vbtnBatch.click();

        }
        function ScrollTop() {
            $("html, body").animate({ scrollTop: 0 }, "fast");
        }

        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        //------for unlocking the batches on pageleave ----------
        // Register the event.
        window.onbeforeunload = function () {
            PageMethods.UnlockOnPageLeave();
        }
    </script>
    <div>
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnablePageMethods="true" />
    </div>
    <!-- [Start] Ajax Loading -->
    <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
    </div>
    <div id="divMain" class="UnFreezePage">
    </div>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    <!-- [End] Ajax Loading -->
    <div style="position: absolute; display: none; z-index: 999">
        <textarea id="txtval" rows="3" cols="30"></textarea>
    </div>
    <asp:UpdatePanel ID="upt" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table width="100%">
                <tr>
                    <td width="70%">
                        <div id="dvImage" class="magnify">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <!-- This is the magnifying glass which will contain the original/large version -->
                            <div id="zoom" class="large" runat="server">
                            </div>
                            <!-- This is the small image -->
                            <asp:Image ID="chkImag" runat="server" CssClass="small" Width="100%" Height="300px"
                                Style="float: left" />
                        </div>
                    </td>
                    <td width="30%">
                        <div id="dvOpen">
                            <asp:Panel ID="pnlOpen" runat="server">
                                <asp:ValidationSummary ForeColor="Red" ID="vldOpen" ValidationGroup="vgOpen" runat="server"
                                    HeaderText="Following errors occured while performing the action:" />
                                <asp:CustomValidator ForeColor="Red" ID="cvOpen" runat="server" ValidationGroup="vgOpen"
                                    Display="None" OnServerValidate="cvOpen_ServerValidate"></asp:CustomValidator>

                                <table style="padding-top: 80px;" width="100%">
                                    <tr>
                                        <td class="form-fld-lbl" width="35%">
                                            <b>ACK Date:</b>
                                        </td>
                                        <td class="form-fld-val" width="65%">
                                            <asp:TextBox runat="server" ID="txtACKDate" AutoCompleteType="Disabled" Width="90%"
                                                onblur="AckBatchDisplay();" ValidationGroup="vgACKDate" CausesValidation="true"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="mskAckDate" TargetControlID="txtACKDate" Mask="99/99/9999"
                                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                ErrorTooltipEnabled="True" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%">
                                            <b>Batch No:</b>
                                        </td>
                                        <td width="65%">
                                            <asp:DropDownList ID="ddlbatchno" Width="90%" runat="server" OnSelectedIndexChanged="ddlbatchno_SelectedIndexChanged"
                                                onkeydown="return MoveNext('MainContent_ddlinho',event.keyCode);" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%">
                                            <b>Mandate No:</b>
                                        </td>
                                        <td width="65%" class="form-fld-val">
                                            <asp:DropDownList ID="ddlinho" Width="90%" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" class="form-fld-val"></td>
                                        <td style="padding-left: 0px">
                                            <asp:Button ID="btnopen" Style="padding-right: 10px" class="myButton" Width="54px" Height="25px" runat="server"
                                                Text="Open" onkeydown="Open();" CausesValidation="true" ValidationGroup="vgOpen"
                                                OnClick="btnopen_Click" />
                                            <asp:Button ID="btnBW" class="myButton" Width="120px" Height="25px" runat="server" CausesValidation="true" Text="B&amp;W Image"
                                                ValidationGroup="vgOpen" OnClick="btnBW_Click" />
                                        </td>
                                    </tr>
                                </table>

                                <table width="100%">
                                    <tr>
                                        <td class="padd" style="width: 150px">
                                            <asp:CheckBox ID="chkMandateFormat" ForeColor="Red" runat="server" Text=" New Mandate Format"
                                                OnClick="IsChecked(this);" />
                                        </td>
                                        <td class="padd">
                                            <asp:CheckBox ID="chkZoom" runat="server" Text="Zoom" OnClick="IsZoomChecked(this);"
                                                AutoPostBack="true"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </table>

                                <table width="100%">
                                    <tr>
                                        <td align="right" width="35%">Utility Code :
                                        </td>
                                        <td width="65%">
                                            <asp:Label ID="lblUtilityCode" runat="server" Text="UCode" class="utilityColor"> </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="right">Utility Name :
                                        </td>
                                        <td width="65%">
                                            <asp:Label ID="lblUtilityName" runat="server" Text="UName" class="utilityColor"> </asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>








            <asp:Panel ID="pnlentry" runat="server" GroupingText="Mark Mandates For Re-submission(Data Entry Errors)"
                Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
                    Display="None" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
                <asp:CustomValidator ForeColor="Red" ID="cvValidationAftrUtilityCodeConfirm" runat="server"
                    ValidationGroup="vgUtilityCode" Display="None"></asp:CustomValidator>
                <table width="100%">
                </table>
                <table width="100%">
                    <tr>
                        <td width="25%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td width="35%" id="tdMndtNo" runat="server" class="form-fld-lbl">Printed No :
                                    </td>
                                    <td width="65%" id="tdMndtNoTxt" runat="server" class="form-fld-val">
                                        <asp:TextBox runat="server" ID="txtMandateNo" MaxLength="10" OnClick="DoFocus(this);MagnifyImage(this);"
                                            Style="text-transform: uppercase" onkeypress="return NumberOnly()" onkeydown="return MoveNext('MainContent_txtSoleIDAutoType',event.keyCode);"
                                            onfocus="DoFocus(this);MagnifyImage(this);" onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-fld-lbl" width="35%">
                                        <asp:Label ID="lblSoleId" Text="Sol Id" runat="server"></asp:Label>
                                    </td>
                                    <td width="65%">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtSoleIDAutoType" runat="server" onkeydown="return MoveNext('MainContent_txtaction',event.keyCode);"
                                                        Width="60px" onblur="BatchDisplay();" onkeypress="return NumberOnly();"></asp:TextBox><asp:HiddenField ID="hiddSoleIDAutoType" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="tdBranchNm" runat="server" class="form-fld-lbl" bgcolor="#FFFF99" style="padding-right: 20px">
                                                    <asp:Label ID="lblBranchNm" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-fld-lbl" width="35%">Action :
                        </td>
                                    <td class="form-fld-val" width="65%">
                                        <asp:TextBox runat="server" ID="txtaction" Width="10%" Style="text-transform: uppercase"
                                onkeypress="return RestrictCharsForAction();" OnClick="DoFocus(this);MagnifyImage(this);"
                                onfocus="DoFocus(this);MagnifyImage(this);" MaxLength="1" onkeydown="MoveNextWithServer(this, event.keyCode)"
                                onchange="Action();" AutoCompleteType="Disabled"></asp:TextBox>
                            <asp:Label ID="label1" Text="*" runat="server" ForeColor="Red"></asp:Label>
                            <span style="font-size: 7px; font-weight: bold;">(N-New, M-Modify, C-Cancel)</span>
                            <asp:RequiredFieldValidator ID="rfvAction" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter Action(N-New,C-Cancel, U-Update)" ValidationGroup="vgsave"
                                ControlToValidate="txtaction"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="form-fld-lbl" width="35%">Acc No :
                    </td>
                    <td class="form-fld-val"  width="65%">
                        <asp:TextBox runat="server" ID="txtaccno" width="90%" MaxLength="20" OnClick="DoFocus(this);"
                            onkeypress="return NumberOnly()" onkeydown="return MoveNextActype(event.keyCode);"
                            onfocus="DoFocus(this);MagnifyImage(this);" onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvAccNo" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter Acc No." ValidationGroup="vgsave" ControlToValidate="txtaccno"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label2" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                                </tr>

                                <tr>
                                    <td class="form-fld-lbl" width="35%">Collection Type :
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:DropDownList ID="ddlcoltype" runat="server" onkeydown="return MoveNext('MainContent_txtamt',event.keyCode);"
                            Width="90%" OnClick="DoFocus(this)" onfocus="DoFocus(this);MagnifyImage(this);"
                            onblur="DoBlur(this);">
                            <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                            <asp:ListItem Text="Fixed Amount" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Maximum Amount" Value="M"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="rfvColType" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Select Collection Type" ValidationGroup="vgsave" ControlToValidate="ddlcoltype"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label6" Text="*" runat="server" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtcoltype" Visible="false" runat="server" Width="100px" OnClick="DoFocus(this);"
                            Style="text-transform: uppercase" onfocus="DoFocus(this);MagnifyImage(this);"
                            onkeydown="return MoveNext('MainContent_txtamt',event.keyCode);" onblur="DoBlur(this);"
                            AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                                </tr>

                                <tr>
                                    <td class="form-fld-lbl" width="35%">Frequency :
                    </td>
                    <td class="style1" width="65%">
                        <asp:DropDownList ID="ddlfrequency" onkeydown="return MoveNext('MainContent_txtstartdate',event.keyCode);"
                            runat="server" Width="90%" onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this);"
                            onblur="DoBlur(this);">
                            <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                            <asp:ListItem Text="Monthly" Value="MNTH"></asp:ListItem>
                            <%--<asp:ListItem Text="Bi-Monthly" Value="BIMN"></asp:ListItem>--%>
                            <asp:ListItem Text="Quarterly" Value="QURT"></asp:ListItem>
                            <asp:ListItem Text="Half Yearly" Value="MIAN"></asp:ListItem>
                            <asp:ListItem Text="Yearly" Value="YEAR"></asp:ListItem>
                            <asp:ListItem Text="as and when presented" Value="ADHO"></asp:ListItem>
                        </asp:DropDownList>
                        <%-- <asp:RequiredFieldValidator ID="rfvfrequency" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Select Frequency" ValidationGroup="vgsave" ControlToValidate="ddlfrequency"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtfrequency" Visible="false" runat="server" Width="100px" OnClick="DoFocus(this);"
                            Style="text-transform: uppercase" onfocus="DoFocus(this);MagnifyImage(this);"
                            onkeydown="return MoveNext('MainContent_txtstartdate',event.keyCode);" onblur="DoBlur(this);"
                            AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:Label ID="label11" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                                </tr>
                                </table>
                        </td>

                         <td width="25%"  valign="top">
                             <table width="100%">
                               <tr><td height="8"></td></tr>
                                 <tr>
                                      <td class="form-fld-lbl" width="35%">UMRN :
                        </td>
                        <td class="form-fld-val" width="65%">
                            <asp:TextBox runat="server" ID="txtumrn" MaxLength="20" Style="text-transform: uppercase"
                                OnClick="DoFocus(this);" onkeydown="MoveNextWithServer(this, event.keyCode)"
                                onkeypress="return RestrictSpecialCharsExcludingSpace();" onfocus="DoFocus(this);MagnifyImage(this);"
                                onBlur="UMRN();" Width="90%" AutoCompleteType="Disabled"></asp:TextBox>
                        </td>
                                 </tr>

                                 <tr>
                                     <td class="form-fld-lbl" width="35%">A/C Type :
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:DropDownList ID="ddlactype" runat="server" Width="90%" onfocus="DoFocus(this);MagnifyImage(this);"
                            onkeydown="return MoveNext('MainContent_txtcode',event.keyCode);" OnClick="DoFocus(this);"
                            onblur="DoBlur(this);">
                            <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                            <asp:ListItem Text="SAVINGS" Selected="False" Value="SAVINGS"></asp:ListItem>
                            <asp:ListItem Text="CURRENT" Value="CURRENT"></asp:ListItem>
                            <asp:ListItem Text="CC" Value="CC"></asp:ListItem>
                            <asp:ListItem Text="OTHERS" Value="OTHERS"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="rfvActype" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Select A/c Type" ValidationGroup="vgsave" ControlToValidate="ddlactype"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label3" Text="*" runat="server" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtactype" Visible="false" runat="server" OnClick="DoFocus(this);"
                            Style="text-transform: uppercase" onfocus="DoFocus(this);MagnifyImage(this);"
                            onkeydown="return MoveNext('MainContent_txtcode',event.keyCode);" onblur="DoBlur(this);"
                            AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                                 </tr>

                                 <tr>
                                     <td class="form-fld-lbl" width="35%">Amount :
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:TextBox ID="txtamt" runat="server" Width="90%" MaxLength="13" onkeydown="return MoveNext('MainContent_txtcustref',event.keyCode);"
                            onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this)" onkeypress="return NumberOnly1()"
                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvAmount" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter Amount" ValidationGroup="vgsave" ControlToValidate="txtamt"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label7" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                                 </tr>

                                 <tr>
                                     <td class="form-fld-lbl" width="35%">Start Date :
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:TextBox ID="txtstartdate" onkeypress="return NumberOnly();" onkeydown="return MoveNext('MainContent_txtenddate',event.keyCode);"
                            runat="server" onfocus="DoFocus(this);MagnifyImage(this);" Width="90%" OnClick="DoFocus(this);"
                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:MaskedEditExtender ID="mskStartDate" TargetControlID="txtstartdate" Mask="99/99/9999"
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                            ErrorTooltipEnabled="True" runat="server" />
                        <%--<asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter Start Date" ValidationGroup="vgsave" ControlToValidate="txtstartdate"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label8" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                                 </tr>
                                 </table>
                             </td>

                        <td width="25%"  valign="top">
                           <table width="100%">
                            <tr><td height="8"></td></tr>
                               <tr>
                                   <td class="form-fld-lbl" width="35%">Date :
                        </td>
                        <td class="form-fld-val" width="65%">
                            <asp:TextBox runat="server" ID="txtdate" onkeydown="return MoveNext('MainContent_ddlUtilityCode',event.keyCode);"
                                onkeypress="return NumberOnly();" onblur="DoBlur(this);" OnClick="DoFocus(this);"
                                onfocus="DoFocus(this);MagnifyImage(this);" Width="90%" AutoCompleteType="Disabled"></asp:TextBox>
                            <asp:MaskedEditExtender ID="mskDate" TargetControlID="txtdate" Mask="99/99/9999"
                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                ErrorTooltipEnabled="True" runat="server" />
                             <asp:Label ID="label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        </td>
                               </tr>

                               <tr>
                                   <td class="form-fld-lbl" Width="35%">IFSC/MICR Code :
                    </td>
                    <td class="form-fld-val" Width="65%">
                        <asp:TextBox ID="txtcode" MaxLength="11" Width="90%" runat="server"
                            OnClick="DoFocus(this)" Style="text-transform: uppercase"
                            onfocus="DoFocus(this);MagnifyImage(this);" onkeypress="RestrictAllSpecialChars();"
                            onkeydown="MoveNextWithServer(this, event.keyCode)" onBlur="MICR();"
                            AutoCompleteType="Disabled"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvMICR" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter IFSC/MICR Code" ValidationGroup="vgsave" ControlToValidate="txtcode"></asp:RequiredFieldValidator>--%>
                        <asp:Label ID="label4" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                               </tr>

                               <tr>
                                   <td class="form-fld-lbl" width="35%">Ref No 1:
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:TextBox ID="txtcustref" MaxLength="20" width="90%" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                            Style="text-transform: uppercase" onkeydown="return MoveNext('MainContent_txtscheme',event.keyCode);"
                            runat="server" OnClick="DoFocus(this)" onfocus="DoFocus(this);MagnifyImage(this);"
                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                               </tr>

                               <tr>
                                   <td class="form-fld-lbl" width="35%">End Date :
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:TextBox ID="txtenddate" onkeypress="return NumberOnly();" onkeydown="return MoveNext('MainContent_txtcustname',event.keyCode);"
                            runat="server" onfocus="DoFocus(this);MagnifyImage(this);" Width="90%" OnClick="DoFocus(this);"
                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:MaskedEditExtender ID="mskEndDate" TargetControlID="txtenddate" Mask="99/99/9999"
                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                            MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                            ErrorTooltipEnabled="True" runat="server" />
                    </td>
                               </tr>
                               </table>
                            </td>

                        <td width="25%"  valign="top">
                           <table width="100%">
                               <tr><td height="8"></td></tr>
                               <tr>
                                   <td class="form-fld-lbl" width="35%">Utility Code :
                        </td>
                        <td class="form-fld-val" width="65%">
                            <asp:DropDownList ID="ddlUtilityCode" runat="server" Width="90%" onfocus="DoFocus(this);MagnifyImage(this);"
                                onblur="DoBlur(this);" OnClick="DoFocus(this);" onkeydown="return MoveNext('MainContent_txtaccno',event.keyCode);">
                            </asp:DropDownList>
                        </td>
                               </tr>
                               
                               <tr>
                                   <td class="form-fld-lbl" width="35%">Bank :
                    </td>
                    <td width="65%" class="form-fld-val">
                        <asp:TextBox runat="server" ID="txtbank" MaxLength="35" Width="90%" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                            Style="text-transform: uppercase" onkeydown="return MoveNext('MainContent_ddlcoltype',event.keyCode);"
                            onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this);" onblur="DoBlur(this);"
                            AutoCompleteType="Disabled"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvBANK" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Enter Bank" ValidationGroup="vgsave" ControlToValidate="txtbank"></asp:RequiredFieldValidator>--%>
                        <asp:GridView CssClass="EU_DataTable" ID="gvBankDetails" runat="server" AllowPaging="True"
                            Width="250px" PageSize="5" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
                            OnPageIndexChanging="gvBankDetails_PageIndexChanging" CellPadding="4" ForeColor="#333333"
                            GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Bank Name" DataField="BANK" />
                                <asp:BoundField HeaderText="" />
                                <asp:CommandField SelectText="SELECT" ShowSelectButton="True" />
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
                        <asp:Label ID="label5" Text="*" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                               </tr>

                               <tr>
                                   <td class="form-fld-lbl" width="35%">Ref No 2:
                    </td>
                    <td class="form-fld-val" width="65%">
                        <asp:TextBox ID="txtscheme" MaxLength="20" Width="90%" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                            Style="text-transform: uppercase" onkeydown="return MoveNextFrequency(event.keyCode);"
                            runat="server" onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this);"
                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                               </tr>

                               <tr>
                                   <td width="35%"></td>
                                   <td class="form-fld-val" width="65%">
                        <asp:CheckBox ID="chkunitcancelled" Width="90%" runat="server" Text=" Untill Cancelled"
                            onfocus="DoFocus(this);MagnifyImage(this);" />
                    </td>
                               </tr>
                               </table>
                            </td>
                    </tr>
                </table>

                <table width="100%">
                    <tr>
                        <td width="25%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td align="right" width="35%" class="form-fld-val">Customer Name :
                                    </td>
                                    <td width="65%" class="form-fld-val">
                                        <asp:TextBox runat="server" MaxLength="40" Style="text-transform: uppercase" onkeypress="return RestrictSpecialCharsExcludingSpaceDot();"
                                            onkeydown="return MoveNext('MainContent_txtcustID',event.keyCode);" ID="txtcustname"
                                            onfocus="DoFocus(this);MagnifyImage(this);" Width="90%" OnClick="DoFocus(this);"
                                            onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvCustName" runat="server" ForeColor="Red" Display="None"
                                            ErrorMessage="Please Enter Customer Name" ValidationGroup="vgsave" ControlToValidate="txtcustname"></asp:RequiredFieldValidator>--%>
                                        <asp:Label ID="label10" Text="*" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="35%" class="form-fld-val">Phone :
                                    </td>
                                    <td class="form-fld-val" width="65%">
                                        <asp:TextBox runat="server" MaxLength="4" onkeydown="return MoveNext('MainContent_txtphone',event.keyCode);"
                                            onkeypress="return NumberOnly()" ID="txtstdcode" Width="10%" OnClick="DoFocus(this)"
                                            onfocus="DoFocus(this);MagnifyImage(this);" onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:TextBox ID="txtphone" MaxLength="8" onkeydown="return MoveNext('MainContent_txtmob',event.keyCode);"
                                            onkeypress="return NumberOnly()" Width="80%" runat="server" OnClick="DoFocus(this);"
                                            onfocus="DoFocus(this);MagnifyImage(this);" onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="35%" class="form-fld-val">Mail ID :
                                    </td>
                                    <td class="form-fld-val" width="65%">
                                        <asp:TextBox runat="server" MaxLength="35" onkeydown="return MoveNext('MainContent_btnSave',event.keyCode);"
                                            ID="txtmailid" Width="90%" OnClick="DoFocus(this);" onfocus="DoFocus(this);MagnifyImage(this);"
                                            onblur="MAILID();" AutoCompleteType="Disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        <td width="25%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td align="right" width="35%" class="form-fld-val">Additional Cust ID :
                                    </td>
                                    <td width="65%" class="form-fld-val">
                                        <asp:TextBox runat="server" MaxLength="27" Style="text-transform: uppercase" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                                            onkeydown="MoveNextWithServer(this, event.keyCode)" ID="txtcustID" Width="90%"
                                            OnClick="DoFocus(this);" onfocus="DoFocus(this);MagnifyImage(this);" onBlur="CustID();"
                                            AutoCompleteType="Disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
<td align="right" width="35%" class="form-fld-val">Mobile :
                                    </td>
                                    <td class="form-fld-val" width="65%">
                                        <asp:TextBox ID="txtmob" MaxLength="10" onkeydown="return MoveNext('MainContent_txtmailid',event.keyCode);"
                                            onkeypress="return NumberOnly()" Width="90%" runat="server" OnClick="DoFocus(this);"
                                            onfocus="DoFocus(this);MagnifyImage(this);" onblur="DoBlur(this);" AutoCompleteType="Disabled"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <td width="25%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td width="35%" class="form-fld-val" align="right" valign="top">  Remark :</td>
                                    <td width="65%" class="form-fld-val">
                                      
                                        <div style=" height: 60px; overflow-y: auto; border: 1px solid gray;">
                                            <asp:CheckBoxList ID="chkremark" width="90%" runat="server">
                                            </asp:CheckBoxList>
                                        </div>
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                        <td width="25%" valign="top">
                            <table width="100%">
                                <tr style="display: none" runat="server" id="trReason">
                                    <td width="35%" class="form-fld-val" align="right" valign="top">  Reason :</td>
                                    <td class="form-fld-val"  width="65%">
                                         
                                        <div style="height: 60px; overflow-y: auto; border: 1px solid gray;">
                                            <asp:CheckBoxList ID="chkreason"  width="90%" runat="server">
                                            </asp:CheckBoxList>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                         </td>
                    </tr>
                </table>
            </asp:Panel>


            <div style="text-align: right;">
                <asp:Button runat="server" ID="btnSave" Text="Save" class="myButton" Width="60px" Height="25px" onkeydown="Save();"
                    OnClick="btnSave_Click" OnClientClick="return ConfirmUtilityCodeChange();" CausesValidation="true"
                    ValidationGroup="vgsave" />
                <asp:Button runat="server" ID="btnCancel" class="myButton" Width="60px" Height="25px" Text="Cancel"
                    OnClick="btnCancel_Click" />
                <asp:Button runat="server" ID="btnClose" class="myButton" Width="60px" Height="25px" Text="Close"
                    OnClick="btnClose_Click" />
            </div>
            <div id="Div1" style="display: none" runat="server">
                <asp:Button ID="hiddBtnUMRN" runat="server" OnClick="hiddUMRN_Click" />
                <asp:Button ID="hiddAction" runat="server" OnClick="hiddAction_Click" />
                <asp:Button ID="hiddMICR" runat="server" OnClick="hiddMICR_Click" />
                <asp:Button ID="hiddCustID" runat="server" OnClick="hiddCustID_Click" />
                <asp:Button ID="hiddMailID" runat="server" OnClick="hiddMailID_Click" />
                <asp:Button ID="hiddBatchFill" runat="server" OnClick="hiddBatchFill_Click" />
                <asp:HiddenField ID="hiddSetFocus" Value="" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="hiddTableName" Value="" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="hiddDBUtilityCode" Value="" runat="server"></asp:HiddenField>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtAckDate" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <div id="Div2" style="display: none" runat="server">
        <asp:HiddenField ID="hiddMndtFormat" Value="" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddZoom" Value="" runat="server"></asp:HiddenField>
        <asp:Button ID="hiddnbtnBatchDisplay" runat="server" OnClick="hiddnbtnBatchDisplay_Click" />
    </div>
</asp:Content>

