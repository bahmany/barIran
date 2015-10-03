<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%; text-align: center;">
        <tr>
            <td>
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <img alt="" src="images/FaaleHalonaghli.jpg" 
                    style="width: 186px; height: 212px" /></td>
            <td>
                <img alt="" src="images/Ranandeh.jpg" style="width: 186px; height: 212px" /></td>
            <td>
                <img alt="" src="images/Khodro.jpg" style="width: 186px; height: 212px" /></td>
        </tr>
        <tr>
            <td style="text-align: right">
             <br />
             <ul>
             <li><a href="frm_haghighi.aspx">ورود اطلاعات فعال حقیقی</a></li>
             <li><a href="frm_hoghoghi.aspx">ورود اطلاعات فعال حقوقی</a></li>
            
             </ul>
             
             </td>
            <td style="text-align: right">
          
                        <table style="width: 170px">
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    کد&nbsp; شرکت</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="115px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                              
                              
                                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید و ورود اطلاعات</asp:LinkButton>
                              
                              
                                    </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    
  
  

                </td>
            <td style="text-align: right">
                          
                        <table style="width: 137px">
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    کد&nbsp; شرکت</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="115px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">تائید و ورود اطلاعات</asp:LinkButton>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
               
  
  

             </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

