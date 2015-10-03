﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_one_observers.ascx.cs" Inherits="ascx_frm_one_managers" %>


<%@ Register assembly="PersianDateValidator" namespace="BehooControls" tagprefix="cc1" %>


بازرسان&nbsp;
    <cc1:PersianDateValidator ID="PersianDateValidator1" runat="server" 
        AcceptWithoutZero="False" ControlToValidate="ohom_date_birth" 
        FirstWhat="FirstYear">
        لطفا تاریخ را صحیح وارد نمایید</cc1:PersianDateValidator>
    &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>



<div  class="DataEntryPanels">

<div>

                        <table>
                            <tr>
                                <td>
                                    نام خانوادگی</td>
                                <td>
                                    نام</td>
                                <td>
                                    کد ملی</td>
                                <td>
                                    جنسیت</td>
                                <td>
                                    تحصیلات</td>
                                <td>
                                    رشته تحصیلی</td>
                                <td>
                                    تاریخ تولد</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="ohom_family" runat="server" Width="87px" MaxLength="35"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="ohom_name" runat="server" Width="78px" MaxLength="40"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="ohom_international_code" runat="server" Width="69px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ohom_sex" runat="server" Width="50px">
                                        <asp:ListItem Selected="True" Value="1">مرد</asp:ListItem>
                                        <asp:ListItem Value="2">زن</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ohom_link_to_education" runat="server" 
                                        DataSourceID="ObjectDataSource1" DataTextField="e_name" DataValueField="e_id" 
                                        Width="100px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="ohom_branch" runat="server" Width="73px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td dir="ltr">
                                    <asp:TextBox ID="ohom_date_birth" runat="server" Width="73px"></asp:TextBox>
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
                                    تلفن همراه</td>
                                <td>
                                    نواع انتصاب</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="ohom_mobile" runat="server" Width="80px" MaxLength="11"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ohom_type_nasb" runat="server" Width="100px">
                                        <asp:ListItem Value="1">اصلی</asp:ListItem>
                                        <asp:ListItem Value="2">علی البدل</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="+" 
                                        Width="30px" />
                                </td>
                                <td colspan="3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
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


<div dir="rtl">

    <table width="100%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" 
                        GridLines="Vertical" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="نام خانوادگی" HeaderText="نام خانوادگی" />
                            <asp:BoundField DataField="نام" HeaderText="نام" />
                            <asp:BoundField DataField="شماره ملی" HeaderText="شماره ملی" />
                            <asp:BoundField DataField="نوع نصب" HeaderText="نوع نصب" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip='<%# Eval("id") %>' 
                                        onclick="LinkButton1_Click"
                                        OnClientClick="javascript:return confirm('آیا می خواهید اطلاعات مورد نظر را حذف نمایید ؟');"
                                        >حذف</asp:LinkButton>
                                    &nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                    <tr>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
    </table>

</div>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                                    DeleteMethod="Delete" InsertMethod="Insert" 
                                                    
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
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
</div>



    
  
    </ContentTemplate>
</asp:UpdatePanel>
