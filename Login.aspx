<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_login.aspx.cdcab7d2" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn {
            width: 60px;
            margin-top: 5px;
            margin-right: 2px;
        }

        .myButton {
            -moz-box-shadow: 0px 1px 0px 0px #f0f7fa;
            -webkit-box-shadow: 0px 1px 0px 0px #f0f7fa;
            box-shadow: 0px 1px 0px 0px #f0f7fa;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #33bdef), color-stop(1, #019ad2));
            background: -moz-linear-gradient(top, #33bdef 5%, #019ad2 100%);
            background: -webkit-linear-gradient(top, #33bdef 5%, #019ad2 100%);
            background: -o-linear-gradient(top, #33bdef 5%, #019ad2 100%);
            background: -ms-linear-gradient(top, #33bdef 5%, #019ad2 100%);
            background: linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#33bdef', endColorstr='#019ad2',GradientType=0);
            background-color: #33bdef;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #057fd0;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px -1px 0px #5b6178;
            padding: 6px;
            margin-top: 10px;
        }

            .myButton:hover {
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #019ad2), color-stop(1, #33bdef));
                background: -moz-linear-gradient(top, #019ad2 5%, #33bdef 100%);
                background: -webkit-linear-gradient(top, #019ad2 5%, #33bdef 100%);
                background: -o-linear-gradient(top, #019ad2 5%, #33bdef 100%);
                background: -ms-linear-gradient(top, #019ad2 5%, #33bdef 100%);
                background: linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#019ad2', endColorstr='#33bdef',GradientType=0);
                background-color: #019ad2;
            }

            .myButton:active {
                position: relative;
                top: 1px;
            }

        .button:hover {
            border-top-color: #28597a;
            background: #28597a;
            color: #ccc;
        }

        .button:active {
            border-top-color: #1b435e;
            background: #1b435e;
        }

        .lower {
            background: none repeat scroll 0 0 #ECF2F5;
            /*border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;*/
            border-top: 1px solid #CCCCCC;
            box-shadow: 0 1px 1px #FFFFFF inset;
            height: 40px;
            margin-top: 20px;
            width: 100%;
        }

        .tbl {
            /*position: absolute;
          top: 50%;
          left: 50%;
          margin-top: -10%;
          margin-left: -146px;
          border: 1px solid gray;
          z-index:9999;
          box-shodow:inset 0 1.5px 5px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
          background: none repeat scroll 0 0 #FFFFFF;*/
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            height: 280px;
            left: 50%;
            margin-left: -170px;
            margin-top: -10%;
            position: fixed;
            top: 50%;
            width: 20%;
        }

        .txt {
            border: 1px solid #a8c9e4;
        }

            .txt:focus {
                border: 1px solid #a8c9e4;
                /*box-shadow: inset 0 1.5px 5px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;*/
            }
    </style>
    <script language="JavaScript" type="text/javascript">
        javascript: window.history.forward(1);
    </script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript">
    </script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
        function tr(id) {
            id.value = "";
        }
    </script>
    <%--<script type="text/javascript">

        $(function () {
            $(window).bind("beforeunload", function () {
                var value = document.getElementById('_ispostback').value;
                if (value = "false") {
                    PageMethods.UnlockOnPageLeave();
                }

            })
        });

        function fnLogOut() { alert('browser closing'); }

    </script>--%>
</head>
<body style="font-family: Verdana; height: 100%; background: none repeat scroll 0 0 #F0F0F0;">
    <form id="form1" autocomplete="Off" runat="server">
        <div align="center" style="height: 100%">
            <%-- <input type="hidden" id="_ispostback" value="<%=Page.IsPostBack.ToString()%>" />--%>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table class="tbl" width="25%">
                <tr>
                    <th align="center"
                        style="height: 60px; border-bottom-style: solid; border-bottom-color: Gray; border-bottom-width: 1px; background-color: #87CEFA">
                        <%-- <h2>Login</h2> --%>
                        <asp:Image ID="Image1" runat="server"
                            ImageUrl="~/Images/AdMandateTransparentLogo.png" Height="42px" Width="264px" />
                        <%--<img src="Images/AdMandateTransparentLogo.png" style="width: 60%; height: 25px" />--%>
                        <%--<img src="AdMandateTransparentLogo.png"
                        style="width: 60%; height: 25px" />--%>
                    </th>
                </tr>
                <tr>
                    <td>
                        <div align="left" style="padding: 5px; margin-top: 5px">
                            Login ID
                        </div>
                        <div align="left">
                            <asp:TextBox CssClass="txt" ID="txtUserName" onkeydown="return MoveNext('txtPassword',event.keyCode);"
                                Style="padding: 5px; width: 95%" runat="server" Text="admin"
                                placeholder="User Name" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div align="left" style="padding: 5px; margin-top: 5px">
                            Password
                        </div>
                        <div align="left">
                            <asp:TextBox CssClass="txt" onfocus="tr(this);" ID="txtPassword"
                                Style="padding: 5px; width: 95%" runat="server" TextMode="Password" Text=""
                                placeholder="Password" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="msg" runat="server" align="left" style="padding: 2px; margin-top: 5px; display: none">
                            <asp:Label ID="lblmsg" runat="server" Text="Label" ForeColor="Red"
                                Font-Size="Smaller"></asp:Label>
                        </div>
                        <div class="lower" align="center" style="margin-top: 5px;">
                            <asp:Button class="myButton" ID="btnLogin" Style="padding: 4px;" runat="server" Text="Login" OnClick="btnLogin_Click" />

                        </div>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>

