
function opn_wind(url, wind_name, mWidth, mHeight) {
    var mfeatures = "width=" + mWidth + ", height=" + mHeight + ", maximize=no,resizable=no, scrollbars=yes, toolbar=no, menubar=no, directories=no, status=yes"
    var new_wind = open(url, '', mfeatures)
    new_wind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
    return new_wind;
}

function opn_wind1(url, wind_name, mWidth, mHeight) {
    var mfeatures = "width=" + mWidth + ", height=" + mHeight + ", maximize=no,resizable=no, scrollbars=yes, toolbar=no, menubar=no, directories=no, status=yes"
    var new_wind = open(url, '', mfeatures)
    new_wind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}

function Opn_ModalWind(url, wind_name, mWidth, mHeight) {
    var mfeatures = "dialogWidth:" + mWidth + "px; dialogHeight:" + mHeight + "px; center:yes"
    var new_wind = window.showModalDialog(url, window.document, mfeatures)
}
function search(mtxt_box, mlist_box) {

    //alert("here")
    var thisform = document.forms(0)
    var objtxt = eval('document.forms(0).' + mtxt_box)
    var objlst = eval('document.forms(0).' + mlist_box)
    objlst.selectedIndex = 0

    var txt_fnd_len = objtxt.value
    txt_fnd_len = txt_fnd_len.length
    var txt_fnd = new String(objtxt.value)
    txt_fnd = txt_fnd.slice(0, txt_fnd_len)
    var lst_len = objlst.length

    for (i = 0; i <= lst_len - 1; i++) {
        var lst_txt = new String(objlst[i].text)
        lst_txt = lst_txt.slice(0, txt_fnd_len)
        if (lst_txt.toUpperCase() == txt_fnd.toUpperCase()) {
            objlst.selectedIndex = i
            break;
        }
    }
}

function full_wind(url, wind_name) {
    //var mfeatures="maximize=yes,resizable=yes, scrollbars=yes, toolbar=no, menubar=no, directories=no"	
    //var new_wind=open(url,'',mfeatures)
    //new_wind.moveTo((screen.availWidth-mWidth	)/2, (screen.availHeight-mHeight)/2)	
    var mfeatures = "maximize=yes,resizable=yes, scrollbars=yes, toolbar=no, menubar=no, directories=no, status=yes"
    var new_wind = open(url, '', mfeatures)
    new_wind.moveTo(0, 0)
    new_wind.resizeTo(screen.availWidth, screen.availHeight)
}

function full_wind1(url, wind_name) {
    //var mfeatures="maximize=yes,resizable=yes, scrollbars=yes, toolbar=no, menubar=no, directories=no"	
    //var new_wind=open(url,'',mfeatures)
    //new_wind.moveTo((screen.availWidth-mWidth	)/2, (screen.availHeight-mHeight)/2)	
    var mfeatures = "maximize=yes,resizable=yes, scrollbars=yes, toolbar=no, menubar=no, directories=no, status=yes"
    var new_wind = open(url, '', mfeatures)
    new_wind.moveTo(0, 0)
    new_wind.resizeTo(screen.availWidth, screen.availHeight)
}

function fullWindow(url, wind_name) {
    var w = screen.availWidth;
    var h = screen.availHeight;
    var mfeatures = "maximize=yes,scrollbars=yes, toolbar=no, menubar=no, status=yes"
    var windowHandleCR = open(url, '', mfeatures)

    windowHandleCR.focus();
    windowHandleCR.moveTo(0, 0);
    windowHandleCR.resizeTo(w, h)
    //new_wind.moveTo((screen.availWidth-mWidth	)/2, (screen.availHeight-mHeight)/2)	
}

function windowFull(url, wind_name) {
    var w = screen.availWidth;
    var h = screen.availHeight;
    LeftPosition = (screen.width) ? (screen.availWidth) : 100; TopPosition = (screen.availHeight) ? (screen.height) : 100;
    var mfeatures = "maximize=yes,scrollbars=yes, toolbar=no, menubar=no, status=yes"
    var windowHandleCR = open(url, '', mfeatures)
    windowHandleCR.focus();
    windowHandleCR.moveTo(0, 0);
    windowHandleCR.resizeTo(w, h)
    //new_wind.moveTo((screen.availWidth-mWidth	)/2, (screen.availHeight-mHeight)/2)	
}

