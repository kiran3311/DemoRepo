<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="SetUp_UnlockBatch, App_Web_unlockbatch.aspx.4cd3357d" %>

<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <script src="../Scripts/Magnify/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Magnify/prefixfree.min.js" type="text/javascript"></script>
     <link href="../Styles/ProgressCtrl.css" rel="Stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <style>
        .form-fld-lbl, .form-fld-val {
            font-size:10px;
         }
    </style>
     <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary" ValidationGroup="vgUnlock"
                    runat="server" HeaderText="Following errors occured while performing the action" />
                <asp:CustomValidator ForeColor="Red" ID="cvUnlock" runat="server" Display="None" ValidationGroup="vgUnlock"
                    OnServerValidate="cvUnlock_ServerValidate"></asp:CustomValidator>
             <asp:Panel ID="pnl" GroupingText="Unlock Batch" runat="server"
                Width="100%">
            <div>
                <table width="100%">
                    <tr>
                        
                        <td width="50%" align="right">
                                            <asp:Label ID="lblBatch" runat="server" Text="Batch :"></asp:Label>
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:DropDownList ID="ddlBatch" runat="server" Width="200px" AutoPostBack="True"></asp:DropDownList>
                                       </td>
                    </tr>
                    <tr>
                        <td align="right" width="50%">
                                           
                            </td>
                        <td align="left" width="50%"> <asp:Button ID="btnUnlock" runat="server" Text="Unlock"
                                                class="myButton" Width="60px" Height="25px" ValidationGroup="vgUnlock" CausesValidation="true" OnClick="btnUnlock_Click"/>
                                            <asp:Button ID="btnClose" runat="server" Text="Close" class="myButton" Width="60px" Height="25px" OnClick="btnClose_Click"/>
                                        </td>
                    </tr>
                </table>
            </div>
                 </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
     <div id="divProgress" style="display: none;">
        <div class="action-progress">
            Processing your request. Please wait....
        </div>
         <div id="divMain" class="UnFreezePage">
    </div>
    <link href="../Scripts/AJAXTools.js" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="../Scripts/AJAXTools.js"></script>
    </div>
</asp:Content>

