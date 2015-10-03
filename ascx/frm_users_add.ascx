<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_users_add.ascx.cs" Inherits="ascx_frm_UsersAdd" %>
<div dir="rtl">
<asp:Panel ID="pnl_registration_form" runat="server">
    <table>
        <tr>
            <td colspan="5" height="20">
                <asp:Label ID="Label17" runat="server" Font-Size="18px" 
                    Text="فرم ثبت نام"></asp:Label>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" class="_lbl" 
                Text="نام" />
                <span>*</span></td>
            <td >
                <asp:TextBox ID="TextBox6" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox6" CssClass="_lbl" ErrorMessage="نام را وارد کنید" 
                    ValidationGroup="rereyt"></asp:RequiredFieldValidator>
            </td>
            
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" class="_lbl" 
                Text="نام خانوادگی" />
                <span>*</span></td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox15" CssClass="_lbl" 
                    ErrorMessage="نام خانوادگی را وارد نمایید" ValidationGroup="rereyt"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" class="_lbl" 
                Text="نام شرکت" />
            </td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" class="_lbl" 
                Text="شماره تماس" />
            </td>
            <td>
                <asp:TextBox ID="TextBox17" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" class="_lbl" 
                Text="ایمیل" />
                <span>*</span></td>
            <td>
                <asp:TextBox ID="TextBox18" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox18" CssClass="_lbl" 
                    ErrorMessage="ایمیل را وارد نمایید" ValidationGroup="rereyt"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label11" runat="server" class="_lbl" 
                Text="نام کاربری" />
                <span>*</span></td>
            <td>
                <asp:TextBox ID="TextBox23" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox19" CssClass="_lbl" 
                    ErrorMessage="رمز عبور را وارد نمایید" ValidationGroup="rereyt"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" class="_lbl" 
                Text="رمز عبور" />
                <span>*</span></td>
            <td>
                <asp:TextBox ID="TextBox19" runat="server" CssClass="_txtbox" 
                TextMode="Password" Width="245px"></asp:TextBox>
                <span>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox18" CssClass="_lbl" 
                    ErrorMessage="تایید رمز عبور صحیح نمی باشد" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="rereyt"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox19" ControlToValidate="TextBox24" 
                    ErrorMessage="  Wrong Password !" ValidationGroup="rereyt"></asp:CompareValidator>
                </span>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" class="_lbl" 
                Text="تایید رمز عبود" />
                <span>*</span></td>
            <td>
                <asp:TextBox ID="TextBox24" runat="server" CssClass="_txtbox" 
                TextMode="Password" Width="245px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label7" runat="server" class="_lbl" 
                Text="حرفه" />
            </td>
            <td>
                <asp:TextBox ID="TextBox20" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" class="_lbl" 
                Text="نحوه آشنایی" />
            </td>
            <td >
                <asp:TextBox ID="TextBox21" runat="server" CssClass="_txtbox" Height="99px" 
                Width="284px" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" class="_lbl" 
                Text="سایر توضیحات" />
            </td>
            <td>
                <asp:TextBox ID="TextBox22" runat="server" CssClass="_txtbox" Width="245px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                <asp:Button ID="btn_registration_submit" runat="server" 
                Text="تایید" Width="100px" onclick="btn_registration_submit_Click1" />
                <br />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Panel>
</div>