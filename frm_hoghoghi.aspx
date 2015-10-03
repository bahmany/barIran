<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_hoghoghi.aspx.cs" Inherits="frm_hoghoghi" %>

<%@ Register src="ascx/pnl_address_information_form.ascx" tagname="pnl_address_information_form" tagprefix="uc1" %>

<%@ Register src="ascx/frm_one_managers.ascx" tagname="frm_one_managers" tagprefix="uc2" %>

<%@ Register src="ascx/frm_one_observers.ascx" tagname="frm_one_observers" tagprefix="uc3" %>
<%@ Register src="ascx/frm_one_add_utilities.ascx" tagname="frm_one_add_utilities" tagprefix="uc4" %>
<%@ Register src="ascx/frm_one_employers.ascx" tagname="frm_one_employers" tagprefix="uc5" %>
<%@ Register src="ascx/frm_one_equipments_in_hand.ascx" tagname="frm_one_equipments_in_hand" tagprefix="uc6" %>




<%@ Register assembly="PersianDateValidator" namespace="BehooControls" tagprefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                  http.open("GET", "Handler.ashx?oho_unique_id=" +
                        document.getElementById(
                        "<%Response.Write(oho_unique_id.ClientID);%>").value
                        );

                  http.onreadystatechange = function() {
                      if (http.readyState == 4) {
                          resp = http.responseText;
                          if (resp != " " && resp != "") {
                              if (resp != "0") {
                                  document.getElementById("div_internationl_code_message").innerHTML = "!!!این کد ملی قبلا ثبت شده است!!! <br/> کد پیگیری " + resp;
                                  document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "hidden";

                              } else {
                                  document.getElementById("div_internationl_code_message").innerHTML = "  **مجاز برای ثبت نام**  ";
                                  document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "visible";

                              }
                              

                          }
                      }
                  }
                  http.send(null);

              }

              function validate() {

var vl = document.getElementById(
                        "<%Response.Write(oho_unique_id.ClientID);%>").value
                  if (vl.length != 13) {
                      document.getElementById("div_internationl_code_message").innerHTML = "  لطفا کد ملی را صحیح وارد کنید ";
                      document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "hidden";

                  } else {

                      
                      if (vl != "") {

                          ChkInterID("<%Response.Write(oho_unique_id.ClientID);%>");
                      } else {

                          document.getElementById("div_internationl_code_message").innerHTML = "  لطفا کد ملی را وارد کنید ";
                          document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "hidden";
                          

                      }
                  }

              }
                
                </script>
           


<div>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
&nbsp;<br />
    <table __designer:mapid="bc5">
        <tr __designer:mapid="bc6">
            <td __designer:mapid="bc7">
                نوع عملیات&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td __designer:mapid="bc8">
                <asp:RadioButton ID="rb_AddNew" runat="server" Checked="True" GroupName="LLI1" 
                    Text="ثبت اطلاعات جدید" AutoPostBack="True" 
                    oncheckedchanged="rb_AddNew_CheckedChanged" />
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td __designer:mapid="bd2">
                <asp:RadioButton ID="rb_edit" runat="server" GroupName="LLI1" 
                    Text="ویرایش" AutoPostBack="True" 
                    oncheckedchanged="rb_edit_CheckedChanged" />
            </td>
        </tr>
    </table>
    <div>
        <asp:Panel ID="pnl_edit" runat="server" Visible="False">
            <table>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp; لطفا کد پیگیری را وارد نمائید&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txt_code_pergiri" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">ویرایش</asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        
        
        
        
        
        
        </asp:Panel>
    </div>
    <hr />
                    <div ID="div_internationl_code_message" 
                        style="font-family: tahoma; font-size: 12px; font-weight: bold" 
                        __designer:mapid="1149">
                    </div>
                

</div>



    <table>
        <tr>
            <td colspan="7">
                <cc1:PersianDateValidator ID="PersianDateValidator1" runat="server" 
                    AcceptWithoutZero="False" ControlToValidate="oho_date_og_registration" 
                    FirstWhat="FirstYear">لطفا تاریخ را صحیح وارد نمایید</cc1:PersianDateValidator>
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
                شناسه ملی*</td>
            <td>
                نوع شخصیت حقوقی</td>
            <td>
                نوع مالکیت</td>
            <td>
                نام شخصیت حقوقی</td>
            <td>
                شماره ثبت*</td>
            <td>
                تاریخ ثبت*</td>
            <td>
                محل ثبت*</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="oho_unique_id" runat="server" Width="87px" MaxLength="13"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="oho_link_to_type_of_hoghoghi_personality" runat="server" 
                    Width="110px">
                    <asp:ListItem Value="0">موسسه</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">با مسئولیت محدود</asp:ListItem>
                    <asp:ListItem Value="2">سهامی خاص</asp:ListItem>
                    <asp:ListItem Value="3">سهامی عام</asp:ListItem>
                    <asp:ListItem Value="4">تضامنی</asp:ListItem>
                    <asp:ListItem Value="5">تعاونی</asp:ListItem>
                </asp:DropDownList>
                        </td>
            <td>
                <asp:DropDownList ID="drp_oho_type_of_owner" runat="server" Width="80px">
                    <asp:ListItem Value="0">دولتی</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">تعاونی</asp:ListItem>
                    <asp:ListItem Value="2">غیر تعاونی</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="oho_name" runat="server" Width="101px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oho_no_of_registration" runat="server" Width="73px"></asp:TextBox>
                </td>
            <td>
                
                <asp:TextBox ID="oho_date_og_registration" runat="server" Width="98px" dir="ltr"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oho_place_of_registration" runat="server" Width="76px" 
                    MaxLength="50"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>





                        <table>
                            <tr>
                                <td>
                                    کد مالیاتی</td>
                                <td>
                                    کدکارگاه (تامین اجتماعی)</td>
                                <td>
                                    نام تشکل صنفی</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                <asp:TextBox ID="oho_tax" runat="server" Width="83px" MaxLength="20"></asp:TextBox>
                                </td>
                                <td>
                <asp:TextBox ID="oho_insurace" runat="server" Width="150px" MaxLength="14"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource1" DataTextField="ca_name" DataValueField="ca_id" 
                                        Width="150px">
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




