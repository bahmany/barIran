using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            string tp = new main_class().GetCompanyName(Convert.ToInt32(TextBox1.Text));
            
            if (tp != "0")
            {
                Session["type"] = TextBox1.Text;
                Session["coname"] = tp;
                Session["idid"] = TextBox1.Text;

                string ur = "http://" + Request.Url.Authority;
                for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
                {
                    ur += Request.Url.Segments[i];
                }
                string srf = ur;
                ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('" + "loader.aspx?moduleid=ورود اطلاعات راننده ها" + "','_blank')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
            }
        }
        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','" + Request.Url.AbsoluteUri + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
        }


    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
       try
        {
            string tp = new main_class().GetCompanyName(Convert.ToInt32(TextBox2.Text));

            if (tp != "0")
            {
                Session["type"] = TextBox2.Text;
                Session["coname"] = tp;
                Session["idid"] = TextBox2.Text;

                string ur = "http://" + Request.Url.Authority;
                for (int i = 0; (i + 1) < Request.Url.Segments.Length; i++)
                {
                    ur += Request.Url.Segments[i];
                }
                string srf = ur;
                ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "j01", "window.open('frm_cars.aspx','_blank')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
            }
        }
        catch (Exception __e)
        {
            string errmsg = __e.Message;
            errmsg = errmsg.Replace("'", " ");
            new main_class().execute_command("insert into tbl_errors(e_err,e_uri) values ('" + errmsg + "','" + Request.Url.AbsoluteUri + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j02", "alert('یافت نشد');", true);
        }
    }
}
