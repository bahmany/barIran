using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Xml;
using MainDataModuleTableAdapters;
using System.Data;

public partial class frm_cars : System.Web.UI.Page
{

    public string ResizeAndSaveImage(FileUpload fu, bool HighQuality)  //    کاهنده حجم عکس
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
                    max_height = 600;
                    max_width = 800;
                }
                else
                {
                    max_height = 60;
                    max_width = 80;
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
            return "~/uploadedfiles/" + addr + ".jpg";

        }
        else { return ""; }




    }
    public string get_txt_c_VIN()   //    تابع برگردان کلاینک ای دی
    {
        return txt_c_VIN.ClientID;
    }
    public string GetInsertBtnName() // تابع برگردان کلاینک ای دی
    {
        return btn_car_post.ClientID;
    }
    protected void btn_image1_Click(object sender, EventArgs e)
    {
        string path = ResizeAndSaveImage(fu_car_pic_uploader, true);
        img_view1.ImageUrl = path;
        Session["img_view1"] = path;
        Session["img_view2"] = img_view2.ImageUrl;
        Session["img_view3"] = img_view3.ImageUrl;

    }
    protected void btn_image2_Click(object sender, EventArgs e)
    {
        string path = ResizeAndSaveImage(fu_car_pic_uploader, true);
        img_view2.ImageUrl = path;
        Session["img_view2"] = path;
        Session["img_view1"] = img_view1.ImageUrl;
        Session["img_view3"] = img_view3.ImageUrl;

    }
    protected void btn_image3_Click(object sender, EventArgs e)
    {
        string path = ResizeAndSaveImage(fu_car_pic_uploader, true);
        img_view3.ImageUrl = path;
        Session["img_view3"] = path;
        Session["img_view2"] = img_view2.ImageUrl;
        Session["img_view1"] = img_view1.ImageUrl;

    }
    public bool is_vin_unique(string vin)
    {
        bool bl = false;
        if (new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_From_VIN1(vin) == null)
        {
            bl = true;
        }
        else
        {
            bl = false;
        }

        return bl;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        txt_c_VIN.Attributes.Add("onblur", "validate()");
        txt_c_driver_code.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");


        if (Session["coname"] != null)
        {
            Label1.Text = Session["coname"].ToString();
        }
        else
        {
            Response.Redirect("default.aspx");
        }


        if (IsPostBack)
        {
            string img1 = img_view1.ImageUrl;
            string img2 = img_view2.ImageUrl;
            string img3 = img_view3.ImageUrl;



            if (Session["img_view1"] != null)
            {
                img_view1.ImageUrl = Session["img_view1"].ToString();
            }

            if (Session["img_view2"] != null)
            { img_view2.ImageUrl = Session["img_view2"].ToString(); }

            if (Session["img_view3"] != null)
            { img_view3.ImageUrl = Session["img_view3"].ToString(); }
        }
        else
        {

        }

        if (!IsPostBack)
        {
            Session.Remove("img_view1");
            Session.Remove("img_view2");
            Session.Remove("img_view3");
        }



    }

    public string GenerateNeededNullValidationJavaScripts()
    {
        // Null Validator
        string str =
            string.Format(
            "AddToNotNullValidator(\"{0}\",\"{1}\",\"{2}\");"+
            "AddToNotNullValidator(\"{3}\",\"{4}\",\"{5}\");"+
            "AddToNotNullValidator(\"{6}\",\"{7}\",\"{8}\");"+
            "AddToNotNullValidator(\"{9}\",\"{10}\",\"{11}\");"+
            "AddToNotNullValidator(\"{12}\",\"{13}\",\"{14}\");",
            txt_c_VIN.ClientID, "شماره شناسنامه را وارد نمایید", "",
            txt_c_pelak_part1.ClientID, "شماره شناسنامه را وارد نمایید", "",
            txt_c_pelak_part3.ClientID, "شماره شناسنامه را وارد نمایید", "",
            txt_c_pelak_part3.ClientID, "شماره شناسنامه را وارد نمایید", "",
            txt_c_iran.ClientID, "شماره شناسنامه را وارد نمایید", "");
        //---------------------------
        return str;

    }


    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
    protected void btn_car_post_Click(object sender, EventArgs e)
    {
        
        string img1 = img_view1.ImageUrl;
        string img2 = img_view2.ImageUrl;
        string img3 = img_view3.ImageUrl;

        img1 = Session["img_view1"].ToString();
        img2 = Session["img_view2"].ToString();
        img3 = Session["img_view3"].ToString();

        string cdpeig = "";
        if (Session["CodePeigiri"] == null)
        {
            if (new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_From_VIN1(txt_c_VIN.Text) == null)
            {
                XmlDocument doc_person = new XmlDocument();
                doc_person.InnerXml = pnl_personal_information_form1.get_frm_xml_with_value();
                string co_id = Session["type"].ToString();

                if (co_id == "")
                {
                    ScriptManager.RegisterClientScriptBlock(
    this, Page.GetType(),
    "j01", "alert(' لطفا مجددا نام شرکت مورد نظر را وارد نمایید ');window.location = \"default.aspx\";", true
    );
                    Response.Redirect("default.aspx");      
                }


                new MainDataModuleTableAdapters.tbl_carsTableAdapter().Insert
                    (
                  txt_c_pelak_part1.Text,
                  Convert.ToInt32(drp_c_pelak_part2.SelectedValue),
                  txt_c_pelak_part3.Text,
                  Convert.ToInt32(txt_c_iran.Text),
                  Convert.ToInt32(drp_c_link_to_car_types.SelectedValue),
                  txt_c_car_tips.Text,
                  Convert.ToInt32(drp_c_link_to_using_types.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_color.SelectedValue),
                  Convert.ToInt32(txt_c_year_of_made.Text),
                  Convert.ToInt32(drp_c_link_to_system_of_gas.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_type_of_gas_controller.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_system_of_gas.SelectedValue),
                  Convert.ToInt32(txt_c_cylinder.Text),
                  Convert.ToInt32(txt_c_weil_count.Text),
                  Convert.ToInt32(txt_c_circuity_count.Text),
                  Convert.ToInt32(txt_c_amount_of_motor.Text),
                  txt_c_number_of_motor.Text,
                  txt_c_number_of_shasi.Text,
                  Convert.ToInt32(txt_c_capacity.Text),
                  txt_c_VIN.Text,
                  0,
                  Convert.ToInt32(drp_c_link_to_owning_types.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_kind.SelectedValue) ,
                  Convert.ToInt32(co_id), doc_person.InnerXml.ToString(), 0,
                  Convert.ToInt32(txt_c_driver_code.Text),
                  img1,
                  img2,
                  img3,
                  Convert.ToInt64(txt_c_driver_code.Text)
                  );


                cdpeig = new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_from_VIN
                    (txt_c_VIN.Text).Value.ToString();
                

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(
                    this, Page.GetType(),
                    "j01", "alert(' این وسیله قبلا ثبت شده است ');", true
                    );
            }


        }
        else
        {
            //if (new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_From_VIN1(txt_c_VIN.Text) != null)
            {
                int int_txt_c_driver_code =0;
                int int_code_peigiri = 0;
                if (txt_c_driver_code.Text != "")
                {
                   // int_txt_c_driver_code = Convert.ToInt32(Session["idid"].ToString());
                }
                if (txt_c_driver_code.Text!= "")
                {
                    int_code_peigiri = Convert.ToInt32(txt_c_driver_code.Text);
                }
                
                int _type = Convert.ToInt32(Session["type"].ToString());
                XmlDocument doc_person = new XmlDocument();
                doc_person.InnerXml = pnl_personal_information_form1.get_frm_xml_with_value();
                new MainDataModuleTableAdapters.tbl_carsTableAdapter().Update
                    (
                  txt_c_pelak_part1.Text,
                  Convert.ToInt32(drp_c_pelak_part2.SelectedValue),
                  txt_c_pelak_part3.Text,
                  Convert.ToInt32(txt_c_iran.Text),
                  Convert.ToInt32(drp_c_link_to_car_types.SelectedValue),
                  txt_c_car_tips.Text,
                  Convert.ToInt32(drp_c_link_to_using_types.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_color.SelectedValue),
                  Convert.ToInt32(txt_c_year_of_made.Text),
                  Convert.ToInt32(drp_c_link_to_system_of_gas.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_type_of_gas_controller.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_system_of_gas.SelectedValue),
                  Convert.ToInt32(txt_c_cylinder.Text),
                  Convert.ToInt32(txt_c_weil_count.Text),
                  Convert.ToInt32(txt_c_circuity_count.Text),
                  Convert.ToInt32(txt_c_amount_of_motor.Text),
                  txt_c_number_of_motor.Text,
                  txt_c_number_of_shasi.Text,
                  Convert.ToInt32(txt_c_capacity.Text),
                  txt_c_VIN.Text,
                  0,
                  Convert.ToInt32(drp_c_link_to_owning_types.SelectedValue),
                  Convert.ToInt32(drp_c_link_to_kind.SelectedValue),
                  _type, doc_person.InnerXml, 0,
                  int_code_peigiri,
                  img1,
                  img2,
                  img3,
                  int_code_peigiri,
                  Convert.ToInt32(Session["CodePeigiri"].ToString())
                  );


                

                cdpeig = new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_from_VIN
                    (txt_c_VIN.Text).Value.ToString();
            }
           /*
            else
            {
                ScriptManager.RegisterClientScriptBlock(
                    this, Page.GetType(),
                    "j01", "alert(' این وسیله قبلا ثبت شده است ');", true
                    );
            }*/

        }



        string ur = "http://" + Request.Url.Authority;
        for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
        {
            ur += Request.Url.Segments[i];
        }
        string srf = ur;
        ur += "CodePeigiriGenerator.aspx?codepeigiri=" + cdpeig + "&mdname=" + "4";
        ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + ur + "','_blank');window.location.href=window.location.href;", true);
        Session.Remove("CodePeigiri");


    }
    protected void drp_c_owner_kind_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((sender as DropDownList).SelectedIndex == 1) { pnl_personal_information_form1.Visible = true; }
        else
        { pnl_personal_information_form1.Visible = false; }

    }


    public int GoToEditMode(int CodePeigiri)
    {
        int RowEf = 0;
        string im1 = "";
        string im2 = "";
        string im3 = "";
        if (new tbl_carsTableAdapter().GetDataBy2(CodePeigiri) != null)
        {
            RowEf = 1;

            DataRow dr = new tbl_carsTableAdapter().GetDataBy2(CodePeigiri).Rows[0];
            
            if (dr["c_img1"] != null) im1 = dr["c_img1"].ToString();
            if (dr["c_img2"] != null) im2 = dr["c_img2"].ToString();
            if (dr["c_img3"] != null) im3 = dr["c_img3"].ToString();
            Session["img_view1"] = im1;
            Session["img_view2"] = im2;
            Session["img_view3"] = im3;
            txt_c_amount_of_motor.Text = dr["c_amount_of_motor"].ToString();
            txt_c_capacity.Text = dr["c_capacity"].ToString();
            txt_c_car_tips.Text = dr["c_car_tips"].ToString();
            txt_c_circuity_count.Text = dr["c_circuity_count"].ToString();
            txt_c_cylinder.Text = dr["c_cylinder"].ToString();
            txt_c_driver_code.Text = dr["c_driver_code"].ToString();
            txt_c_iran.Text = dr["c_iran"].ToString();
            txt_c_number_of_motor.Text = dr["c_number_of_motor"].ToString();
            txt_c_number_of_shasi.Text = dr["c_number_of_shasi"].ToString();
            txt_c_pelak_part1.Text = dr["c_pelak_part1"].ToString();
            txt_c_pelak_part3.Text = dr["c_pelak_part3"].ToString();
            txt_c_VIN.Text = dr["c_VIN"].ToString();
            txt_c_weil_count.Text = dr["c_weil_count"].ToString();
            txt_c_year_of_made.Text = dr["c_year_of_made"].ToString();
            //txt_code_peigiri.Text = dr["code_peigiri"].ToString();
            drp_c_link_to_car_types.SelectedValue = dr["c_link_to_car_types"].ToString();
            drp_c_link_to_color.SelectedValue = dr["c_link_to_color"].ToString();
            drp_c_link_to_kind.SelectedValue = dr["c_link_to_kind"].ToString();
            drp_c_link_to_owning_types.SelectedValue = dr["c_link_to_owning_types"].ToString();
            drp_c_link_to_system_of_gas.SelectedValue = dr["c_link_to_system_of_gas"].ToString();
            drp_c_link_to_type_of_gas_controller.SelectedValue = dr["c_link_to_type_of_gas_controller"].ToString();
            drp_c_link_to_using_types.SelectedValue = dr["c_link_to_using_types"].ToString();
            drp_c_pelak_part2.SelectedValue = dr["c_link_pelak_part2"].ToString();
            new main_class().XmlToFormForEditing(dr["c_personal_inf"].ToString(), pnl_personal_information_form1);
            img_view1.ImageUrl = im1;
            img_view2.ImageUrl = im2;
            img_view3.ImageUrl = im3;


            if (drp_c_owner_kind.SelectedValue == "0")
            {
                pnl_personal_information_form1.Visible = true;
            }
        
        }


        return RowEf;
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            int CodePeigiri = Convert.ToInt32(txt_code_peigiri.Text);
            Session["CodePeigiri"] = CodePeigiri;
            GoToEditMode(CodePeigiri);
        }

        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','" + Request.Url.AbsoluteUri + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');window.location.href=window.location.href;", true);
        }
    }
    protected void rb_edit_CheckedChanged(object sender, EventArgs e)
    {
        pnl_code_peigiri.Visible = true;
    }
    protected void btn_add_new_Click(object sender, EventArgs e)
    {
        Session.Remove("CodePeigiri");
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
