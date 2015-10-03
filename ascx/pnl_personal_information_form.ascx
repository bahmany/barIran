<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pnl_personal_information_form.ascx.cs" Inherits="ascx_pnl_personal_information_form" %>
<%@ Register assembly="ShamsiDateValidator" namespace="Softcam" tagprefix="cc1" %>
<%@ Register assembly="PersianDateValidator" namespace="BehooControls" tagprefix="cc2" %>

<div style="font-family: tahoma; font-size: 12px; width: 670px" dir="rtl">
<div>

    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="vertical-align: bottom">
                <img alt="" src="./images/AddNewInformationIDentification.jpg" 
                     />&nbsp;
                    </td>
        </tr>
        </table>
    </div>
        <div class="DataEntryPanels" >
        
            <table>
                <tr>
                    <td>
                           <table>
        <tr>
            <td colspan="7">
                &nbsp;&nbsp;
                <cc2:PersianDateValidator ID="PersianDateValidator1" runat="server" 
                    AcceptWithoutZero="False" ControlToValidate="txt_birthDate" 
                    ErrorMessage="لطفا تاریخ شمسی را صحیح وارد نمایید" FirstWhat="FirstYear">
                </cc2:PersianDateValidator>
                                       </td>
        </tr>
        <tr>
            <td>
                نام *</td>
            <td>
                نام خانوادگی *</td>
            <td>
                نام پدر *</td>
            <td>
                تاریخ تولد *-   روز/ ماه /سال</td>
            <td>
                محل تولد *</td>
            <td>
                محل صدور&nbsp; *</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txt_name" runat="server" Width="85px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_family" runat="server" Width="85px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_fathername" runat="server" Width="85px"></asp:TextBox>
            </td>
            <td dir="ltr">
                <asp:TextBox ID="txt_birthDate" runat="server" Width="116px" dir="ltr"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_birth_place" runat="server" Width="85px" MaxLength="30"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txt_registration_place" runat="server" Width="85px" 
                    MaxLength="30"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table>
                <tr>
                    <td>
                        کد ملی *</td>
                    <td>
                                                شماره شناسنامه *</td>
                    <td>
                        شماره سریال شناسنامه&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                                                کد 10 رقمی تامین اجتماعی</td>
                    <td>
                جنسیت</td>
                    <td rowspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                <asp:TextBox ID="txt_international_code" runat="server" Width="85px"></asp:TextBox>
                    </td>
                    <td>
                <asp:TextBox ID="txt_shsh" runat="server" Width="85px" Height="22px" MaxLength="12"></asp:TextBox>
                    </td>
                    <td>
                        <table bgcolor="#DCDCBA">
                                <tr>
                                    <td rowspan="2" 
                                        style="margin-right: 80px; text-align: center; vertical-align: middle;">
                                        <asp:TextBox ID="txt_oh_serial_1" runat="server" Width="65px" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_txt_oh_serial_2" runat="server" Width="35px" 
                                            DataSourceID="ods_alphabetList" DataTextField="ash_char" 
                                            DataValueField="ash_id" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txt_oh_serial_3" runat="server" Width="35px" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    <td>
                <asp:TextBox ID="txt_insurance_Code" runat="server" Width="117px" MaxLength="10" ></asp:TextBox>
                    </td>
                    <td>
                <asp:DropDownList ID="drp_oh_sex" runat="server" Width="50px">
                    <asp:ListItem Selected="True" Value="1">مرد</asp:ListItem>
                    <asp:ListItem Value="2">زن</asp:ListItem>
                </asp:DropDownList>
                    </td>
                </tr>
            </table> 
      
      
                               <table>
                                   <tr>
                                       <td>
                                           تحصیلات</td>
                                       <td>
                                           رشته تحصیلی</td>
                                   </tr>
                                   <tr>
                                       <td>
                                                           <asp:DropDownList ID="drp_oh_link_to_education" runat="server" Width="150px" 
                    DataSourceID="ods_education" DataTextField="e_name" DataValueField="e_id">
                </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ods_alphabetList" runat="server" 
                                            DeleteMethod="Delete" InsertMethod="Insert" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="MainDataModuleTableAdapters.tbl_idcart_serial_alphabetsTableAdapter" 
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_ash_id" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ash_char" Type="String" />
                                                <asp:Parameter Name="Original_ash_id" Type="Int32" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ash_char" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                        
                                        
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
                <asp:TextBox ID="txt_oh_education_branch" runat="server" Width="105px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
      
      
      </td>
                    <td style="vertical-align: middle">
                        <asp:Image ID="img_pic_person" runat="server" 
                                ImageUrl="~/images/NullPersonPic.jpg" Visible="False" />
                            </td>
                </tr>
            </table>
        

    
    </div>

</div>
 <script type="text/javascript">
                                        <%Response.Write(GenerateNeededNullValidationJavaScripts()); %>
                                        
                                        </script>

<script type="text/javascript">
    $(function() {
        $("#<%Response.Write(txt_birthDate.ClientID);%>").mask("99/99/99");


        // Contents of textboxes will be selected when receiving focus.
        $("input[type=text]")
                .focus(function() {
                    $(this).select();
                });
    });
    
   
    
</script>

<script type="text/javascript">
    function chkEducation(elm) {
        var val = elm.options[elm.selectedIndex].value;
        if (parseInt(val) > 3) {
            document.aspnetForm.<%Response.Write(txt_oh_education_branch.ClientID);%>.disabled = false;
        } else {
        document.aspnetForm.<%Response.Write(txt_oh_education_branch.ClientID);%>.disabled = true;
        }
    }
    
    
    
    
    
    //document.getElementById("<%Response.Write(txt_oh_education_branch.ClientID);%>").selectedIndex = 5;
</script>

