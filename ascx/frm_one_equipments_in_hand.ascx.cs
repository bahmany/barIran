using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;

public partial class ascx_frm_one_equipments_in_hand : System.Web.UI.UserControl
{
    public bool isEditing = false;
    public string CodePeigiri = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        oe_amount.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");
        oe_meter.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");



        if (isEditing)
        //if (isEditing)
        {
            Session.Remove("tmptbl_equipentsDataTable");
            int code = Convert.ToInt32(CodePeigiri);
            isEditing = false;
            DataTable dtd = new tbl_ones_equipmentsTableAdapter().GetDataBy1(code);
            MainDataModule.tmptbl_equipentsDataTable dt = new MainDataModule.tmptbl_equipentsDataTable();
            if (dt != null)
            foreach (DataRow dr in dtd.Rows)
            {
                MainDataModule.tmptbl_equipentsRow row = (MainDataModule.tmptbl_equipentsRow)dt.NewRow();
                row["نوع فعالیت"] = new tbl_ones_equipments_typesTableAdapter().ScalarQuery(Convert.ToInt32(dr["oe_link_to_ones_equipments_types"])); ;
                row["کد نوع فعالیت"] = dr["oe_link_to_ones_equipments_types"];
                row["نام"] = new tbl_ones_equipments_namesTableAdapter().ScalarQuery(Convert.ToInt32(dr["oe_link_to_ones_equipments_names"]));
                row["کد نام"] = dr["oe_link_to_ones_equipments_names"];
                row["تعداد"] = dr["oe_amount"];
                row["متراژ"] = dr["oe_meter"];
                row["id"] = (dt.Rows.Count + 1).ToString();
                dt.Rows.Add(row);
            }
            Session["tmptbl_equipentsDataTable"] = dt;
            updateGrid(dt);
            GridView1.DataBind();


        }





        if (Session["tmptbl_equipentsDataTable"] != null)
        {
            // مشاهده دیتا تیبا در رفرش شدن های مختلف صفحه
            MainDataModule.tmptbl_equipentsDataTable dt = new MainDataModule.tmptbl_equipentsDataTable();
            dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
            updateGrid(dt);
        }

    }


    // این تابع برای بروز رسانی جدول بکار بده شده در صفحه میباشد
    public void updateGrid(DataTable dt)
    {
        Session["tmptbl_equipentsDataTable"] = dt;
        GridView1.DataSource = dt;

        
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // ساخت دیتا تیبل از طریق مراجعه به حافظه
        MainDataModule.tmptbl_equipentsDataTable dt = new MainDataModule.tmptbl_equipentsDataTable();
        if (Session["tmptbl_equipentsDataTable"] != null)
        {
            dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
        }
        MainDataModule.tmptbl_equipentsRow row = (MainDataModule.tmptbl_equipentsRow) dt.NewRow();
        row["نوع فعالیت"] = oe_link_to_ones_equipments_types.SelectedItem.Text;
        row["کد نوع فعالیت"] = oe_link_to_ones_equipments_types.SelectedValue;
        row["نام"] = oe_link_to_ones_equipments_names.SelectedItem.Text;
        row["کد نام"] = oe_link_to_ones_equipments_names.SelectedValue;
        row["تعداد"] = oe_amount.Text;
        row["متراژ"] = oe_meter.Text;
        row["id"] = (dt.Rows.Count+1).ToString();
        dt.Rows.Add(row);
        updateGrid(dt);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        // حذف یک رکورد از طریق آی دی آن که به تول تیپ منتقل شده و آسانترین راه میباشد

        if (Session["tmptbl_equipentsDataTable"] != null)
        {
            string tltp = (sender as Button).ToolTip;

            MainDataModule.tmptbl_equipentsDataTable dt = new MainDataModule.tmptbl_equipentsDataTable();
            dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_equipentsRow dr in dt.Rows)
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
        MainDataModule.tmptbl_equipentsDataTable dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
        if (dt != null) 
            foreach (MainDataModule.tmptbl_equipentsRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_equipmentsTableAdapter().Insert
                (
                    Convert.ToInt32(row["کد نوع فعالیت"].ToString()),
                    Convert.ToInt32(row["کد نام"].ToString()),
                    Convert.ToDouble(row["تعداد"].ToString()),
                    Convert.ToDouble(row["متراژ"].ToString()),
                    Convert.ToInt32(idcode), 1
                );
        }

    }
    public void update(string idcode)
    {
        new MainDataModuleTableAdapters.tbl_ones_equipmentsTableAdapter().DeleteQuery(Convert.ToInt32(idcode));
        MainDataModule.tmptbl_equipentsDataTable dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
        if (dt != null) 
            foreach (MainDataModule.tmptbl_equipentsRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_equipmentsTableAdapter().Insert
                (
                    Convert.ToInt32(row["کد نوع فعالیت"].ToString()),
                    Convert.ToInt32(row["کد نام"].ToString()),
                    Convert.ToDouble(row["تعداد"].ToString()),
                    Convert.ToDouble(row["متراژ"].ToString()),
                    Convert.ToInt32(idcode), 1
                );
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["tmptbl_equipentsDataTable"] != null)
        {
            string tltp = (sender as LinkButton).ToolTip;

            MainDataModule.tmptbl_equipentsDataTable dt = new MainDataModule.tmptbl_equipentsDataTable();
            dt = (MainDataModule.tmptbl_equipentsDataTable)Session["tmptbl_equipentsDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_equipentsRow dr in dt.Rows)
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
}
