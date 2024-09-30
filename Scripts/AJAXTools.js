
var postBackElement;
var prm;
var _Scroll;

prm = Sys.WebForms.PageRequestManager.getInstance();

prm.add_initializeRequest(InitializeRequest);
prm.add_endRequest(EndRequest);

function InitializeRequest(sender, args) {
    if (prm.get_isInAsyncPostBack())
        args.set_cancel(true);
    postBackElement = args.get_postBackElement();

    document.getElementById('divProgress').style.display = "inline";
    document.getElementById('divMain').className = "FreezePage";
    try {
    _Scroll = document.body.scroll;
    //document.body.scroll = "no";
    }
    catch (ex) { }
}

function EndRequest(sender, args) {
    $(window).focus();    
    document.getElementById('divMain').className = "UnFreezePage";
    document.getElementById('divProgress').style.display = "none";
    try {
    //document.body.scroll = "scroll";
    }
    catch (ex) { }

    try {
    After_AJAX_EndRequest();
    }
    catch (ex)
    { }
}
