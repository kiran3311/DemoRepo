<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="SetUp_Test, App_Web_test.aspx.4cd3357d" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type ="text/javascript" src="../AutoComplete/jquery-ui.min.js"></script>
    <%--<script type="text/javascript" src="../AutoComplete/jquery.min.js"></script>--%>
    <link type="text/css" href="../../AutoComplete/jquery-ui.css" rel="stylesheet" />
    
    <script type="text/javascript">
     
        $(function () {
            SearchText();
           
        });
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Test.aspx/GetAutoCompleteData",
                        data: "{'username':'" + $('#txtSearch').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },


                select: function (event, ui) {
                    if (ui.item.val == -1) {
                        return false;
                    }
                    $('#lblUserId').text(ui.item.val);
                    //var textbox3 = document.getElementById("txtSearch").value;;
                    //alert(textbox3)
                }


            });
          
        }
      
        //function myfunction() {
        //    var first = document.getElementById("txtSearch").value;
      
        //    var answer = first;

        //    var textbox3 = document.getElementById('txtUserID');
        //    textbox3.innerText = answer;
        //    alert("y");
        //    alert(answer);
        //}
       
</script>
   <%-- <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            $("#txtUserID").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Test.aspx/GetUsrId",
                        data: "{'ursId':'" + document.getElementById('txtUserID').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }
    </script>--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

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
                                            <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                                        </td>
                                        <td align="left" class="style2">

                                            <%--  <asp:DropDownList ID="drpBranch" Style="padding: 2px" runat="server" Width="200px">--%>

                                            <asp:TextBox ID="txtUserID" runat="server" Width="200px" Style="padding: 2px" Visible="false" ></asp:TextBox>
                                            <input type="text" id="txtSearch" class="autosuggest" name="txtSearch" />
                                     
                                           <label id="lblUserId" />


                                            <asp:Button ID="btnSub" runat="server" Text="OK" OnClick="btnSub_Click" />
                                            <%--   <asp:Label ID="lblBranch" ForeColor="Red" Text="*" runat="server"></asp:Label>--%>
                                            <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="*" ForeColor="Red"
                                                Font-Bold="False" ControlToValidate="drpBranch">*</asp:RequiredFieldValidator>--%>
                                        </td>




                                    </tr>

                                    <tr>
                                        <td align="Right" class="style2" height="25">
                                            <asp:Label ID="Label3" runat="server" Text="Branch"></asp:Label>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtBranch" runat="server" Width="200px" Style="padding: 2px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="Right" class="style2" height="25">
                                            <asp:Label ID="Label6" runat="server" Text="User Name"></asp:Label>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtUserName" runat="server" Width="200px" Style="padding: 2px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" height="25">
                                            <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
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
                                            <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
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
                                        <td colspan="2" height="25">
                                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" height="25">
                                            <asp:Button ID="btnChange" runat="server" Style="margin-right: 1px" Text="Change"
                                                CausesValidation="true" ValidationGroup="vgOK" OnClick="btnChange_Click" />
                                            <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
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

