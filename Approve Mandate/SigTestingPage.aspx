<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Approve_Mandate_SigTestingPage, App_Web_sigtestingpage.aspx.1f1b7ac7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
    </div>
   <table width="100%">
                <tr>
                    <td style="width: 100%">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">  <%-- UpdateMode="Conditional"--%>
                            <ContentTemplate>
                                <div align="left" style="border-style: none; font-family: Verdana;">
                                    <table style="margin-left: -4px; width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Panel3" runat="server" Enabled="true">
                                                        <%--<iframe id="imgFinacle" src="http://172.31.12.121:8888/ubibio/ubi.jsp" width="750px"
                                                            height="400px" runat="server" frameborder="1" name="search_iframe"></iframe>--%>
                                                        <iframe id="imgFinacle" width="0%" height="0px" runat="server" frameborder="1" name="search_iframe">                                                    
                                                        </iframe>
                                                        <div class="container" style="width:100%;">
                                                                <div class="row-fluid">
                                                                  <table style="width:100%;" border="1">
                                                                      <tr>
                                                                      <td colspan="2" rowspan="2" style="width: 50%;">
                                                                          <asp:Panel ID="Panel4" runat="server" Enabled="true">
                                                                              <asp:Image ID="Image1" CssClass="small" Width="100%" runat="server"  />
                                                                              </asp:Panel>
                                                                      </td>
                                                                          <td>
                                                                              <table cellspacing="10">
                                                                                  <tr>
                                                                                      <td valign="top" colspan="4"><h2>Account Service</h2></td>
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API Account No</td>
                                                                                       <td>
                                                                                           <asp:TextBox ID="txtAPIAccno" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox>
                                                                                       </td>
                                                                                       <td style="text-align:right" colspan="2">
                                                                                           <asp:Label ID="lblAPImsg" runat="server"></asp:Label></td>
                                                                               
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API CustID No</td>
                                                                                       <td><asp:TextBox ID="txtAPICustID" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>Acc Status</td>
                                                                                       <td><asp:TextBox ID="txtAccStatus" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API Cust Name</td>
                                                                                       <td><asp:TextBox ID="txtAPICustName" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>Acc Type</td>
                                                                                       <td><asp:TextBox ID="txtAccType" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API Request ID</td>
                                                                                       <td><asp:TextBox ID="txtAPIReqID" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>API Error</td>
                                                                                       <td><asp:TextBox ID="txtAPIErr" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API Error</td>
                                                                                       <td><asp:TextBox ID="txtAPIErrMsg" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>Status</td>
                                                                                       <td><asp:TextBox ID="txtStatus" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                  <tr>
                                                                                      <td>Effective Balance</td>
                                                                                       <td><asp:TextBox ID="txtEFCBAL" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       
                                                                                  </tr>
                                                                                  <tr>
                                                                                      <td colspan="4"><h2>Signature Service</h2></td>
                                                                                  </tr>
                                                                                  <tr>
                                                                                      <td>API Request ID</td>
                                                                                       <td><asp:TextBox ID="txtAPIReqID_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>API Error</td>
                                                                                       <td><asp:TextBox ID="txtAPIErr_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                   <tr>
                                                                                      <td>API Error</td>
                                                                                       <td><asp:TextBox ID="txtAPIErrMsg_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                       <td>Status</td>
                                                                                       <td><asp:TextBox ID="txtStatus_Sig" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:TextBox></td>
                                                                                  </tr>
                                                                                   <tr>

                                                                                      <td colspan="4"><asp:Button ID="btnAccAPI" Text="Account API" class="myButton" runat="server" OnClick="btnAccAPI_Click" /><asp:Button ID="btnReset" Text="Reset" class="myButton" runat="server" OnClick="btnReset_Click" /><asp:Button ID="btnSign_API" Text="Signature API" class="myButton" runat="server" Visible="false" /></td>
                                                                                  </tr>
                                                                         
                                                                              </table>
                                                                          </td>

                                                                      </tr>
                                                                       <tr>
                                                                                        <td style="border:1px solid red;height: 200px;">
                                                                                    
                                                                                                <asp:GridView ID="GridView2" runat="server" DataKeyNames="CustomerName" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" >
                                                                                                    <Columns>
                                                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                                                                                                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                                                                                                        <asp:BoundField DataField="IsExpired" HeaderText="IsExpired" />
                                                                                                        <asp:BoundField DataField="IsMandatory" HeaderText="IsMandatory" />
                                                                                                        <asp:BoundField DataField="PhotoIsMandatory" HeaderText="PhotoIsMandatory" />
                                                                                                        <asp:BoundField DataField="SignatureGroupName" HeaderText="Sign Group" />
                                                                                                        <asp:BoundField DataField="ReturnedSignature" HeaderText="ReturnedSignature" Visible="false" />
                                                                                                        <asp:TemplateField ShowHeader="False">
                                                                                                   
                                                                                                                <ItemTemplate>
                                                                                                                    <asp:Button Text="Select" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                                                                                                </ItemTemplate>
                                                                                                            </asp:TemplateField>
                                                                                                    </Columns>
                                                                                        

                                                                                            </asp:GridView></td>
                                                                                </tr>
                                                                  </table>
                                                                </div>
                                                              </div>
                                                    <span style="display: none">
                                                        <asp:GridView ID="GridView1" runat="server">
                                                        </asp:GridView>
                                                    </span>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <caption>
                </caption>
            </table>
</asp:Content>

