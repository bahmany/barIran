<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_start_adding.ascx.cs" Inherits="ascx_frm_start_adding" %>



<div dir="rtl">








            


    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="200px" 
        Width="300px" HorizontalAlign="NotSet" 
        LoadingPanelID="ralp_plz_wait_add_new_grid">



    <table>
        <tr>
            <td class="tdAddNew">
                &nbsp;</td>
            <td>
                &nbsp;<telerik:RadAjaxLoadingPanel ID="ralp_plz_wait_add_new_grid" runat="server" 
                    Height="75px" Width="75px">
                    <img alt="Loading..." 
                        src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' 
                        style="border: 0px;" />
                </telerik:RadAjaxLoadingPanel>
&nbsp;<table>
                    <tr>
                        <td>
                            &nbsp;&nbsp; نوع فعالیت&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:DropDownList ID="drp_select_add_type" runat="server" AutoPostBack="True" 
                                DataSourceID="ods_select_add_type" DataTextField="des_name" 
                                DataValueField="des_id" 
                                onselectedindexchanged="drp_select_add_type_SelectedIndexChanged" Width="154px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                &nbsp;
                <asp:ObjectDataSource ID="ods_select_add_type" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_data_entry_stepsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_des_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="des_name" Type="String" />
                        <asp:Parameter Name="des_link_to_main_part" Type="Int32" />
                        <asp:Parameter Name="des_shown_priority" Type="Int32" />
                        <asp:Parameter Name="Original_des_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="des_link_to_main_part" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="des_name" Type="String" />
                        <asp:Parameter Name="des_link_to_main_part" Type="Int32" />
                        <asp:Parameter Name="des_shown_priority" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td rowspan="2">
                <asp:DataList ID="dl_select_from_drp" runat="server" 
                    DataSourceID="ods_selected_maps">
                    <ItemTemplate>
                        <table>
                            <tr style="vertical-align: middle">
                                <td>
                                    *</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("desc_name") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <div style="text-align: left">
                
                    <asp:Button ID="btn_start_add_new" runat="server" 
                        onclick="btn_start_add_new_Click" Text="شروع ورود اطلاعات" Width="155px" />
                
                </div>
                <asp:ObjectDataSource ID="ods_selected_maps" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                    TypeName="MainDataModuleTableAdapters.tbl_data_entry_steps_childTableAdapter" 
                    UpdateMethod="Update" onselected="ods_selected_maps_Selected">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_desc_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="desc_name" Type="String" />
                        <asp:Parameter Name="desc_link_to_modules" Type="Int32" />
                        <asp:Parameter Name="desc_link_to_data_entry_steps" Type="Int32" />
                        <asp:Parameter Name="desc_priority" Type="Int32" />
                        <asp:Parameter Name="Original_desc_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drp_select_add_type" DefaultValue="1" 
                            Name="desc_link_to_data_entry_steps" PropertyName="SelectedValue" 
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="desc_name" Type="String" />
                        <asp:Parameter Name="desc_link_to_modules" Type="Int32" />
                        <asp:Parameter Name="desc_link_to_data_entry_steps" Type="Int32" />
                        <asp:Parameter Name="desc_priority" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

<div>

    <br />


    <br />


    <br />
    <telerik:RadWindow ID="RadWindow2" runat="server">
    </telerik:RadWindow>
    <br />
    <br />

</div>
        
    </telerik:RadAjaxPanel>
    <input id="Button1" type="button" value="button" onclick="OpenWindow();" />

           


<script type="text/javascript">
 function OpenWindow()
        {
            var wnd = window.radopen("http://www.google.com", null);
            wnd.setSize(400, 400);
            return false;
        }            

</script>




    <telerik:RadWindow ID="RadWindow1" runat="server" Behavior="Default" 
        InitialBehavior="None" Left="" NavigateUrl="" style="display: none;" Top="">
    </telerik:RadWindow>




</div>