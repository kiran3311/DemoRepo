
$().ready(function () {
    BindAutoCompleteCtrls();
});

function BindAutoCompleteCtrls() {
    try {
        $(".lkp-ctrl").each(function () {
            if (typeof ($(this).attr("pli")) == "undefined") {
                xLkpSingle_BindAutoComplete(this.id);
            }
        });
    }
    catch (ex) {
    }

}

function xLkpSingle_BindAutoComplete(vCtrlLkpId) {
    
    var mLkpCtrl;
    var mLkpId;
    var mPLkpId;
    var mHiddRPath = "";

    try {
        mHiddRPath = window.top.document.getElementById("hiddRootPath").value;
        if (mHiddRPath == "/")
            mHiddRPath = "";
    }
    catch (ex) {
        //mHiddRPath = document.getElementById("hiddRootPath").value;
    }

    try {

        LkpSingle_OnDialogOpen(document.getElementById(vCtrlLkpId));
    }
    catch (ex) {
    }
    
    mLkpCtrl = $("#" + vCtrlLkpId);
    mLkpId = mLkpCtrl.attr("lkp_id");
    
    BindDialog(vCtrlLkpId, mLkpCtrl, mLkpId, xLkp_GetParamValsIfExists(mLkpCtrl))

    mLkpCtrl.unautocomplete();

    mLkpCtrl.autocomplete(mHiddRPath + "/Standard/srvLkp.aspx",
    {
        width: 260,
        selectFirst: false,
        mustMatch: true,
        extraParams: { LkpId: mLkpId, LkpParams: xLkp_GetParamValsIfExists(mLkpCtrl), Filter: xLkp_GetFilter(mLkpCtrl) }
    });

    mLkpCtrl.result(function (event, data, formatted) {
        var mText = "";
        var mValue = "";
        var mAddData = "";
        var mAddDataArr = null;
        var mIsFuncExists = false;
        var mReturnVal;
        var mLkpCtrlId;

        mIsFuncExists = false;
        try {
            mReturnVal = LkpSingle_Before_OnSelect(this, mText, mValue);
            mIsFuncExists = true;
            if (mReturnVal == false)
                return;
        }
        catch (ex) {
            mIsFuncExists = false;
        }

        if (data) {
            mText = data[0];
            mValue = data[1];
            if (data.length > 2) {
                mAddData = data[2];
                mAddDataArr = mAddData.split("~");
            }
        }
        else {
            mValue = "";
            mText = "";
            mAddData = "";
        }

        $("#" + vCtrlLkpId).val(mText);
        $("#" + vCtrlLkpId.replace("txt", "hidd")).val(mValue);

        var mAddtlDataObj;

        mAddtlDataObj = $("#" + vCtrlLkpId.replace("txt", "hidd") + "_AddtlData");

        if (mAddtlDataObj.length > 0) {
            mAddtlDataObj.val(mAddData);
        }

        mIsFuncExists = false;

        if (typeof (CtrlID) != "undefined") {
            mLkpCtrlId = vCtrlLkpId.replace(CtrlID, "");
        }

        BindChildLookup(mLkpCtrlId, vCtrlLkpId, mText, mValue, mAddDataArr);
    });
}

function xLkp_GetFilter(vObj) {
    var mParams;
    var mPLkpId;

    mLkpCtrl = vObj;
    mLkpCtrl = mLkpCtrl.attr("lkp_filter");

    if (typeof (mLkpCtrl) != "undefined") {
        mObj = $("input[name$='" + mLkpCtrl + "']");
        mParams = mObj.val();
    }
    else
        mParams = "";
        
    return mParams;
}

function BindChildLookup(vLkpCtrlId, vLkpId, vText, vValue, vAddDataArr) {
    
    $("input[plkp_id='" + vLkpCtrlId + "']").each(function () {
    
        if (vText != "") {
            this.readOnly = false;
            this.value = "";
            //$(this).attr("DlgBinded", "N");

            try {
                LkpSingle_OnDialogOpen(document.getElementById(vCtrlLkpId));
            }
            catch (ex) { }

            xLkpSingle_BindAutoComplete(this.id);
        }
        else {
            this.readOnly = true;
            this.value = "";
        }
    });

    try {
        if (vValue != "") {
            LkpSingle_After_OnSelect(document.getElementById(vLkpId), vText, vValue, vAddDataArr);            
        }
        mIsFuncExists = true;
    }
    catch (ex) {
        mIsFuncExists = false;
    }    
}

function BindDialog(vCtrlLkpId, vLkpbj, vLkpId, vLkpParams) {
    var mURL;
    var mTextFld;
    var mValFld;
    var mImgId;

    var mHiddRPath = "";

    try {
        mHiddRPath = window.top.document.getElementById("hiddRootPath").value;
        if (mHiddRPath == "/")
            mHiddRPath = "";
    }
    catch (ex) {
        //mHiddRPath = document.getElementById("hiddRootPath").value;
    }

    mTextFld = vCtrlLkpId;
    mValFld = vCtrlLkpId.replace("txt", "hidd");
    
    mURL = mHiddRPath + "/Standard/LookupDlg.aspx?LkpId=" + vLkpId + "&LkpParams=" + vLkpParams + "&TextFld=" + mTextFld +
           "&ValFld=" + mValFld + "&LkpFld=" + vCtrlLkpId + "&Filter=#Filter#";
           
    mImgId = vCtrlLkpId + "_lkpImg";

    if ($("#" + mImgId).length > 0) {
        $("#" + mImgId).remove();
    }

    if ($("#" + vCtrlLkpId)[0].tagName == "INPUT") {
        vLkpbj.after(" <span id='" + mImgId + "'><img src='" + mHiddRPath + "/Images/SearchLKP.png' style='cursor: pointer;' align='absmiddle'" +
                     " onclick='OpenLookupDlg(\"" + mURL + "\", \"" + vCtrlLkpId + "\")' /></span>");
    }

    //vLkpbj.attr("DlgBinded", "Y");
}

