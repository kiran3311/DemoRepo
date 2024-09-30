<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_MenuAccessForRole, App_Web_menuaccessforrole.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
            //alert(0); 
            var childChkBoxes = childContainer.getElementsByTagName("input");
            var childChkBoxCount = childChkBoxes.length;
            for (var i = 0; i < childChkBoxCount; i++) {
                childChkBoxes[i].checked = check;
            }
        }

        function CheckUncheckParents(srcChild, check) {
            // alert(0);
            var parentDiv = GetParentByTagName("div", srcChild);
            var parentNodeTable = parentDiv.previousSibling;

            if (parentNodeTable) {
                var checkUncheckSwitch;

                if (check) //checkbox checked
                {
                    //alert(1);
                    var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);

                    if (isAllSiblingsChecked)
                        checkUncheckSwitch = true;
                    else
                        //alert(isAllSiblingsChecked);
                        return; //do not need to check parent if any(one or more) child not checked
                }
                else //checkbox unchecked
                {
                    // alert(2);
                    checkUncheckSwitch = false;
                }
                //alert(3);
                var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
                if (inpElemsInParentTable.length > 0) {
                    //alert(4);
                    var parentNodeChkBox = inpElemsInParentTable[0];
                    //alert(parentNodeChkBox);
                    parentNodeChkBox.checked = checkUncheckSwitch;
                    //do the same recursively
                    CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch); //30/11/2016
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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <fieldset>
            <legend>Menu Access for Role</legend>
            <table>
                <tr>
                    <td>
                        <span>Role :</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                            class="myButton" Width="60px" Height="25px" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton"
                            Width="60px" Height="25px" />
                    </td>
                </tr>
            </table>
            <br />
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <asp:Panel runat="server" ID="panelTrvAccess" ScrollBars="Vertical" Height="380px">
                <asp:TreeView ID="trvMenuAccess" ExpandDepth="0" PopulateNodesFromClient="true" ShowLines="true"
                    ShowExpandCollapse="true" onclick="OnTreeClick(event)" runat="server" ShowCheckBoxes="All" />
            </asp:Panel>
        </fieldset>
    </div>
</asp:Content>