function windowFull1(url, wind_name, vTabName) {
    var w = screen.availWidth;
    var h = screen.availHeight;

    if (OpenTab(vTabName, wind_name, url) == true)
        return;

    LeftPosition = (screen.width) ? (screen.availWidth) : 100; TopPosition = (screen.availHeight) ? (screen.height) : 100;

    var mfeatures = "maximize=yes,scrollbars=no, toolbar=no, menubar=no, status=yes"
    var windowHandleCR = open(url, '', mfeatures)  
    windowHandleCR.focus();
    windowHandleCR.moveTo(0, 0);
    windowHandleCR.resizeTo(w, h)
    //new_wind.moveTo((screen.availWidth-mWidth	)/2, (screen.availHeight-mHeight)/2)
}

function CloseTabWindow() {
    var mTabName

    try {
        mTabName = window.document.getElementById("hiddTabName").value;

        CloseTab(mTabName);
    }
    catch (ex) {
        window.close();
    }
}

function ResizeFrame() {
    var mFrames

    try {
        mFrames = document.getElementsByTagName("iframe")

        mLen = mFrames.length;

        mLoop = 0;

        for (mLoop = 0; mLoop < mLen; mLoop++) {
            mFrame = mFrames[mLoop]
            mFrame.height = document.body.clientHeight - 2;
        }
    }
    catch (ex) {
    }
}

function OpenTab1(vTabName, vTabCaption, vURL) {
    var mFrame
    var mDoc
    var mTabs
    var mRow
    var mCell
    var mTabCaption
    var mNewFrame
    var mBottomPage
    var mHeaderPage
    var mFrameContainer
    var mLoop
    var mFrames
    var mLen
    var mFrameRefName
    var mMainFrame
    var mFrameRef

    var mTabFrame
    var mPageFrame

    var mTabFrameObj
    var mPageFrameObj

    try {

        mMainFrame = window.top.frames[1];

        if (window.top.document.getElementById("DefPage")) {
            mMainFrame = window.top;
            mFrameRef = 'window.top';

            mTabFrame = mFrameRef + '.document';
            mPageFrame = mFrameRef + '.document';

            mTabFrameObj = window.top;
            mPageFrameObj = window.top;

        }
        else if (typeof (mMainFrame) == "undefined") {
            mMainFrame = window.top.frames[0];
            mFrameRef = 'window.top.frames[0]';

            mTabFrame = mFrameRef + '.frames[0].document';
            mPageFrame = mFrameRef + '.frames[1].document';

            mTabFrameObj = mMainFrame.frames[0];
            mPageFrameObj = mMainFrame.frames[1];

        }
        else {
            mFrameRef = 'window.top.frames[1]';

            if (mMainFrame.frames.length == 1 || window.top.frames[0].document.getElementById("tblTabs")) {
                mTabFrame = 'window.top.frames[0].document';
                mPageFrame = 'window.top.frames[1].document';

                mTabFrameObj = window.top.frames[0];
                mPageFrameObj = window.top.frames[1];
            }
            else {
                mTabFrame = mFrameRef + '.frames[0].document';
                mPageFrame = mFrameRef + '.frames[1].document';

                mTabFrameObj = mMainFrame.frames[0];
                mPageFrameObj = mMainFrame.frames[1];
            }
        }


        /*mHeaderPage = mMainFrame.document;
	
	mFrame = mHeaderPage.frames[0];
	
	if(!mFrame)
        {
        //return false;
        }
        */

        mFrame = mTabFrameObj.document

        mBottomPage = mPageFrameObj.document //mMainFrame.frames[1].document;

        mFrameContainer = mBottomPage.getElementById("divFrames");

        if (mFrameContainer == null) {
            mFrameContainer = mBottomPage
        }

        mFrames = mFrameContainer.getElementsByTagName("iframe");
        mLen = mFrames.length;
        mFrameRefName = vTabName + mLen

        mDoc = mFrame;
        mTabs = mDoc.getElementById("tblTabs");
        mRow = mTabs.rows(0);
        mCell = mRow.insertCell();


        mTabCaption = vTabCaption

        //mCell.innerHTML = "<table class='TabTextStyle' cellpadding=0 cellspacing=0><tr valign=middle><td><span width='100%' onclick=ShowFrame('"+mFrameRef+".frames[0].document','"+mFrameRef+".frames[1].document','" + mFrameRefName + "','td" + mFrameRefName + "','tblTabs')>"+mTabCaption+"</span>&nbsp;</td><td onclick=\"CloseTab('" + mFrameRefName + "')\"><!--<img1 src='/Portal/Images/smallcancel.jpg'>-->X</td></tr></table>";
        mCell.innerHTML = "<table class='TabTextStyle' cellpadding=0 cellspacing=0><tr valign=middle><td><span width='100%' onclick=ShowFrame('" + mTabFrame + "','" + mPageFrame + "','" + mFrameRefName + "','td" + mFrameRefName + "','tblTabs')>" + mTabCaption + "</span>&nbsp;</td><td onclick=\"CloseTab('" + mFrameRefName + "')\"><!--<img1 src='/Portal/Images/smallcancel.jpg'>-->X</td></tr></table>";

        mCell.className = "TabUnSel";
        mCell.id = "td" + mFrameRefName

        mNewFrame = mBottomPage.createElement("iframe");
        mNewFrame.name = "ifrDefault";
        mNewFrame.width = "100%";
        mNewFrame.height = mBottomPage.body.clientHeight - 2;
        mNewFrame.id = mFrameRefName
        mNewFrame.frameBorder = "0px";


        if (vURL.indexOf("?") == -1)
            vURL = vURL + "?TabName=" + mFrameRefName
        else
            vURL = vURL + "&TabName=" + mFrameRefName

        mNewFrame.src = vURL;
        mFrameContainer.appendChild(mNewFrame);


        //ShowFrame(mFrameRef+'.frames[0].document',mFrameRef+'.frames[1].document',mFrameRefName,"td"+mFrameRefName+"",'tblTabs');
        ShowFrame(mTabFrame, mPageFrame, mFrameRefName, "td" + mFrameRefName + "", 'tblTabs');


        //return true; 
    }
    catch (ex) {
        full_wind(vURL, '')
    }

}

