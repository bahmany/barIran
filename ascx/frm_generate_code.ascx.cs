using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ascx_frm_generate_code : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (TextBox38.Text != "")

            Label1.Text = "0251-2238-3543";
        if (TextBox39.Text != "")

            Label2.Text = "0251-2238-27-04";
        if (TextBox38.Text == "")

            Label1.Text = "";
        if (TextBox39.Text == "")

            Label2.Text = "";

    }
}
