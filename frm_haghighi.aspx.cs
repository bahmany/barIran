using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;
using System.Data;
using System.Xml;
using System.Drawing;

public partial class frm_haghighi : System.Web.UI.Page
{
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
       // (pnl_personal_information_form1.FindControl("txt_international_code") as TextBox).Enabled = false;              
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Remove("tmptbl_employersDataTable");
            Session.Remove("tmptbl_utilitiesDataTable");
            Session.Remove("tmptbl_equipentsDataTable");
            Session.Remove("tmptbl_employersDataTable");
            Session.Remove("tmptbl_utilitiesDataTable");
            Session.Remove("tmptbl_equipentsDataTable");
            Session.Remove("CodePeigiri");
            Session.Remove("IsInEditingMode");
        }
        // ارتباط با رویداد خروج و چک عدم ورود مجدد کد ملی
        string internationalCode = "this.form." + pnl_personal_information_form1.InternationalCode() + ".value = this.form." + txt_oh_international_code.ClientID + ".value ;";
        txt_oh_international_code.Attributes.Add("onblur", "validate()");
        //txt_oh_international_code.Attributes.Add("onKeyDown", "limitText(this.form." + txt_oh_international_code.ClientID + ",InternationalCounter,10);" + internationalCode);
        //txt_oh_international_code.Attributes.Add("onKeyUp", "limitText(this.form." + txt_oh_international_code.ClientID + ",InternationalCounter,10);" + internationalCode);
        txt_oh_international_code.Attributes.Add("maxlength", "10");
        txt_oh_international_code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_insurace_kargah.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");




        TextBox tx = (pnl_personal_information_form1.FindControl("txt_international_code") as TextBox);


        tx.Attributes.Add("onblur", "EqualTwoTextbox()");
        tx.Attributes.Add("maxlength", "10");
     //   tx.Attributes.Add("onKeyUp", "limitText(this.form." + tx.ClientID + ",InternationalCounter,10);" + internationalCode);
     //   tx.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
    }


    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void drp_o_sex_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public string ResizeAndSaveImage(FileUpload fu, bool HighQuality)  // کاهنده حجم عکس
    {


        


        string addr = "";
        string extension = "";
        string fileName = "";
        if (fu.HasFile)
        {
            addr = Guid.NewGuid().ToString();
            fileName = Server.HtmlEncode(fu.FileName);
            extension = System.IO.Path.GetExtension(fileName);

            if ((extension.ToUpper() == ".JPG") | (extension.ToUpper() == ".GIF"))
            {

                //**** Resize image section ****  
                System.Drawing.Image image_file = System.Drawing.Image.FromStream(fu.PostedFile.InputStream);
                int image_height = image_file.Height;
                int image_width = image_file.Width;
                int max_height = 0;
                int max_width = 0;


                if (HighQuality)
                {
                    max_height = 400;
                    max_width = 250;
                }
                else
                {
                    max_height = 80;
                    max_width = 50;
                }


                image_height = (image_height * max_width) / image_width;
                image_width = max_width;

                if (image_height > max_height)
                {
                    image_width = (image_width * max_height) / image_height;
                    image_height = max_height;
                }


                Bitmap bitmap_file = new Bitmap(image_file, max_width, max_height);
                System.IO.MemoryStream stream = new System.IO.MemoryStream();
                bitmap_file.Save(Server.MapPath("~/uploadedfiles") + "/" + addr + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);

            }
            return "../uploadedfiles/" + addr + ".jpg";

        }
        else { return ""; }




    }


    protected void btn_add_new_person_Click(object sender, EventArgs e)
    {
        /**/


        // فیلدهای ثابت بروز می شوند
        // جداول خارجی فیلدها حذف شده و مجددا ایجاد می شوند

        try
        {
            XmlDocument doc_person = new XmlDocument();
            XmlDocument doc_address = new XmlDocument();
            doc_person.InnerXml = pnl_personal_information_form1.get_frm_xml_with_value();
            doc_address.InnerXml = pnl_address_information_form1.get_frm_xml_with_value();
            if (txt_oh_international_code.Text == "")
            {
                txt_oh_international_code.Text = pnl_personal_information_form1.GetInternationalCode();
            }

            string idcode = "";

            if (Session["IsInEditingMode"] != null)
            {
                string cdpeig = Session["IsInEditingMode"].ToString();
                new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().Update
                    (
                        txt_oh_international_code.Text,
                        Convert.ToInt32(drp_oh_link_to_context_of_activity.SelectedValue),
                        Convert.ToInt32(DropDownList1.SelectedValue),
                        txt_oh_tax_code.Text,
                        txt_oh_insurace_kargah.Text,
                        doc_address.InnerXml,
                        doc_person.InnerXml,
                        Convert.ToInt32(cdpeig)

                     );

                frm_one_add_utilities1.update(cdpeig);
                frm_one_employers1.update(cdpeig);
                frm_one_equipments_in_hand1.update(cdpeig);
                idcode = cdpeig;

            }
            else
            {
                new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().Insert(
                        txt_oh_international_code.Text,
                        Convert.ToInt32(drp_oh_link_to_context_of_activity.SelectedValue),
                        Convert.ToInt32(DropDownList1.SelectedValue),
                        txt_oh_tax_code.Text,
                        txt_oh_insurace_kargah.Text, doc_address.InnerXml, doc_person.InnerXml);
                idcode = new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().Get_id_from_international_code(txt_oh_international_code.Text).Value.ToString();

                frm_one_add_utilities1.insert(idcode);
                frm_one_employers1.insert(idcode);
                frm_one_equipments_in_hand1.insert(idcode);
            }



            string ur = "http://" + Request.Url.Authority;
            for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
            {
                ur += Request.Url.Segments[i];
            }
            string srf = ur;
            //ur = "http://localhost:8024/CodePeigiriGenerator.aspx?codepeigiri=" + idcode + "&mdname=" + "1";
            ur += "CodePeigiriGenerator.aspx?codepeigiri=" + idcode + "&mdname=" + "1";
            //string crf = "CodePei" + Guid.NewGuid().ToString() + ".jpg";
            //string cmplurl = Server.MapPath("~/uploadedfiles/" + crf);
            //WebsiteToImage websiteToImage = new WebsiteToImage(ur, @"" + cmplurl);
            //websiteToImage.Generate();
            // ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + srf + "uploadedfiles/" + crf + "','_blank')", true);
            ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + ur + "','_blank');window.location.href=window.location.href;", true);
            //*Response.Redirect(Request.Url.AbsoluteUri);
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "j03", "alert('ثبت گردید');", true);
        }
        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','" + Request.Url.AbsoluteUri + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j03", "alert('لطفا در ورود کد ملی دقت نمایید');", true);

        }





    }

    public string GenerateNeededJavaScripts()
    {
        return "";
    }


    protected void btn_post_picture_Click(object sender, EventArgs e)
    {
        // img_pic_person.ImageUrl = ResizeAndSaveImage(fu_image_uploader, true);
    }
    protected void drp_oh_link_to_country_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {


    }
    protected void rb_AddNew_CheckedChanged(object sender, EventArgs e)
    {
        pnl_international_code.Visible = true;
        pnl_peigiri_code.Visible = false;

    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        pnl_international_code.Visible = false;
        pnl_peigiri_code.Visible = true;

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //  ویرایش فرد حقیقی
try
{    
        string CodePeigiri = txt_code_pergiri.Text;

        if (new tbl_ones_haghighiTableAdapter().check_id_is_avlbl_or_not(Convert.ToInt32(txt_code_pergiri.Text)).Value != 0)
        {

            DataRow dr = new tbl_ones_haghighiTableAdapter().GetDataBy4(Convert.ToInt32(CodePeigiri)).Rows[0];


            // فرا خوانی ایکس ام ال ها
            new main_class().XmlToFormForEditing(dr["oh_personal_inf"].ToString(), pnl_personal_information_form1);
            new main_class().XmlToFormForEditing(dr["oh_address_office"].ToString(), pnl_address_information_form1);
            txt_oh_tax_code.Text = dr["oh_tax_code"].ToString();
            txt_oh_insurace_kargah.Text = dr["oh_insurance_code"].ToString();
            drp_oh_link_to_context_of_activity.SelectedValue = dr["oh_link_to_context_of_activity"].ToString();
            DropDownList1.SelectedValue = dr["oh_link_to_complex"].ToString();
            Session["CodePeigiri"] = txt_code_pergiri.Text;
            frm_one_add_utilities1.CodePeigiri = CodePeigiri;
            frm_one_add_utilities1.isEditing = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
        }
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
        Session.Remove("CodePeigiri");
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
