<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.Utility, App_Web_utilitymaster.aspx.28963a75" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" language="javascript">
        function Confirm() {

            var retVal = confirm("Are you sure to save the changes?");
            if (retVal == true) {
                return true;
            } else {
                return false;
            }

        }
        function NumberOnly1() {
            var AsciiValue = event.keyCode;
            //if ((AsciiValue >= 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 46))
            if ((AsciiValue > 47 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 46))
                return true;
            else
                return false;
        }
        function EmailIdValidation() {
            var AsciiValue = event.keyCode;
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 64 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 8 || AsciiValue == 16) || (AsciiValue == 46) || (AsciiValue == 59))
                return true;
            else
                return false;
        }

        function NpciValidation() {
            var AsciiValue = event.keyCode;
            //if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue >= 48 && AsciiValue <= 57))
            if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 32) ) //add space ascii value on 20-07-2020 by rutuja
                return true;
            else
                return false; 
        }

        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if (emailField.value != "") {
                if (reg.test(emailField.value) == false) {
                    alert('Invalid Email Address');
                    return false;
                    emailField.value = "";
                }
            }

            return true;
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
    <style>
        .txt
        {
            padding: 1px; /* border-width: 1px;*/
            margin-bottom: 0px;
        }
        .txt:focus
        {
            padding: 1px;
            border-width: 1px;
            border-color: Black;
        }
        .style1
        {
            width: 150px;
        }
        .style2
        {
        }
        .style3
        {
            width: 150px;
            height: 25px;
        }
        .style4
        {
            height: 25px;
        }
        .breakword
        {
            width: 80px;
            word-wrap: break-word;
            word-break: break-all;
        }
        .breakword1
        {
            width: 50px;
            word-wrap: break-word;
            word-break: break-all;
        }
         .hiddencol
          {
            display: none;
          }
    </style>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgsave"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvSave" runat="server" Display="None" OnServerValidate="cvSave_ServerValidate"
                    ValidationGroup="vgsave"></asp:CustomValidator>
                <asp:Panel ID="Panel1" GroupingText="Utility Details" runat="server" Width="100%">
                    <div align="center">
                        <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
                        <table width="80%">
                            <tr>
                                <td align="right" class="style1" height="25">
                                    Client Name:
                                </td>
                                <td align="left" class="style2">
                                    <%--<asp:DropDownList ID="ddlClientName" runat="server" Width="250px" AutoPostBack="true"
                                                    CssClass="txt" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged">
                                                </asp:DropDownList>--%>
                                    <asp:TextBox ID="txtClientName" runat="server" Width="280px" ReadOnly="true"></asp:TextBox>
                                </td>
                                 <asp:RequiredFieldValidator ID="rfvClientName" runat="server" ForeColor="Red"
                                    Display="None" ErrorMessage="Client is required" ValidationGroup="vgsave"
                                    ControlToValidate="txtClientName"></asp:RequiredFieldValidator>
                                <td style="width: 150px" align="right" height="25">
                                    Transaction:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlTransaction" runat="server" Width="250px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlTransaction_SelectedIndexChanged" CssClass="txt">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px" align="right" height="25">
                                    Product:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlProduct" runat="server" Width="250px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" CssClass="txt">
                                    </asp:DropDownList>
                                    <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                    Display="None" ErrorMessage="Please Select Product" ValidationGroup="vgsave"
                                    ControlToValidate="ddlProduct"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 150px" align="right" height="25">
                                   <%-- Name of Utility/Biller:--%>
                                    Utility Type:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlUtilityType" runat="server">
                                        <asp:ListItem Text="<--Select-->" Value="<--Select-->"></asp:ListItem>
                                        <asp:ListItem Text="Corporate Customer" Value="C"></asp:ListItem>
                                        <asp:ListItem Text="Retail Customer" Value="R"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                    Display="None" ErrorMessage="Please Select Utility Type" ValidationGroup="vgsave"
                                    ControlToValidate="ddlUtilityType"></asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td style="width: 150px" align="right" height="25">
                                    Name of Utility/Biller:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtUtilityName" runat="server" CssClass="txt" Width="250px" MaxLength="40"
                                        onKeyPress="return NpciValidation()"></asp:TextBox>
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <asp:RequiredFieldValidator ID="rfvUtilityName" runat="server" ForeColor="Red" Display="None"
                                    ErrorMessage="Please Enter Name of Utility/Biller" ValidationGroup="vgsave" ControlToValidate="txtUtilityName"></asp:RequiredFieldValidator>
                                <td style="width: 150px" align="right" height="25">
                                    NPCI User No:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtUtilityCode" runat="server" CssClass="txt" Width="250px" MaxLength="18" onkeypress="return RestrictAllSpecialChars();"></asp:TextBox>
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <asp:RequiredFieldValidator ID="rfvUtilityCode" runat="server" ForeColor="Red" Display="None"
                                    ErrorMessage="Please Enter NCPI User No" ValidationGroup="vgsave" ControlToValidate="txtUtilityCode"></asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td style="width: 150px" align="right" height="25">
                                    NPCI User Name:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtNPCIUserName" runat="server" CssClass="txt" Width="250px" MaxLength="40"
                                        onKeyPress="return NpciValidation()"></asp:TextBox>
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                    Display="None" ErrorMessage="Please Enter NCPI User Name" ValidationGroup="vgsave"
                                    ControlToValidate="txtNPCIUserName"></asp:RequiredFieldValidator>
                                <td align="right" height="25" width="">
                                    Transaction Limit (Rs):
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtMaxAmount" runat="server" CssClass="txt" Width="250px" MaxLength="13" onkeypress="return NumberOnly1()"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px" align="right" height="25">
                                    Biller IFS Code:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtIFSCode" runat="server" CssClass="txt" Width="250px" MaxLength="11" onkeypress="return RestrictAllSpecialChars();"></asp:TextBox>
                                </td>
                                <%--<asp:RequiredFieldValidator ID="rfvIFSCode" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Enter IFS Code of Biller" ValidationGroup="vgsave" ControlToValidate="txtIFSCode"></asp:RequiredFieldValidator>--%>
                                <td style="width: 150px" align="right" height="25">
                                    Biller ACC Name:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtBillerAccName" runat="server" CssClass="txt" Width="250px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <%--<asp:RequiredFieldValidator ID="rfvBillerAccName" runat="server" ForeColor="Red"
                                                Display="None" ErrorMessage="Please Enter Account Name of Biller" ValidationGroup="vgsave"
                                                ControlToValidate="txtBillerAccName"></asp:RequiredFieldValidator>--%>
                            </tr>
                            <tr>
                                <td style="width: 150px" align="right" height="25">
                                    Biller ACC Number:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtAccNo" runat="server" CssClass="txt" Width="250px" MaxLength="15" onkeypress="return NumberOnly1()"></asp:TextBox>
                                </td>
                                <td style="width: 150px" align="right" height="25">
                                    Address:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtContact" runat="server" CssClass="txt" Width="250px" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <%--<asp:RequiredFieldValidator ID="rfvContact" runat="server" ForeColor="Red" Display="None"
                                                ErrorMessage="Please Enter Address" ValidationGroup="vgsave" ControlToValidate="txtContact"></asp:RequiredFieldValidator>--%>
                            </tr>
                            <tr>
                                <td align="right" class="style3">
                                    Email Id:
                                </td>
                                <td align="left" class="style4">
                                    <asp:TextBox ID="txtemailid" runat="server" CssClass="txt" Width="250px" TextMode="MultiLine"
                                        onblur="validateEmail(this);"></asp:TextBox>
                                    <%--onkeypress="return Validation();"
                                               onblur="EmailIdValidation();"
                                                <asp:RegularExpressionValidator ID="regEmailid" ControlToValidate="txtemailid" text="(Invalid email)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="Invalid E-Mail ID"></asp:RegularExpressionValidator>--%>
                                </td>
                                <td style="width: 150px" align="right" height="25">
                                    Status:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkStatus" Text="Active" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblUtilityType" Text="Utility Transaction Type:" runat="server"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlUtilityAccType" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="Savings Transaction" Value="S"></asp:ListItem>
                                        <asp:ListItem Text="Loans Transaction" Value="L"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 150px;" height="25" align="right">
                                    Legacy Utility:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkLegacy" runat="server" Text="Yes/No" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" height="25" style="text-align: center;">
                                    <asp:Button ID="btnSave" runat="server" CausesValidation="true" class="myButton"
                                        Height="25px" OnClick="btnSave_Click" Text="Save" ValidationGroup="vgsave" Width="60px" />
                                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="true" class="myButton"
                                        CssClass="myButton" Height="25px" OnClick="btnUpdate_Click" Text="Update"
                                        ValidationGroup="vgsave" Width="60px" />
                                    <asp:Button ID="btnDelete" runat="server" class="myButton" CssClass="myButton"
                                        OnClick="btnDelete_Click" ValidationGroup="vgsave" Text="Delete" Width="60px" />
                                    <asp:Button ID="btnclose" runat="server" class="myButton" Height="25px" OnClick="btnCancel_Click"
                                        Text="Cancel" Width="60px" />
                                    <asp:Button ID="btnExit" runat="server" class="myButton" Height="25px" OnClick="btnExit_Click"
                                        Text="Exit" Width="60px" />
                                </td>
                            </tr>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:Panel ID="PanelGridView" runat="server">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div style="padding: 5px; height: 100%; font-family: 'Verdana'; font-size: 10px;
                                            font-weight: normal; font-style: normal; color: #000000;" align="center">
                                            <asp:GridView ID="dgvData" runat="server" AutoGenerateColumns="false" CellPadding="4"
                                                AllowPaging="true" PageSize="5" OnSelectedIndexChanged="dgvData_SelectedIndexChanged"
                                                OnPageIndexChanging="dgvData_PageIndexChanging">
                                                <AlternatingRowStyle BackColor="White" Height="50px" Width="30px" />
                                                <Columns>
                                                    <%--<asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" Width="20px" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />                                                       
                                                        <ItemTemplate>                                                            
                                                            <asp:CheckBox ID="chkEmp" AutoPostBack="true" runat="server" OnCheckedChanged="chkEmp_CheckedChanged">
                                                            </asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="UTILITY_NAME" HeaderText="UTILITY NAME" ItemStyle-Width="30%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="UTILITY_CODE" HeaderText="UTILITY CODE" ItemStyle-Font-Size="Small"
                                                        ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="NPCI_USERNAME" HeaderText="NPCI USERNAME" ItemStyle-Font-Size="Small"
                                                        ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="MAX_AMOUNT" HeaderText="TRANSACTION LIMIT" ItemStyle-Width="12%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-CssClass="breakword1" />
                                                    <asp:BoundField DataField="UTILITY_BRANCHCODE" HeaderText="IFS CODE" ItemStyle-Width="6%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="ECS_ACNO" HeaderText="ACCOUNT NO" ItemStyle-Font-Size="Small"
                                                        ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="ACCOUNT_NAME" HeaderText="BILLER ACCNAME" ItemStyle-Width="12%"
                                                        ItemStyle-Font-Size="Small" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" ItemStyle-Font-Size="Small"
                                                        ItemStyle-CssClass="hiddencol;" ItemStyle-Height="20px" ItemStyle-Font-Bold="false" />
                                                    <asp:BoundField DataField="MAILID" HeaderText="EMAIL_ID" ItemStyle-Font-Size="Small"
                                                        ItemStyle-CssClass="hiddencol;" />
                                                       <%-- ItemStyle-CssClass="breakword" />--%>
                                                    <asp:BoundField DataField="LEGACY_UTILITY" HeaderText="LEGACY_UTILITY" ItemStyle-Font-Size="Small"
                                                        ItemStyle-CssClass="breakword" />
                                                     <asp:BoundField DataField="STATUS" HeaderText="STATUS" ItemStyle-Font-Size="Small"
                                                        ItemStyle-CssClass="breakword" />
                                                 
                                                    <asp:BoundField DataField="PRODUCT_CODE" HeaderText="Product" ItemStyle-Font-Size="Small" />
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton" runat="server" CausesValidation="false" CommandName="Select"
                                                                Font-Underline="true" Text="Select" Width="30px"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                        <div id="Div1" style="display: none" runat="server">
                                            <asp:Button ID="hiddDelete" runat="server" />
                                            <asp:Button ID="hiddClient" runat="server" OnClick="hiddClient_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
