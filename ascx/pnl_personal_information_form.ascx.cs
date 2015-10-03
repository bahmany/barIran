using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class ascx_pnl_personal_information_form : System.Web.UI.UserControl
{

 


    protected void Page_Load(object sender, EventArgs e)
    {
        txt_name.Attributes.Add("lang", "fa");
        txt_family.Attributes.Add("lang", "fa");
        txt_fathername.Attributes.Add("lang", "fa");
        txt_birth_place.Attributes.Add("lang", "fa");
        txt_registration_place.Attributes.Add("lang", "fa");
        txt_shsh.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        //txt_oh_serial_1.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        //txt_oh_serial_3.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        //txt_shsh.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_insurance_Code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        drp_oh_link_to_education.Attributes.Add("onchange", "chkEducation(this)");
        drp_oh_link_to_education.Attributes.Add("onKeyUp", "chkEducation(this)");
        drp_oh_link_to_education.Attributes.Add("onKeyDown", "chkEducation(this)");
      //  txt_insurance_Code.Attributes.Add("onKeyDown", "limitText(this.form." + txt_insurance_Code.ClientID + ",InternationalCounter,8);" );
      //  txt_insurance_Code.Attributes.Add("onKeyUp", "limitText(this.form." + txt_insurance_Code.ClientID + ",InternationalCounter,8);" );
        drp_oh_link_to_education.SelectedIndex = 4;// for education default select 


        txt_family.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        txt_fathername.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        txt_name.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        txt_oh_education_branch.Attributes.Add("onKeyPress", "return  onlyAlp(event)");



    }


    protected void btn_post_picture_Click(object sender, EventArgs e)
    {

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
            "AddToNotNullValidator(\"{18}\",\"{19}\",\"{20}\");" ,
            txt_shsh.ClientID, "شماره شناسنامه را وارد نمایید", "",
            txt_name.ClientID, "نام را وارد نمایید", "",
            txt_family.ClientID, "نام خانوادگی را وارد نمایید", "",
            txt_fathername.ClientID, "نام پدر را وارد کنید", "",
            txt_birthDate.ClientID, "تاریخ تولد را وارد کنید", "",
            txt_birth_place.ClientID, "محل تولد را وارد کنید", "",
            txt_registration_place.ClientID, "محل صدور شناسنامه را وارد کنید", "");
        //---------------------------




        return str;


    }

    protected void xmlElement(XmlDocument doc,XmlElement root, string name, string value)
    {
        XmlElement xmlname = doc.CreateElement(name);
        xmlname.InnerText = value;
        root.AppendChild(xmlname);
    }

    public string InternationalCode()
    {
        return txt_international_code.ClientID;
    }

    public string GetInternationalCode()
    {
        return txt_international_code.Text;
    }

    public void makeInternationalCodeEnable(bool enal)
    {
        txt_international_code.Enabled = enal;
    }

    public string get_frm_xml_with_value()
    {
        XmlDocument doc = new XmlDocument();
       
        XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", null, null);
        doc.AppendChild(dec);
        XmlElement root = doc.CreateElement("PersonalInformation");
        doc.AppendChild(dec);
        xmlElement(doc, root, "txt_birth_place", txt_birth_place.Text);
        xmlElement(doc, root, "txt_birthDate", txt_birthDate.Text);
        xmlElement(doc, root, "txt_family", txt_family.Text);
        xmlElement(doc, root, "txt_fathername", txt_fathername.Text);
        xmlElement(doc, root, "txt_insurance_Code", txt_insurance_Code.Text);
        xmlElement(doc, root, "txt_international_code", txt_international_code.Text);
        xmlElement(doc, root, "txt_name", txt_name.Text);
        xmlElement(doc, root, "txt_oh_education_branch", txt_oh_education_branch.Text);
        xmlElement(doc, root, "txt_oh_serial_1", "1");
        xmlElement(doc, root, "txt_oh_serial_3", "1");
        xmlElement(doc, root, "txt_registration_place", txt_registration_place.Text);
        xmlElement(doc, root, "txt_shsh", txt_shsh.Text);
        xmlElement(doc, root, "drp_oh_link_to_education", drp_oh_link_to_education.SelectedValue.ToString());
        xmlElement(doc, root, "drp_oh_sex", drp_oh_sex.SelectedValue.ToString());
        xmlElement(doc, root, "drp_txt_oh_serial_2", "1");
        xmlElement(doc, root, "img_pic_person", img_pic_person.ImageUrl);
       

        doc.AppendChild(root);
        return doc.InnerXml;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        





    }
}
