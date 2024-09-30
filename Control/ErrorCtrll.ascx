<%@ control language="C#" autoeventwireup="true" inherits="Control_ErrorCtrll, App_Web_errorctrll.ascx.cc961b29" %>
<div id="dvError" runat="server" visible="false">
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
    
    function ToggleError(vObj) 
    {     
        var _ControlID = "ctl00_AppError1_";
        
        if(vObj.getAttribute("showimg") == 0)
        {
            vObj.src = "../Images/LibPlus.bmp";
            vObj.setAttribute("showimg",1);
            
            document.getElementById("divTechnicalMsg").style.display = "none";            
        } 
        else
        {
            vObj.src = "../Images/Libminus.bmp";
            vObj.setAttribute("showimg",0);
            
            document.getElementById("divTechnicalMsg").style.display = "inline";
        }
    }
    
    
    function FreezePage()
    {
        
        //document.getElementById('divOverlap').className = "FreezePage"
        document.getElementById('popup_error').style.top = (parseInt(getScrollHeight()) + 20) + "px";
        document.getElementById('popup_error').style.display = "inline";
        document.body.scroll = "no";
    }
    
    function UnFreezePage2()
    {
        //document.getElementById('divOverlap').className = "UnFreezePage";          
        document.getElementById('popup_error').style.display = "none";                
        document.body.scroll = "yes";
    }
    
     function getScrollWidth()
    {
       var w = window.pageXOffset ||
               document.body.scrollLeft ||
               document.documentElement.scrollLeft;
               
       return w ? w : 0;
    }

    function getScrollHeight()
    {
       var h = window.pageYOffset ||
               document.body.scrollTop ||
               document.documentElement.scrollTop;
               
       return h ? h : 0;
    }
    
    function CloseError()
    {
        $("#popup_error").hide();
    }
    
    </script>

    <div id="popup_error" style="background-color: white; border: solid 5px #b33d3d;
        display1: none; height1: 330px; z-index1: 1000; left1: 50px; right1: 50px; visibility: visible;
        width: 98%; position1: absolute; top1: 10px;">
        <div style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px; padding-top: 10px;
            height: 100%">
            <div style="background-color: rgb(247,247,247); padding: 2px; border: solid 1px gray;">
                <div style="width: 95%; height: 100%">
                    <div style="padding: 10px; font-family: Verdana;">
                        <table border="0" cellpadding="2" cellspacing="0" width="100%" style="color: rgb(66,130,206);">
                            <tr valign="top">
                                <td style="width: 50px;">
                                    <img src="../Img/ico-Error.png" alt="Error" align="absmiddle" />
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="color: rgb(82,85,82);
                                        font-size: 12px;">
                                        <tr>
                                            <td style="height: 1px;">
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td style="color: #cc0000; font-size: 16px;">
                                                System Error !!
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 12px;">
                                                The system is unable to perform the action due to some error. Please try performing
                                                the action again.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr style="background-color: rgb(181,190,198); height: 1px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-weight: bold;">Message : </span>
                                                <div id="divMessage" runat="server" style="font-size: 11px; color: Red; padding-left: 25px;">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 1px">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span style="font-weight: bold;">What you can try : </span>
                                                <ul style="padding-top: 0px; margin-top: 2px; font-size: 11px;">
                                                    <li>Click on the Close button to close the error message and try taking the action again.
                                                    </li>
                                                    <%--<li>Please expand the Technical Details section below. </li>--%>
                                                    <li>Take the Screen Shot of the form and send it to the system admin.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr id="dtlMsg" runat="server">
                                            <td>
                                                <img src="../Images/LibPlus.bmp" showimg="1" alt="" style="display: none; cursor: pointer;"
                                                    onclick="ToggleError(this)" />
                                                <span style="font-weight: bold;">Technical Details : </span>
                                                <div id="divTechnicalMsg" style="display1: none;">
                                                    <div id="divDetailMsg" runat="server" style="margin: 2px; color: #314d96; font-size: 11px;
                                                        padding-left: 25px;">
                                                    </div>
                                                    <div id="divInnerException" visible="false" runat="server" style="margin: 2px; color: #314d96;
                                                        font-size: 11px; padding-left: 25px;">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; padding: 2px;">
            <input type="button" id="btnClose" value="Close" onclick="CloseError()" style="cursor: pointer;
                background-color: #b33d3d; color: White; font-weight: bold; padding: 2px;" />
        </div>
    </div>
    <div id="divJS" runat="server">
    </div>
</div>

