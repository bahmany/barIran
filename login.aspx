<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>

    <br />
<br />
    
    <center>
    <table>
        <tr>
            <td>
                   <br />
                   <br />
                   
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                </telerik:RadAjaxManager>
                   
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
             
             <div>
                 <asp:Panel ID="pnl_btns" runat="server">
                 
                     <table>
                         <tr>
                             <td>
                                 <img alt="" src="images/SodooreBarname.jpg" 
                                     style="width: 128px; height: 128px" /></td>
                             <td>
                                 <img alt="" src="images/Gozareshat.jpg" style="width: 118px; height: 140px" /></td>
                             <td>
                                 <img alt="" src="images/AddNew.jpg" style="width: 128px; height: 128px" /></td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                     Text="صدور بارنامه" Width="136px" />
                             </td>
                             <td>
                                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="گزارشات" 
                                     Width="136px" />
                             </td>
                             <td>
                                 <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                                     Text="ورود اطلاعات" Width="136px" />
                             </td>
                         </tr>
                     </table>
                 
                 
                     <table>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                 &nbsp;</td>
                         </tr>
                     </table>
                 
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
             <br />
             </asp:Panel>
             </div>
             <div>
                 <asp:Panel ID="pnl_login" runat="server" Visible="False">
               
                 <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" 
                     BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
                     FailureText="لطفا مجددا سعی کنید" Font-Names="tahoma" Font-Size="11pt" 
                     ForeColor="#333333" LoginButtonText="ورود" onauthenticate="Login1_Authenticate" 
                     PasswordLabelText="رمز عبور :" 
                     PasswordRequiredErrorMessage="رمز عبور را وارد نمایید" 
                     RememberMeText="مرا بخاطر بسپار" TitleText="ورود به سیستم" 
                     UserNameLabelText="نام کاربری : " 
                     UserNameRequiredErrorMessage="نام کاربری را وارد نمایید" Width="268px" 
                         RememberMeSet="True">
                     <CheckBoxStyle Font-Names="Tahoma" Font-Size="10pt" />
                     <TextBoxStyle Font-Size="0.8em" Width="150px" />
                     <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                         BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                     <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                     <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" 
                         ForeColor="White" />
                 </asp:Login>
                     <br />
                     <br />
                    <asp:Button ID="Button5" runat="server" Height="20px" onclick="Button4_Click" 
                                                    Text="برگشت " Width="97px" />
               </asp:Panel>
             </div>
             
                                            <br />
                                            <asp:Panel ID="pnl_back" runat="server" Visible="False">
                                                <asp:Label ID="Label1" runat="server" Text="به زودی فعال خواهد شد"></asp:Label>
                                                    <br />
                                                <asp:Button ID="Button4" runat="server" Height="20px" onclick="Button4_Click" 
                                                    Text="برگشت " Width="97px" />
                    </asp:Panel>
                                            <br />
                                            
                                       </telerik:RadAjaxPanel>        
                                            
                   &nbsp;</td>
        </tr>
        </table>
</center>

<br />
<br />
<br />
    
    
</asp:Content>

