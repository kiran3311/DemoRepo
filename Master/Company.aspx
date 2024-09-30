<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Company, App_Web_company.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .tbl
        {
            border: 1px solid #CCCCCC;
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
                            <td style="padding-left: 5px">
                                Business Date:
                            </td>
                            <td align="left">
                                <asp:TextBox CssClass="txt" ReadOnly="true" ID="txtDate" runat="server"></asp:TextBox>
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
                                <asp:Button ID="btnOK" runat="server" Width="80px" Text="OK" CssClass="txt" OnClick="btnOK_Click" />
                            </td>
                            <asp:Button ID="btnEncrypt" Visible="false" runat="server" Text="Encrypt" OnClick="btnEncrypt_Click" />
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
