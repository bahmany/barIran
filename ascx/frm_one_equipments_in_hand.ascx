<%@ Control Language="C#"  AutoEventWireup="true" CodeFile="frm_one_equipments_in_hand.ascx.cs" Inherits="ascx_frm_one_equipments_in_hand"  %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>

<div>

    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="vertical-align: bottom">
                <img alt="" src="images/Equipments.jpg" 
                     />&nbsp;
                    </td>
        </tr>
        </table>
    </div>
        <div class="DataEntryPanels" >
        
            
        

    
    <table>
        <tr>
            <td>
                نوع فعالیت</td>
            <td>
                نام</td>
            <td>
                تعداد</td>
            <td>
                متراژ</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="oe_link_to_ones_equipments_types" runat="server" 
                    AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="oen_name" 
                    DataValueField="oen_id" Width="131px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_ones_equipments_typesTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_oen_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="oen_name" Type="String" />
                        <asp:Parameter Name="oen_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_oen_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="oen_name" Type="String" />
                        <asp:Parameter Name="oen_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:DropDownList ID="oe_link_to_ones_equipments_names" runat="server" 
                    DataSourceID="ObjectDataSource2" DataTextField="oen_name" 
                    DataValueField="oen_id" Width="131px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_ones_equipments_namesTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_oen_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="oen_name" Type="String" />
                        <asp:Parameter Name="oen_exp" Type="String" />
                        <asp:Parameter Name="oen_link_to_equipment_types" Type="Int32" />
                        <asp:Parameter Name="Original_oen_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oe_link_to_ones_equipments_types" 
                            Name="oen_link_to_equipment_types" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="oen_name" Type="String" />
                        <asp:Parameter Name="oen_exp" Type="String" />
                        <asp:Parameter Name="oen_link_to_equipment_types" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:TextBox ID="oe_amount" runat="server" Width="76px" MaxLength="5">0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oe_meter" runat="server" Width="76px" MaxLength="10">0</asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="+" />
            </td>
        </tr>
        </table>

                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" AutoGenerateColumns="False" 
    Width="100%">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ردیف" />
                        <asp:BoundField DataField="نوع فعالیت" HeaderText="نوع فعالیت" />
                        <asp:BoundField DataField="نام" HeaderText="نام" />
                        <asp:BoundField DataField="تعداد" HeaderText="تعداد" />
                        <asp:BoundField DataField="متراژ" HeaderText="متراژ" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" ToolTip='<%# Eval("id") %>' 
                                    onclick="LinkButton1_Click" OnClientClick="javascript:return confirm('آیا می خواهید اطلاعات مورد نظر را حذف نمایید ؟');">حذف</asp:LinkButton>
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
</asp:UpdatePanel>





                
            