<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_one_employers.ascx.cs" Inherits="ascx_frm_one_employers" %>







            <asp:UpdatePanel ID="UpdatePanel1" runat="server" 
    UpdateMode="Conditional">
<ContentTemplate>

<div>

    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="vertical-align: bottom">
                <img alt="" src="images/Personell.jpg" 
                     />&nbsp;
                    </td>
        </tr>
        </table>
    </div>
        <div class="DataEntryPanels" >
        
            
        

    
    <table>
        <tr>
            <td>
                نوع پرسنل</td>
            <td>
                تعداد</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="oe_link_to_ones_employers_names" runat="server" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="oen_name" 
                    DataValueField="oen_id" Width="131px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:bariranConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_ones_employers_names]">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:TextBox ID="oe_amount" runat="server" Width="76px">0</asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1are" runat="server" onclick="Button1_Click" Text="+" 
                    Width="31px" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

                <asp:GridView ID="grv_employers" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" AutoGenerateColumns="False" 
    Width="100%">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ردیف" />
                        <asp:BoundField DataField="نوع پرسنل" HeaderText="نوع پرسنل" />
                        <asp:BoundField DataField="تعداد" HeaderText="تعداد" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="حذف" ToolTip='<%# Eval("id") %>' 
                                    onclick="Button2_Click" 
                                    OnClientClick="javascript:return confirm('آیا می خواهید اطلاعات مورد نظر را حذف نمایید ؟');"
                                    />
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
        
            
        

    
    </div>

</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="Button1are" EventName="Click" />

</Triggers>

</asp:UpdatePanel>







            