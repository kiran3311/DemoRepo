<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register_Mandate_TempMoveFile, App_Web_tempmovefile.aspx.bf0ff4eb" %>
 <%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
     <asp:Panel ID="pnl" GroupingText="Upload Mandate Image/Data" CssClass="Panel" runat="server"  Width="100%">                 
                <div align="center">
                    <table width="80%">                                                    
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblMandate" Text="" runat="server">                    
                                </asp:Label>
                                </td>
                                 <td>
                                <asp:Label ID="lblOfRejected" Text="" runat="server"> </asp:Label>  
                                </td>                                                                             
                            <td align="left">
                                <div>
                                    <span style="margin-left: 100px">
                                        <asp:Label ID="lblBatch" Text="" runat="server">                    
                                        </asp:Label>
                                    </span><span style="margin-left: 150px">
                                        <asp:Label ID="lblBatchNos" Text="" runat="server">                    
                                        </asp:Label>
                                    </span>
                                
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="lblNoOfImages" Text="" runat="server">  
                                                      
                                </asp:Label>
                            </td>
                              
                            

                            <td align="center" class="style2">
                                <asp:Label ID="lblMsg" Text="Download log file:- " runat="server" Font-Bold="true"></asp:Label>
                                <asp:LinkButton ID="linkExcel" runat="server" OnClick="linkExcel_Click">Click to download</asp:LinkButton>
                              
                            </td>
                        </tr>
                        
                    </table>
                </div>

                <div id="Div1" style="display: none" runat="server">
                    <asp:TextBox ID="txtFilePath" runat="server">      
                    </asp:TextBox>
                </div>
 
     </asp:Panel>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .Panel fieldset
        {
            border-color: Black;
            border-width: 1px;
        }
        .style1
        {
            height: 28px;
        }
    </style>
</asp:Content> 
