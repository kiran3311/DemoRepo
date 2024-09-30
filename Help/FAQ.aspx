<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Help_FAQ, App_Web_faq.aspx.87a0902e" %>
<%@ Register TagPrefix="uc" TagName="ErrorCtrll" Src="~/Control/ErrorCtrll.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript">

        $(function () {

            $("#faq").accordion();

        });

    </script>
    <div id="faq" runat="server">
    </div>
    <uc:ErrorCtrll ID="ucErrorCtrll" runat="server" />
    <div>
        <asp:Repeater ID="RepSample" runat="server">
            <HeaderTemplate>
                <table cellpadding="1" cellspacing="1" width="100%" style="font-family: Verdana;
                    border: 1px solid #C0C0C0; border-color: Blue">
                    <tr bgcolor="#99ccff">
                        <%--<tr bgcolor="#FF781E">--%>
                        <th>
                            SR NO
                        </th>
                        <th>
                            QUESTION
                        </th>
                        <th>
                            ANSWER
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.FAQNO")%>
                    </td>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.QUESTION")%>
                    </td>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.ANSWER")%>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.FAQNO")%>
                    </td>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.QUESTION")%>
                    </td>
                    <td style="border: 1px solid #C0C0C0; margin: 0px auto;">
                        <%#DataBinder.Eval(Container, "DataItem.ANSWER")%>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <%--<h3> 1. What is NACH?</h3>                      
      
      <div>

    <p>

    The National Payments Corporation of India (NPCI) offers to banks, financial institutions, Corporates and <br />
    Government/s a service termed as “National Automated Clearing House (NACH)”which includes both Debit and <br />
    Credit. It shall be referred to as NACH. NACH (Debit) & NACH (Credit) aims at facilitating interbank high <br />
    volume, low value debit/credit transactions, which are repetitive in nature, electronically <br />
    using the NPCI service.

    </p>
                    
    </div> 
  
   <h3> 2. What is NACH-DR? </h3>                      
      
   <div>

    <p>

    NACH-DR is to provide a better & efficient Mandate based debit services to the banks. <br />

    Unique features of NACH Dr. <br />
The following are the key features of the NACH Debit: <br />
•	Automated processing and exchange of mandate information electronically with well-defined timelines for acknowledgement/confirmation.<br />
•	Each mandate needs to be accepted/authorized by the debtor bank before the User can initiate a transaction <br />
•	Each mandate is uniquely identified by Unique Mandate Reference Number (UMRN) which makes tracking of multiple mandate details easier for customers.  <br />
•	Enable the usage of standardized Mandate Forms. <br />
•	Mandate repository containing Mandate details to be maintained for the purpose of validating mandate UMRN available on the NACH transaction files, at the time of NACH transaction processing. <br />
•	MMS would allow processing of debtor and creditor initiated mandates. <br />
•	MMS would allow processing of e-mandates as well as paper mandates, where e-mandates would consist of onlydata file upload while paper mandates would consist of mandate image and Data file uploads. E-mandates can be initiated only by a debtor bank.<br />
•	Bank can leverage on the existing CTS instrument scanning infrastructure for scanning and maintaining repository of the mandates images. <br />

    </p>
  </div>      
    <h3> 3. What are the benefits of NACH-DR to Banks?</h3>                      
      
  <div>

    <p>
   
Benefits of NACH-DR are as follows: <br />
•	Standardization and digitization of mandates allowing complete audit trail of the Mandate lifecycle. <br />
•	Simplification of the mandate acceptance and recording process <br />
•	Cost Efficiency <br />
•	Unique identifier number allocated to each mandate (UMRN – Unique Mandate Reference Number)


    </p>
                    
    </div>    
    <h3>4. Which are the various fields to be captured on the Mandate form?</h3>                      
      
  <div>

    <p>   
Please refer Annexure 1
    </p>
                    
    </div>  
     <h3>5. Which are the Mandatory fields to be captured on the Mandate form?</h3>                      
      
  <div>

    <p>   
All fields are mandatory except- Field No. 13 which is Consumer Reference Number, <br />
Field No. 14 which is Scheme/ Plan reference Number <br />
Field No. 20, 21 & 22 (Telephone, Mobile & Mail-ID) – Any one of these 3 field is mandatory. <br />
Field No. 19 which is Customer Additional Identification. <br />

    </p>
     </div>    
      <h3>6. What is Mandate Management System?</h3>                      
      
  <div>

    <p>   
