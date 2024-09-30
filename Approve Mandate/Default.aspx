<%@ page language="C#" autoeventwireup="true" inherits="Approve_Mandate_Default, App_Web_default.aspx.1f1b7ac7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <%-- <script type="text/javascript">
    function openPDF() {
        var strMessage = '<%= abc%>';
        var a = strMessage;
        window.open('<%= abc%>', 'PDF');
        return true;
    }
</script>--%>
    <style type="text/css">
        .small {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="RepeaterImages" runat="server">
            <ItemTemplate>
                <asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' />
            </ItemTemplate>
        </asp:Repeater>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <td>
            <asp:Button ID="Button1" runat="server" Text="show" OnClick="Button1_Click"/>

        </td>

    </div>
        <div>
            <a href="display_pdf.aspx" target="_blank" >SHOW PDF FILE</a>
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
        </div>
        <asp:Image ID="Image1" CssClass="small" Width="881px" Height="440px" runat="server"
                                BorderWidth="1px" />
    </form>

</body>
</html>
