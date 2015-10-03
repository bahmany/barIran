<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_tashakol_add.ascx.cs" Inherits="ascx_frm_one_hoghoghi" %>
<div style=" padding: 10px; margin: 0px; background-color: #000000; color: #000000;">
<div style=" color: #FFFFFF; font-weight: bold;">
    ورود اطلاعات تشکل های صنفی</div>
<div style="border: 1px solid #CCCCCC; padding: 5px; margin: 0px; background-color: #FFFFFF;">

<div dir="rtl" style="background-color: #FFFFFF">

    <table>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="tdFormTitle" colspan="3">
                اطلاعات اصلی</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                نوع تشکل</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
                    <asp:ListItem>موسسه</asp:ListItem>
                    <asp:ListItem>با مسئولیت محدود</asp:ListItem>
                    <asp:ListItem>سهامی خاص</asp:ListItem>
                    <asp:ListItem>سهامی عام</asp:ListItem>
                    <asp:ListItem>تضامنی</asp:ListItem>
                </asp:DropDownList>
                        </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                شماره ثبت</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                تاریخ ثبت</td>
            <td>
                
                <asp:TextBox ID="TextBox23" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                سازمان ثبت کننده</td>
            <td>
                
                <asp:TextBox ID="TextBox49" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                محل فعالیت:</td>
            <td>
                
                <table>
                    <tr>
                        <td>
                            منطقه</td>
                        <td>
                <asp:TextBox ID="TextBox44" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            آدرس</td>
                        <td>
                <asp:TextBox ID="TextBox45" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            زمینه فعالیت</td>
                                    <td>
                <asp:TextBox ID="TextBox50" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        امکانات در اختیار</td>
                                    <td>
                <asp:TextBox ID="TextBox51" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="tdFormTitle" colspan="3">
                مشخصات مدیر عامل
                </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                نام خانوادگی</td>
            <td>
                <asp:TextBox ID="TextBox24" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                نام</td>
            <td>
                <asp:TextBox ID="TextBox25" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                شماره ملی</td>
            <td>
                <asp:TextBox ID="TextBox26" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                جنسیت</td>
            <td>
                <asp:DropDownList ID="drp_o_sex" runat="server" Width="150px" 
                    onselectedindexchanged="drp_o_sex_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="1">مرد</asp:ListItem>
                    <asp:ListItem Value="2">زن</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                تتحصیلات</td>
            <td>
                <asp:DropDownList ID="drp_o_link_to_education" runat="server" Width="150px" 
                    DataSourceID="ods_education" DataTextField="e_name" DataValueField="e_id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ods_education" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_educationsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_e_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="e_name" Type="String" />
                        <asp:Parameter Name="Original_e_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="e_name" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                
                رشته تحصیلی
                </td>
            <td>
                <asp:TextBox ID="TextBox29" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                سن</td>
            <td>
                <asp:TextBox ID="TextBox30" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                سوابق اجرایی</td>
            <td>
                <asp:TextBox ID="TextBox31" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="tdFormTitle" colspan="3">
                مشخصات اعضای هیئت مدیره</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="pnl_menagment_team" runat="server" BackColor="#E9E9D1">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            نام خانوادگی</td>
                                        <td>
                                            <asp:TextBox ID="TextBox32" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نام</td>
                                        <td>
                                            <asp:TextBox ID="TextBox33" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شماره ملی</td>
                                        <td>
                                            <asp:TextBox ID="TextBox34" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            جنسیت</td>
                                        <td>
                                            <asp:DropDownList ID="drp_o_sex0" runat="server" Width="150px">
                                                <asp:ListItem Selected="True" Value="1">مرد</asp:ListItem>
                                                <asp:ListItem Value="2">زن</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تحصیلات</td>
                                        <td>
                                            <asp:DropDownList ID="drp_o_link_to_education0" runat="server" 
                                                DataSourceID="ods_education" DataTextField="e_name" DataValueField="e_id" 
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            رشته تحصیلی</td>
                                        <td>
                                            <asp:TextBox ID="TextBox35" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            سن</td>
                                        <td>
                                            <asp:TextBox ID="TextBox36" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            سوابق اجرایی</td>
                                        <td>
                                            <asp:TextBox ID="TextBox37" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Button ID="Button4" runat="server" Text="اضافه سازی به لیست" 
                                                Width="149px" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button6" runat="server" Text="ثبت" Width="112px" />
                        </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

</div>
</div>
</div>