function ShowFrame(vHeaderPage, vBottomPage, vFrameRefName, vTab, vTabs) {
    var mFrames
    var mLen
    var mBottomPage
    var mFrameContainer
    var mFrame
    var mHeaderPage
    var mRow
    var mCell
    var mTBLTab

    mHeaderPage = eval(vHeaderPage)
    mBottomPage = eval(vBottomPage);

    mTBLTab = mHeaderPage.getElementById("tblTabs");

    //mHeaderPage.getElementById("txt_ActiveTab").value = vFrameRefName;

    mFrames = mBottomPage.getElementsByTagName("iframe")

    mLen = mFrames.length;

    mLoop = 0;

    for (mLoop = 0; mLoop < mLen; mLoop++) {
        mFrame = mFrames[mLoop];

        if (mFrame.id == vFrameRefName) {
            mFrame.style.display = "inline";
        }
        else {
            mFrame.style.display = "none";
        }
    }

    mRow = mTBLTab.rows(0);

    for (mLoop = 0; mLoop < mTBLTab.cells.length; mLoop++) {

        mCell = mRow.cells(mLoop)
        if (mCell.id == vTab) {
            mCell.className = "TabSel";
        }
        else {
            mCell.className = "TabUnSel";
        }
    }

}

function CloseTab(vFrameID) {
    var mHeaderPage
    var mBottomPage
    var mFrames
    var mLen
    var mTblTabs
    var mRow
    var mCell
    var mTab
    var mLoop
    var mMainFrame
    var mFrameRef
    var mFrameToShow
    var mFrame
    var mFrame1

    var mTabFrame
    var mPageFrame

    var mTabFrameObj
    var mPageFrameObj

    var mFrameContainer

    //mHeaderPage = window.parent.parent.parent.document
    mMainFrame = window.top.frames[1]

    if (window.top.document.getElementById("DefPage")) {
        mMainFrame = window.top;
        mFrameRef = 'window.top';

        mTabFrame = mFrameRef + '.document';
        mPageFrame = mFrameRef + '.document';

        mTabFrameObj = window.top;
        mPageFrameObj = window.top;

    }
    else if (typeof (mMainFrame) == "undefined") {
        mMainFrame = window.top.frames[0];
        mFrameRef = 'window.top.frames[0]';

        mTabFrame = mFrameRef + '.frames[0].document';
        mPageFrame = mFrameRef + '.frames[1].document';

        mTabFrameObj = mMainFrame.frames[0];
        mPageFrameObj = mMainFrame.frames[1];
    }
    else {
        mFrameRef = 'window.top.frames[1]';

        if (mMainFrame.frames.length == 1 || window.top.frames[0].document.getElementById("tblTabs")) {

            mTabFrame = 'window.top.frames[0].document';
            mPageFrame = 'window.top.frames[1].document';

            mTabFrameObj = window.top.frames[0];
            mPageFrameObj = window.top.frames[1];
        }
        else {
            mTabFrame = mFrameRef + '.frames[0].document';
            mPageFrame = mFrameRef + '.frames[1].document';

            mTabFrameObj = mMainFrame.frames[0];
            mPageFrameObj = mMainFrame.frames[1];
        }
    }

    /*mHeaderPage = mMainFrame.document;
	
	mFrame = mHeaderPage.frames[0];
	
	if(!mFrame)
    {
    //return false;
    }
    */

    mHeaderPage = mTabFrameObj.document //mMainFrame.frames[0].document; //window.document;

    mBottomPage = mPageFrameObj.document //mMainFrame.frames[1].document //window.parent.frames[1].document;

    mTblTabs = mHeaderPage.getElementById("tblTabs");

    mFrames = mBottomPage.getElementsByTagName("iframe")

    mFrameContainer = mBottomPage.getElementById("divFrames");

    if (mFrameContainer == null) {
        mFrameContainer = mBottomPage
    }

    mLen = mFrames.length;

    if (vFrameID == "") {
        vFrameID = mHeaderPage.getElementById("txt_ActiveTab").value;
    }

    for (mLoop = 0; mLoop < mLen; mLoop++) {
        mFrame = mFrames[mLoop]

        if (mFrame.id == vFrameID) {

            mFrame1 = mFrames[mLoop - 1]
            mFrameToShow = mFrame1.id

            //ShowFrame(mFrameRef+'.frames[0].document',mFrameRef+'.frames[1].document','DefPage',"tdDefPage",'tblTabs');
            ShowFrame(mTabFrame, mPageFrame, mFrameToShow, "td" + mFrameToShow + "", 'tblTabs');
            mFrameContainer.removeChild(mFrame);
            break;
        }
    }

    mRow = mTblTabs.rows(0)
    mTab = "td" + vFrameID
    for (mLoop = 0; mLoop < mTblTabs.cells.length; mLoop++) {
        mCell = mRow.cells(mLoop)
        if (mCell.id == mTab) {
            mRow.deleteCell(mLoop);
            break;
        }
    }
}

