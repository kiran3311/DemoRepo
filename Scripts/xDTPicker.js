
$().ready(function () {
    BindDTPickerCtrls();
});

function BindDTPickerCtrls() {
    try {
        $(".xDTPick").each(function () {
            var mSeparator;
            var mObj;

            mObj = $(this);
            if (mObj.is('input')) {
                mSeparator = mObj.attr("Separator");
                if (typeof (mSeparator) == "undefined")
                    mSeparator = "/";
                else if (mSeparator == "")
                    mSeparator = "/";

                try {
                    mObj.mask("99" + mSeparator + "aaa" + mSeparator + "9999");
                }
                catch (ex)
        { }
                xDTPicker_ShowCal(mObj);
            }
        });
    }
    catch (ex) {
    }

}

function xDTPicker_OpenCal(vObj, vCtrlId) {
    $("#" + vCtrlId).focus();
}

function xDTPicker_ShowCal(vObj) {
    vObj.datepicker
    ({
        changeMonth: true,
        changeYear: true,
        yearRange: "-20:+10",
        onSelect: function () {
            try {
                xDTPicker_OnSelect(this);
            }
            catch (ex)
            { }
        } /*,
        onClose: function (dateText, inst)
        {
            if($(window.event.srcElement).hasClass('ui-datepicker-close'))
            {
                $(this).val('');
            }            
        }*/
    });
}

function ShowCal(vObj) {
    //
    //$(vObj).datepicker("enable");
    //alert(5)
    //$(vObj).datepicker("refresh");
    //$(vObj).datepicker("destroy");
    $(vObj).datepicker
    ({
        changeMonth: true,
        changeYear: true,
        //closeText: "Clear",
        //showButtonPanel: true,
        yearRange: "-20:+10",
        onSelect: function () {
            try {
                xDTPicker_OnSelect(this);
            }
            catch (ex)
            { }
        } /*,
        onClose: function (dateText, inst)
        {
            if($(window.event.srcElement).hasClass('ui-datepicker-close'))
            {
                $(this).val('');
            }            
        }*/
    });
}


function xDTPicker_Validate(vFieldName) {
    
    if (document.getElementById(vFieldName).value == "__/___/____") {
        return true;
    }

    ValidateDTFormat(vFieldName);
    
}