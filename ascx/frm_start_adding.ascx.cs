using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ascx_frm_start_adding : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void drp_select_add_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        // لود لیست مراحل 
        dl_select_from_drp.DataBind();


        if (((DataView)(ods_selected_maps.Select())).Table.Rows.Count == 0)
        {
            btn_start_add_new.Visible = false;
        }
        else
        {
            btn_start_add_new.Visible = true;
        }

    }
    protected void ods_selected_maps_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
       
    }
    protected void btn_start_add_new_Click(object sender, EventArgs e)
    {
       
    }
}
