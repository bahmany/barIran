using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        Response.Cookies.Clear();
        Response.Cookies.Add(new HttpCookie("username", ""));
        Response.Cookies.Add(new HttpCookie("password", ""));
        Response.Cookies.Add(new HttpCookie("owner", ""));
        Response.Cookies.Add(new HttpCookie("userWeight", ""));
        Response.Redirect("login.aspx");
    }
}
