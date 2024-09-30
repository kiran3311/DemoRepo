<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Master_CreateUser, App_Web_createuser.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/1.8.3jquery.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript" language="javascript">
        function GetSearch() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnsearch = document.getElementById('MainContent_hddnSrch');
                vbtnsearch.click();
            }
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

        function GetUserDetail() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnUserDetail = document.getElementById('MainContent_hiddnbtnUserDetail');
                vbtnUserDetail.click();
            }
        }

    </script>--%>
    <script type="text/javascript" language="javascript">
        //        function See() {
        //            alert('Sole id doesnot exists.')
        //        }

        function MoveNext(next_ctrl, _key) {
            if (_key == 13) {
                var _next = document.getElementById(next_ctrl);
                _next.focus();
                return false;
            }
        }
        function GetSearch() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnsearch = document.getElementById('MainContent_hddnSrch');
                vbtnsearch.click();
            }

        }
        function GetBranch() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnBranch = document.getElementById('MainContent_hiddnbtnBranch');
                vbtnBranch.click();
            }
        }
        function GetUserDetail() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnUserDetail = document.getElementById('MainContent_hiddnbtnUserDetail');
                vbtnUserDetail.click();
            }
        }
        function GetNewBranch() {
            if (document.activeElement.id != "MainContent_btnCancel" && document.activeElement.id != "MainContent_btnClose") {
                var vbtnUserDetail = document.getElementById('MainContent_hiddnbtnNewBranch');
                vbtnUserDetail.click();
            }
        }

        function NumberOnly() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }

        function UserId() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 8 || AsciiValue == 127))
                return true;
            else
                return false;
        }


        //$(document).ready(function () {
        //    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        //    function EndRequestHandler(sender, args) {
        //        $('.csssoleid').blur(function () {
        //            GetBranch();
        //        });

        //        $('.cssuserid').blur(function () {
        //            GetUserDetail();
        //        });
        //        $('.CsstxtSearch').blur(function () {
        //            GetSearch();
        //        });

        //    }

        //});


        //for backspace preventing causes postback
        function preventBackspace(e) {
            var evt = e || window.event;
            if (evt) {
                var keyCode = evt.charCode || evt.keyCode;
                if (keyCode === 8) {
                    if (evt.preventDefault) {
                        evt.preventDefault();
                    } else {
                        evt.returnValue = false;
                    }
                }
            }
        }
    </script>
    <%--<asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="left">
                        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                        <asp:Panel ID="pnl" GroupingText="User Details" runat="server" Width="100%">
                            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                                runat="server" HeaderText="Following errors occured while performing the action"
                                Display="None" />
                            <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" Display="None" ValidationGroup="vgOk"
                                OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table>
                                            <tr>
                                                <td align="right">
                                                    <asp:RadioButtonList ID="rbtList" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                                                        <asp:ListItem Selected="True" Text="Add" Value="Add"></asp:ListItem>
                                                        <asp:ListItem Text="Edit" Value="Edit"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                             <td align="left">
                                                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"
                                                        class="myButton" Width="60px" Height="25px" />
                                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="CsstxtSearch" onblur="GetSearch();"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnChangeSoleID" runat="server" OnClick="ChangeSoleID_Click" Text="Change SoleID" />
                                                </td>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblSoleId" Text="SoleId:" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtSoleId" onkeypress="return NumberOnly();" runat="server" MaxLength="4"
                                                            TabIndex="1"></asp:TextBox>
                                                        <asp:Label ID="lblBranchName" runat="server"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSoleId"
                                                            Text="*" Display="Dynamic" ErrorMessage="Please Enter SoleId" ForeColor="Red"
                                                            ValidationGroup="vgOk"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNewSoleId" runat="server" MaxLength="4" Width="50px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        User Id:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtUserId" runat="server" Width="150px" TabIndex="2"
                                                            onblur="GetUserDetail();"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserId"
                                                            Text="*" Display="Dynamic" ErrorMessage="Please Enter User Id" ForeColor="Red"
                                                            ValidationGroup="vgOk"></asp:RequiredFieldValidator>

                                                        <asp:TextBox ID="txt1" runat="server" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        User Name:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtName" runat="server" Width="150px" TabIndex="3"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtName"
                                                            Text="*" Display="Dynamic" ErrorMessage="Please Enter User Name" ForeColor="Red"
                                                            ValidationGroup="vgOk"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblPwd" runat="server" Text="Password:"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px" TabIndex="4"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegexNewPwd" runat="server" ControlToValidate="txtPwd"
                                                            Display="Dynamic" ErrorMessage="Password of Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                            ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&amp;])[A-Za-z\d$@$!%*#?&amp;]{8,}$"
                                                            ValidationGroup="g" />

                                                </td>
                                            </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Label ID="Label1" Text="(Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character)"
                                                            runat="server" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblcnfPwd" runat="server" Text="Confirm Password:"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtConfPwd" runat="server" TextMode="Password" Width="150px" TabIndex="5"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtConfPwd"
                                                            Display="Dynamic" ErrorMessage="Password of Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                            ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&amp;])[A-Za-z\d$@$!%*#?&amp;]{8,}$"
                                                            ValidationGroup="g" />
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passward Mismatch" 
                                                            ValidationGroup="g" ControlToValidate="txtConfPwd" ControlToCompare="txtPwd" ForeColor="Red"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        Role Id:
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddlRoleId" runat="server" Width="156px" TabIndex="6">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        Status:
                                                    </td>
                                                    <td align="left" class="style4">
                                                        <asp:RadioButton ID="chkActive" runat="server" Checked="true" GroupName="Active"
                                                            Text="Active" TabIndex="7" />
                                                        <asp:RadioButton ID="chkInactive" runat="server" GroupName="Active" Text="InActive"
                                                            TabIndex="8" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="center">
                                                        <asp:Button ID="btnOk" runat="server" CausesValidation="true" OnClick="btnOk_Click"
                                                            Text="OK" ValidationGroup="vgOk" class="myButton" Width="60px" Height="25px" />
                                                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                                                            class="myButton" Width="60px" Height="25px" />
                                                        <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" class="myButton"
                                                            Width="60px" Height="25px" />
                                                    </td>
                                                </tr>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div style="display: none">
                                <asp:Button ID="hddnSrch" runat="server" OnClick="hddnSrch_Click" />
                                <asp:Button ID="hiddnbtnBranch" runat="server" OnClick="hiddnbtnBranch_Click" />
                                <asp:Button ID="hiddnbtnUserDetail" runat="server" OnClick="hiddnbtnUserDetail_Click" />
                                <asp:Button ID="hiddnbtnNewBranch" runat="server" OnClick="hiddnbtnNewBranch_Click" />
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>--%>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                        <asp:Panel ID="pnl" GroupingText="User Details" runat="server" Width="100%">
                            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                                runat="server" HeaderText="Following errors occured while performing the action"
                                Display="None" />
                            <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" Display="None" ValidationGroup="vgOk"
                                OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table>
                                            <tr>
                                                <td align="right" style="width: 50%">
                                                    <asp:RadioButtonList ID="rbtList" runat="server" AutoPostBack="true" CellSpacing="20"
                                                        onkeydown="return MoveNext('MainContent_drpBranch',event.keyCode);" OnTextChanged="rbtList_TextChanged"
                                                        RepeatDirection="Horizontal" Style="margin-bottom: 0px" >
                                                        <asp:ListItem Selected="True" Text="Add" Value="Add"></asp:ListItem>
                                                        <asp:ListItem Text="Edit" Value="Edit"></asp:ListItem>
                                                    </asp:RadioButtonList> <%--OnSelectedIndexChanged="rbtList_SelectedIndexChanged"--%>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="CsstxtSearch" onchange ="GetSearch()" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnChangeSoleID" runat="server" OnClick="ChangeSoleID_Click" Text="Change SoleID" />
                                                </td>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblSoleId" Text="SoleId:" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtSoleId" onkeypress="return NumberOnly();" CssClass="csssoleid"
                                                            runat="server" onblur="GetBranch()" MaxLength="5"></asp:TextBox>
                                                        <asp:Label ID="lblBranchName" runat="server"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="rfvSoleId" runat="server" ControlToValidate="txtSoleId"
                                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNewSoleId" runat="server" onkeypress="return NumberOnly();" onblur="GetNewBranch()"
                                                            MaxLength="4" Width="50px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewSoleId"
                                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                                        <%--<asp:RangeValidator ID="rngvalidate" runat="server" MaximumValue="4" MinimumValue="4"
                                                            ControlToValidate="txtNewSoleId" Type="Integer" ValidationGroup="g1"
                                                            ErrorMessage = "Enter Only Numbers" Display="Dynamic" ></asp:RangeValidator>--%>
                                                        <%--<asp:RegularExpressionValidator ID="reg1" runat="server" ValidationExpression ="^[0-9]*$" ControlToValidate="txtNewSoleId" ValidationGroup="g1" ErrorMessage="*" ToolTip="Not Correct Format" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        User Id:
                                                    </td>
                                                    <td align="left" colspan="2">
                                                        <asp:TextBox ID="txtUserId" CssClass="cssuserid" runat="server" Width="150px" onchange = "GetUserDetail()"
                                                             MaxLength="8" onkeypress="return UserId();"></asp:TextBox> <%--onblur="GetUserDetail()"--%>
                                                        <%--   
                                                        <asp:DropDownList ID="ddlUserId" runat="server" AutoPostBack="true" onkeydown="return MoveNext('MainContent_txtName',event.keyCode);"
                                                            OnSelectedIndexChanged="ddlUserId_SelectedIndexChanged" Visible="false" Width="155px">
                                                        </asp:DropDownList>--%>
                                                        <asp:TextBox ID="txt1" runat="server" Enabled="false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserId"
                                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="rgv" runat="server" ControlToValidate="txtUserId"
                                                            ValidationExpression="^[a-z]{1,2}[0]{1}[0-9]{5}$" ValidationGroup="g1" ErrorMessage="*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        User Name:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtName" runat="server" onkeydown="return MoveNext('MainContent_txtPwd',event.keyCode);"
                                                            Width="150px"></asp:TextBox>
                                                        <%--<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="true" onkeydown="return MoveNext('MainContent_txtPwd',event.keyCode);"
                                                            OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged" Visible="false" Width="155px">
                                                        </asp:DropDownList>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblPwd" runat="server" Text="Password:"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtPwd" runat="server" onkeydown="return MoveNext('MainContent_txtConfPwd',event.keyCode);"
                                                            TextMode="Password" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPwd"
                                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegexNewPwd" runat="server" ControlToValidate="txtPwd"
                                                            Display="Dynamic" ErrorMessage="Password of Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                            ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&amp;])[A-Za-z\d$@$!%*#?&amp;]{8,}$"
                                                            ValidationGroup="g" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Label ID="Label1" Text="(Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character)"
                                                            runat="server" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblcnfPwd" runat="server" Text="Confirm Password:"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtConfPwd" runat="server" onkeydown="return MoveNext('MainContent_txtRoleID',event.keyCode);"
                                                            TextMode="Password" Width="150px">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvCnfmPassword" runat="server" ControlToValidate="txtConfPwd"
                                                            Display="Dynamic" ForeColor="Red" ValidationGroup="g">Enter Confirm Password</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        Role Id:
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtRoleID" runat="server" ReadOnly="true" Width="150px" onKeyDown="preventBackspace();"></asp:TextBox>
                                                        <asp:DropDownList ID="ddlRoleId" runat="server" ></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        Status:
                                                    </td>
                                                    <td align="left" class="style4">
                                                        <asp:RadioButton ID="chkActive" runat="server" GroupName="Active"
                                                            onkeydown="return MoveNext('MainContent_btnOk',event.keyCode);" Text="Active" />
                                                        <asp:RadioButton ID="chkInactive" runat="server" GroupName="Active" Text="InActive" />
                                                        <asp:RadioButton ID="chkForAuthorize" runat="server"  Checked="true" GroupName="Active" Text="ForAuthorize" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblRemarks" runat="server" Text="Remarks"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="150px" 
                                                            MaxLength="500"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: center;">
                                                        <asp:Button ID="btnOk" runat="server" CausesValidation="true" OnClick="btnOk_Click"
                                                            Text="OK" ValidationGroup="g" Width="80" />
                                                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                                                            Width="80" />
                                                        <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" Width="80" />
                                                    </td>
                                                </tr>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div style="display: none">
                                <asp:Button ID="hddnSrch" runat="server" OnClick="hddnSrch_Click" />
                                <asp:Button ID="hiddnbtnBranch" runat="server" OnClick="hiddnbtnBranch_Click" />
                                <asp:Button ID="hiddnbtnUserDetail" runat="server" OnClick="hiddnbtnUserDetail_Click" />
                                <asp:Button ID="hiddnbtnNewBranch" runat="server" OnClick="hiddnbtnNewBranch_Click" />
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
