using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class ascx_pnl_address_information_form : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        txt_name.Attributes.Add("lang", "fa");
        txt_family.Attributes.Add("lang", "fa");
        txt_fathername.Attributes.Add("lang", "fa");
        txt_birth_place.Attributes.Add("lang", "fa");
        txt_registration_place.Attributes.Add("lang", "fa");
        txt_shsh.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_serial_1.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_serial_3.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_shsh.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_insurance_Code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        drp_oh_link_to_education.Attributes.Add("onchange", "chkEducation(this)");
        drp_oh_link_to_education.Attributes.Add("onKeyUp", "chkEducation(this)");
        drp_oh_link_to_education.Attributes.Add("onKeyDown", "chkEducation(this)");
*/
        txt_oh_floor.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_unit.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_postal_code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_tel.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_tel_nec.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_mob.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        txt_oh_fax.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");

        txt_oh_city_city.Attributes.Add("onKeyPress", "return  onlyAlp(event)");


    }


    protected void btn_post_picture_Click(object sender, EventArgs e)
    {

    }

    public string _GenerateNeededNullValidationJavaScripts()
    {

        
        // Null Validator
        string str=
        string.Format(
        "AddToNotNullValidator(\"{0}\",\"{1}\",\"{2}\");" +
        "AddToNotNullValidator(\"{3}\",\"{4}\",\"{5}\");" +
        "AddToNotNullValidator(\"{6}\",\"{7}\",\"{8}\");",
        txt_oh_city_city.ClientID, "لطفا شهر را وارد نمایید", "",
        txt_oh_street_main1.ClientID, "لطفا خیابان اصلی 1 را وارد نمایید", "",
        txt_oh_postal_code.ClientID, "لطفا کد پستی را وارد نمایید", "");
        return str;


    }

    protected void xmlElement(XmlDocument doc,XmlElement root, string name, string value)
    {
        XmlElement xmlname = doc.CreateElement(name);
        xmlname.InnerText = value;
        root.AppendChild(xmlname);
    }




    public string get_frm_xml_with_value()
    {
        
        XmlDocument doc = new XmlDocument();
        XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", null, null);
        doc.AppendChild(dec);
        XmlElement root = doc.CreateElement("AddressInformation");
        doc.AppendChild(dec);
        xmlElement(doc, root, "txt_oh_city_city", txt_oh_city_city.Text);
        xmlElement(doc, root, "txt_oh_exp", txt_oh_exp.Text);
        xmlElement(doc, root, "txt_oh_fax", txt_oh_fax.Text);
        xmlElement(doc, root, "txt_oh_floor", txt_oh_floor.Text);
        xmlElement(doc, root, "txt_oh_mob", txt_oh_mob.Text);
        xmlElement(doc, root, "txt_oh_pelak", txt_oh_pelak.Text);
        xmlElement(doc, root, "txt_oh_postal_code", txt_oh_postal_code.Text);
        xmlElement(doc, root, "txt_oh_street_main1", txt_oh_street_main1.Text);
        xmlElement(doc, root, "txt_oh_street_main2", txt_oh_street_main2.Text);
        xmlElement(doc, root, "txt_oh_street_other1", txt_oh_street_other1.Text);
        xmlElement(doc, root, "txt_oh_street_other2", txt_oh_street_other2.Text);
        xmlElement(doc, root, "txt_oh_tel", txt_oh_tel.Text);
        xmlElement(doc, root, "txt_oh_tel_nec", txt_oh_tel_nec.Text);
        xmlElement(doc, root, "txt_oh_unit", txt_oh_unit.Text);
        xmlElement(doc, root, "drp_oh_link_to_city", drp_oh_link_to_city.SelectedValue.ToString());
        xmlElement(doc, root, "drp_oh_link_to_country", drp_oh_link_to_country.SelectedValue.ToString());
        doc.AppendChild(root);
        return doc.InnerXml;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        





    }
    protected void drp_oh_link_to_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        drp_oh_link_to_city.Enabled = true;
        if ((sender as DropDownList).SelectedItem.Text != "ایران")
        {
            drp_oh_link_to_city.Enabled = false;
        }
        else
        {
            drp_oh_link_to_city.DataBind();
        }

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        drp_oh_link_to_city.DataBind();
    }
}
