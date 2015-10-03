using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;

public partial class ascx_frm_one_add_utilities : System.Web.UI.UserControl
{

    public bool isEditing = false;
    public string CodePeigiri = "";

    protected void Page_Load(object sender, EventArgs e)
    {


        if (isEditing)
        //if (isEditing)
        {
            Session.Remove("tmptbl_utilitiesDataTable");
            int code = Convert.ToInt32(CodePeigiri);
            isEditing = false;
            DataTable dtd = new tbl_ones_utilitiesTableAdapter().GetDataBy1(code);
            MainDataModule.tmptbl_utilitiesDataTable dt = new MainDataModule.tmptbl_utilitiesDataTable();
            if (Session["tmptbl_utilitiesDataTable"] != null)
            {
                dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
            }
            foreach (DataRow dr in dtd.Rows)
            {
                MainDataModule.tmptbl_utilitiesRow row = (MainDataModule.tmptbl_utilitiesRow)dt.NewRow();
                row["کد از طریق"] = dr["ou_link_to_ones_utilities_by"];
                row["از طریق"] = new tbl_ones_utilities_byTableAdapter().ScalarQuery(Convert.ToInt32(dr["ou_link_to_ones_utilities_by"]));
                row["مکان"] = dr["ou_place"];
                row["چه کسانی"] = dr["ou_by"];
                row["نوع"] = dr["ou_type"];
                row["تعداد"] = dr["ou_amount"];
                row["id"] = (dt.Rows.Count + 1).ToString();
                dt.Rows.Add(row);

            }
            Session["tmptbl_utilitiesDataTable"] = dt;
            updateGrid(dt);
            GridView1.DataBind();


        }




        if (Session["tmptbl_utilitiesDataTable"] != null)
        {
            MainDataModule.tmptbl_utilitiesDataTable dt = new MainDataModule.tmptbl_utilitiesDataTable();
            dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        GridView1.DataBind();

        UpdatePanel1.Update();
    }

    public void updateGrid(DataTable dt)
    {
        Session["tmptbl_utilitiesDataTable"] = dt;
        GridView1.DataSource = dt;


        GridView1.DataBind();

    }

    public void Button1_Click(object sender, EventArgs e)
    {
        
        //GridView1.DataBind();
        

        // ساخت دیتا تیبل از طریق مراجعه به حافظه
        MainDataModule.tmptbl_utilitiesDataTable dt = new MainDataModule.tmptbl_utilitiesDataTable();
        if (Session["tmptbl_utilitiesDataTable"] != null)
        {
            dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
        }
        MainDataModule.tmptbl_utilitiesRow row = (MainDataModule.tmptbl_utilitiesRow)dt.NewRow();
        row["کد از طریق"] = DropDownList1.SelectedValue;
        row["از طریق"] = DropDownList1.SelectedItem.Text;
        row["مکان"] = TextBox2.Text;
        row["چه کسانی"] = TextBox3.Text;
        row["نوع"] = DropDownList2.SelectedValue;
        row["تعداد"] = TextBox1.Text;
        row["id"] = (dt.Rows.Count + 1).ToString();
        if (new main_class().IsDuplicateRow(dt, row))
        {
            ScriptManager.RegisterStartupScript(this, Page.GetType(), "j02", "alert('Duplicated');", true);
        }
        
        dt.Rows.Add(row);
        updateGrid(dt);


     

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        // حذف یک رکورد از طریق آی دی آن که به تول تیپ منتقل شده و آسانترین راه میباشد
        if (Session["tmptbl_utilitiesDataTable"] != null)
        {
            string tltp = (sender as Button).ToolTip;

            MainDataModule.tmptbl_utilitiesDataTable dt = new MainDataModule.tmptbl_utilitiesDataTable();
            dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_utilitiesRow dr in dt.Rows)
            {
                if (dr["id"].ToString() == tltp)
                {
                    del_i = i;
                }

                i++;
            }

            if (del_i != -1)
            {
                dt.Rows[del_i].Delete();
            }

            updateGrid(dt);

        }
    }



    public void insert(string idcode)
    {
        MainDataModule.tmptbl_utilitiesDataTable dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
        if (dt != null)

        foreach (MainDataModule.tmptbl_utilitiesRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_utilitiesTableAdapter().Insert
                (
                Convert.ToInt32(row["کد از طریق"].ToString()),
                Convert.ToInt32(row["تعداد"].ToString()),
                row["مکان"].ToString(),
                row["چه کسانی"].ToString(),
                Convert.ToInt32(row["نوع"].ToString()),
                Convert.ToInt32(idcode), 1
                );
        }
    }
    public void update(string idcode)
    {
        new MainDataModuleTableAdapters.tbl_ones_utilitiesTableAdapter().DeleteQuery(Convert.ToInt32(idcode));
        MainDataModule.tmptbl_utilitiesDataTable dt = (MainDataModule.tmptbl_utilitiesDataTable)Session["tmptbl_utilitiesDataTable"];
        if (dt != null) 
        foreach (MainDataModule.tmptbl_utilitiesRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_utilitiesTableAdapter().Insert
                (
                Convert.ToInt32(row["کد از طریق"].ToString()),
                Convert.ToInt32(row["تعداد"].ToString()),
                row["مکان"].ToString(),
                row["چه کسانی"].ToString(),
                Convert.ToInt32(row["نوع"].ToString()),
                Convert.ToInt32(idcode), 1
                );
        }
    }


}
