
function LoadPage(vURL, vWidth, vHeight) {
    try {
        window.parent.OpenPopUpPage(vURL + '&RootFolder=&IsDlg=1&TranFlag=Transfer', '', vWidth, vHeight);
    }
    catch (ex) {
        window.location.href = vURL;
    }
}

function ClosePage() {
    try {
        window.frameElement.commitPopup(); 
    } catch (ex) {
    window.location.href = "../Pages/Home.aspx";
    }
}

function ClosePopupPage() {
    try {
        window.parent.CloseDialog();
    } catch (ex) {
        window.location.href = "../Pages/Home.aspx";
    }
}

function opn_wind(url, wind_name, mWidth, mHeight) {

    var mfeatures = "width=" + mWidth + ", height=" + mHeight + ", maximize=no,resizable=no, scrollbars=yes, toolbar=no, menubar=no, directories=no, status=yes"
    var new_wind = open(url, '', mfeatures)
    new_wind.moveTo((screen.availWidth - mWidth) / 2, (screen.availHeight - mHeight) / 2)
    return new_wind;
}

// ********* Only Number
function NumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 47 && charCode < 58 || charCode == 127 || charCode == 8) {
        return true;

    }
    else {
        return false;
    }
}