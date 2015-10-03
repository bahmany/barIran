<%@ Page Title="" Language="C#" EnableViewStateMac="false" EnableViewState="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_cars.aspx.cs" Inherits="frm_cars" %>

<%@ Register src="ascx/pnl_personal_information_form.ascx" tagname="pnl_personal_information_form" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style4
    {
        font-size: x-large;
    }
    .style2
    {
        color: #FF3300;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script type="text/javascript">
                    function ChkInterID(str) {
                    
                   
                    
                    
                        var http = false;
                        var resp = "";
                        if (navigator.appName == "Microsoft Internet Explorer") {
                            http = new ActiveXObject("Microsoft.XMLHTTP");
                        } else {
                            http = new XMLHttpRequest();
                        }
                        http.open("GET", "Handler.ashx?vin=" +
                        document.getElementById(
                        "<%Response.Write(get_txt_c_VIN());%>").value
                        );
                        
                        http.onreadystatechange = function() {
                            if (http.readyState == 4) {
                                resp = http.responseText;
                                if (resp != " " && resp != "") {
                                    if (resp != "0") {
                                        document.getElementById("div_VIN_message").innerHTML = "!!!این کد  قبلا ثبت شده است!!!" + "کد پیگیری " + resp;
                                        document.getElementById("<%Response.Write(GetInsertBtnName());%>").style.visibility = "hidden";

                                    } else {
                                    document.getElementById("div_VIN_message").innerHTML = "  **مجاز برای ثبت نام**  ";
          document.getElementById("<%Response.Write(GetInsertBtnName());%>").style.visibility = "visible";

                                    }


                                }
                            }
                        }
                        http.send(null);
                       
                    }
                    
                  function validate()  
                  { 
                  var vl = document.getElementById(
                        "<%Response.Write(get_txt_c_VIN());%>").value
                  if (vl != "") {

                      ChkInterID("<%Response.Write(get_txt_c_VIN());%>");
                  } else {

                  document.getElementById("div_VIN_message").innerHTML = "  لطفا کد  را وارد کنید ";
                  }
                  }
                
                </script>
                

<div>
                <span class="style4" __designer:mapid="294a">
                <asp:Label ID="Label1" runat="server" Text="lbl_co_name"></asp:Label>
                </span>
</div>

<div>

    <table>
        <tr>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="ورود اطلاعات" 
                    Checked="True" GroupName="SDADSA" AutoPostBack="True" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rb_edit" runat="server" Text="ویرایش" GroupName="SDADSA" 
                    AutoPostBack="True" oncheckedchanged="rb_edit_CheckedChanged" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Panel ID="pnl_code_peigiri" runat="server" Visible="False">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            لطفا کد پیگیری را وارد نمایید&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_code_peigiri" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            &nbsp;&nbsp;
                                                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید</asp:LinkButton>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div id="div_VIN_message">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
<hr />
</div>

<div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_typesTableAdapter" 
                    UpdateMethod="Update" 
        onselecting="ObjectDataSource1_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ct_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ct_name" Type="String" />
                        <asp:Parameter Name="ct_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_ct_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ct_name" Type="String" />
                        <asp:Parameter Name="ct_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                    DeleteMethod="Delete" InsertMethod="Insert" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="MainDataModuleTableAdapters.tbl_car_owning_typesTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_ot_id" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="ot_name" Type="String" />
                                        <asp:Parameter Name="ot_exp" Type="String" />
                                        <asp:Parameter Name="upds" Type="Int32" />
                                        <asp:Parameter Name="Original_ot_id" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ot_id" Type="Int32" />
                                        <asp:Parameter Name="ot_name" Type="String" />
                                        <asp:Parameter Name="ot_exp" Type="String" />
                                        <asp:Parameter Name="upds" Type="Int32" />
                                    </InsertParameters>
                                    </asp:ObjectDataSource>
      
   <table>
                                <tr>
                                    <td>
                                        شماره VIN</td>
                                    <td>
                                        نوع وسیله نقلیه</td>
                                    <td>
                                        نوع مالکیت</td>
                                    <td>
                                        نوع ثبت</td>
                                    <td>
                                        کد پیگیری</td>
                                    <td>
                                        مدل</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                <asp:TextBox ID="txt_c_VIN" runat="server" Width="110px" Height="16px" MaxLength="20">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_car_types" runat="server" Width="110px" 
                    DataSourceID="ObjectDataSource1" DataTextField="ct_name" 
                    DataValueField="ct_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                                <asp:DropDownList ID="drp_c_link_to_owning_types" runat="server" 
                                    DataSourceID="ObjectDataSource2" DataTextField="ot_name" DataValueField="ot_id" 
                                    Width="100px">
                                </asp:DropDownList>
                                    </td>
                                    <td>
                                <asp:DropDownList ID="drp_c_owner_kind" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="drp_c_owner_kind_SelectedIndexChanged">
                                    <asp:ListItem Value="2">ثبت شده</asp:ListItem>
                                    <asp:ListItem Value="3">ثبت نشده</asp:ListItem>
                                </asp:DropDownList>
                                    </td>
                                    <td>
                                <asp:TextBox ID="txt_c_driver_code" runat="server" MaxLength="10">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_kind" runat="server" Width="100px" 
                    DataSourceID="ObjectDataSource3" DataTextField="ck_name" 
                    DataValueField="ck_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <uc1:pnl_personal_information_form ID="pnl_personal_information_form1" 
    runat="server" Visible="False" />
                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_colorsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_cc_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cc_name" Type="String" />
                        <asp:Parameter Name="cc_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_cc_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cc_id" Type="Int32" />
                        <asp:Parameter Name="cc_name" Type="String" />
                        <asp:Parameter Name="cc_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" 
                            DeleteMethod="Delete" InsertMethod="Insert" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="MainDataModuleTableAdapters.tbl_car_pelak_alphabetTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_cpa_id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="cpa_name" Type="String" />
                                <asp:Parameter Name="cpa_exp" Type="String" />
                                <asp:Parameter Name="upds" Type="Int32" />
                                <asp:Parameter Name="Original_cpa_id" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="cpa_name" Type="String" />
                                <asp:Parameter Name="cpa_exp" Type="String" />
                                <asp:Parameter Name="upds" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_using_typesTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_cut_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cut_name" Type="String" />
                        <asp:Parameter Name="cut_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_cut_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cut_name" Type="String" />
                        <asp:Parameter Name="cut_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_gas_typesTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_cgt_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cgt_name" Type="String" />
                        <asp:Parameter Name="cgt_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_cgt_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cgt_name" Type="String" />
                        <asp:Parameter Name="cgt_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_kindTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ck_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ck_name" Type="String" />
                        <asp:Parameter Name="ck_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_ck_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ck_name" Type="String" />
                        <asp:Parameter Name="ck_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_car_gas_controllerTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_cgc_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cgc_name" Type="String" />
                        <asp:Parameter Name="cgc_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                        <asp:Parameter Name="Original_cgc_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cgc_id" Type="Int32" />
                        <asp:Parameter Name="cgc_name" Type="String" />
                        <asp:Parameter Name="cgc_exp" Type="String" />
                        <asp:Parameter Name="upds" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                            <table>
                                <tr>
                                    <td>
                                        شماره پلاک انتظامی</td>
                                    <td>
                تیپ</td>
                                    <td>
                نوع کاربردی</td>
                                    <td>
                رنگ 
                                    </td>
                                    <td>
                                        سیستم سوخت ر.</td>
                                    <td>
                                        سال ساخت      </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table __designer:mapid="b9">
                                            <tr __designer:mapid="ba">
                                                <td __designer:mapid="bb">
                                                    ایران</td>
                                                <td __designer:mapid="bc" style="margin-right: 40px">
                                                    <asp:TextBox ID="txt_c_iran" runat="server" Width="40px"></asp:TextBox>
                                                </td>
                                                <td __designer:mapid="be" style="margin-right: 80px">
                                                    <asp:TextBox ID="txt_c_pelak_part3" runat="server" Width="67px"></asp:TextBox>
                                                </td>
                                                <td __designer:mapid="c0" style="margin-right: 40px">
                                                    <asp:DropDownList ID="drp_c_pelak_part2" runat="server" 
                                                        DataSourceID="ObjectDataSource10" DataTextField="cpa_name" 
                                                        DataValueField="cpa_id" Width="56px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td __designer:mapid="ce">
                                                    <asp:TextBox ID="txt_c_pelak_part1" runat="server" Width="40px"></asp:TextBox>
                                                    <span __designer:mapid="d0" class="style2">*</span></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_car_tips" runat="server" Width="65px"></asp:TextBox>
                                    </td>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_using_types" runat="server" Width="85px" 
                    DataSourceID="ObjectDataSource5" DataTextField="cut_name" 
                    DataValueField="cut_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_color" runat="server" Width="80px" 
                    DataSourceID="ObjectDataSource6" DataTextField="cc_name" 
                    DataValueField="cc_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_type_of_gas_controller" runat="server" 
                    Width="100px" DataSourceID="ObjectDataSource7" DataTextField="cgc_name" 
                    DataValueField="cgc_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_c_year_of_made" runat="server" Width="63px">0</asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            
                            <table>
                                <tr>
                                    <td>
                                        نوع سوخت</td>
                                    <td>
                                        تعداد سیلندر</td>
                                    <td>
                                        تعداد چرخ</td>
                                    <td>
                                        تعداد محور</td>
                                    <td>
                                        حجم موتور</td>
                                    <td>
                                        شماره موتور</td>
                                    <td>
                                        شماره شاسی</td>
                                    <td>
                                        ظرفیت بارگیری</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                <asp:DropDownList ID="drp_c_link_to_system_of_gas" runat="server" Width="100px" 
                    DataSourceID="ObjectDataSource8" DataTextField="cgt_name" 
                    DataValueField="cgt_id">
                </asp:DropDownList>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_cylinder" runat="server" Width="51px">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_weil_count" runat="server" Width="58px">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_circuity_count" runat="server" Width="55px">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_amount_of_motor" runat="server" Width="51px">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_number_of_motor" runat="server" Width="76px">0</asp:TextBox>
                                    </td>
                                    <td>
                <asp:TextBox ID="txt_c_number_of_shasi" runat="server" Width="90px">0</asp:TextBox>
                                    </td>
                                    <td>
&nbsp;<asp:TextBox ID="txt_c_capacity" runat="server" Width="77px">0</asp:TextBox>kg</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                </table>
                <hr />
                <table __designer:mapid="16d">
                    <tr __designer:mapid="16e">
                        <td colspan="2" __designer:mapid="16f">
                            عکس</td>
                                </tr>
                                <tr __designer:mapid="170">
                                    <td __designer:mapid="171">
                                        <asp:FileUpload ID="fu_car_pic_uploader" runat="server" />
                                    </td>
                                    <td __designer:mapid="173">
                                        &nbsp;</td>
                                </tr>
                                <tr __designer:mapid="174">
                                    <td __designer:mapid="175">
                                        <table __designer:mapid="176">
                                            <tr __designer:mapid="177">
                                                <td __designer:mapid="178">
                                                    &nbsp;</td>
                                                <td __designer:mapid="179" style="text-align: center; vertical-align: middle;">
                                                    <asp:Button ID="btn_image1" runat="server" Text="ارسال عکس اول" Width="100px" 
                                                        onclick="btn_image1_Click" />
                                                    <asp:Image ID="img_view1" runat="server" Height="85px" Width="120px" />
                                                </td>
                                            </tr>
                                            <tr __designer:mapid="17c">
                                                <td __designer:mapid="17d">
                                                    &nbsp;</td>
                                                <td __designer:mapid="17e" style="text-align: center">
                                                    <asp:Button ID="btn_image2" runat="server" Text="ارسال عکس دوم" Width="100px" 
                                                        onclick="btn_image2_Click" />
                                                    <asp:Image ID="img_view2" runat="server" Height="85px" Width="120px" />
                                                </td>
                                            </tr>
                                            <tr __designer:mapid="181">
                                                <td __designer:mapid="182">
                                                    &nbsp;</td>
                                                <td __designer:mapid="183" style="text-align: center">
                                                    <asp:Button ID="btn_image3" runat="server" Text="ارسال عکس سوم" Width="100px" 
                                                        onclick="btn_image3_Click" />
                                                    <asp:Image ID="img_view3" runat="server" Height="85px" Width="120px" />
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                    <td __designer:mapid="18a">
                                        &nbsp;</td>
                                </tr>
                                </table>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_car_post" runat="server" Text="ثبت" Width="83px" 
                    onclick="btn_car_post_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_add_new" runat="server" onclick="btn_add_new_Click" 
                    Text="آماده سازی جهت اطلاعات جدید" />
                        <br />
                                        <asp:ObjectDataSource ID="ods_cars" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="MainDataModuleTableAdapters.tbl_carsTableAdapter" 
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_c_id" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="c_pelak_part1" Type="String" />
                                                <asp:Parameter Name="c_pelak_part2" Type="String" />
                                                <asp:Parameter Name="c_pelak_part3" Type="String" />
                                                <asp:Parameter Name="c_iran" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_car_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_car_tips" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_using_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_color" Type="Int32" />
                                                <asp:Parameter Name="c_year_of_made" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_system_of_gas" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_type_of_gas_controller" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_gas_type" Type="Int32" />
                                                <asp:Parameter Name="c_cylinder" Type="Int32" />
                                                <asp:Parameter Name="c_weil_count" Type="Int32" />
                                                <asp:Parameter Name="c_circuity_count" Type="Int32" />
                                                <asp:Parameter Name="c_amount_of_motor" Type="Int32" />
                                                <asp:Parameter Name="c_number_of_motor" Type="String" />
                                                <asp:Parameter Name="c_number_of_shasi" Type="String" />
                                                <asp:Parameter Name="c_VIN" Type="String" />
                                                <asp:Parameter Name="upds" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_owning_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_kind" Type="Int32" />
                                                <asp:Parameter Name="Original_c_id" Type="Int32" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="c_pelak_part1" Type="String" />
                                                <asp:Parameter Name="c_pelak_part2" Type="String" />
                                                <asp:Parameter Name="c_pelak_part3" Type="String" />
                                                <asp:Parameter Name="c_iran" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_car_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_car_tips" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_using_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_color" Type="Int32" />
                                                <asp:Parameter Name="c_year_of_made" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_system_of_gas" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_type_of_gas_controller" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_gas_type" Type="Int32" />
                                                <asp:Parameter Name="c_cylinder" Type="Int32" />
                                                <asp:Parameter Name="c_weil_count" Type="Int32" />
                                                <asp:Parameter Name="c_circuity_count" Type="Int32" />
                                                <asp:Parameter Name="c_amount_of_motor" Type="Int32" />
                                                <asp:Parameter Name="c_number_of_motor" Type="String" />
                                                <asp:Parameter Name="c_number_of_shasi" Type="String" />
                                                <asp:Parameter Name="c_VIN" Type="String" />
                                                <asp:Parameter Name="upds" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_owning_types" Type="Int32" />
                                                <asp:Parameter Name="c_link_to_kind" Type="Int32" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                            <br />
</div>
<script type="text/javascript">
 <%Response.Write(GenerateNeededNullValidationJavaScripts()); %>  
  
  
  function att_to_event()
  {
  StartCheckNullValidator("<%Response.Write(btn_car_post.ClientID);%>");
  }
  
  
  document.onkeydown = att_to_event;
  document.onkeyup = att_to_event;
  
</script>
</asp:Content>

