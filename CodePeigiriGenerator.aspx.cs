using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CodePeigiriGenerator : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_code.Text = Request.QueryString["codepeigiri"].ToString();
        lbl_date.Text = new FarsiLibrary.Utils.PersianDate(DateTime.Now).ToWritten();
        if (Request.QueryString["mdname"].ToString() == "1") Label1.Text = "فعال حقیقی";
        if (Request.QueryString["mdname"].ToString() == "2") Label1.Text = "فعال حقوقی";
        if (Request.QueryString["mdname"].ToString() == "3") Label1.Text = "راننده ها";
        if (Request.QueryString["mdname"].ToString() == "4") Label1.Text = "وسیله ی نقلیه";
        lbl_code.Text = new main_class().ShowWithDeparated(3, lbl_code.Text);

    }
}
