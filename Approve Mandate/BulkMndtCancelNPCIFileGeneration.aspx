<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="NACH_Application.BulkMndtCancelNPCIFileGeneration, App_Web_bulkmndtcancelnpcifilegeneration.aspx.1f1b7ac7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">

        function cnfrmtym() {
            var getval = document.getElementById('MainContent_hiddCompareDates');
            var val = getval.value;
            if (val == "True") {
                alert('System Date and Login Date is incorrect, you are not able to generate the report.');
                return;
            }
            var getval1 = document.getElementById('MainContent_hiddNpciTime');
            var valNpciTime = getval1.value;
            if (valNpciTime == "True") {
                var result = confirm('Your NPCI Window Time has been Expired. Still You Want to Generate?');
                if (result == true) {
                }
                else {
                    return false;
                }
            }
        }
        //------for unlocking the batches on pageleave ----------
        // Register the event.
        window.onbeforeunload = function () {
            PageMethods.UnlockOnPageLeave();
        }
    </script>
    <style type="text/css">
        .pnl {
        }

        .lbl {
            text-align: right;
        }

        .Panel fieldset {
            border-color: Black;
            border-width: 1px;
        }

        .style2 {
            height: 24px;
        }

        .style5 {
            width: 50%;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="uptPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
            <table>
                <tr>
                    <td valign="top" class="style5">
                        <asp:Panel GroupingText="Upload Files" CssClass="Panel" runat="server" ID="pnl2">
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblUtilityNm" CssClass="lbl" Text="Utility Name :" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlUtilityCode" runat="server" AutoPostBack="true" Width="200px"
                                            OnSelectedIndexChanged="ddlUtilityCode_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2"></td>
                                    <td class="style2">
                                        <%-- <asp:CheckBox ID="chkSelectAll" Text="Select All" runat="server" AutoPostBack="True"
                                            OnCheckedChanged="chkSelectAll_CheckedChanged" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <%--  <td align="right" valign="top">
                                        <asp:Label ID="lblBatchFr" CssClass="lbl" Text="Batch From :" runat="server"></asp:Label>
                                    </td>--%>
                                    <%--<td valign="top" height="190px">
                                        <asp:CheckBoxList ID="chkBatch" runat="server" RepeatLayout="Flow" Height="192px">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>--%>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="style5" valign="top">
                        <table>

                            <tr>
                                <td>
                                    <asp:Panel GroupingText="NPCI Details" CssClass="Panel" runat="server" ID="Panel1">
                                        <div style="padding: 5px; width: 400px">

                                            <div>
                                                <asp:RadioButtonList ID="rbtNPCI" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtNPCI_SelectedIndexChanged">
                                                    <asp:ListItem Text="NPCI User" Value="NPCI" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Bank User" Value="Bank"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>

                                            <div>
                                                <span>
                                                    <asp:Label ID="lblNPCILoginId" Width="95px" CssClass="lbl" runat="server" Text="NPCI Login Id:"></asp:Label></span><span
                                                        style="padding-left: 3px"><asp:TextBox ID="txtNPCILoginId" Width="277px" runat="server"></asp:TextBox></span>
                                            </div>
                                            <div style="margin-top: 5px">
                                                <span>
                                                    <asp:Label ID="lblUtilityName" CssClass="lbl" Width="95px" runat="server" Text="Utility Name:"></asp:Label></span><span
                                                        style="padding-left: 3px"><asp:TextBox ID="txtUtilityName" Width="277px" runat="server"
                                                            ReadOnly="true"></asp:TextBox></span>
                                            </div>
                                            <div style="margin-top: 5px">
                                                <span>
                                                    <asp:Label ID="lblNPCIUserCode" CssClass="lbl" Width="95px" runat="server" Text="NPCI UserCode:"></asp:Label></span><span
                                                        style="padding-left: 3px"><asp:TextBox ID="txtNPCIUserCode" Width="277px" runat="server"
                                                            ReadOnly="true"></asp:TextBox></span>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel2" runat="server" Style="margin-top: 10px; border-color: Black;"
                                        BorderStyle="Solid" BorderWidth="1px">
                                        <div style="margin: 5px; margin-left: 0px; margin-bottom: 10px">
                                            <div>
                                                <span style="margin-left: 115px">
                                                    <asp:Label ID="Label3" Style="text-align: center" runat="server" Width="112px" Text="Sucessfull"></asp:Label></span>
                                                <span>
                                                    <asp:Label ID="Label4" Style="text-align: center" runat="server" Width="112px" Text="Rejected"></asp:Label></span>
                                            </div>
                                            <div style="margin-top: 5px">
                                                <span>
                                                    <asp:Label ID="Label1" runat="server" CssClass="lbl" Width="112px" Text="Create Mandate:"></asp:Label></span>
                                                <span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtSucCreate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span><span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtRejCreate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span>
                                            </div>
                                            <div style="margin-top: 5px">
                                                <span>
                                                    <asp:Label ID="Label2" runat="server" CssClass="lbl" Width="112px" Text="Modify Mandate:"></asp:Label></span>
                                                <span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtSucUpdate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span><span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtRejUpdate" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span>
                                            </div>
                                            <div style="margin-top: 5px">
                                                <span>
                                                    <asp:Label ID="Label13" runat="server" CssClass="lbl" Width="112px" Text="Cancel Mandate:"></asp:Label></span>
                                                <span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtSucCancel" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span><span style="padding-left: 3px">
                                                    <asp:TextBox ID="txtRejCancel" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                                </span>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblNofFiles" Width="112px" CssClass="lbl" runat="server" Text="No of Files"></asp:Label></span><span
                                        style="padding-left: 3px">
                                        <asp:TextBox ID="txtFiles" Width="107px" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <span>
                            <asp:Button ID="btnProcess" runat="server" CausesValidation="true" OnClick="btnProcess_Click"
                                OnClientClick="return cnfrmtym();" Text="Process" ValidationGroup="vgProcess" />
                            <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" />
                            
                    </td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <asp:Label ID="lblFlName" runat="server" Style="margin-bottom: 0px" Width="100%"></asp:Label>
                    </td>
                </tr>

                <%-- <!-- [Start] Ajax Loading -->
    <div id="divProgress" style="display: none;">
        <div class="action-progress" style="font-weight:bold;">
            Processing your request. Please wait....
        </div>
    </div>
    <div id="divMain" class="UnFreezePage">
    </div>
    <!-- [End] Ajax Loading -->--%>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="display: none">
        <asp:HiddenField ID="hiddCompareDates" runat="server" Value="" />
        <asp:HiddenField ID="hiddNpciTime" runat="server" Value="" />
    </div>
</asp:Content>