Mandate Management System is an image-based, multi-institution, multi-location, web-basedsystem for undertaking end-to-end operations for mandate-based, repetitive direct credit or direct debittransactions. <br />

Mandate Management System facilitates the process of Mandate Creation, Mandate Amendment,and Mandate Cancellation and offers all MIS related to the Mandate.<br />
Mandate Creation      –      Creation of a new mandate in favor of the User Institution.<br />
Mandate Amendment-for amendment of any of the variables of an existing Mandate, which is Active. UMRN needs to be quoted for Amendment.<br />
Mandate Cancellation –for cancellation of an Active mandate. –UMRN is required to be quoted <br />
The file based method for creation of a mandate is particularly for supporting the banks automated process of initiating more than one mandate at a time.<br />
    </p>               
    </div> 
 <h3>7. What is the size of the Mandate? Is it mandatory to restrict mandate to the size?</h3>                      
      
  <div>

    <p>   
The mandate has to be in the size of a standard cheque.It is mandatory to restrict the mandate to the size mentioned above.
    </p>               
    </div> 
    <h3>8. What should be the size and format of the scanned mandate?</h3>                      
      
  <div>
    <p>   
Given below is the specification of the scanned mandate. <br />
FrontImage  <br />
•	The Image should be in black & white. <br />
•	The Image should be in TIFF Format <br />
•	DPI for the Image is 200 <br />
Front Grayscale Image <br />
•	The Image should be in grayscale <br />
•	The image should be in JPEG Format <br />
•	DPI for the Image should be 100 <br />
The size of a single image should not exceed 100 Kb. <br />
The sample of the scanned copies is in Appendix. 2.

    </p>               
    </div> 
  <h3>9. How many mandates can a bank upload at a time?</h3>                      
      
  <div>
    <p>   
The bank can upload any number of mandates to the MMS system, provided a single image file doesn’t <br /> 
exceed 100 Kb and a single zip file with multiple image and data files doesn’t exceed 10 Mb. <br />
The utility allows the bank to upload multiple zip files.
    </p>               
    </div>
     <h3>10. Who can initiate a Mandate?</h3>                      
      
  <div>
    <p>   
The Mandate Creation/Amendment/Cancellation request can be initiated by both, the Creditor Bank or the Debtor Bank. <br />
In the case where the Mandate is initiated by the Creditor Bank, a scanned copy of the physical mandate along with the data file will have to be submitted for Acceptance of the Debtor bank. <br />
In the case where the Mandate is initiated by the Debtor Bank, the scanned copy of the physical mandate may not accompany the data file when submitted for acceptance of the Creditor Bank. <br />

    </p>               
    </div>
     <h3>11. What are the steps involved in initiating a mandate through Sponsor Bank via Corporates / Service Provider?</h3>                      
      
  <div>
    <p>
     <img id="Img2" src="Images/Mandate_Initiation_SpncrBnk.png" runat="server" />  
     <br />    
Step 1 <br />
The Corporates / Service Providers that holds an account with Sponsor Bank send an application to the sponsor Bank for getting Utility Code, which would allow them to participate in the NACH process. <br />

Step 2 <br />
A customer who has purchased or subscribedthe service from corporate/service provider and desires to pay through a mandate arrangement would fill up NACH mandate form provided by the corporate and sign it for authorizing debit to his bank account. Customer will hand over duly filled up mandate form to corporate/service provider, who in turn would submit the same to the sponsor bank. <br />

Step 3 <br />
The sponsor bank will capture the Destination Bank IFSC / MICR details & other mandatory mandate transaction details and send it to NPCI.<br />
Step 4 <br />
The mandate image and the related mandate transaction data will be routed to the concerned destination banks over the MMS system within the timelines stated by NPCI. <br />

Step 5 <br />
The Destination Bank will validate the transaction date and the details given on the image of mandate. It will send the mandate verification and acceptance confirmation message to sponsor bank via NPCI, and updates records at its end. <br />
Step 6 <br />
The Sponsor bank sends mandate information update with UMRN to corporate for their record updates to ensure the NACH transaction file carry the UMRN reference against the transactions sent for processing in future.Once a mandate is uploaded, Corporate can view the same, since access has been enabled to them directly by NPCI.<br />

    </p>               
    </div>
    <h3>12. What are the steps involved in the Process of customer initiating mandate request through Destination Bank?</h3>                      
      
  <div>
    <p> 
    <img id="Img1" src="Images/Customer_MandateReq_Steps.png" runat="server" /> 
    <br />  
