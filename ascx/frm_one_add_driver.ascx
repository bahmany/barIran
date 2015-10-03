<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_one_add_driver.ascx.cs" Inherits="ascx_frm_driver_add_new" %>







<%@ Register src="pnl_personal_information_form.ascx" tagname="pnl_personal_information_form" tagprefix="uc1" %>
<%@ Register src="pnl_address_information_form.ascx" tagname="pnl_address_information_form" tagprefix="uc2" %>
<%@ Register assembly="PersianDateValidator" namespace="BehooControls" tagprefix="cc1" %>



    <style type="text/css">
    .s11111111
    {
        color: #FF0000;
    }
    .s11111221
    {
    }
    .style2
    {
    }
    .style4
    {
        font-size: x-large;
    }
</style>



    <script type="text/javascript">
//nnnnnnnnnnnnnnn


                    function ChkInterID(str) {
                    
                   
                    
                    
                        var http = false;
                        var resp = "";
                        if (navigator.appName == "Microsoft Internet Explorer") {
                            http = new ActiveXObject("Microsoft.XMLHTTP");
                        } else {
                            http = new XMLHttpRequest();
                        }
                        http.open("GET", "Handler.ashx?international_code_check="+
                        document.getElementById(
                        "<%Response.Write(GetItxt_o_international_code());%>").value
                        );
                        
                        http.onreadystatechange = function() {
                            if (http.readyState == 4) {
                                resp = http.responseText;
                                if (resp != " " && resp != "") {
                                    if (resp == "0") {
                                        document.getElementById("div_internationl_code_message").innerHTML = "  **مجاز برای ثبت نام**  ";
                                        document.getElementById("<%Response.Write(GetInsertBtnName());%>").style.visibility = "visible";

                                    } else {
                                    document.getElementById("div_internationl_code_message").innerHTML = "!!!این کد ملی قبلا ثبت شده است!!!" + "کد پیگیری  " + resp;
                                    document.getElementById("<%Response.Write(GetInsertBtnName());%>").style.visibility = "hidden";
          
                                    }


                                }
                            }
                        }
                        http.send(null);
                       
                    }
                    
                  function validate()  
                  { 
                  var vl = document.getElementById(
                        "<%Response.Write(GetItxt_o_international_code());%>").value
                  if (vl != "") {

                      ChkInterID("<%Response.Write(GetItxt_o_international_code());%>");
                  } else {

                  document.getElementById("div_internationl_code_message").innerHTML = "  لطفا کد ملی را وارد کنید ";
                  }
                  }
                
                </script>

<div style=" padding: 10px; margin: 0px; background-color: #000000; color: #000000;">
<div style=" color: #FFFFFF; font-weight: bold;">
    &nbsp;&nbsp;&nbsp; ورود اطلاعات حقیقی&nbsp;&nbsp;<br />
</div>
<div style="border: 1px solid #CCCCCC; padding: 5px; margin: 0px; background-color: #FFFFFF;">

