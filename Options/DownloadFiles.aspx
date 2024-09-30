<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Options_DownloadFiles, App_Web_downloadfiles.aspx.d613b7e9" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ReloadPage() {

            window.location.reload();
        }
        function DeleteConfirmation(Obj) {
            //  var mRowNo;
            //var ObjValue = $(Obj).data('CommandArgument');

            var result = confirm("Are you sure you want to delete the file?");
            if (result == true) {
                // mRowNo = $("LinkButton").closest("tr")[0].rowIndex - 1;
                //  alert(mRowNo);
                var vbtnDelete = document.getElementById('MainContent_hiddDelete');

                vbtnDelete.click();

            }
            else {
                return false;
            } 

        }
    </script>
    <div>
        <%--        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </div>
    <%--  <!-- [Start] Ajax Loading -->
    <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
    </div>
    <div id="divMain" class="UnFreezePage">
    </div>
    <!-- [End] Ajax Loading -->--%>
    <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <center>
                <asp:Panel ID="pnlOpen" GroupingText="Download Files for NPCI " runat="server" Width="500px">
                    <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgOk"
                        runat="server" HeaderText="Following errors occured while performing the action" />
                    <asp:CustomValidator ForeColor="Red" ID="cvOk" runat="server" ValidationGroup="vgOk"
                        Display="None" OnServerValidate="cvOk_ServerValidate"></asp:CustomValidator>
                    <table>
                        <tr>
                            <td class="form-fld-lbl">
                                <b>Select Module:</b>
                            </td>
                            <td style="padding-right: 5px" class="form-fld-val">
                                <asp:DropDownList ID="ddlModule" Width="200px" runat="server" OnSelectedIndexChanged="ddlModule_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Text="<--Select-->" Selected="True" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Register Mandate" Value="Register_Mandate"></asp:ListItem>
                                    <asp:ListItem Text="Approve Mandate" Value="Approve_Mandate"></asp:ListItem>
                                    <%--<asp:ListItem Text="Request Payment" Value="Request Payment"></asp:ListItem>
                                    <asp:ListItem Text="Approve Payment" Value="Approve Payment"></asp:ListItem>
                                    <asp:ListItem Text="CECS File" Value="CECS File"></asp:ListItem>--%>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvBatchNo" runat="server" ForeColor="Red" Display="None"
                                    ErrorMessage="Please Select the Module" ValidationGroup="vgOk" ControlToValidate="ddlModule"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-fld-lbl">
                                <asp:Label ID="Label3" runat="server" Text="Settlement Date :"></asp:Label>
                            </td>
                            <td align="left" class="style2">
                                <asp:TextBox ID="txtSettltmentDt" Width="50%" runat="server"></asp:TextBox>
                                <asp:MaskedEditExtender ID="mskFromDate" TargetControlID="txtSettltmentDt" Mask="99/99/9999"
                                    MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                    MaskType="Date" InputDirection="LeftToRight" AcceptNegative="Left" DisplayMoney="None"
                                    ErrorTooltipEnabled="True" runat="server" />
                                <asp:ImageButton ID="ImageButton2" ImageUrl="~/calender.png" runat="server" />
                                <asp:CalendarExtender PopupButtonID="ImageButton2" Format="dd-MM-yyyy" runat="server"
                                    ID="CalendarExtender1" TargetControlID="txtSettltmentDt">
                                </asp:CalendarExtender>
                            </td>
                            <%--<td style="top;">
                                <asp:Button ID="Button1" runat="server" Width="60px" Text="OK" class="myButton" Height="20px"
                                    OnClick="btnOK_Click" />
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnOk" runat="server" Text="OK" OnClick="btnOk_Click" onkeydown="Open();"
                                    CausesValidation="true" ValidationGroup="vgOk" class="myButton" Width="60px"
                                    Height="25px" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" class="myButton"
                                    Width="60px" Height="25px" />
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="dgvData" CssClass="EU_DataTable" runat="server" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="dgvData_SelectedIndexChanged" AllowPaging="True" PageSize="5"
                                    OnPageIndexChanging="gvList_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File Name">
                                            <ItemTemplate>
                                                <asp:Label ID="FileNameText" runat="server" Text="<%# Container.DataItem%>">
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnDetails" runat="server" CausesValidation="False" CommandName="Select"
                                                    CommandArgument='<%# Container.DataItem %>' Text="Download File" OnClick="lnkBtnDetails_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--  07122017 --%>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="SndNPCI"
                                                    CommandArgument='<%# Container.DataItem %>' Text="Send NPCI" OnClick="lnkBtnSend_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <%--  07122017 --%>

                                    </Columns>
                                </asp:GridView>
                                <div id="Div1" style="display: none" runat="server">
                                    <asp:Button ID="hiddDelete" runat="server" OnClick="hiddDelete_Click" />
                                    <asp:HiddenField ID="hiddFileName" Value="" runat="server"></asp:HiddenField>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>