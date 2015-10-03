using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using MainDataModuleTableAdapters;
using System.Xml;
using System.Data;

public partial class ascx_frm_driver_add_new : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session.Remove("imagepath");
        }


        if (Session["imagepath"] != null)
        {
            img_pic_person.ImageUrl = Session["imagepath"].ToString();
        }

        // ارتباط با رویداد خروج و چک عدم ورود مجدد کد ملی
        txt_o_international_code.Attributes.Add("onblur", "validate()");
        if (Session["coname"] != null)
        {
            Label1.Text = Session["coname"].ToString();
        }
        else
        {
            Response.Redirect("default.aspx");
        }
        // ارتباط با رویداد خروج و چک عدم ورود مجدد کد ملی
        string internationalCode = "this.form." + pnl_personal_information_form1.InternationalCode() + ".value = this.form." + txt_o_international_code.ClientID + ".value ;";
        txt_o_international_code.Attributes.Add("onblur", "EqualTwoTextbox()");
        //txt_o_international_code.Attributes.Add("onKeyDown", "limitText(this.form." + txt_o_international_code.ClientID + ",InternationalCounter,10);" + internationalCode);
        //txt_o_international_code.Attributes.Add("onKeyUp", "limitText(this.form." + txt_o_international_code.ClientID + ",InternationalCounter,10);" + internationalCode);
        txt_o_international_code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        TextBox tx = (pnl_personal_information_form1.FindControl("txt_international_code") as TextBox);
        tx.Attributes.Add("onblur", "EqualTwoTextbox()");
       tx.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
    }

    protected void btn_add_new_person_Click(object sender, EventArgs e)
    {
        string cdpeig = "";
        XmlDocument doc_person = new XmlDocument();
        XmlDocument doc_address = new XmlDocument();
        doc_person.InnerXml = pnl_personal_information_form1.get_frm_xml_with_value();
        doc_address.InnerXml = pnl_address_information_form1.get_frm_xml_with_value();
        if (Session["imagepath"] == null) Session["imagepath"] = "0";

        if (Session["CodePeigiri"] == null)
        {
            new MainDataModuleTableAdapters.tbl_onesTableAdapter().Insert(
                txt_o_international_code.Text,
                Session["imagepath"].ToString(),
                txt_o_yaraneh_bank_name.Text,
                txt_o_yaraneh_account_no.Text,
                Convert.ToInt32(drp_o_driver_license_type.SelectedValue),
                txt_o_driver_license_no.Text,
                txt_o_driver_license_reg_date.Text,
                txt_o_driver_license_reg_exp_date.Text,
                txt_o_exprience.Text,
                Convert.ToInt32(Session["type"].ToString()),
                        doc_address.InnerXml,
                        doc_person.InnerXml
             );
            cdpeig = new MainDataModuleTableAdapters.tbl_onesTableAdapter().Get_ID_from_international_code(txt_o_international_code.Text).Value.ToString();
            Session.Remove("imagepath");
        }
        else
        {
            cdpeig = Session["CodePeigiri"].ToString();
            new MainDataModuleTableAdapters.tbl_onesTableAdapter().Update(
                
                (pnl_personal_information_form1.FindControl("txt_international_code") as TextBox).Text
                
                ,

            Session["imagepath"].ToString(),
                txt_o_yaraneh_bank_name.Text,
                txt_o_yaraneh_account_no.Text,
                Convert.ToInt32(drp_o_driver_license_type.SelectedValue),
                txt_o_driver_license_no.Text,
                txt_o_driver_license_reg_date.Text,
                txt_o_driver_license_reg_exp_date.Text,
                txt_o_exprience.Text,
                Convert.ToInt32(Session["idid"].ToString()),
                        doc_address.InnerXml,
                        doc_person.InnerXml,
                        Convert.ToInt32(cdpeig)
             );
            Session.Remove("CodePeigiri");
            Session.Remove("imagepath");
        }



        string ur = "http://" + Request.Url.Authority;
        for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
        {
            ur += Request.Url.Segments[i];
        }
        string srf = ur;
        ur += "CodePeigiriGenerator.aspx?codepeigiri=" + cdpeig + "&mdname=" + "1";
        ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + ur + "','_blank');window.location.href=window.location.href;", true);

    }

    public string GetInsertBtnName() // تابع برگردان کلاینک ای دی
    {
        return btn_add_new_person.ClientID;
    }
    public string GetItxt_o_international_code() // تابع برگردان کلاینک ای دی
    {
        return txt_o_international_code.ClientID;
    }



    public string ResizeAndSaveImage(FileUpload fu, bool HighQuality)  // کاهنده حجم عکس
    {

        string addr = "";
        string extension = "";
        string fileName = "";
        if (fu_image_uploader.HasFile)
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string path = ResizeAndSaveImage(fu_image_uploader, true);
        img_pic_person.ImageUrl = path;
        Session["imagepath"] = path;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
       
    }


    protected void btn_next_Click(object sender, EventArgs e)
    {

    }


    public string GenerateNeededNullValidationJavaScripts()
    {
// Null Validator
        string str =
            string.Format(
            "AddToNotNullValidator(\"{0}\",\"{1}\",\"{2}\");",
            txt_o_international_code.ClientID, "شماره شناسنامه را وارد نمایید", "");
//---------------------------
        return str;

    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        pnl_add_new.Visible = true;
        pnl_edit.Visible = false;
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        pnl_add_new.Visible = false;
        pnl_edit.Visible = true;
    
    }

    public int GoToEditMode(int CodePeigiri)
    {
        int RowEf = 0;
        if (new tbl_ones_hoghoghiTableAdapter().GetDataBy3(CodePeigiri) != null)
        {
            RowEf = 1;

            DataRow dr = new tbl_onesTableAdapter().GetDataBy2(CodePeigiri).Rows[0];

            txt_o_international_code.Text = dr["o_international_code"].ToString();
            img_pic_person.ImageUrl = dr["o_image_address"].ToString();
            Session["imagepath"] = dr["o_image_address"].ToString();
            txt_o_driver_license_no.Text = dr["o_driver_license_no"].ToString();
            txt_o_driver_license_reg_date.Text = dr["o_driver_license_reg_date"].ToString();
            txt_o_driver_license_reg_exp_date.Text = dr["o_driver_license_reg_exp_date"].ToString();
            txt_o_exprience.Text = dr["o_exprience"].ToString();
            txt_o_yaraneh_account_no.Text = dr["o_yaraneh_account_no"].ToString();
            txt_o_yaraneh_bank_name.Text = dr["o_yaraneh_bank_name"].ToString();
            drp_o_driver_license_type.SelectedValue = dr["o_driver_license_type"].ToString();
            new main_class().XmlToFormForEditing(dr["o_address_office"].ToString(), pnl_address_information_form1);
            new main_class().XmlToFormForEditing(dr["o_personal_inf"].ToString(), pnl_personal_information_form1);
        }

        return RowEf;
    }






    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            int CodePeigiri = Convert.ToInt32(txt_code_pergiri.Text);
            Session["CodePeigiri"] = CodePeigiri;
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
        Session.Remove("CodePeigiri");
        Response.Redirect(Request.Url.AbsoluteUri);

    }
}