function showStatusText(vMessage) {
    window.status = vMessage
}
function clearStatusText() {
    window.status = ""
}
function showFrame(vFile, vDocUNID, vCaller, vMode) {
    divComments.style.display = "inline"
    divActionBar.style.display = "none"
    inFrame.navigate(vFile + "?FormID=" + vDocUNID + "&Caller=" + vCaller + "&Mode=" + vMode)
}
/*function confirmDelete(vMessage)
{	
if(confirm(vMessage)==false)
return false;
else
return true;
}*/
function confirmExit(vHidden, vField) {
    if (vField.value == "EDIT") {
        if (confirm("Do you want save changes before closing....") == true) {
            vHidden.click();
            return;
        }
    }
    //window.close();
    CloseTabWindow();
}

function confirmCancel(vMessage) {
    if (confirm('Are you sure you want to cancel the request') == false)
        return false;
    else
        return true;
}
function showData(vID, vArea) {
    if (frmEmpHierarchy.document.getElementById(vArea).style.display == "none") {
        frmEmpHierarchy.document.getElementById(vArea).style.display = "inline";
        frmEmpHierarchy.document.getElementById(vID).innerHTML = "<img src='/Portal/ImagesImages/Collapse.gif'>"
    }
    else {
        frmEmpHierarchy.document.getElementById(vArea).style.display = "none";
        frmEmpHierarchy.document.getElementById(vID).innerHTML = "<img src='/Portal/ImagesImages/Expand.gif'>"
    }
}
function openEmpForm() {
    opn_wind("../Masters/frmEmpMaster.aspx?Mode=display&FormID=" + frmEmpHierarchy.hiddEmpID.value + "", '0', 700, 385)
}
function opensubMenu(vMenu, vSubMenu) {
    var mMenuID = vMenu.id;
    var mSubMenuID = vSubMenu.id
    var XPos = findPosX(vMenu);
    var YPos = parseInt(findPosY(vMenu)) + parseInt(frmEmpHierarchy.document.getElementById(mMenuID).offsetHeight);
    frmEmpHierarchy.document.getElementById(mSubMenuID).style.left = XPos
    frmEmpHierarchy.document.getElementById(mSubMenuID).style.top = YPos
    frmEmpHierarchy.document.getElementById(mSubMenuID).style.visibility = "visible";
}
function hideMenu(vSubMenu) {
    var mSubMenuID = vSubMenu.id
    frmEmpHierarchy.document.getElementById(mSubMenuID).style.visibility = "hidden";
}
function findPosX(obj) {
    var curleft = 0;
    if (obj.offsetParent) {
        while (obj.offsetParent) {
            curleft += obj.offsetLeft
            obj = obj.offsetParent;
        }
    }
    else if (obj.x)
        curleft += obj.x;
    return curleft;
}