Step 1 <br />
The end customer that holds an account with Destination Bank sends the mandate initiation request through Internet/ IVR/ Paper (Mandate form) to the Destination bank. <br />

Step 2 <br />
Destination bank receives the mandate request along with the mandate data and sends the mandate information over the MMS. (E-mandate) <br />
Step 3 <br />
The mandate transaction data will be routed to the concerned sponsor banks with UMRN generated by NACH system<br />

Step 4 <br />
Sponsor bank updates its record and forward it to corporate/ service provider.  <br />

Step 5 <br />
Corporate /service provider updates its record and sends the confirmation to Sponsor bank. <br />

Step 6 <br />
Sponsor bank sends the confirmation to NPCI. <br />

Step 7 <br />
NPCI routes the confirmation toward the Destination bank. <br />

Step 8 <br />
 Upon receiving the confirmation from Sponsor bank/ Corporate via NPCI MMS the destination banks provides update to its customer on the status of the mandate<br />

    </p>               
    </div>
 <h3>13. When is a UMRN generated/assigned to the mandate?</h3>                      
      
  <div>
    <p>   
The UMRN is generated immediately after the initiating bank/party creates the mandate using a GUI or the xml file upload. <br />
The ACK/NACK file generated immediately after mandate submission will reflect the UMRN.
    </p>               
    </div>
    <h3>14. Can the Destination bank view and approve/reject all inward mandates using the GUI?</h3>                      
      
  <div>
    <p>   
Yes. The NPCI GUI allows the Destination bank to view and approve/reject all mandated, irrespective of <br />
the fact that the mandate has been created by the Sponsor bank using the GUI or an xml file upload.
    </p>               
    </div>
     <h3>15. Does the bank need to encrypt the mandate files being uploaded to MMS? Does the bank need to decrypt the INW mandate received for acceptance?</h3>                      
      
  <div>
    <p>   
Yes. Standard encrypt/decrypt process followed by NACH.
    </p>               
    </div>
     <h3>16. Can, banks send multiple mandates Create / Amendment / Cancel zip files to NPCI throughout the day?</h3>                      
      
  <div>
    <p>   
Yes, Banks can send multiple separate mandates create/amend/cancel files to NPCI throughout a day.
    </p>               
    </div>
     <h3>17. Who will be responsible for managing the physical mandates?</h3>                      
      
  <div>
    <p>   
It will be responsibility on the sponsor bank to retain a physical copy of the mandate for the <br />
period as per RBI guidelines. Sponsor bank should also ensure that the image copy and mandate <br />
transaction date to be retained as per RBI guidelines.
    </p>               
    </div>
     <h3>18. What is the time available to the instructed agentto accept the mandate?</h3>                      
      
  <div>
    <p>   
The instructed agent will have to accept/reject the mandate within 3 business days of the generation of <br />
inward file. In the event of the destination bank not processing a response for the mandates, the same <br />
would be considered as deemed rejected.  
    </p>               
    </div>
     <h3>19. What does Reject Reason Code mean?</h3>                      
      
  <div>
    <p>   
Reject Reason Codes are the codes defined by NPCI. The instructed agent while rejecting a mandate will <br /> 
assign one of these codes as a reason for rejecting the mandate.  
    </p>               
    </div>
       <h3>20. What are the Session Timings for MMS?</h3>                      
      
  <div>
    <p>   
   Session Timings for Mandates are as follows:. <br />
 <img id="MMS_SessionTM" src="Images/MMS_SessionTimings.png" runat="server" /> 
    </p>               

    </div>
    <h3>21. What is a ‘User Number’? Can a single corporate have two or more user numbers?</h3>                      
      
  <div>
    <p>   
