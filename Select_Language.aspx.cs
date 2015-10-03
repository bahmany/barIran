using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Select_Language : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("links.aspx?command_type=1&order=1");
        /* HttpCookie MyCookie = new HttpCookie("Language_ID");
        DateTime now = DateTime.Now;
        MyCookie.Value = "2";
        MyCookie.Expires = now.AddYears(2);
        Response.Cookies.Add(MyCookie);
        Response.Redirect("default.aspx"); */
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("links.aspx?command_type=1&order=2");
        /*  HttpCookie MyCookie = new HttpCookie("Language_ID");
          DateTime now = DateTime.Now;
          MyCookie.Value = "1";
          MyCookie.Expires = now.AddYears(2);
          Response.Cookies.Add(MyCookie);
          Response.Redirect("default.aspx"); */
    }
}