function findPosY(obj) {
    var curtop = 0;
    if (obj.offsetParent) {
        while (obj.offsetParent) {
            curtop += obj.offsetTop
            obj = obj.offsetParent;
        }
    }
    else if (obj.y)
        curtop += obj.y;
    return curtop;
}
function check(vType) {
    if (vType == 'Main') {
        if (tdMainSSA.innerText == "New")
            opn_wind("../Forms/frmSMAUnAssign.aspx?Mode=1&FormID=" + frmEmpHierarchy.hiddEmpID.value + "", 0, 700, 200)
        else if (tdMainSSA.innerText == "Edit")
            opn_wind("../Forms/frmSMAUnAssign.aspx?Mode=2&FormID=" + frmEmpHierarchy.hiddEmpID.value + "", 0, 700, 200)
        else if (tdMainSSA.innerText == "Exception")
            opn_wind("../Forms/frmSMAUnAssign.aspx?Mode=4&FormID=" + frmEmpHierarchy.hiddEmpID.value + "", 0, 700, 310)
    }
    else if (vType == 'Other')
    { }
}
function hideWindow() {
    window.parent.document.getElementById("divComments").style.display = "none";
    window.parent.document.getElementById("divActionBar").style.display = "inline";
}
function PrintDocument() {
    document.getElementById("ActBar").style.display = "none"

    document.getElementById("divDocBody").className = "DocumentBodyPlain"
    document.getElementById("divDocBody").style.backgroundColor = "white"

    document.getElementById("divDocCont").className = "DocumentHeaderPlain"
    document.getElementById("divDocCont1").className = "DocumentPlain"
    document.getElementById("divDocHead").className = "DocumentHeaderPlain"
    document.getElementById("divDocFoot").className = "DocumentFooterPlain"
    try {
        document.getElementById("BodyTag").className = "WindowPlain"
        document.getElementById("BodyTag").style.backgroundColor = "white"
    }
    catch (ex)
				{ }
    window.print()
}



function confirmdelete() {
    var mLoop
    var mChk
    var mSel
    var mFlag
    var mForm

    mChk = window.document.getElementsByName("chk")
    mFlag = false;
    mForm = document.forms(0)

    for (mLoop = 0; mLoop < mChk.length; mLoop++) {
        if (mChk[mLoop].checked == true) {
            mFlag = true;
            break;
        }
    }
    if (mFlag == false) {
        alert("Please Select Records before deleting...")
        mForm.btnRem.focus();
        return false;
    }
    else {
        mSel = confirm("Do You Want To Delete the Selected Record(s)? ")
        if (mSel == true)
            return true;
        else
            return false;
    }
}