<div dir="rtl" style="background-color: #FFFFFF">

    <asp:Panel ID="pnl_add_new_one_form" runat="server">
  
    <table>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="tdFormTitle" colspan="3">
                <span class="style4">
                    <asp:Label ID="Label1" runat="server" Text="lbl_co_name"></asp:Label></span></td>
        </tr>
        <tr>
            <td class="s11111221" colspan="4">
                <table>
                    <tr>
                        <td>
                            نوع عملیات</td>
                        <td>
                            <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" 
                                GroupName="dddsdf" oncheckedchanged="RadioButton1_CheckedChanged" 
                                Text="ثبت اطلاعات جدید" Checked="True" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" 
                                GroupName="dddsdf" oncheckedchanged="RadioButton2_CheckedChanged" 
                                Text="ویرایش" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2" colspan="2">
                <div ID="div_internationl_code_message">
                </div>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2" colspan="2">
                <asp:Panel ID="pnl_add_new" runat="server">
                    <table>
                        <tr>
                            <td>
                                کد ملی</td>
                            <td>
                                <asp:TextBox ID="txt_o_international_code" runat="server" Width="150px" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <span class="s11111111">*</span>&nbsp;
                                
                                
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnl_edit" runat="server" Visible="False">
                    <table>
                        <tr>
                            <td>
                                کد پیگیری</td>
                            <td>
                                <asp:TextBox ID="txt_code_pergiri" runat="server" Width="167px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td style="margin-right: 40px">
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221" colspan="4">
                <uc1:pnl_personal_information_form ID="pnl_personal_information_form1" 
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                عکس</td>
            <td>
            
            
            
       
       
             
    

                <table>
                    <tr>
                        <td>
                            <asp:Image ID="img_pic_person" runat="server" Height="100px" Width="87px" />
                        </td>
                        <td>
                            
                            <asp:FileUpload ID="fu_image_uploader" runat="server" />
                            <br />
                            <asp:Button ID="btn_post_picture" runat="server" onclick="Button1_Click" 
                                Text="ارسال عکس" Width="100px" />
                        </td>
                    </tr>
                </table>
     
    
    
                
                
                
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                <br />
            </td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                پرداخت یارانه</td>
            <td>
                <table>
                    <tr>
                        <td>
                            نام بانک</td>
                        <td>
                            <asp:TextBox ID="txt_o_yaraneh_bank_name" runat="server" Width="91px" 
                                MaxLength="35"></asp:TextBox>
                        </td>
                        <td>
                            شماره حساب</td>
                        <td>
                            <asp:TextBox ID="txt_o_yaraneh_account_no" runat="server" Width="91px" 
                                MaxLength="25"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                نوع گواهینامه
            </td>
            <td>
                <asp:DropDownList ID="drp_o_driver_license_type" runat="server" Width="150px" 
                    DataSourceID="SqlDataSource1" DataTextField="odl_name" DataValueField="odl_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:bariranConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_driver_license_types]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                شماره گواهینامه</td>
            <td>
                <asp:TextBox ID="txt_o_driver_license_no" runat="server" Width="150px" 
                    MaxLength="20"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                تاریخ صدور</td>
            <td>
            <span dir="ltr">
                <asp:TextBox ID="txt_o_driver_license_reg_date" runat="server" Width="150px"></asp:TextBox></span>
                &nbsp;
                <cc1:PersianDateValidator ID="PersianDateValidator2" runat="server" 
                    AcceptWithoutZero="False" ControlToValidate="txt_o_driver_license_reg_date" 
                    ErrorMessage="لطفا تاریخ شمسی را صحیح وارد نمایید" FirstWhat="FirstYear"></cc1:PersianDateValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                اعتبار تا تاریخ</td>
            <td>
            <span dir="ltr">
                <asp:TextBox ID="txt_o_driver_license_reg_exp_date" runat="server" 
                    Width="150px"></asp:TextBox></span>
                &nbsp;
                <cc1:PersianDateValidator ID="PersianDateValidator1" runat="server" 
                    AcceptWithoutZero="False" ControlToValidate="txt_o_driver_license_reg_exp_date" 
                    ErrorMessage="لطفا تاریخ شمسی را صحیح وارد نمایید" FirstWhat="FirstYear"></cc1:PersianDateValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                دوره های آموزشی<br />
                حرفه ای طی شده</td>
            <td>
                <asp:TextBox ID="txt_o_exprience" runat="server" Width="382px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221" colspan="4">
                <uc2:pnl_address_information_form ID="pnl_address_information_form1" 
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <td class="style2">
                <br />
                <br />
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="btn_add_new_person" runat="server" 
                    onclick="btn_add_new_person_Click" Text="ثبت" Width="88px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_add_new" runat="server" onclick="btn_add_new_Click" 
                    Text="آماده سازی جهت اطلاعات جدید" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="s11111221">
                &nbsp;</td>
            <tr>
                <td class="style2">
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </caption>
        </tr>
    </table>
  </asp:Panel>
  
  
    <asp:Panel ID="pnl_ok_write_code" runat="server" Visible="False">
    
    </asp:Panel>
</div>
</div>
</div>



<script type="text/javascript">
 <%Response.Write(GenerateNeededNullValidationJavaScripts()); %>  
      $(function() {
    $("#<%Response.Write(txt_o_driver_license_reg_exp_date.ClientID);%>").mask("99/99/99");
    $("#<%Response.Write(txt_o_driver_license_reg_date.ClientID);%>").mask("99/99/99");

        // Contents of textboxes will be selected when receiving focus.
        $("input[type=text]")
                .focus(function() {
                    $(this).select();
                });
            });

  
  function att_to_event()
  {
  StartCheckNullValidator("<%Response.Write(btn_add_new_person.ClientID); %>");
  }
  
    function EqualTwoTextbox()
  {
                                    document.getElementById("<%Response.Write(pnl_personal_information_form1.FindControl("txt_international_code").ClientID);%>").value = 
                                  document.getElementById("<%Response.Write(txt_o_international_code.ClientID);%>").value;
                                  validate();
  }

  
  document.onkeydown = att_to_event;
  document.onkeyup = att_to_event;
  
</script>





