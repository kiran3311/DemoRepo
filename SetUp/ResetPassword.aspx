<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="ResetPassword, App_Web_resetpassword.aspx.4cd3357d" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .style1 {
            height: 30px;
        }

        .style2 {
            height: 26px;
        }

        .txt {
            padding: 2px;
            /*border-width: 1px;*/ /* border-color:Black; */
        }

            .txt:focus {
                padding: 2px;
                border-width: 1px;
                border-color: Black;
            }
    </style>
    <script src="../Scripts/jquery-1.4.1.min.js"></script>
<%--     <link rel="stylesheet" href="Style/chosen.css" />  <%--Added by rutuja for auto complete dropdown on23/07/2020

    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>

     <script src="Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select").chosen(); $(".chzn-select").chosen(); $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: false });

		</script>--%>


<%--    <script src="ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



    <link href="../Select2/select2.css" rel="stylesheet">
    <script src="../Select2/select2.js"></script>

    <script type="text/jscript">
        $(document).ready(function () { $("#drpUserID").select2(); });
    </script>
    --%>
        

   <%-- <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=txtNew]');
            var $ddl = $('select[id$=drpUserID]');
            var $items = $('select[id$=drpUserID] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found</option>");
                }
            }

            function countItemsFound(num) {
                $("#para").empty();
                if ($txt.val().length) {
                    $("#para").html(num + " items found");
                }

            }
        });
    </script>--%>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOK"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" Display="None" ValidationGroup="vgOK"
                    OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                <asp:Panel ID="pnl" GroupingText="Password Reset" runat="server" Width="100%">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <table width="60%">
                                    <tr>
                                        <td align="right" class="style2" height="25">
                                            <asp:Label ID="Label3" runat="server" Text="Branch :"></asp:Label>
                                        </td>
                                        <td align="left" class="style2">
                                            <div class="side-by-side clearfix">
                                                <asp:DropDownList ID="drpBranch" Style="padding: 2px" runat="server" OnSelectedIndexChanged="drpBranch_SelectedIndexChanged"
                                                    Width="200px" AutoPostBack="True" class="chzn-select">
                                                </asp:DropDownList>
                                                <asp:Label ID="lblBranch" ForeColor="Red" Text="*" runat="server"></asp:Label>
                                                <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="*" ForeColor="Red"
                                                Font-Bold="False" ControlToValidate="drpBranch">*</asp:RequiredFieldValidator>--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style2" height="25">

                                            <asp:Label ID="Label2" runat="server" Text="User ID :"></asp:Label>
                                        </td>

                                        <td align="left" style="font-weight: 700" class="style2">

                                            <asp:TextBox ID="txtuserid" runat="server" Width="198px" AutoComplete ="off"></asp:TextBox>

                                            <asp:DropDownList ID="drpUserID" Style="padding: 2px" runat="server" Width="200px">
                                                <%--EnableIncrementalSearch="true" CaseSensitiveSearch="true" comment by rutuja--%>
                                            </asp:DropDownList>
                                            <%-- <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="*" ForeColor="Red"
                                                Font-Bold="False" ControlToValidate="drpUserID">*</asp:RequiredFieldValidator>--%>
                                            
                                           <%-- &nbsp;<asp:TextBox ID="txtuserid" runat="server" Width="198px" Style="display: none"></asp:TextBox>--%>

                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnsearch_uid" runat="server" Text="Search" Style="display: none" ValidationGroup="vgOK" OnClick="btnsearch_uid_Click" class="myButton" Width="70px" Height="25px" />
                                            <br />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" height="25">

                                            <asp:Label ID="Label1" runat="server" Text="New Password :"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700">
                                            <asp:TextBox ID="txtNewPwd" Style="padding: 2px" runat="server" TextMode="Password"
                                                Width="195px"></asp:TextBox>
                                            <asp:Label ID="lblNewPwd" ForeColor="Red" Font-Bold="true" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ErrorMessage="Select New Password"
                                                ForeColor="Red" Font-Bold="False" ControlToValidate="txtNewPwd">*</asp:RequiredFieldValidator>--%>
                                            <asp:RegularExpressionValidator ID="RegexNewPwd" runat="server" ValidationGroup="vgOK"
                                                ControlToValidate="txtNewPwd" Display="None" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                                                ErrorMessage="Password of Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"
                                                ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td align="left">
                                            <asp:Label ID="Label5" Text="(Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character)"
                                                runat="server" ForeColor="Red" Font-Size="XX-Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style1" height="25">
                                            <asp:Label ID="Label4" runat="server" Text="Confirm Password :"></asp:Label>
                                        </td>
                                        <td align="left" style="font-weight: 700" class="style1">
                                            <asp:TextBox ID="txtCpwd" Style="padding: 2px" runat="server" TextMode="Password"
                                                Width="195px"></asp:TextBox>
                                            <asp:Label ID="lblConfirmPwd" ForeColor="Red" Text="*" runat="server"></asp:Label>
                                            <%-- <asp:RequiredFieldValidator ID="rfvCnfrmPwd" runat="server" ErrorMessage="Confirm Password"
                                               ForeColor="Red" Font-Bold="False" ControlToValidate="txtCpwd" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblComment" Text="Reset Comment" runat="server"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtComment" runat="server" Width="195px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="25">
                                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td align="left" colspan="2" height="25">
                                            <asp:Button ID="btnChange" runat="server" Style="margin-right: 1px" Text="Change"
                                                CausesValidation="true" ValidationGroup="vgOK" OnClick="btnChange_Click" class="myButton" Width="70px" Height="25px" />
                                            <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton" Width="60px" Height="25px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
