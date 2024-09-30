<%@ page language="C#" autoeventwireup="true" inherits="Errors, App_Web_errors.aspx.cdcab7d2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
      <tr> 
       <td>
        <asp:Label ID="errorMsg" Text="An Error has occurred " runat="server" 
        Visible="False" ForeColor="Red"></asp:Label>
        </td>
      </tr>
      <tr>
      <td>
       An unexpected error occured in our website. The website administrator has been notified.  
      </td>
      </tr>
      <tr>
      <td>
        <a href="Home.aspx">
           Return to homepage 
         </a>
      </td>
      </tr>
    </table>
    </div>
    </form> 
</body>
</html>

