<%@ Control EnableViewState="false" Language="C#" AutoEventWireup="true" CodeFile="frm_one_add_utilities.ascx.cs" Inherits="ascx_frm_one_add_utilities" %>





<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div>

    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="vertical-align: bottom">
                <img alt="" src="images/EraaeKhadamat.jpg" 
                     />&nbsp;
                    </td>
        </tr>
        </table>
    </div>
   

    
    
     <div class="DataEntryPanels" >
        
            
        

    
    <table>
        <tr>
            <td>
                ازطریق</td>
            <td>
                &nbsp;</td>
            <td>
                مکان</td>
            <td>
                چه کسانی</td>
            <td>
                نوع</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="oub_name" DataValueField="oub_id" 
                    Width="105px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:bariranConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_ones_utilities_by]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="92px" Visible="False">0</asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="92px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="92px"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="105px">
                    <asp:ListItem Selected="True" Value="1">حقیقی</asp:ListItem>
                    <asp:ListItem Value="2">حقوقی</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="+" />
            </td>
        </tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" AutoGenerateColumns="False" 
    Width="90%" PageSize="5">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="از طریق" HeaderText="از طریق" />
                        <asp:BoundField DataField="مکان" HeaderText="مکان" />
                        <asp:BoundField DataField="چه کسانی" HeaderText="چه کسانی" />
                        <asp:BoundField DataField="نوع" HeaderText="نوع" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="حذف" ToolTip='<%# Eval("id") %>' 
                                    onclick="Button2_Click" OnClientClick="javascript:return confirm('آیا می خواهید اطلاعات مورد نظر را حذف نمایید ؟');"/>
                                &nbsp;
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        داده ای وارد نشده است
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
                <br />
        
            
        

    
    </div>
   
    </ContentTemplate>
</asp:UpdatePanel>