It is the ID issued to a corporate that is linked to the Sponsor bank. The corporate will have to get a new <br />
User number if it changes its bank or will have to maintain multiple user number if it is transacting with <br />
more than one bank.  
    </p>               
    </div>
    <h3>22.Does NPCI validates the User Number?</h3>                      
      
  <div>
    <p>   
 Yes, User number is being validated during the transaction leg and NPCI will reject the transaction, <br />
 without sending it to destination bank, in case of incorrect User number. Scenarios in which User  <br />
 number will be considered invalid is as follows:
    </p>               
    </div>
    <h3>23.Does NPCI validates the User Number?</h3>                      
      
  <div>
    <p>   
 Yes, User number is being validated during the transaction leg and NPCI will reject the transaction, <br />
 without sending it to destination bank, in case of incorrect User number. Scenarios in which User <br />
 number will be considered invalid is as follows: <br /> 

 >	If the user number mentioned in the transaction file does not match with the one that was mentioned in the mandate. <br />
 >	If the user number does not exist. <br />
 >	If the user number does not match with the User Name.

    </p>               
    </div>
     <h3>24. What is the logic followed for generation of User Number?</h3>                      
      
  <div>
    <p>   
User number will be generated by NACH. Logic is Bank’s short code followed by running sequence number.

    </p>               
    </div>
     <h3>25. Is the User Number unique to the Corporate or is it linked to the Sponsor Bank?</h3>                      
      
  <div>
    <p>   
User number is unique across the system. If a corporate has a tie up with two banks he will have 2 user numbers.

    </p>               
    </div>
     <h3>26. What do you mean by “Utility Code”?</h3>                      
      
  <div>
    <p>   
Utility Code/ Corporate User IDrefer to the User Number that has been allocated by NPCI, to the Corporates.

    </p>               
    </div>
      <h3>27. What are the fields that can’t be amended?</h3>                      
      
  <div>
    <p>   
    The fields that can’t be amended are: <br />
a.)	UMRN <br />
b.)	Payment Type <br />
c.)	Debtor Bank Name <br />
d.)	Debtor Bank ID <br />
e.)	Name of Debtor Account Holder

    </p>               
    </div>
       <h3>Annexure 1 – Description of Mandate fields.</h3>                      
      
  <div>
    <p>   
1.	UMRN- UMRN is a Unique Mandate Reference number allocated to each new mandate created <br />
    in NACH Debit. It is auto generated by the NACH system during mandate creation. UMRN is <br />
    mandatory for every transaction and even during mandate amendment and cancellation. <br />
2.	DATE- The date on which the mandate was initiated. It should be in the following format: DD/MM/YYYY <br />
3.	SPONSOR BANK CODE- Sponsor Bank IFSC/MICR code. <br />
4.	UTILITY CODE- It is the User Number allocated to the Utility/Biller/Bank entity/Aggregator.<br />
5.	NAME OF UTILITY/BILLER/BANK/COMPANY- It is the name of the service provider.<br />
6.	ACTION- Action that the customer want to take i.e. Create/Amend/ Cancel.<br />
7.	A/c Type- It is the type of account held by the Payer against which the mandate is being issued (For e.g. Savings, Current, CC, Others)<br />
8.	LEGAL ACCOUNT NO. – Payer’s bank account number. <br />
9.	Name of the Destination Bank with Branch: Name of the Payer’s Bank and its Branch Name<br />
10.	IFSC/MICR Code- IFSC/MICR Code of Payer’s bank. <br />
11.	Maximum amount per transaction that could be processed, in words.<br />
12.	Amount in figures, similar to the amount mentioned in words.. <br />
13.	CONSUMER REFERENCE NUMBER- It is the reference number that has been allotted to the Payer by the User institution (Utility/Biller/Bank entity).<br />
14.	SCHEME/ PLAN REFERENCE NUMBER- Scheme/Plan reference number under which the Payer is authorizing the User institution to debit his/her account.<br />
15.	FREQUENCY- It refers to the frequency of transactions.<br />
16.	PERIOD- Validity of mandate with dates in DD/MM/YYYY format.<br />
17.	Names of customer/s and signatures as well as seal of company (where required). <br />
18.	Undertaking by customer – The User institution can define the undertaking, in context of the mandate.<br />
19.	Customer Additional Identification- Permanent ID of customer. E.g. PAN/Aadhaar No. <br />
20.	Telephone number with STD Code, of Payer. <br />
21.	10 digit mobile number of Payer. <br />
22.	Mail ID of Payer. <br />
    </p>               
    </div>
      <h3>ANNEXURE 2. Mandate image</h3>    --%>
    <%--<div>
    <p>   
    <img id="MndtImg1" src="Images/FAQ_MandateImg1.png" runat="server" /> 
    <img id="MndtImg2" src="Images/FAQ_MandateImg2.png" runat="server" />
    </p>               
    </div>--%>
</asp:Content>

