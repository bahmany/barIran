using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("login.aspx");

        if (Request.Cookies["username"] == null)
        {
            Response.Redirect("login.aspx");
        }


        if (Request.QueryString["pid"] != null)
        {
            RadTreeView1.ExpandAllNodes();

            pnl_loader.Controls.Clear();

            int pid = Convert.ToInt16(Request.QueryString["pid"].ToString());
            if (pid == 1)
            {
                Control cnt = LoadControl("ascx\\frm_driver_add_new.ascx");
                pnl_loader.Controls.Add(cnt);
            }
            if (pid == 2)
            {
                Control cnt = LoadControl("ascx\\frm_car_add_new.ascx");
                pnl_loader.Controls.Add(cnt);
            }
            if (pid == 3)
            {
                Control cnt = LoadControl("ascx\\frm_parking_add_new.ascx");
                pnl_loader.Controls.Add(cnt);
            }
        }
    }
}
