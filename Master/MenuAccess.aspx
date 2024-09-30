<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_Default, App_Web_menuaccess.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="../Scripts/1.8.3jquery.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function OnTreeClick(evt) {
            var src = window.event != window.undefined ? window.event.srcElement : evt.target;
            var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
            if (isChkBoxClick) {
                var parentTable = GetParentByTagName("table", src);
                var nxtSibling = parentTable.nextSibling;
                if (nxtSibling && nxtSibling.nodeType == 1)//check if nxt sibling is not null & is an element node
                {
                    if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
                    {
                        //check or uncheck children at all levels
                        CheckUncheckChildren(parentTable.nextSibling, src.checked);
                    }
                }
                //check or uncheck parents at all levels
                CheckUncheckParents(src, src.checked);
            }
        }

        function CheckUncheckChildren(childContainer, check) {
            var childChkBoxes = childContainer.getElementsByTagName("input");
            var childChkBoxCount = childChkBoxes.length;
            for (var i = 0; i < childChkBoxCount; i++) {
                childChkBoxes[i].checked = check;
            }
        }

        function CheckUncheckParents(srcChild, check) {
            var parentDiv = GetParentByTagName("div", srcChild);
            var parentNodeTable = parentDiv.previousSibling;

            if (parentNodeTable) {
                var checkUncheckSwitch;

                if (check) //checkbox checked
                {
                    var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                    if (isAllSiblingsChecked)
                        checkUncheckSwitch = true;
                    else
                        return; //do not need to check parent if any(one or more) child not checked
                }
                else //checkbox unchecked
                {
                    checkUncheckSwitch = false;
                }

                var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
                if (inpElemsInParentTable.length > 0) {
                    var parentNodeChkBox = inpElemsInParentTable[0];
                    parentNodeChkBox.checked = checkUncheckSwitch;
                    //do the same recursively
                    CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
                }
            }
        }

        function AreAllSiblingsChecked(chkBox) {
            var parentDiv = GetParentByTagName("div", chkBox);
            var childCount = parentDiv.childNodes.length;
            for (var i = 0; i < childCount; i++) {
                if (parentDiv.childNodes[i].nodeType == 1) //check if the child node is an element node
                {
                    if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
                        var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
                        //if any of sibling nodes are not checked, return false
                        if (!prevChkBox.checked) {
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        //utility function to get the container of an element by tagname
        function GetParentByTagName(parentTagName, childElementObj) {
            var parent = childElementObj.parentNode;
            while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
                parent = parent.parentNode;
            }
            return parent;
        }


        function RestrictAllSpecialChars() {
            var k;
            k = event.keyCode;
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57))
                return true;
            else
                return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                    runat="server" HeaderText="Following errors occured while performing the action" ></asp:ValidationSummary>
                <asp:CustomValidator ForeColor="Red" Display="None" ID="cvCustInfo" runat="server"
                    ValidationGroup="vgOK" OnServerValidate="cvCustInfo_ServerValidate"></asp:CustomValidator>
    <div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <fieldset>
            <legend>Menu Access</legend>
            <table>
                <tr>
                    <td>
                        <span>UserID:</span>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="txtUserId" runat="server" AutoPostBack="true" OnTextChanged="txtUserId_TextChanged"
                            MaxLength="5"></asp:TextBox>--%>
                        <asp:TextBox ID="txtUserId" runat="server" AutoPostBack="true" OnTextChanged="txtUserId_TextChanged"
                            onkeypress="return RestrictAllSpecialChars();" CausesValidation="true" ValidationGroup="vgOK"></asp:TextBox>

                            <%--<asp:TextBox ID="txtUserId" runat="server" AutoPostBack="true" OnTextChanged="txtUserId_TextChanged" CausesValidation="true" ValidationGroup="vgOK"></asp:TextBox>--%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged"
                            Visible="false">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        User Name:
                    </td>
                    <td>
                        <b>
                            <asp:Label ID="lblUserName" runat="server"></asp:Label></b>
                    </td>
                    <td colspan="2">
                        Branch:
                    </td>
                    <td>
                        <b>
                            <asp:Label ID="lblBranch" runat="server"></asp:Label></b>
                    </td>
                    <td colspan="2">
                        Role:
                    </td>
                    <td>
                        <b>
                            <asp:Label ID="lblRole" runat="server"></asp:Label></b>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                            class="myButton" Width="60px" Height="25px" />
                    </td>
                    <td>
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton"
                            Width="60px" Height="25px" />
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="myButton"
                            Width="60px" Height="25px" />
                    </td>
                    <td>
                        <asp:Button ID="btnExtraPermission" runat="server" Text="Extra Permission" class="myButton"
                            Width="160px" Height="25px" OnClick="btnExtraPermission_Click" Visible="false" />
                    </td>
                </tr>
            </table>
            <br />
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel runat="server" ID="panelTrvAccess" ScrollBars="Vertical" Height="380px">
                <asp:TreeView ID="trvMenuAccess" ExpandDepth="0" PopulateNodesFromClient="true" ShowLines="true"
                    ShowExpandCollapse="true" runat="server" ShowCheckBoxes="All" onclick="OnTreeClick(event)">
                </asp:TreeView>
            </asp:Panel>
            <asp:HiddenField ID="hdn_User_Code" runat="server" />
        </fieldset>
    </div>
    </asp:Content>
