<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_main_part.ascx.cs" Inherits="ascx_frm_main_part" %>
<style type="text/css">
    .style1
    {
        height: 30px;
    }
</style>
<div dir="rtl">

    <table>
        <tr>
            <td>
                نام</td>
            <td>
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                توضیحات</td>
            <td>
                <asp:TextBox ID="txt_exp" runat="server" Height="158px" TextMode="MultiLine" 
                    Width="264px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                </td>
            <td class="style1">
                <asp:Button ID="btn_post" runat="server" Text="ثبت" Width="107px" />
            </td>
            <td class="style1">
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
<div>

    <asp:GridView ID="gr_tbl_main_all" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="mp_id" 
        DataSourceID="ods_tbl_main" GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="mp_id" HeaderText="کد رایانه" InsertVisible="False" 
                ReadOnly="True" SortExpression="mp_id" />
            <asp:BoundField DataField="mp_name" HeaderText="نام" SortExpression="mp_name" />
            <asp:BoundField DataField="mp_exp" HeaderText="توضیحات" 
                SortExpression="mp_exp" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ods_tbl_main" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="MainDataModuleTableAdapters.tbl_main_partTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_mp_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="mp_name" Type="String" />
            <asp:Parameter Name="mp_exp" Type="String" />
            <asp:Parameter Name="upds" Type="Int32" />
            <asp:Parameter Name="Original_mp_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="mp_name" Type="String" />
            <asp:Parameter Name="mp_exp" Type="String" />
            <asp:Parameter Name="upds" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>

</div>