function openSingleUserLkp(vAppName, MText, HText) {
    var mFeatures
    var mWind
    var mWidth = 420; //  screen.availWidth-200;
    var mHeight = 550; // screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/" + vAppName + "/Forms/frmUserName.aspx?MForm=" + MText + "&HForm=" + HText, "UserSelectionForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
function openSingleUserLkp1(vAppName, MText, HText, vIndex) {
    var mFeatures
    var mWind
    var mWidth = 420; //screen.availWidth-200;
    var mHeight = 550; //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/" + vAppName + "/Forms/frmUName.aspx?MForm=" + MText + "&HForm=" + HText + "&Index=" + vIndex, "UserSelectionForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
function OpenLookupForm2(vAppName, MText, HText, vLkpType, vIndex) {
    //alert("1")
    var mFeatures
    var mWind
    var mWidth = 420; //screen.availWidth-200;
    var mHeight = 550; //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/" + vAppName + "/Forms/frmLookup.aspx?MForm=" + MText + "&HForm=" + HText + "&Index=" + vIndex + "&LkpType=" + vLkpType, "LookupForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
function OpenLookupForm(vAppName, MText, HText, vLkpType) {
    //alert("1")
    var mFeatures
    var mWind
    var mWidth = 500;  //screen.availWidth-200;
    var mHeight = 550;  //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/" + vAppName + "/Forms/frmLookup.aspx?MForm=" + MText + "&HForm=" + HText + "&LkpType=" + vLkpType, "LookupForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
function OpenLookupForm1(vAppName, MText, HText, vLkpType, vDependField, vFldType, vBtn) {
    var mFeatures
    var mWind
    var mWidth = 500; //screen.availWidth-200;
    var mHeight = 550; //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/" + vAppName + "/Forms/frmLookup.aspx?MForm=" + MText + "&HForm=" + HText + "&LkpType=" + vLkpType + "&DependField=" + vDependField + "&FldType=" + vFldType + "&Btn=" + vBtn, "LookupForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
//----[Start] Added By Prakash on 21-Jun-2007----
function DeleteRow111(vTbl, vChk, vRowCount, vStart) {

    var mCount
    var mRowNo
    var mFlag
    var mTable
    var mCountField, mObjChk
    var i;

    mCountField = vRowCount
    mCount = mCountField.value;

    mObjChk = vChk
    mTable = vTbl

    if (vStart == "") {
        vStart = 1
    }
    vStart = parseInt(vStart)

    for (i = 0; i < mCount; i++) {
        if (mObjChk[i].checked == true) {
            mTable.deleteRow(i + vStart)
            i = -1;
            mCount = mCount - 1;
        }
    }

    mCountField.value = mCount;

    ResetSrNo111(mTable, mCount, vStart)

}

function ResetSrNo111(vTable, mRows, vStart) {
    for (i = 0; i < mRows; i++) {
        vTable.rows(i + vStart).cells(1).innerHTML = i + 1
    }

}
//----[End] Added By Prakash on 21-Jun-2007----				
function roundNumber(num, dec) {
    if (!(isNaN(num) || isNaN(dec))) {
        var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
        return result;
    } else
    { return 0 }

}
function RemoveRow(vCheckCount) {
    if (confirm("Your are about to delete selected  " + vCheckCount + " row(s).\n Are your sure you want to continue") == true) {
        return true;
    }
    else {
        return false;
    }
}


// Changes done by Sarafarz on 25.8.07
function confirmDelete(vMessage) {
    if (typeof (vMessage) == "undefined")
        vMessage = "Are you sure you want to delete record(s)"
    if (confirm(vMessage) == false)
        return false;
    else
        return true;
}
// Changes done by Sarafarz on 25.8.07



function GetFormParameterValue(vParamName) {
    var mParamValue;
    var mGetVars;
    var mQString;
    var mPairs;
    var mNameVal;

    mGetVars = new Array();
    mQString = unescape(window.location.search.substring(1));

    mPairs = mQString.split(/\&/);

    mParamValue = ""
    for (var i in mPairs) {
        mNameVal = mPairs[i].split(/\=/);

        if (mNameVal[0] == vParamName) {
            mParamValue = mNameVal[1];
            break;
        }
    }

    return mParamValue
}

function GetFormParameter() {
    var mParamValue;
    var mGetVars;
    var mQString;
    var mPairs;
    var mNameVal;
    var mQIndex

    mParamValue = "";
    mGetVars = new Array();
    mQString = window.location.href;

    mQIndex = mQString.indexOf("?", 0);

    if (mQIndex > 0) {
        mParamValue = mQString.substring(mQIndex + 1, mQString.length);
        mParamValue = mParamValue.replace("ReturnUrl=", "")
    }


    return mParamValue
}
// start added by Prakash 9.1.2008  
//e.g onclick="openMultipleSelection('txtabc','hiddabc','DC')"
function openMultipleSelection(MText, HText, vLkpType) {
    var mFeatures
    var mWind
    var mWidth = 850; //screen.availWidth-200;
    var mHeight = 550; //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/Forms/Lookup/lkpMultipleSelection.aspx?MForm=" + MText + "&HForm=" + HText + "&LkpType=" + vLkpType, "SelectionForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}
//e.g onclick="OpenSingleSelection('txtxyz','hiddxyz','lkp_SD')" and Query in store procedure				
function OpenSingleSelection1(MText, HText, vLkpType) {
    //alert("1")
    var mFeatures
    var mWind
    var mWidth = 500;  //screen.availWidth-200;
    var mHeight = 550;  //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    mWind = window.open("/Portal/Forms/Lookup/lkpSingleSelection.aspx?MForm=" + MText + "&HForm=" + HText + "&LkpType=" + vLkpType, "LookupForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
}

// end by prakash 9.1.2008.     


function ResizeWindowHeight() {
    divMainBody.style.height = window.document.body.clientHeight - 76;
}


function OpenSingleSelection(MText, HText, LkpType) {
    var mFeatures;
    var mWind;
    var mWidth = 500;  //screen.availWidth-200;
    var mHeight = 550;  //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";

    mWind = window.open("../Lookups/lkpUserSelection.aspx?MForm=" + MText + "&LkpType=" + LkpType + "&HForm=" + HText, "", mFeatures);

    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)

}


function PrintForm() {
    window.print();
}

function SetDefaultFocus(vObj) {
    var mFocusFeild;
    mFocusFeild = document.getElementById("vObj");
    mFocusFeild.focus();
}

function OpenSingleSelectionSchemeForm(MText, HText, vLkpType) {
    var mFeatures
    var mWind
    var mWidth = 650;  //screen.availWidth-200;
    var mHeight = 550;  //screen.availHeight-235;

    mFeatures = "toolbar=no,scrollbars=no,status=yes,menubar=no,titlebar=yes,width=" + mWidth + ",height=" + mHeight + "";
    //mWind = window.open("../Lookups/lkpSingleLookupSelection.aspx?MForm="+MText+"&HForm="+HText+"&LkpType="+vLkpType + "&AMC=" + vAMC.value,"LookupForm",mFeatures);
    mWind = window.open("../Pages/Lookups/lkpUserSelection.aspx?MForm=" + MText + "&HForm=" + HText + "&LkpType=" + vLkpType, "LookupForm", mFeatures);
    mWind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)

}

//function OpenTabWin(vName, vTitle, vURL) {
//    var mURL = vURL;    
//    window.parent.OpenTab(vName, vTitle, mURL);
//}

function OpenTabWin(vName, vTitle, vURL, vRefreshPanel, vRefreshButton) {
    var mURL = "";

    if ($("#txtURL").length > 0 && $("#txtURL").val() != "/") {
        mURL = $("#txtURL").val() + "/" + vURL;
    }
    else if ($("#txtURL").val() == "/") {
        mURL = "/" + vURL;
    }
    else {
        mURL = vURL;
    }
    window.parent.xOpenTab(vName, vTitle, mURL, vRefreshPanel, vRefreshButton);
}


function CloseDialogWin() {
    window.parent.CloseDialog();
}

function CloseTabWin() {
    //window.parent.RemoveTab();
    window.history.back();
}

function SetFocus(vTextBox) {
    document.getElementById(vTextBox).focus();
}


function SetRptrFocus(vObj, CtrlId) {

    var mIdPrefix = "tabCont_TabMitiDetails_RptrMitigationDtls_ctl0"; //"RptrMitigationDtls_ctl0";
    var mId;
    var mRowNo;
    mRowNo = $(vObj).closest("tr")[0].rowIndex ;

    mId = mIdPrefix + mRowNo + "_" + CtrlId;    
    $("#" + mId).focus();
}



function ShowTab(vTabName, vTabTitle, vURL, vRefreshParent, vRefreshPath) {
    //window.top.xOpenTab(vTabName, vTabTitle, vURL, vRefreshParent, vRefreshPath);
    window.location.href = vURL;
}

function ExitTab(vIgnoreRefresh) {
    try
    {
        window.top.xCloseTab(vIgnoreRefresh);
    }
    catch(ex) 
    {
        window.close();
    }
}


function CloseForm() {
    window.location.href = "../Pages/Home.aspx";
}