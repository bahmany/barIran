<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_haghighi.aspx.cs" Inherits="frm_haghighi" EnableEventValidation="false" EnableViewStateMac="false" EnableViewState="false" %>
<%@ Register src="ascx/pnl_personal_information_form.ascx" tagname="pnl_personal_information_form" tagprefix="uc1" %>
<%@ Register src="ascx/pnl_address_information_form.ascx" tagname="pnl_address_information_form" tagprefix="uc2" %>
<%@ Register src="ascx/frm_one_employers.ascx" tagname="frm_one_employers" tagprefix="uc3" %>
<%@ Register src="ascx/frm_one_add_utilities.ascx" tagname="frm_one_add_utilities" tagprefix="uc4" %>
<%@ Register src="ascx/frm_one_equipments_in_hand.ascx" tagname="frm_one_equipments_in_hand" tagprefix="uc5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div style=" padding: 10px; margin: 0px; background-color: #000000; color: #000000;">

<div style=" color: #FFFFFF; font-weight: bold;">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    ورود اطلاعات فعال حقیقی حمل و نقل </div>
<div style="border: 1px solid #CCCCCC; padding: 5px; margin: 0px; background-color: #FFFFFF;">






 
          <script type="text/javascript">
          
          
             function ChkInterID(str) {
                  var http = false;
                  var resp = "";
                  if (navigator.appName == "Microsoft Internet Explorer") {
                      http = new ActiveXObject("Microsoft.XMLHTTP");
                  } else {
                      http = new XMLHttpRequest();
                  }
                  http.open("GET", "Handler.ashx?international_code_check_haghighi=" +
                        document.getElementById(
                        "<%Response.Write(txt_oh_international_code.ClientID);%>").value
                        );
document.getElementById("<%Response.Write(pnl_personal_information_form1.FindControl("txt_international_code").ClientID);%>").value = "";
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
                                  document.getElementById("<%Response.Write(pnl_personal_information_form1.FindControl("txt_international_code").ClientID);%>").value = 
                                  document.getElementById("<%Response.Write(txt_oh_international_code.ClientID);%>").value;

                              }
                              

                          }
                      }
                  }
                  http.send(null);

              }

              function validate() {

var vl = document.getElementById(
                        "<%Response.Write(txt_oh_international_code.ClientID);%>").value
                  if (vl.length != 10) {
                      document.getElementById("div_internationl_code_message").innerHTML = "  لطفا کد ملی را صحیح وارد کنید ";
                      document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "hidden";

                  } else {

                      
                      if (vl != "") {

                          ChkInterID("<%Response.Write(txt_oh_international_code.ClientID);%>");
                      } else {

                          document.getElementById("div_internationl_code_message").innerHTML = "  لطفا کد ملی را وارد کنید ";
                          document.getElementById("<%Response.Write(btn_add_new_person.ClientID);%>").style.visibility = "hidden";

                      }
                  }

              }
                
                </script>



    <asp:Panel ID="pnl_form" runat="server">
    
    
    <div dir="rtl">
 

<div>

    <table>
        <tr>
            <td>
                نوع عملیات&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:RadioButton ID="rb_AddNew" runat="server" Checked="True" GroupName="LLI1" 
                    Text="ثبت اطلاعات جدید" AutoPostBack="True" 
                    oncheckedchanged="rb_AddNew_CheckedChanged" />
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="LLI1" 
                    Text="ویرایش" AutoPostBack="True" 
                    oncheckedchanged="RadioButton1_CheckedChanged" />
            </td>
        </tr>
    </table>
<hr />
</div> 

            <asp:Panel ID="pnl_international_code" runat="server">
       
