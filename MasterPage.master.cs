using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;
using Persia;
using Telerik.Web.UI;



public partial class MasterPage : System.Web.UI.MasterPage
{





    protected void Page_Load(object sender, EventArgs e)
    {
        RadAjaxManager.GetCurrent(Page);
        try
        {


        if (Page.AppRelativeVirtualPath != "~/login.aspx")
        {
            
                    string username = Request.Cookies["username"].Value.ToString();
                    string pass = Request.Cookies["password"].Value.ToString();
                    string ownerid = Request.Cookies["owner"].Value.ToString();
                    string userWeight = Request.Cookies["userWeight"].Value.ToString();
                    string useridfromDB = new main_class().Encode(((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString());
                    Session["owner"] = ((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString();
                    Session["OwnerID"] = ((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString();
                    Session["userWeight"] = userWeight;
                    Session["username"] = username;
                    Session["password"] = pass;
          }
        }
            catch (Exception __e)
            {
               Response.Redirect("login.aspx");
            }
    }



    public string GetFootInformation()
    {
        string dtr = "";
        string username = "میهمان";
        Persia.SunDate persiandate = new SunDate();
        persiandate = Persia.Calendar.ConvertToPersian(DateTime.Now);
       



        //lbldate.Text = persiandate.Weekday;


        //string dt = FormatDateTime( 


        if (Session["username"] != null)
        {
            username = Session["username"].ToString();

        }
        dtr =
            "امروز  <b>" + (persiandate.Weekday) + "</b>"
            + "  &nbsp;&nbsp;&nbsp;&nbsp; <span id=\"digitalclock\">111111</span>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " +
            "کاربر جاری : <b>" + username + "</b>  <a class=\"exit\" href=\"exit.aspx\"> ( خروج ) </a>";
        return dtr;

    }


}
