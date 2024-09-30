﻿<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_CheckerEntry, App_Web_checkerentry.aspx.bf0ff4eb" %>


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

        .style2 {
            background-color: #FFFFCC;
            height: 28px;
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

        .btnMargin {
            margin-top: 5px;
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
            if (document.getElementById('MainContent_hiddMsgCount').value == '0') {

                $(".large").fadeIn(100);
                var px = xp;
                var py = yp;
                var bgp = bgp1 + 'px' + ' ' + bgp2 + 'px';

                $(".large").css({ left: px, top: py, backgroundPosition: bgp, height: height, width: width });

                var setfocusObj = document.getElementById(vobj);
                DoFocus(setfocusObj);

            }
        }



        function Checkdate() {

            var currentDate = new Date();
            var futuredate = document.getElementById('MainContent_txtdate').value;

            var parts = futuredate.split("-");
            var day = parseInt(parts[0], 10);
            var month = parseInt(parts[1], 10) - 1; // Months are zero-based in JavaScript
            var year = parseInt(parts[2], 10);

            // Create a Date object from the user input
            var userDate = new Date(year, month, day);

            // To calculate the time difference of two dates
            var Difference_In_Time = currentDate.getTime() - userDate.getTime();

            // To calculate the no. of days between two dates
            var Difference_In_Days = Math.floor(Difference_In_Time / (1000 * 3600 * 24));



            if (Difference_In_Days >= 120) {
                var chk = $("#MainContent_chkremark").find('td').length;
                for (var i = 0; i < chk; i++) {
                    var txt = $("#MainContent_chkremark").find('td')[i].innerText;
                    if (txt == "Expiry Mandate_Date/Post Date") {
                        var id = $("#MainContent_chkremark").find('td')[i].firstChild.id;
                        $("#" + id)[0].checked = true;
                    }
                }
                alert("Range between mandate date and current business date exceeds 120 days defined");
            }
            if (userDate.getTime() > currentDate.getTime()) {
                var chk = $("#MainContent_chkremark").find('td').length;
                for (var i = 0; i < chk; i++) {
                    var txt = $("#MainContent_chkremark").find('td')[i].innerText;
                    if (txt == "Expiry Mandate_Date/Post Date") {
                        var id = $("#MainContent_chkremark").find('td')[i].firstChild.id;
                        $("#" + id)[0].checked = true;
                    }
                }
                alert("The date of Mandate should be before current business date");
            }

        }
        // added by deepak on 31102023 for circular point 008
        function CheckEnddate() {  
            debugger

            var futuredate = document.getElementById('MainContent_txtdate').value;

            var parts = futuredate.split("-");
            var day = parseInt(parts[0], 10);
            var month = parseInt(parts[1], 10) - 1; // Months are zero-based in JavaScript
            var year = parseInt(parts[2], 10);
            // Create a Date object from the user input
            var mandatedate = new Date(year, month, day);

            var chk = $("#MainContent_chkremark").find('td').length;
            for (var i = 0; i < chk; i++) {
                var txt = $("#MainContent_chkremark").find('td')[i].innerText;
                if (txt == "EMI ENDDATE NOT SPECIFIED" || txt == "EMI DURATION EXCEEDS 30 YEARS") {
                    var id = $("#MainContent_chkremark").find('td')[i].firstChild.id;
                    $("#" + id)[0].checked = false;
                }
            }


            var enddt = document.getElementById('MainContent_txtenddate').value;
            var enddt1 = document.getElementById('MainContent_txtenddate');
            if (enddt == "__-__-____" || enddt == "__/__/____") {
                alert("Please enter Enddate otherwise mandate will be cancel");

                var chk = $("#MainContent_chkremark").find('td').length;
                for (var i = 0; i < chk; i++) {
                    var txt = $("#MainContent_chkremark").find('td')[i].innerText;
                    if (txt == "EMI ENDDATE NOT SPECIFIED") {
                        var id = $("#MainContent_chkremark").find('td')[i].firstChild.id;
                        $("#" + id)[0].checked = true;
                    }
                }
                //enddt1.focus();
            }
            var parts1 = enddt.split("-");
            var day1 = parseInt(parts1[0], 10);
            var month1 = parseInt(parts1[1], 10) - 1; // Months are zero-based in JavaScript
            var year1 = parseInt(parts1[2], 10);
            var enddate = new Date(year1, month1, day1);



            // To calculate the time difference of two dates
            var Difference_In_Time = enddate.getTime() - mandatedate.getTime();

            // To calculate the no. of days between two dates
            var Difference_In_Days = Math.floor(Difference_In_Time / (1000 * 3600 * 24));
            if (Difference_In_Days > 10950) {
                alert("'EMI DURATION EXCEEDS 30 YEARS otherwise mandate will be cancel");
                var chk = $("#MainContent_chkremark").find('td').length;
                for (var i = 0; i < chk; i++) {
                    var txt = $("#MainContent_chkremark").find('td')[i].innerText;
                    if (txt == "EMI DURATION EXCEEDS 30 YEARS") {
                        var id = $("#MainContent_chkremark").find('td')[i].firstChild.id;
                        $("#" + id)[0].checked = true;
                    }
                }
                // enddt1.focus();
            }
        }



    </script>
    <script type="text/javascript">

        function Action() {
            var vbtnAction = document.getElementById('MainContent_hiddAction');
            vbtnAction.click();
        }
        function UMRN() {
            debugger;
            var vbtnUMRN = document.getElementById('MainContent_hiddBtnUMRN');
            vbtnUMRN.click();
        }

        function CustID() {
            var vCustID = document.getElementById('MainContent_hiddCustID');
            vCustID.click();
        }
        function MAILID() {
            var vbtnMAILID = document.getElementById('MainContent_hiddMailID');
            vbtnMAILID.click();
        }
        function MICR() {

            var vbtnMICR = document.getElementById('MainContent_hiddMICR');
            vbtnMICR.click();
        }
        //function Open() {
        //    var vbtnOpen = document.getElementById('MainContent_btnopen');
        //    vbtnOpen.click();
        //}

        //function Save() {
        //    var vbtnSave = document.getElementById('MainContent_btnSave');
        //    vbtnSave.click();
        //}
        function Open(event) {
            if (event.keyCode == 13) {
                var vbtnOpen = document.getElementById('MainContent_btnopen');
                vbtnOpen.click();
            }
            else {
                return false;
            }
        }

        function Save(event) {
            if (event.keyCode == 13) {
                var vbtnSave = document.getElementById('MainContent_btnSave');
                vbtnSave.click();
            }
            else {
                return false;
            }
        }
        function Cancel(event) {
            if (event.keyCode == 13) {
                var vbtnOpen = document.getElementById('MainContent_btnCancel');
                vbtnOpen.click();
            }
            else {
                return false;
            }
        }
        function Close(event) {
            if (event.keyCode == 13) {
                var vbtnOpen = document.getElementById('MainContent_btnClose');
                vbtnOpen.click();
            }
            else {
                return false;
            }
        }
        function DoBlur(fld) {
            fld.className = 'normalfld';
        }

        function DoFocus(fld) {
            if (fld != null) {
                fld.className = 'focusfld';
            }

        }

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
                    Magnify(fld.id, 1, 26, 40, -100, 200, 150);
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

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }

        function validateEmailID(email) {
            var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
            if (reg.test(email)) {
                var save = document.getElementById('MainContent_btnSave');
                save.focus();
                return true;
            }
            else {
                alert('Please Enter a valid email address');
                email.focus();
                return false;
            }
        }

        function ConfirmationBox(Obj) {
            debugger;
            var result = confirm("Are you sure you want to continue?");
            if (result == true) {
                debugger;
                $(Obj).attr("MsgCount", "2");
                _ActiveBlurEvent = "";
                //$(Obj).attr("MsgCount", "0");
                if (Obj.id == "MainContent_txtaction") {
                    Action();

                }
                if (Obj.id == "MainContent_txtumrn") {
                    UMRN();

                }

                // if (Obj.id == "MainContent_hiddMICR") {
                if (Obj.id == "MainContent_txtcode") {

                    MICR();

                }
                if (Obj.id == "MainContent_hiddPANNO") {
                    PANNO();

                }
                if (Obj.id == "MainContent_hiddMailID") {
                    var email = document.getElementById('MainContent_txtmailid');
                    validateEmailID(email);

                }
                DoBlur(Obj);
                return true;
            }
            else {
                //$(Obj).attr("MsgCount", "0");
                DoFocus(Obj);
                //Obj.focus();
                return false;
            }
        }

        var _ActiveBlurEvent = "";

        function FieldOnBlur(vObj) {
            debugger;
            
            if (_ActiveBlurEvent != "" && _ActiveBlurEvent != vObj.id)
                return;

            //if (document.activeElement.id == "") {
            //    return;
            //}
            //if (document.activeElement.id == "MainContent_btnCancel") {
            //    return;
            //}
            //if (document.activeElement.id == "MainContent_btnClose") {
            //    return;
            //}
            //if (document.activeElement.id == "MainContent_btnBW") {
            //    return;
            //}

            if (vObj.id == "") {
                return;
            }
            if (document.getElementById(vObj.id).value == "N") {
                return;
            }
            if (vObj.id == "MainContent_btnCancel") {
                return;
            }
            if (vObj.id == "MainContent_btnClose") {
                return;
            }
            if (vObj.id == "MainContent_btnBW") {
                return;
            }

            _ActiveBlurEvent = vObj.id;
            return ValidateFields(vObj);
        }

        function ShowMsgBoxs(obj) {
            debugger;
            if ($(obj).attr("MsgCount") == "0") {
                DoBlur(obj);
                //obj.id.focus;
                alert('First Entry and Second Entry is mismatched, Please Enter again !!!');// + obj.id);
                $(obj).attr("MsgCount", "1");
                //document.getElementById('MainContent_txtaction').value = parsedData.Action.Name;
                //$(obj).focus();
                var ob = document.getElementById(obj.id);
                ob.focus();
                return false;
            }

            else if ($(obj).attr("MsgCount") == "1") {
                return ConfirmationBox(obj);
            }
        }

        function ValidateFields(obj) {
            debugger;
            //-------JSON  for Data Comparison-------
            var vbtnHiddFields = document.getElementById('MainContent_txthiddFields');
            var jsonp = vbtnHiddFields.value;
            var jsonp = jsonp.substring(1, jsonp.length - 1);
            var parsedData = $.parseJSON(jsonp);

            if (obj.id == document.getElementById('MainContent_txtaction').id) {

                if (parsedData.Action.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtaction'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                    Action();
                    return true;
                }

            }

            if (obj.id == document.getElementById('MainContent_txtumrn').id) {
                if (parsedData.Umrn.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtumrn'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                    UMRN();
                }
            }
            if (obj.id == document.getElementById('MainContent_txtdate').id) {

                if (parsedData.Date.Name != obj.value) {

                    return ShowMsgBoxs(document.getElementById('MainContent_txtdate'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }
            if (obj.id == document.getElementById('MainContent_txtaccno').id) {
                if (parsedData.AccNo.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtaccno'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_ddlactype').id) {
                if (parsedData.ACType.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_ddlactype'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtcode').id) {
                debugger;
                if (parsedData.MICR.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtcode'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                    MICR();
                }
            }

            if (obj.id == document.getElementById('MainContent_txtbank').id) {
                if (parsedData.Bank.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtbank'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_ddlcoltype').id) {
                if (parsedData.CollectionType.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_ddlcoltype'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtamt').id) {

                if ((obj.value - parsedData.Amount.Name) == 0) {

                    return;
                }

                if (parsedData.Amount.Name != obj.value) {

                    return ShowMsgBoxs(document.getElementById('MainContent_txtamt'));
                }
                else {

                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtcustref').id) {

                if (parsedData.CustomerRefNo.Name != obj.value.toUpperCase()) {

                    return ShowMsgBoxs(document.getElementById('MainContent_txtcustref'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtscheme').id) {
                if (parsedData.SchemeRefNo.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtscheme'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_ddlfrequency').id) {
                if (parsedData.Frequency.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_ddlfrequency'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtstartdate').id) {
                if (parsedData.StartDate.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtstartdate'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtenddate').id) {
                if (parsedData.EndDate.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtenddate'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_chkunitcancelled').id) {
                if (parsedData.UnitCancelled.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_chkunitcancelled'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtcustname').id) {
                if (parsedData.CustomerName.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtcustname'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtcustID').id) {
                if (parsedData.AddCustID.Name != obj.value.toUpperCase()) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtcustID'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtstdcode').id) {
                if (parsedData.AddCustID.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtstdcode'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtphone').id) {
                if (parsedData.Phone.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtphone'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtstdcode').id) {
                if (parsedData.StdCode.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtstdcode'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtmob').id) {
                if (parsedData.Mobile.Name != obj.value) {
                    return ShowMsgBoxs(document.getElementById('MainContent_txtmob'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
                }
            }

            if (obj.id == document.getElementById('MainContent_txtmailid').id) {

                if (parsedData.MailID.Name != obj.value.toUpperCase()) {

                    return ShowMsgBoxs(document.getElementById('MainContent_txtmailid'));
                }
                else {
                    DoBlur(obj);
                    _ActiveBlurEvent = "";
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
            if ((AsciiValue > 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 46))
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

                if (document.getElementById("MainContent_chkZoom") != null) {
                    document.getElementById("MainContent_chkZoom").checked = true;
                }
            }
            else {
                document.getElementById("MainContent_chkZoom").checked = false;
            }

        }
        //------------New functions End---------------- 
        function ScrollTop() {
            $("html, body").animate({ scrollTop: 0 }, "fast");
        }
        function BatchDisplay() {
            var vbtnBatch = document.getElementById('MainContent_hiddBatchFill');
            vbtnBatch.click();

        }
        $(document).keypress(function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
        //------for unlocking the batches on pageleave ----------
        // Register the event.
        //window.onbeforeunload = function () {
            //PageMethods.UnlockOnPageLeave();
        //}
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
        <textarea id="Textarea1" rows="2" cols="30"></textarea>
    </div>
    <asp:UpdatePanel ID="upPnl" runat="server" UpdateMode="Conditional">
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
                    <td width="30%" id="dvOpen">
                        <asp:Panel ID="pnlOpen" runat="server">
                            <asp:ValidationSummary ForeColor="Red" ID="vldOpen" ValidationGroup="vgOpen" runat="server"
                                HeaderText="Following errors occured while performing the action:" />
                            <asp:CustomValidator ForeColor="Red" ID="cvOpen" runat="server" ValidationGroup="vgOpen"
                                OnServerValidate="cvOpen_ServerValidate" Display="None"></asp:CustomValidator>

                            <table width="100%">
                                <tr>
                                    <td width="40%" class="form-fld-lbl" align="right">
                                        <b>Batch No:</b>
                                    </td>
                                    <td width="60%">
                                        <asp:DropDownList ID="ddlbatchno" Width="80%" runat="server" OnSelectedIndexChanged="ddlbatchno_SelectedIndexChanged"
                                            AutoPostBack="true" Height="18px" CssClass="btnMargin">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvBatchNo" runat="server" ForeColor="Red" Display="None"
                                            ErrorMessage="No 'Batch No.' for Checker-Mandate Data Entry" ValidationGroup="vgOpen"
                                            ControlToValidate="ddlbatchno"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" class="form-fld-lbl" align="right">
                                        <b>Mandate No:</b>
                                    </td>
                                    <td width="60%">
                                        <asp:DropDownList ID="ddlinho" Width="80%" runat="server" Height="16px" CssClass="btnMargin">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%"></td>
                                    <td width="60%">
                                        <asp:Button ID="btnopen" runat="server" Width="60px" Height="25px" Text="Open" OnClick="btnopen_Click"
                                            onkeydown="Open(event);" class="myButton btnMargin" CausesValidation="true" ValidationGroup="vgOpen" />
                                        <asp:Button ID="btnBW" class="myButton" Width="85px" Height="25px" runat="server" CausesValidation="true"
                                            Text="B&W Image" OnClick="btnBW_Click" />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%">
                                <tr style="display:none">
                                    <td class="padd" style="width: 150px">
                                        <asp:CheckBox ID="chkMandateFormat" runat="server" ForeColor="Red" OnClick="IsChecked(this);" Text=" New Mandate Format" Checked="true" />

                                        <asp:CheckBox ID="chkZoom" runat="server" AutoPostBack="true" OnClick="IsZoomChecked(this);" Text="Zoom" Checked ="true" />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%">
                                <tr>
                                    <td width="30%" align="right">Utility Code:
                                    </td>
                                    <td width="70%">
                                        <asp:Label ID="lblUtilityCode" runat="server" Text="UCode" CssClass="utilityColor"> </asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td height="4"></td>
                                    <td height="4"></td>
                                </tr>
                                <tr>
                                    <td width="30%" align="right">Utility Name:
                                    </td>
                                    <td width="70%">
                                        <asp:Label ID="lblUtilityName" runat="server" Text="UName" CssClass="utilityColor"> </asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlentry" runat="server" GroupingText="Checker-Mandate Data Entry"
                Width="100%">
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvCustInfo" runat="server" ValidationGroup="vgsave"
                    OnServerValidate="cvCustInfo_ServerValidate" Display="None"></asp:CustomValidator>
                <asp:CustomValidator ForeColor="Red" ID="cvUMRN" runat="server" ValidationGroup="vgsave"
                    OnServerValidate="cvUMRN_ServerValidate"></asp:CustomValidator>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td width="25%" valign="top">
                            <table width="100%" border="0">
                                <tr>
                                    <td width="100%">
                                        <table width="100%">
                                            <tr>
                                                <td id="tdMndtNo" runat="server" class="form-fld-lbl" width="35%">Printed No :
                                                </td>
                                                <td id="tdMndtNoTxt" runat="server" class="form-fld-val" width="65%">
                                                    <asp:TextBox runat="server" ID="txtMandateNo" MaxLength="10" MsgCount="0" onfocus="DoFocus(this);MagnifyImage(this);"
                                                        Style="text-transform: uppercase" OnClick="DoFocus(this);MagnifyImage(this);"
                                                        onkeypress="return NumberOnly()" Width="90%" onblur="FieldOnBlur(this);" onkeydown="return MoveNext('MainContent_txtSoleIDAutoType',event.keyCode);"
                                                        AutoCompleteType="Disabled"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">Action :
                                                </td>
                                                <td class="form-fld-val" width="65%"> 
                                                    
                                                    <asp:TextBox ID="txtaction" runat="server" AutoCompleteType="Disabled" MaxLength="1"
                                                        MsgCount="0" onblur="FieldOnBlur(this);" OnClick="DoFocus(this);MagnifyImage(this);"
                                                        onfocus="DoFocus(this);MagnifyImage(this);"
                                                        onkeypress="return RestrictCharsForAction();" Style="text-transform: uppercase"
                                                        Width="10%" TabIndex="1"></asp:TextBox>
                                                     <%--onkeydown="return MoveNext('MainContent_txtumrn',event.keyCode);"--%>
                                                     <%--FieldOnBlur(this)--%>
                                                        <asp:Label ID="label12" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:CheckBox ID="chkaction" runat="server" Text="" />
                                                        <span style="font-size: 6px; font-weight: bold;">(N-New, M-Modify, C-Cancel)</span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaction"
                                                            Display="None" ErrorMessage="Please Enter Action(N-New, M-Modify, C-Cancel)" ForeColor="Red"
                                                            ValidationGroup="vgsave"></asp:RequiredFieldValidator>
                                                    <%--<asp:Label ID="label12" runat="server" ForeColor="Red" Text="*"></asp:Label>--%>
                                                    </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                           <tr>
                                                <td class="form-fld-lbl" width="35%">A/c Type :</td>
                                                <td class="form-fld-val" width="65%">
                                                    <asp:DropDownList ID="ddlactype" MsgCount="0" runat="server" Width="75%" onblur="FieldOnBlur(this)"
                                                        onfocus="DoFocus(this);MagnifyImage(this);" onkeydown="return MoveNext('MainContent_txtcode',event.keyCode);"
                                                        OnClick="DoFocus(this);MagnifyImage(this);" TabIndex="4">
                                                        <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="SAVINGS" Value="SAVINGS"></asp:ListItem>
                                                        <asp:ListItem Text="CURRENT" Value="CURRENT"></asp:ListItem>
                                                        <asp:ListItem Text="CC" Value="CC"></asp:ListItem>
                                                        <asp:ListItem Text="OTHER" Value="OTHER"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<asp:RequiredFieldValidator ID="rfvActype" runat="server" ForeColor="Red" Display="None"
                                                        ErrorMessage="Please Select A/c Type" ValidationGroup="vgsave" ControlToValidate="ddlactype"></asp:RequiredFieldValidator>--%>
                                                    <asp:Label ID="label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                                    <asp:CheckBox ID="chkactype" runat="server" Text="" />
                                                </td>
                                           </tr>
                                        </table>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">Amount :
                        </td>
                        <td class="form-fld-val" width="65%">
                           <asp:TextBox ID="txtamt" MsgCount="0" MaxLength="13" Width="80%" runat="server" onblur="FieldOnBlur(this)"
                                                        onkeydown="return MoveNext('MainContent_txtcustref',event.keyCode);" onfocus="DoFocus(this);MagnifyImage(this);"  TabIndex="8"
                                                        OnClick="DoFocus(this)" onkeypress="return NumberOnly1()"  AutoCompleteType="Disabled" oncopy="return false" onpaste="return false"></asp:TextBox>
                                                    <asp:Label ID="label7" runat="server" ForeColor="Red" Text="*"></asp:Label> <%--onblur="FieldOnBlur(this)"--%>
                                                    <%-- <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ForeColor="Red" Display="None"
                                                        ErrorMessage="Please Enter Amount" ValidationGroup="vgsave" ControlToValidate="txtamt"></asp:RequiredFieldValidator>--%>
                                                    <asp:CheckBox ID="chkamt" runat="server" Text="" /> 
                        </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">Start Date :</td>
                                                <td  width="65%">
                                                     <asp:TextBox ID="txtstartdate" MsgCount="0" Width="80%" onkeypress="return NumberOnly();" onblur="CheckEnddate(),FieldOnBlur(this)"
                                                        onkeydown="return MoveNext('MainContent_txtenddate',event.keyCode);" runat="server"
                                                        onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this)"
                                                        AutoCompleteType="Disabled" TabIndex="12"></asp:TextBox>  <%----%>
                                                    <asp:Label ID="label9" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                                    <asp:MaskedEditExtender ID="mskStartDate" TargetControlID="txtstartdate" Mask="99/99/9999"
                                                        MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                        MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                        ErrorTooltipEnabled="True" runat="server" />
                                                    <%--<asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ForeColor="Red" Display="None"
                                                        ErrorMessage="Please Enter Start Date" ValidationGroup="vgsave" ControlToValidate="txtstartdate"></asp:RequiredFieldValidator>--%>
                                                    <asp:CheckBox ID="chkstartdate" runat="server" Text="" /> 
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                
                               
                                 
                            </table>
                        </td>
                        <td width="25%" valign="top">
                            <table width="100%" border="0">
                                 <tr>
                                    <td>
                                        <table width="100%">
                                           <tr>
                                               <td class="form-fld-lbl" width="35%" valign="top">
                                                    <asp:Label ID="lblSoleId" Text="Sol Id" runat="server"></asp:Label>
                                                </td>
                                                <td width="65%" class="form-fld-val">
                                                     <table width="100%">
                                                            <tr><td> 
                                                                <asp:TextBox ID="txtSoleIDAutoType" onfocus="DoFocus(this);" runat="server" AutoCompleteType="Disabled"
                                                        MsgCount="0" onkeydown="return MoveNext('MainContent_txtaction',event.keyCode);"
                                                        onblur="FieldOnBlur(this);BatchDisplay();" OnClick="DoFocus(this);" Width="90%"
                                                        onkeypress="return NumberOnly();"></asp:TextBox>
                                                    <asp:HiddenField ID="hiddSoleIDAutoType" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvSoleID" runat="server" ForeColor="Red" Display="None"
                                                        ErrorMessage="Please Select the SoleID" ValidationGroup="vgsave" ControlToValidate="txtSoleIDAutoType"></asp:RequiredFieldValidator></td></tr>
                                                          <tr><td id="tdBranchNm" runat="server" class="form-fld-lbl" bgcolor="#FFFF99" style="padding-right: 20px"> <asp:Label ID="lblBranchNm" runat="server"></asp:Label></td></tr>
                                                    </table>
                                                 </td>
                                           </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <table width="100%">
                                            <tr>
                                                 <td class="form-fld-lbl" width="35%">UMRN :
                                                </td>
                                                <td class="form-fld-val" width="65%">
                                                    <asp:TextBox ID="txtumrn" runat="server" width="80%" AutoCompleteType="Disabled" MaxLength="20"
                                                        MsgCount="0" onblur="FieldOnBlur(this)" OnClick="DoFocus(this);MagnifyImage(this);"
                                                        onfocus="DoFocus(this);MagnifyImage(this);" onkeydown="return MoveNext('MainContent_txtdate',event.keyCode);"
                                                        onkeypress="return RestrictAllSpecialChars();" Style="text-transform: uppercase" TabIndex="2"></asp:TextBox>
                                                    <asp:CheckBox ID="chkumrn" runat="server" Text="" /> <%--RestrictSpecialCharsExcludingSpace--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">IFSC/MICR Code :</td>
                                                <td class="form-fld-val" width="65%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <%--<asp:TextBox ID="TextBox1" MaxLength="11" runat="server" OnClick="DoFocus(this)" Style="text-transform: uppercase"
                                                        onfocus="DoFocus(this);MagnifyImage(this);" onkeypress="return RestrictAllSpecialChars();"
                                                        onkeydown="MoveNextWithServer(this, event.keyCode)" onBlur="MICR();" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="None"
                                                        ErrorMessage="Please Enter IFSC/MICR Code" ValidationGroup="vgsave" ControlToValidate="txtcode"></asp:RequiredFieldValidator>--%>

                                                                <asp:TextBox ID="txtcode" MsgCount="0" MaxLength="11" width="80%" runat="server" OnClick="DoFocus(this)"
                                                                    Style="text-transform: uppercase" onfocus="DoFocus(this);MagnifyImage(this);"
                                                                    onkeypress="return RestrictAllSpecialChars();" onkeydown="return MoveNext('MainContent_txtbank',event.keyCode);"
                                                                    onblur="FieldOnBlur(this)" AutoCompleteType="Disabled" TabIndex="5" ></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvMICR" runat="server" ForeColor="Red" Display="None"
                                                                    ErrorMessage="Please Enter IFSC/MICR Code" ValidationGroup="vgsave" ControlToValidate="txtcode"></asp:RequiredFieldValidator>--%>
                                                              <asp:Label ID="label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                                           
                                                                <asp:CheckBox ID="chkcode" runat="server" Text="" />
                                                            </td>
                                                           
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">Ref No 1:
                                                </td>
                                                <td class="form-fld-val" width="65%">
                                                  <asp:TextBox ID="txtcustref" MsgCount="0" Width="80%" MaxLength="20" onblur="FieldOnBlur(this)"
                                                onkeypress="return RestrictSpecialCharsExcludingSpace();" Style="text-transform: uppercase"
                                                onkeydown="return MoveNext('MainContent_txtscheme',event.keyCode);" runat="server"
                                                OnClick="DoFocus(this)" onfocus="DoFocus(this);MagnifyImage(this);" AutoCompleteType="Disabled" TabIndex="9"></asp:TextBox>
                                            <asp:Label ID="label11" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:CheckBox ID="chkcustref" runat="server" Text="" />  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="form-fld-lbl" width="35%">End Date :
                                                </td>
                                                <td class="form-fld-val" width="65%">                                                  

                                                      <asp:TextBox ID="txtenddate" MsgCount="0"  Width="80%" onblur="FieldOnBlur(this)" onkeypress="return NumberOnly();"
                                                onkeydown="return MoveNext('MainContent_txtcustname',event.keyCode);" runat="server"
                                                onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this)"
                                                AutoCompleteType="Disabled" TabIndex="13"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="mskEndDate" TargetControlID="txtenddate" Mask="99/99/9999"
                                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                                ErrorTooltipEnabled="True" runat="server" />
                                            <asp:CheckBox ID="chkenddate" runat="server" Text="" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                          </td>
                            <td width="25%" valign="top">
                                <table width="100%">
                                    <tr><td height="6" width="35%"></td></tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%" align="right">Date : </td>
                                        <td class="form-fld-val" width="65%">
                                            <asp:TextBox ID="txtdate" runat="server" Width="80%" AutoCompleteType="Disabled" MsgCount="0"
                                                onblur="FieldOnBlur(this)" OnClick="DoFocus(this);MagnifyImage(this);" onfocus="DoFocus(this);MagnifyImage(this);"
                                                onkeydown="return MoveNext('MainContent_txtaccno',event.keyCode);" onkeypress="return NumberOnly();" TabIndex="2" OnTextChanged="txtdate_TextChanged"></asp:TextBox>
                                            <asp:MaskedEditExtender ID="mskDate" runat="server" AcceptNegative="Left" DisplayMoney="None"
                                                ErrorTooltipEnabled="True" InputDirection="LeftToRight" Mask="99/99/9999" MaskType="Date"
                                                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                                TargetControlID="txtdate" />
                                            <asp:Label ID="label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <asp:CheckBox ID="chkdate" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%" valign="top">Bank :
                                        </td>
                                        <td  class="form-fld-val" width="65%">
                                            <asp:TextBox runat="server" ID="txtbank" MsgCount="0" Width="80%" MaxLength="35"
                                                onblur="FieldOnBlur(this)" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                                                Style="text-transform: uppercase" onkeydown="return MoveNext('MainContent_ddlcoltype',event.keyCode);"
                                                onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this);" AutoCompleteType="Disabled" TabIndex="6"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvBANK" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Enter Bank" ValidationGroup="vgsave" ControlToValidate="txtbank"></asp:RequiredFieldValidator>--%>
                                            <asp:GridView CssClass="EU_DataTable" ID="gvBankDetails" runat="server" AllowPaging="True"
                                                Width="90%" PageSize="5" AutoGenerateColumns="False" OnSelectedIndexChanged="Grid_change"
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
                                            <asp:Label ID="label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:CheckBox ID="chkbank" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%">Ref No 2:
                                        </td>
                                        <td class="form-fld-val" width="65%">
                                          <asp:TextBox ID="txtscheme" MsgCount="0" Width="80%"  MaxLength="20" onblur="FieldOnBlur(this)"
                                                onkeypress="return RestrictSpecialCharsExcludingSpace();" Style="text-transform: uppercase"
                                                onkeydown="return MoveNext('MainContent_ddlfrequency',event.keyCode);" runat="server"
                                                onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this)"
                                                AutoCompleteType="Disabled" TabIndex="10"></asp:TextBox>
                                            <asp:CheckBox ID="chkscheme" runat="server" Text="" />   
                                        </td>
                                    </tr>
                                    <tr  <tr style="display:none">
                                        <td class="form-fld-lbl" width="35%">
                                        </td>
                                        <td align="left" class="form-fld-val" width="65%">
                                          
                                            <asp:CheckBox ID="chkunitcancelled" runat="server" Text="Until Cancelled"
                                            onfocus="DoFocus(this);MagnifyImage(this);" TabIndex="14" />
                                        <asp:CheckBox ID="chkunitcancelledCorr" runat="server" Text="" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="25%" valign="top">
                                <table width="100%"> 
                                    <tr><td height="6" width="35%"></td></tr>
                                    <tr>
                                        <td class="form-fld-lbl" width="35%">Acc No :
                                        </td>
                                        <td class="form-fld-val" width="65%">
                                            <asp:TextBox runat="server" ID="txtaccno" Width="80%" MsgCount="0" MaxLength="20" Style="text-transform: uppercase"
                                                OnClick="DoFocus(this);MagnifyImage(this);" onblur="FieldOnBlur(this)" onkeypress="return NumberOnly1();"
                                                onkeydown="return MoveNext('MainContent_ddlactype',event.keyCode);" onfocus="DoFocus(this);MagnifyImage(this);"
                                                AutoCompleteType="Disabled" oncopy="return false" onpaste="return false" TabIndex="3" ></asp:TextBox>
                                            <asp:Label ID="label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--<asp:RequiredFieldValidator ID="rfvAccNo" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Enter Acc No." ValidationGroup="vgsave" ControlToValidate="txtaccno"></asp:RequiredFieldValidator>--%>
                                            <asp:CheckBox ID="chkaccno" runat="server" Text="" />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="form-fld-lbl" width="35%">Collection Type :
                                        </td>
                                        <td class="form-fld-val" width="65%">
                                          <asp:DropDownList ID="ddlcoltype" MsgCount="0" runat="server" onblur="FieldOnBlur(this)"
                                            onkeydown="return MoveNext('MainContent_txtamt',event.keyCode);" Width="75%"
                                            OnClick="DoFocus(this)" onfocus="DoFocus(this);MagnifyImage(this);" TabIndex="7">
                                            <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Fixed Amount" Value="D"></asp:ListItem>
                                            <asp:ListItem Text="Maximum Amount" Value="M"></asp:ListItem>
                                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="rfvColType" runat="server" ForeColor="Red" Display="None"
                                ErrorMessage="Please Select Collection Type" ValidationGroup="vgsave" ControlToValidate="ddlcoltype"></asp:RequiredFieldValidator>--%>
                            <asp:Label ID="label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <asp:CheckBox ID="chkcoltype" runat="server" Text="" /> 
                                        </td>
                                    </tr>
                                    <tr>
                                    <td class="form-fld-lbl" width="35%">Frequency :
                                    </td>
                                    <td class="form-fld-val" width="65%">
                                        <table width="100%">
                                                        <tr><td><asp:DropDownList ID="ddlfrequency"  MsgCount="0" width="75%" onblur="FieldOnBlur(this)" onkeydown="return MoveNext('MainContent_txtstartdate',event.keyCode);"
                                                                    runat="server"  onfocus="DoFocus(this);MagnifyImage(this);" OnClick="DoFocus(this)" TabIndex="11">
                                                                    <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Monthly" Value="MNTH"></asp:ListItem>
                                                                    <%--<asp:ListItem Text="Bi-Monthly" Value="BIMN"></asp:ListItem>--%>
                                                                    <asp:ListItem Text="Quarterly" Value="QURT"></asp:ListItem>
                                                                    <asp:ListItem Text="Half Yearly" Value="MIAN"></asp:ListItem>
                                                                    <asp:ListItem Text="Yearly" Value="YEAR"></asp:ListItem>
                                                                    <asp:ListItem Text="as and when presented" Value="ADHO"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvfrequency" runat="server" ForeColor="Red" Display="None"
                                                                    ErrorMessage="Please Select Frequency" ValidationGroup="vgsave" ControlToValidate="ddlfrequency"></asp:RequiredFieldValidator>--%>
                                                                <asp:Label ID="label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                                                <asp:CheckBox ID="chkfrequency" runat="server" Text="" /></td></tr>
                                                    </table>
                                        
                                    </td>
                                </tr>
                                </table>
                            </td>
                    </tr>
                </table>
                    <table width="100%">
                        <tr>
                            <td width="25%">
                                <table width="100%">
                                    <tr>
                                        <td class="form-fld-lbl" width="35%" align="right">Customer Name :
                                        </td>
                                        <td width="65%" class="form-fld-val">
                                            <asp:TextBox runat="server" MsgCount="0" MaxLength="40" Style="text-transform: uppercase"
                                                onblur="FieldOnBlur(this)" onkeypress="return RestrictSpecialCharsExcludingSpaceDot();"
                                                onkeydown="return MoveNext('MainContent_txtcustID',event.keyCode);" ID="txtcustname"
                                                onfocus="MagnifyImage(this);" Width="80%" OnClick="DoFocus(this);" AutoCompleteType="Disabled" TabIndex="15"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvCustName" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Enter Customer Name" ValidationGroup="vgsave" ControlToValidate="txtcustname"></asp:RequiredFieldValidator>--%>
                                            <asp:Label ID="label10" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:CheckBox ID="chkcustname" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="35%">Phone :
                                        </td>
                                        <td width="65%" class="form-fld-val">
                                            <asp:TextBox runat="server" MsgCount="0" MaxLength="4" onblur="FieldOnBlur(this)"
                                                onkeydown="return MoveNext('MainContent_txtphone',event.keyCode);" onkeypress="return NumberOnly()"
                                                ID="txtstdcode" Width="10%" OnClick="DoFocus(this)" onfocus="DoFocus(this);MagnifyImage(this);"
                                                AutoCompleteType="Disabled" oncopy="return false" onpaste="return false" TabIndex="17"></asp:TextBox>
                                            <asp:CheckBox ID="chkstdcode" runat="server" Text="" />
                                            <asp:TextBox ID="txtphone" MaxLength="8" onblur="FieldOnBlur(this)" onkeydown="return MoveNext('MainContent_txtmob',event.keyCode);"
                                                onkeypress="return NumberOnly()" Width="60%" runat="server" OnClick="DoFocus(this)"
                                                onfocus="DoFocus(this);MagnifyImage(this);" oncopy="return false" onpaste="return false" TabIndex="18"></asp:TextBox>
                                            <asp:CheckBox ID="chkphone" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right"  width="35%">Mail ID :
                                        </td>
                                        <td  class="form-fld-val"  width="65%">
                                            <asp:TextBox runat="server" MaxLength="35" onkeydown="return MoveNext('MainContent_btnSave',event.keyCode);"
                                                ID="txtmailid" Width="80%" OnClick="DoFocus(this);" onfocus="DoFocus(this);MagnifyImage(this);"
                                                onblur="FieldOnBlur(this);" AutoCompleteType="Disabled" TabIndex="20"></asp:TextBox>
                                            <asp:CheckBox ID="chkmailid" runat="server" Text="" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="25%">
                                  <table width="100%">
                                    <tr>
                                        <td align="right" width="40%">Additional Cust ID1 :
                                        </td>
                                        <td width="60%" class="form-fld-val">
                                            <asp:TextBox runat="server" MsgCount="0" MaxLength="27" Style="text-transform: uppercase"
                                                onblur="FieldOnBlur(this)" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                                                onkeydown="return MoveNext('MainContent_txtstdcode',event.keyCode);" ID="txtcustID"
                                                Width="80%" OnClick="DoFocus(this);" onfocus="DoFocus(this);MagnifyImage(this);"
                                                AutoCompleteType="Disabled" TabIndex="16"></asp:TextBox>
                                            <asp:CheckBox ID="chkcustID" runat="server" Text="" />
                                        </td>
                                    </tr>
                                      <tr>
                                          <td align="right"  width="35%">Mobile :</td>
                                            <td class="form-fld-val"  width="65%">
                                                <asp:TextBox ID="txtmob" MsgCount="0" MaxLength="10" onblur="FieldOnBlur(this)" onkeydown="return MoveNext('MainContent_txtmailid',event.keyCode);"
                                                    onkeypress="return NumberOnly()" Width="80%" runat="server" OnClick="DoFocus(this);" TabIndex="18"
                                                    onfocus="DoFocus(this);MagnifyImage(this);" AutoCompleteType="Disabled" oncopy="return false" onpaste="return false"></asp:TextBox>
                                                <asp:CheckBox ID="chkmob" runat="server" Text="" />
                                            </td>
                                      </tr>
                                        <tr style="display:none">
                                        <td align="right" width="40%">Additional Cust ID2 :
                                        </td>
                                        <td width="60%" class="form-fld-val">
                                            <asp:TextBox runat="server" MsgCount="0" MaxLength="27" Style="text-transform: uppercase"
                                                onblur="FieldOnBlur(this)" onkeypress="return RestrictSpecialCharsExcludingSpace();"
                                                onkeydown="return MoveNext('MainContent_txtstdcode',event.keyCode);" ID="TextBox1"
                                                Width="80%" OnClick="DoFocus(this);" onfocus="DoFocus(this);MagnifyImage(this);"
                                                AutoCompleteType="Disabled" TabIndex="21"></asp:TextBox>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="" />
                                        </td>
                                    </tr>
                                  </table>
                            </td>
                            <td width="25%">
                                <table width="100%">
                                    <tr>
                                        <td align="right" width="35%">Remark :</td>
                                        <td class="form-fld-val"  width="65%">
                                            <div id="dvRemark" runat="server" style="width:100%; height: 80px; overflow-y: auto; border: 1px solid gray;">
                                                <asp:CheckBoxList ID="chkremark" runat="server" TabIndex="22">
                                                </asp:CheckBoxList>
                                            </div>
                                        </td>
                                       
                                    </tr>
                                </table>
                            </td>
                            <td width="25%">
                                <table width="100%">
                                    <tr>
                                         <td id="tdReason" class="form-fld-val" style="display: none" runat="server"> Reason :
                                            <div style="width: 90%; height: 80px; overflow-y: auto; border: 1px solid gray;">
                                                <asp:CheckBoxList ID="chkreason" runat="server">
                                                </asp:CheckBoxList>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                 <div id="Div_BTN" style="text-align: right;">
                <asp:Button runat="server" class="myButton" ID="btnSave" Width="60px" Height="25px" Text="Save" TabIndex="23"
                    OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="vgsave" onkeydown="Save(event);" /> 
                <%----%>
                <asp:Button runat="server" class="myButton" ID="btnCancel" Width="60px" Height="25px" Text="Cancel" TabIndex="24"
                    OnClick="btnCancel_Click"  onkeydown="Cancel(event);"/>
                <asp:Button runat="server" class="myButton" ID="btnClose" Width="60px" Height="25px" Text="Close" TabIndex="25"
                    OnClick="btnClose_Click" onkeydown="Close(event);"/>
            </div>
            </asp:Panel>
           
            <div id="Div1" style="display: none" runat="server">
                <asp:Button ID="hiddBtnUMRN" runat="server" OnClick="hiddUMRN_Click" /> <!-- ValidationGroup="vgUMRN"
                    CausesValidation="true" -->
                <asp:Button ID="hiddAction" runat="server" OnClick="hiddAction_Click" />
                <asp:Button ID="hiddMICR" runat="server" OnClick="hiddMICR_Click" />
                <asp:Button ID="hiddPANNO" runat="server" OnClick="hiddPANNO_Click" />
                <asp:Button ID="hiddMailID" runat="server" OnClick="hiddMailID_Click" />
                <asp:Button ID="hiddDate" runat="server" OnClick="hiddDate_Click" />
                <asp:Button ID="hiddBatchFill" runat="server" OnClick="hiddBatchFill_Click" />
                <asp:HiddenField ID="hiddSetFocus" Value="" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="hiddTableName" Value="" runat="server"></asp:HiddenField>
                <asp:TextBox ID="txthiddFields" runat="server">      
                </asp:TextBox>
                <asp:HiddenField ID="hiddMsgCount" runat="server" Value="0" />
                <asp:HiddenField ID="hiddActnToUmrnFocusPrevnt" runat="server" Value="0" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="Div2" style="display: none" runat="server">
        <asp:HiddenField ID="hiddMndtFormat" Value="" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hiddZoom" Value="" runat="server"></asp:HiddenField>
    </div>
</asp:Content>

