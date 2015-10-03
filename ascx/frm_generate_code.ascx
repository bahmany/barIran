<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_generate_code.ascx.cs" Inherits="ascx_frm_generate_code" %>
<div dir="rtl">

</div>


<asp:Panel ID="Panel1" runat="server">
</asp:Panel>
<div style=" padding: 10px; margin: 0px; background-color: #000000; color: #000000;">
    <div style=" color: #FFFFFF; font-weight: bold;">
        تولید کد</div>
    <div style="border: 1px solid #CCCCCC; padding: 5px; margin: 0px; background-color: #FFFFFF;">
        <div dir="rtl" style="background-color: #FFFFFF">
            <table>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="tdFormTitle" colspan="3">
                        تولید کد 12 رقمی </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        کد راننده</td>
                    <td>
                        <asp:TextBox ID="TextBox38" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        کد وسیله نقلیه</td>
                    <td>
                        <asp:TextBox ID="TextBox39" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        کد شرکت</td>
                    <td>
                        <asp:TextBox ID="TextBox40" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button7" runat="server" Text="تولید و ثبت" Width="116px" 
                            onclick="Button7_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        کد کارکنان</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        کد ناوگان</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button8" runat="server" Text="صدور کارت" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</div>
