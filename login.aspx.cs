using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {


        //if (RadioButton3.Checked)
        {
            try
            {
                Response.Cookies.Add(new HttpCookie("username", Login1.UserName));
                Response.Cookies.Add(new HttpCookie("password", new main_class().Encode(Login1.Password)));
                Response.Cookies.Add(new HttpCookie("owner", new MainDataModuleTableAdapters.tbl_usersTableAdapter().GetOwnerIDfromUsername(Login1.UserName, new main_class().Encode(Login1.Password)).ToString()));
                Response.Cookies.Add(new HttpCookie("userWeight", new MainDataModuleTableAdapters.tbl_usersTableAdapter().GetUserGroupWeight(Login1.UserName).ToString()));
                Response.Redirect("default.aspx");
            }
            catch
            {

            }
        }

        
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
 
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
 
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pnl_back.Visible  = true;
        pnl_btns.Visible  = false;
        pnl_login.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        pnl_back.Visible = true;
        pnl_btns.Visible = false;
        pnl_login.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        pnl_back.Visible = false;
        pnl_btns.Visible = false;
        pnl_login.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        pnl_back.Visible = false;
        pnl_btns.Visible = true;
        pnl_login.Visible = false;

    }
}
