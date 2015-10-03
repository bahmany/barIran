using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using MainDataModuleTableAdapters;
using System.Data;

public partial class frm_hoghoghi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oho_unique_id.Attributes.Add("onblur", "validate()");
        oho_unique_id.Attributes.Add("maxlength", "13");
        //oho_unique_id.Attributes.Add("onKeyUp", "limitText(this.form." + oho_unique_id.ClientID + ",InternationalCounter,13);");
        oho_unique_id.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        oho_name.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        oho_mngr_name.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        oho_mngr_family.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        oho_mngr_branch.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        //oho_name.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        //oho_mngr_international_code.Attributes.Add("onKeyDown", "limitText(this.form." + oho_mngr_international_code.ClientID + ",InternationalCounter,10);");
        //oho_mngr_international_code.Attributes.Add("onKeyUp", "limitText(this.form." + oho_mngr_international_code.ClientID + ",InternationalCounter,10);");
        oho_mngr_international_code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        oho_mngr_mobile.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        oho_mngr_link_to_eduction.Attributes.Add("onchange", "chkEducation(this)");
        oho_mngr_link_to_eduction.Attributes.Add("onKeyUp", "chkEducation(this)");
        oho_mngr_link_to_eduction.Attributes.Add("onKeyDown", "chkEducation(this)");
        oho_mngr_link_to_eduction.SelectedIndex = 5;
        if (!IsPostBack)
        {
            Session.Remove("tmptbl_employersDataTable");
            Session.Remove("tmptbl_equipentsDataTable");
            Session.Remove("tmptbl_utilitiesDataTable");
            Session.Remove("tmptbl_mngrsDataTable");
            Session.Remove("tmptbl_obsrvDataTable");
            Session.Remove("tmptbl_employersDataTable");
            Session.Remove("tmptbl_utilitiesDataTable");
            Session.Remove("tmptbl_equipentsDataTable");
            Session.Remove("tmptbl_employersDataTable");
            Session.Remove("tmptbl_utilitiesDataTable");
            Session.Remove("tmptbl_equipentsDataTable");
            Session.Remove("CodePeigiri");
            Session.Remove("IsInEditingMode");

        }
        
    }




    public void Page_Init(object o, EventArgs e)
    {
        if (Session["CodePeigiri"] != null)
        {
            frm_one_add_utilities1.isEditing = true;
            frm_one_employers1.isEditing = true;
            frm_one_equipments_in_hand1.isEditing = true;
            frm_one_add_utilities1.CodePeigiri = Session["CodePeigiri"].ToString();
            frm_one_employers1.CodePeigiri = Session["CodePeigiri"].ToString();
            frm_one_equipments_in_hand1.CodePeigiri = Session["CodePeigiri"].ToString();
            Session["SystemIsEditing"] = Session["CodePeigiri"].ToString();
            frm_one_add_utilities1.DataBind();
            frm_one_employers1.DataBind();
            frm_one_equipments_in_hand1.DataBind();
            Session["IsInEditingMode"] = Session["CodePeigiri"];
            Session.Remove("CodePeigiri");
            
        }


    }
    protected void btn_add_new_person_Click(object sender, EventArgs e)
    {
        try
        {
            string idcode = "";
            XmlDocument doc_address = new XmlDocument();
            doc_address.InnerXml = pnl_address_information_form1.get_frm_xml_with_value();
            if (Session["IsInEditingMode"] == null)
            {
                new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().Insert(
                    Convert.ToInt32(oho_link_to_type_of_hoghoghi_personality.SelectedValue.ToString()),
                    Convert.ToInt32(drp_oho_type_of_owner.SelectedValue.ToString()),
                    oho_unique_id.Text,
                    oho_name.Text,
                    oho_no_of_registration.Text,
                    oho_date_og_registration.Text,
                    oho_place_of_registration.Text,
                    oho_tax.Text,
                    oho_insurace.Text,
                    oho_mngr_family.Text,
                    oho_mngr_name.Text,
                    oho_mngr_international_code.Text,
                    Convert.ToInt32(oho_mngr_sex.SelectedValue.ToString()),
                    Convert.ToInt32(oho_mngr_link_to_eduction.SelectedValue.ToString()),
                    oho_mngr_branch.Text,
                    oho_mngr_date_of_birth.Text,
                    oho_mngr_mobile.Text,
                    0, 0, 0, Convert.ToInt32(DropDownList1.SelectedValue.ToString()), doc_address.InnerXml);

                idcode = new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().Get_iD_from_international_code(oho_unique_id.Text).Value.ToString();


                frm_one_managers1.insert(idcode);
                frm_one_observers1.insert(idcode);
                frm_one_add_utilities1.insert(idcode);
                frm_one_employers1.insert(idcode);
                frm_one_equipments_in_hand1.insert(idcode);

            }
            else
            {
                string cdpeig = Session["IsInEditingMode"].ToString();
                new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().Update(
                    Convert.ToInt32(oho_link_to_type_of_hoghoghi_personality.SelectedValue.ToString()),
                    Convert.ToInt32(drp_oho_type_of_owner.SelectedValue.ToString()),
                    oho_unique_id.Text,
                    oho_name.Text,
                    oho_no_of_registration.Text,
                    oho_date_og_registration.Text,
                    oho_place_of_registration.Text,
                    oho_tax.Text,
                    oho_insurace.Text,
                    oho_mngr_family.Text,
                    oho_mngr_name.Text,
                    oho_mngr_international_code.Text,
                    Convert.ToInt32(oho_mngr_sex.SelectedValue.ToString()),
                    Convert.ToInt32(oho_mngr_link_to_eduction.SelectedValue.ToString()),
                    oho_mngr_branch.Text,
                    oho_mngr_date_of_birth.Text,
                    oho_mngr_mobile.Text,
                    0, 0, 0, Convert.ToInt32(DropDownList1.SelectedValue.ToString()), doc_address.InnerXml,
                    Convert.ToInt32(cdpeig));

                idcode = cdpeig;


                frm_one_managers1.Update(idcode);
                frm_one_observers1.Update(idcode);
                frm_one_add_utilities1.update(idcode);
                frm_one_employers1.update(idcode);
                frm_one_equipments_in_hand1.update(idcode);
            }

            // reloading the image of Peigiri.......
            string ur = "http://" + Request.Url.Authority;
            for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
            {
                ur += Request.Url.Segments[i];
            }
            string srf = ur;
            //ur = "http://localhost:8024/CodePeigiriGenerator.aspx?codepeigiri=" + idcode + "&mdname=" + "1";
            ur += "CodePeigiriGenerator.aspx?codepeigiri=" + idcode + "&mdname=" + "2";
            //string crf = "CodePei" + Guid.NewGuid().ToString() + ".jpg";
            //string cmplurl = Server.MapPath("~/uploadedfiles/" + crf);
            //WebsiteToImage websiteToImage = new WebsiteToImage(ur, @"" + cmplurl);
            //websiteToImage.Generate();
            //ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + srf + "uploadedfiles/" + crf + "','_blank')", true);
            ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + ur + "','_blank');window.location.href=window.location.href;", true);
            
            //Response.Redirect(Request.Url.AbsoluteUri);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "j03", "alert('ثبت گردید');", true);
        }
        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','"+Request.Url.AbsoluteUri+"')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('لطفا در ورود اطلاعات دقت کنید');", true);

        }

    }





    public string GenerateNeededNullValidationJavaScripts()
    {


        // Null Validator
        string str =
            string.Format(
            "AddToNotNullValidator(\"{0}\",\"{1}\",\"{2}\");" +
            "AddToNotNullValidator(\"{3}\",\"{4}\",\"{5}\");" +
            "AddToNotNullValidator(\"{6}\",\"{7}\",\"{8}\");" +
            "AddToNotNullValidator(\"{9}\",\"{10}\",\"{11}\");" +
            "AddToNotNullValidator(\"{12}\",\"{13}\",\"{14}\");" +
            "AddToNotNullValidator(\"{15}\",\"{16}\",\"{17}\");" +
            "AddToNotNullValidator(\"{18}\",\"{19}\",\"{20}\");"+
            "AddToNotNullValidator(\"{21}\",\"{22}\",\"{23}\");",
            oho_unique_id.ClientID, "شماره شناسنامه را وارد نمایید", "",
            oho_no_of_registration.ClientID, "نام را وارد نمایید", "",
            oho_date_og_registration.ClientID, "نام خانوادگی را وارد نمایید", "",
            oho_place_of_registration.ClientID, "نام پدر را وارد کنید", "",
            oho_mngr_family.ClientID, "تاریخ تولد را وارد کنید", "",
            oho_mngr_name.ClientID, "محل تولد را وارد کنید", "",
            oho_mngr_international_code.ClientID, "محل صدور شناسنامه را وارد کنید", "",
            oho_mngr_date_of_birth.ClientID, "محل صدور شناسنامه را وارد کنید", ""
            
            );
        //---------------------------




        return str;


    }


    public int GoToEditMode(int CodePeigiri)
    {
        int RowEf = 0;
        if (new tbl_ones_hoghoghiTableAdapter().GetDataBy3(CodePeigiri) != null)
        {
            RowEf = 1;
            DataRow dr = new tbl_ones_hoghoghiTableAdapter().GetDataBy3(CodePeigiri).Rows[0];

            oho_link_to_type_of_hoghoghi_personality.SelectedValue = dr["oho_link_to_type_of_hoghoghi_personality"].ToString();
            drp_oho_type_of_owner.SelectedValue=dr["oho_type_of_owner"].ToString();
            oho_unique_id.Text = dr["oho_international_code"].ToString();
            oho_name.Text = dr["oho_name"].ToString();
            oho_no_of_registration.Text = dr["oho_no_of_registration"].ToString();
            oho_date_og_registration.Text = dr["oho_date_og_registration"].ToString();
            oho_place_of_registration.Text = dr["oho_place_of_registration"].ToString();
            oho_tax.Text = dr["oho_tax"].ToString();
            oho_insurace.Text = dr["oho_onsurance"].ToString();
            oho_mngr_family.Text = dr["oho_mngr_family"].ToString();
            oho_mngr_name.Text = dr["oho_mngr_name"].ToString();
            oho_mngr_international_code.Text = dr["oho_mngr_international_code"].ToString();
            oho_mngr_sex.SelectedValue = dr["oho_mngr_sex"].ToString();
            oho_mngr_link_to_eduction.SelectedValue = dr["oho_mngr_link_to_eduction"].ToString();
            oho_mngr_branch.Text = dr["oho_mngr_branch"].ToString();
            oho_mngr_date_of_birth.Text =dr["oho_mngr_date_of_birth"].ToString();
            oho_mngr_mobile.Text = dr["oho_mngr_mobile"].ToString();
            DropDownList1.SelectedValue = dr["oh_link_to_complex"].ToString();
            new main_class().XmlToFormForEditing(dr["oh_address_info"].ToString(), pnl_address_information_form1);
            frm_one_add_utilities1.isEditing = true;
            frm_one_add_utilities1.CodePeigiri = CodePeigiri.ToString();
            frm_one_employers1.isEditing = true;
            frm_one_employers1.CodePeigiri = CodePeigiri.ToString();
            frm_one_equipments_in_hand1.isEditing = true;
            frm_one_equipments_in_hand1.CodePeigiri = CodePeigiri.ToString();

        
        }

        return RowEf;
    }



    protected void rb_AddNew_CheckedChanged(object sender, EventArgs e)
    {
        pnl_edit.Visible = false;

    }
    protected void rb_edit_CheckedChanged(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int CodePeigiri = Convert.ToInt32(txt_code_pergiri.Text);
        Session["CodePeigiri"] = CodePeigiri;
        try
        {
            GoToEditMode(CodePeigiri);
        }

        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','" + Request.Url.AbsoluteUri + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
        }

    }
    protected void btn_add_new_Click(object sender, EventArgs e)
    {
        Session.Remove("tmptbl_employersDataTable");
        Session.Remove("tmptbl_equipentsDataTable");
        Session.Remove("tmptbl_utilitiesDataTable");
        Session.Remove("tmptbl_mngrsDataTable");
        Session.Remove("tmptbl_obsrvDataTable");

        Session.Remove("CodePeigiri");
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
