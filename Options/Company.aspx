<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Options_Company, App_Web_company.aspx.d613b7e9" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .tbl
        {
            /*border: 1px solid #CCCCCC;*/
            border: 1px solid black;
            border-radius: 3px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            height: 20%;
            left: 50%;
            margin-left: -20%;
            margin-top: -5%;
            position: fixed;
            top: 50%;
            width: 40%;
        } 
        .styled-button-1 {
   border-top: 1px solid #96d1f8;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#65a9d7));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   padding: 4.5px 9px;
   -webkit-border-radius: 9px;
   -moz-border-radius: 9px;
   border-radius: 9px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 12px;
   font-family: Georgia, serif;
   text-decoration: none;
   vertical-align: middle;
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
    </style>
    <script type="text/javascript">

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <div align="center" style="height: 100%">
                    <table class="tbl">
                        <tr>
                            <th colspan="2" align="center" style="background-color: #87CEFA">
                                <h3 style="font-weight: bold; font-style: normal; margin-top: 0px;">
                                    Bank / Corporate</h3>
                            </th>
                        </tr>
                        <tr align="left">
                            <td align="left" style="padding-left: 5px">
                                Business Date:
                            </td>
                            <td align="left">
                                <asp:TextBox style="width:77px;" CssClass="txt" ReadOnly="true" ID="txtDate" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 5px">
                                Select Client:
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlClient" Width="400px" CssClass="txt" runat="server" OnSelectedIndexChanged="ddlClient_SelectedIndexChanged"
                                    onkeydown="return MoveNext('MainContent_ddlUtility',event.keyCode);" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 5px">
                                Select Utility:
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlUtility" CssClass="txt" Width="400px" onkeydown="return MoveNext('MainContent_btnOK',event.keyCode);"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnOK" runat="server" Width="60px" Text="OK" Class="myButton" OnClick="btnOK_Click" />
                            </td>
                            <asp:Button ID="btnEncrypt" Visible="false" runat="server" Text="Encrypt" OnClick="btnEncrypt_Click" />
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