function OpenLookupDlg(mURL, vCtrlLkpId) {
    var mDialog = new DialogCtrl();
    var mDocID = "";
    var mFilter = "";
    
    try {

        LkpSingle_OnDialogOpen(document.getElementById(vCtrlLkpId));
    }
    catch (ex) {
    }
    
    mFilter = xLkp_GetFilter($("#" + vCtrlLkpId));
    mURL = mURL.replace("#Filter#", mFilter);

    mDialog.Title = "Lookup";
    mDialog.URL = mURL + "&keepThis=true&modal=true&TB_iframe=true&height=320&width=650";
    mDialog.AddButtons = false;
    mDialog.Show();
}

function xLkp_GetParamValsIfExists(vObj) {
    var mParams;
    var mPLkpId;

    mLkpCtrl = vObj;
    mParams = mLkpCtrl.attr("plkp_id");
    
    if (typeof (mParams) != "undefined")

        mParams = xLkp_GetParamValues(mParams);
    else
        mParams = "";

    return mParams;
}

function xLkp_GetParamValues(vParams) {
    var mParamArr;
    var mParamVals;
    var mLoop;
    var mType;
    var mObj;

    if (vParams == "")
        return ""

    mParamArr = vParams.split(",");
    mLoop = 0;
    mParamVals = "";
    for (mLoop = 0; mLoop < mParamArr.length; mLoop++) {
        if (mLoop > 0) {
            mParamVals += "~";
        }

        mObj = $("input[name$='" + mParamArr[mLoop].replace("txt", "hidd") + "']");
        if (mObj.length == 0) {
            mObj = $("select[name$='" + mParamArr[mLoop].replace("txt", "hidd") + "']");
        }

        mParamVals += mObj.val();
    }

    return mParamVals;
}

function xLkp_VerifyParentCtrlsValsEntered(vCtrlObj) {
    var mParentCtrlId;
    var mParentCtrlLbl;
    var mCtrlIdArr;
    var mCtrlLblArr;
    var mCtrlLblCount = 0;
    var mLoop;
    var mObj;

    mParentCtrlId = vCtrlObj.attr("pli");
    if (typeof (mParentCtrlId) == "undefined" || mParentCtrlId == "")
        return true;

    mParentCtrlLbl = vCtrlObj.attr("pll");
    if (typeof (mParentCtrlLbl) != "undefined" && mParentCtrlLbl != "") {
        mCtrlLblArr = mParentCtrlLbl.split(",");
        mCtrlLblCount = mCtrlLblArr.length;
    }

    mCtrlIdArr = mParentCtrlId.split(",");
    for (mLoop = 0; mLoop < mCtrlIdArr.length; mLoop++) {
        mObj = $("#" + mCtrlIdArr[mLoop]);

        if (mObj.length > 0) {
            if (mObj.val() == "") {
                if (mCtrlLblCount < (mLoop + 1)) {
                    alert("Invalid Action!! Please enter value in Parent field.");
                    mObj.focus();
                }
                else {
                    alert("Invalid Action!! Please enter value in '" + mCtrlLblArr[mLoop] + "' field.");
                }
                try {
                    mObj.focus();
                }
                catch (ex)
                { }
                return false;
            }
        }
    }

    return true;
}

function xLkpSingle_OpenDialog(vObj, vCtrlId) {
    var mLkpId;
    var mLkpCtrl;
    var mCtrlHiddFldId;
    var mLkpParams;
    var mBtnXML;
    var mDialog;
    var mDocID;

    mLkpCtrl = $("#" + vCtrlId);
    if (xLkp_VerifyParentCtrlsValsEntered(mLkpCtrl) == false)
        return;

    mLkpId = mLkpCtrl.attr("li");
    mCtrlHiddFldId = "hidd__" + vCtrlId;
    mLkpParams = xLkp_GetParamValsIfExists(mLkpCtrl);

    mBtnXML = "";

    mDialog = new DialogCtrl();
    mDocID = "";

    mDocID = GetFormParameterValue("FormID");
    mDialog.Title = "Lookup";

    mDialog.URL = "/App/Common/Pages/SingleLookup.aspx?LkpID=" + mLkpId + "&TextFld=" + vCtrlId + "&ValFld=" + mCtrlHiddFldId +
                  "&LkpParams=" + mLkpParams + "&keepThis=true&modal=true&TB_iframe=true&height=320&width=650";
    mDialog.AddButtons = true;
    mBtnXML = "<act> " +
                "<btn id='btnSome' text='Done' type='main' postback='y' button='btnClick' />" +
              "</act>";
    //"<btn id='btnSomething' text='Hello' button='btnClick' />" +

    mDialog.Buttons = mBtnXML;

    mDialog.Show();
    return false
}
/*function xLkpSingle_OpenDialog(vObj, vCtrlId) {
var mCtrlObj;

mCtrlObj = $("#" + vCtrlId);
if (xLkp_VerifyParentCtrlsValsEntered(mCtrlObj) == false)
return;
}*/

function xLkp_Validate(vCtrlId, vObjString) {
    if ($("#hidd__" + vCtrlId).val() == "") {
        alert("Invalid Input!!! Please provide '" + vObjString + "'")
        $("#" + vCtrlId).focus();
        return false
    }
    return true;
}
