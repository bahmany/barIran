using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ascx_frm_one_managers : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ohom_mobile.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");


        ohom_family.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        ohom_name.Attributes.Add("onKeyPress", "return  onlyAlp(event)");
        ohom_branch.Attributes.Add("onKeyPress", "return  onlyAlp(event)");



        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
            dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            updateGrid(dt);
            GridView1.DataBind();
        }

    }

    public void updateGrid(DataTable dt)
    {
        Session["tmptbl_obsrvDataTable"] = dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        // ساخت دیتا تیبل از طریق مراجعه به حافظه
        MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
        }

        MainDataModule.tmptbl_obsrvRow row = (MainDataModule.tmptbl_obsrvRow)dt.NewRow();

        row["نام خانوادگی"] = ohom_family.Text;
        row["نام"] = ohom_name.Text;
        row["شماره ملی"] = ohom_international_code.Text;
        row["جنسیت"] = ohom_sex.SelectedValue;
        row["تحصیلات"] = ohom_link_to_education.SelectedItem.Text;
        row["کد تحصیلات"] = ohom_link_to_education.SelectedValue;
        row["رشته تحصیلی"] = ohom_branch.Text;
        row["تاریخ تولد"] = ohom_date_birth.Text;
        row["تلفن همراه"] = ohom_mobile.Text;
        row["نوع نصب"] = ohom_type_nasb.SelectedItem.Text;
        row["کد نوع نصب"] = ohom_type_nasb.SelectedValue;
        row["id"] = (dt.Rows.Count + 1).ToString();

        dt.Rows.Add(row);
        updateGrid(dt);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        // حذف یک رکورد از طریق آی دی آن که به تول تیپ منتقل شده و آسانترین راه میباشد
        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            string tltp = (sender as Button).ToolTip;

            MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
            dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_obsrvRow dr in dt.Rows)
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
            Session["tmptbl_obsrvDataTable"] = dt;
            updateGrid(dt);

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    public void insert(string ones_ID)
    {
        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            MainDataModule.tmptbl_obsrvDataTable dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            foreach (MainDataModule.tmptbl_obsrvRow row in dt.Rows)
            {
                new MainDataModuleTableAdapters.tbl_ones_observersTableAdapter().Insert
                    (
                    row["نام خانوادگی"].ToString(),
                    row["نام"].ToString(),
                    row["شماره ملی"].ToString(),
                    Convert.ToInt32(row["جنسیت"].ToString()),
                    Convert.ToInt32(row["کد تحصیلات"].ToString()),
                    row["رشته تحصیلی"].ToString(),
                    row["تاریخ تولد"].ToString(),
                    row["تلفن همراه"].ToString(),
                    Convert.ToInt32(row["کد نوع نصب"].ToString()),
                    Convert.ToInt32(ones_ID),
                    -1
                    );
            }
            Session.Remove("tmptbl_obsrvDataTable");
        }
    }

    public void Update(string ones_ID)
    {
        if (Session["tmptbl_obsrvDataTable"] != null)
        {

            MainDataModule.tmptbl_obsrvDataTable dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            new MainDataModuleTableAdapters.tbl_ones_observersTableAdapter().DeleteQuery(
                Convert.ToInt32(ones_ID));


            foreach (MainDataModule.tmptbl_obsrvRow row in dt.Rows)
            {
                new MainDataModuleTableAdapters.tbl_ones_observersTableAdapter().Insert
                    (
                    row["نام خانوادگی"].ToString(),
                    row["نام"].ToString(),
                    row["شماره ملی"].ToString(),
                    Convert.ToInt32(row["جنسیت"].ToString()),
                    Convert.ToInt32(row["کد تحصیلات"].ToString()),
                    row["رشته تحصیلی"].ToString(),
                    row["تاریخ تولد"].ToString(),
                    row["تلفن همراه"].ToString(),
                    Convert.ToInt32(row["کد نوع نصب"].ToString()),
                    Convert.ToInt32(ones_ID),
                    -1
                    );
            }
            Session.Remove("tmptbl_obsrvDataTable");
        }
    }


    public void fill(string ones_ID)
    {
        MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
        foreach (
            DataRow dr in
            new MainDataModuleTableAdapters.tbl_ones_observersTableAdapter().GetDataBy1(Convert.ToInt32(ones_ID)))
        {
            MainDataModule.tmptbl_obsrvRow row = (MainDataModule.tmptbl_obsrvRow)dt.NewRow();

            row["نام خانوادگی"] = dr["om_family"].ToString();
            row["نام"] = dr["om_name"].ToString();
            row["شماره ملی"] = dr["om_international_code"].ToString();
            row["جنسیت"] = dr["om_sex"].ToString();
            row["تحصیلات"] = new MainDataModuleTableAdapters.tbl_educationsTableAdapter().ScalarQuery(Convert.ToInt32(dr["om_education_link_to_education"].ToString()));
            row["کد تحصیلات"] = dr["om_education_link_to_education"].ToString();
            row["رشته تحصیلی"] = dr["om_branch"].ToString();
            row["تاریخ تولد"] = dr["om_age"].ToString();
            row["تلفن همراه"] = dr["om_mob"].ToString();
            row["نوع نصب"] = dr["om_inst"].ToString();
            row["کد نوع نصب"] = dr["om_inst"].ToString();
            row["id"] = (dt.Rows.Count + 1).ToString();
            dt.Rows.Add(row);

        }

        updateGrid(dt);
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            string tltp = (sender as LinkButton).ToolTip;

            MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
            dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_obsrvRow dr in dt.Rows)
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
            Session["tmptbl_obsrvDataTable"] = dt;
            updateGrid(dt);

        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        // حذف یک رکورد از طریق آی دی آن که به تول تیپ منتقل شده و آسانترین راه میباشد
        if (Session["tmptbl_obsrvDataTable"] != null)
        {
            string tltp = (sender as Button).ToolTip;

            MainDataModule.tmptbl_obsrvDataTable dt = new MainDataModule.tmptbl_obsrvDataTable();
            dt = (MainDataModule.tmptbl_obsrvDataTable)Session["tmptbl_obsrvDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_obsrvRow dr in dt.Rows)
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
            Session["tmptbl_obsrvDataTable"] = dt;
            updateGrid(dt);

        }
    }
}