<table>
            <tr>
                <td>
                    تائید کد ملی برای ثبت نام
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; کد ملی&nbsp;</td>
                <td>
                    <asp:TextBox ID="txt_oh_international_code" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <div ID="div_internationl_code_message" 
                        style="font-family: tahoma; font-size: 12px; font-weight: bold">
                    </div>
                </td>
            </tr>
        </table>
      </asp:Panel>
 
            <asp:Panel ID="pnl_peigiri_code" runat="server" Visible="False">
            
                <table>
                    <tr>
                        <td>
                            لطفا کد پیگیری مورد نظر را وارد نمایید&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_code_pergiri" runat="server" Width="170px" MaxLength="20"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            
            </asp:Panel>
            <hr />

        

</div>


<div dir="rtl" style="background-color: #FFFFFF">

<table style="width: 100%">
                <tr>
                    <td class="s11111221" colspan="4">
                        <table>
                            <tr>
                                <td>
                                    کد مالیاتی</td>
                                <td>
                                    کد کارگاه تامین کارگاه<br />
                                    (تامین اجتماعی)</td>
                                <td>
                                    زمینه فعالیت</td>
                                <td>
                                    نام تشکل صنفی</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_oh_tax_code" runat="server" Width="150px" MaxLength="15"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_oh_insurace_kargah" runat="server" Width="150px" 
                                        MaxLength="25"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drp_oh_link_to_context_of_activity" runat="server" 
                                        DataSourceID="ObjectDataSource1" DataTextField="ohca_name" 
                                        DataValueField="ohca_id" Width="150px">
                                    </asp:DropDownList>
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
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
        </tr>
        <tr>
            <td colspan="4">
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:bariranConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_caste] order by ca_id">
                </asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_one_context_of_activityTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ohca_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ohca_name" Type="String" />
                        <asp:Parameter Name="Original_ohca_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ohca_name" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            
                <uc1:pnl_personal_information_form ID="pnl_personal_information_form1" 
                    runat="server" />
                <br />
                <uc2:pnl_address_information_form ID="pnl_address_information_form1" 
                    runat="server" />
                <uc4:frm_one_add_utilities ID="frm_one_add_utilities1" runat="server" />
                <uc3:frm_one_employers ID="frm_one_employers1" runat="server" />
                <uc5:frm_one_equipments_in_hand ID="frm_one_equipments_in_hand1" 
                    runat="server" />
                <br />
                <br />
            
                <br />
            
                <br />
               
           
            
                </td>
        </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
        <tr>
            <td>
                <br />
            </td>
            <td colspan="3">
                
            </td>
        </tr>
                                        <tr>
                                            <td class="s11111221">
                                                &nbsp;</td>
                                            <td class="style2">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style1">
                                                <asp:Button ID="btn_add_new_person" runat="server" 
                                                    onclick="btn_add_new_person_Click" Text="ثبت" Visible="true" Width="88px" />
                                                &nbsp;
                                                <asp:Button ID="btn_add_new" runat="server" onclick="btn_add_new_Click" 
                                                    Text="آماده سازی جهت اطلاعات جدید" />
                                            </td>
                </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                        </td __designer:mapid="154f" class="style2">
            &nbsp;<td>
    </td>
    <td>
        &nbsp;</td>
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
        <td class="style2">
            <br />
        </td>
        <td>
        </td>
    </tr>
    </caption>
    </tr>
    </table>
</div>
 </asp:Panel></div>
</div>
<script type="text/javascript">
 <%Response.Write(GenerateNeededJavaScripts()); %>  
  
  
  function att_to_event()
  {
  StartCheckNullValidator("<%Response.Write(btn_add_new_person.ClientID); %>");
  }
  
  
  document.onkeydown = att_to_event;
  document.onkeyup = att_to_event;
  
  
  
  function EqualTwoTextbox()
  {
                                    document.getElementById("<%Response.Write(pnl_personal_information_form1.FindControl("txt_international_code").ClientID);%>").value = 
                                  document.getElementById("<%Response.Write(txt_oh_international_code.ClientID);%>").value;
                                  validate();
  }
</script>



</asp:Content>

