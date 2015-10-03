<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pnl_address_information_form.ascx.cs" Inherits="ascx_pnl_address_information_form" %>

     
<div style="font-family: tahoma; font-size: 12px; width: 670px" dir="rtl">
<div>

    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="vertical-align: bottom">
                <img alt="" src="images/Address.jpg" 
                     />&nbsp;
                    </td>
        </tr>
        </table>
    </div>
        <div class="DataEntryPanels" >
        
            
        

    
            <table>
                <tr>
                    <td>
                        کشور</td>
                    <td>
                        استان</td>
                    <td>
                        شهر *</td>
                    <td>
                        خیابان اصلی 1 *</td>
                    <td>
                        خیابان اصلی 2</td>
                    <td>
                        خیابان فرعی 1</td>
                    <td>
                        خیابان فرعی 2 </td>
                </tr>
                <tr>
                    <td>
                <asp:DropDownList ID="drp_oh_link_to_country" runat="server" 
                    AutoPostBack="True" DataSourceID="ObjectDataSource4" DataTextField="c_name" 
                    DataValueField="c_id" Width="70px" 
                            onselectedindexchanged="drp_oh_link_to_country_SelectedIndexChanged" >
                </asp:DropDownList>
                    </td>
                    <td>
                <asp:DropDownList ID="drp_oh_link_to_city" runat="server" 
                    DataSourceID="ods_cities" DataTextField="cc_name" DataValueField="cc_id" 
                    Width="85px">
                </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_city_city" runat="server" Width="68px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_street_main1" runat="server" Width="89px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_street_main2" runat="server" Width="89px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_street_other1" runat="server" Width="89px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_street_other2" runat="server" Width="89px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        
            
        

    
            <table>
                <tr>
                    <td>
                        پلاک
                    </td>
                    <td>
                        طبقه
                    </td>
                    <td>
                        واحد</td>
                    <td>
                        کد پستی *</td>
                    <td>
                        تلفن</td>
                    <td>
                        تلفن همراه</td>
                    <td class="style1">
                        فکس</td>
                    <td>
                        تلفن ضروری</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_oh_pelak" runat="server" Width="44px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_floor" runat="server" Width="44px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_unit" runat="server" Width="44px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_postal_code" runat="server" Width="86px" MaxLength="14"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_tel" runat="server" Width="86px" MaxLength="14"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_mob" runat="server" Width="86px" MaxLength="12"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="txt_oh_fax" runat="server" Width="86px" MaxLength="14"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_oh_tel_nec" runat="server" Width="86px" MaxLength="14"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        سایر توضیحات</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_oh_exp" runat="server" Width="590px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        
            
        

    
    </div>

</div>
                                        
                                        
                                        
                                        <script type="text/javascript">
                                        
                                        <%Response.Write(_GenerateNeededNullValidationJavaScripts()); %>
                                        
                                        </script>




                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_countryTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_c_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="c_name" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="c_link_to_main_part" Type="Int32" />
                        <asp:Parameter Name="Original_c_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="c_name" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="c_link_to_main_part" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ods_cities" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" 
                    TypeName="MainDataModuleTableAdapters.tbl_country_cityTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_cc_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cc_name" Type="String" />
                        <asp:Parameter Name="cc_link_to_country" Type="Int32" />
                        <asp:Parameter Name="cc_link_to_main_part" Type="Int32" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_cc_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drp_oh_link_to_country" 
                            Name="cc_link_to_country" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cc_id" Type="Int32" />
                        <asp:Parameter Name="cc_name" Type="String" />
                        <asp:Parameter Name="cc_link_to_country" Type="Int32" />
                        <asp:Parameter Name="cc_link_to_main_part" Type="Int32" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                