<hr />
    <table>
        <tr>
            <td colspan="8">
                <br />
                <b>مشخصات مدیر عامل</b><asp:ObjectDataSource ID="ods_education" runat="server" DeleteMethod="Delete" 
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
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:bariranConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_caste] order by ca_id">
                </asp:SqlDataSource>
                                </td>
        </tr>
        <tr>
            <td colspan="8">
                <cc1:PersianDateValidator ID="PersianDateValidator2" runat="server" 
                    AcceptWithoutZero="False" ControlToValidate="oho_mngr_date_of_birth" 
                    FirstWhat="FirstYear">لطفا تاریخ تولد را صحیح وارد نمایید</cc1:PersianDateValidator>
            </td>
        </tr>
        <tr>
            <td>
                نام خانوادگی*</td>
            <td>
                نام*</td>
            <td>
                کد ملی*</td>
            <td>
                جنسیت</td>
            <td>
                تحصیلات</td>
            <td>
                رشته تحصیلی</td>
            <td>
                تاریخ تولد</td>
            <td>
                تلفن همراه</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="oho_mngr_family" runat="server" Width="90px" MaxLength="60"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oho_mngr_name" runat="server" Width="69px" MaxLength="60"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oho_mngr_international_code" runat="server" Width="90px" MaxLength="10"></asp:TextBox>
                </td>
            <td>
                <asp:DropDownList ID="oho_mngr_sex" runat="server" Width="50px">
                    <asp:ListItem Selected="True" Value="1">مرد</asp:ListItem>
                    <asp:ListItem Value="2">زن</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="oho_mngr_link_to_eduction" runat="server" Width="100px" 
                    DataSourceID="ods_education" DataTextField="e_name" DataValueField="e_id">
                </asp:DropDownList>
                </td>
            <td>
                <asp:TextBox ID="oho_mngr_branch" runat="server" Width="80px"></asp:TextBox>
            </td>
            <td dir="ltr">
                <asp:TextBox ID="oho_mngr_date_of_birth" runat="server" Width="73px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="oho_mngr_mobile" runat="server" Width="80px" MaxLength="11"></asp:TextBox>
            </td>
        </tr>
    </table>

<hr />
<div>



    <uc1:pnl_address_information_form ID="pnl_address_information_form1" 
        runat="server" />

    <uc2:frm_one_managers ID="frm_one_managers1" runat="server" />
    <br>
    <uc3:frm_one_observers ID="frm_one_observers1" runat="server" />
    </br>
    <uc4:frm_one_add_utilities ID="frm_one_add_utilities1" runat="server" />
    <br />
    <uc5:frm_one_employers ID="frm_one_employers1" runat="server" />
    <br />
    <uc6:frm_one_equipments_in_hand ID="frm_one_equipments_in_hand1" 
        runat="server" />
    <br />
    <br />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btn_add_new_person" runat="server" 
                                                    
        onclick="btn_add_new_person_Click" Text="ثبت" Visible="true" Width="88px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btn_add_new" 
        runat="server" onclick="btn_add_new_Click" 
                                                    
        Text="آماده سازی جهت اطلاعات جدید" />
    <br />
    <br />
    <br />

</div>



<script type="text/javascript">
    $(function() {
    $("#<%Response.Write(oho_date_og_registration.ClientID);%>").mask("99/99/99");
    $("#<%Response.Write(oho_mngr_date_of_birth.ClientID);%>").mask("99/99/99");
    $("#<%Response.Write((frm_one_managers1.FindControl("ohom_date_birth") as TextBox).ClientID);%>").mask("99/99/99");
    $("#<%Response.Write((frm_one_observers1.FindControl("ohom_date_birth") as TextBox).ClientID);%>").mask("99/99/99");

        // Contents of textboxes will be selected when receiving focus.
        $("input[type=text]")
                .focus(function() {
                    $(this).select();
                });
    });



</script>  


<script type="text/javascript">
 <%Response.Write(GenerateNeededNullValidationJavaScripts()); %>  
  
  
  function att_to_event()
  {
  StartCheckNullValidator("<%Response.Write(btn_add_new_person.ClientID); %>");
  }
  
  
  document.onkeydown = att_to_event;
  document.onkeyup = att_to_event;
  
</script>
</asp:Content>

