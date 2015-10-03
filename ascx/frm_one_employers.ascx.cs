using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;

public partial class ascx_frm_one_employers : System.Web.UI.UserControl
{
    public bool isEditing = false;
    public string CodePeigiri = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        oe_amount.Attributes.Add("onKeyPress", "return  onlyNumbers(event)");

        if (isEditing)
        //if (isEditing)
        {
            Session.Remove("tmptbl_employersDataTable");
            int code = Convert.ToInt32(CodePeigiri);
            isEditing = false;
            DataTable dtd = new tbl_ones_employersTableAdapter().GetDataBy1(code);
            MainDataModule.tmptbl_employersDataTable dt = new MainDataModule.tmptbl_employersDataTable();
            foreach (DataRow dr in dtd.Rows)
            {
                MainDataModule.tmptbl_employersRow row = (MainDataModule.tmptbl_employersRow)dt.NewRow();
                row["نوع پرسنل"] = new tbl_ones_employers_namesTableAdapter().GetEmployeesName(Convert.ToInt32(dr["oe_link_to_ones_employers_names"]));
                row["کد نوع پرسنل"] = dr["oe_link_to_ones_employers_names"];
                row["تعداد"] = dr["oe_amount"];
                row["id"] = (dt.Rows.Count + 1).ToString();
                dt.Rows.Add(row);

            }
            Session["tmptbl_employersDataTable"] = dt;
            updateGrid(dt);
            grv_employers.DataBind();


        }













        
        if (Session["tmptbl_employersDataTable"] != null)
        {
            MainDataModule.tmptbl_employersDataTable dt = new MainDataModule.tmptbl_employersDataTable();
            dt = (MainDataModule.tmptbl_employersDataTable)Session["tmptbl_employersDataTable"];
            grv_employers.DataSource = dt;
            grv_employers.DataBind();
        }
    }

    public void Page_Init(object o, EventArgs e)
    {
        grv_employers.DataBind();
    }


    public void updateGrid(DataTable dt)
    {
        Session["tmptbl_employersDataTable"] = dt;
        grv_employers.DataSource = dt;
        grv_employers.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
        // ساخت دیتا تیبل از طریق مراجعه به حافظه
        MainDataModule.tmptbl_employersDataTable dt = new MainDataModule.tmptbl_employersDataTable();
        if (Session["tmptbl_employersDataTable"] != null)
        {
            dt = (MainDataModule.tmptbl_employersDataTable)Session["tmptbl_employersDataTable"];
        }

        MainDataModule.tmptbl_employersRow row = (MainDataModule.tmptbl_employersRow)dt.NewRow();

        row["نوع پرسنل"] = oe_link_to_ones_employers_names.SelectedItem.Text;
        row["کد نوع پرسنل"] = oe_link_to_ones_employers_names.SelectedValue;
        row["تعداد"] = oe_amount.Text;
        row["id"] = (dt.Rows.Count + 1).ToString();

        dt.Rows.Add(row);

        updateGrid(dt);
        UpdatePanel1.Update();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        // حذف یک رکورد از طریق آی دی آن که به تول تیپ منتقل شده و آسانترین راه میباشد
        if (Session["tmptbl_employersDataTable"] != null)
        {
            string tltp = (sender as Button).ToolTip;

            MainDataModule.tmptbl_employersDataTable dt = new MainDataModule.tmptbl_employersDataTable();
            dt = (MainDataModule.tmptbl_employersDataTable)Session["tmptbl_employersDataTable"];
            int i = 0;
            int del_i = -1;
            foreach (MainDataModule.tmptbl_employersRow dr in dt.Rows)
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
        MainDataModule.tmptbl_employersDataTable dt = (MainDataModule.tmptbl_employersDataTable)Session["tmptbl_employersDataTable"];
        if (dt != null) 
            foreach (MainDataModule.tmptbl_employersRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_employersTableAdapter().Insert
                (
                "",
                Convert.ToInt32(row["کد نوع پرسنل"].ToString()),
                Convert.ToInt32(row["تعداد"].ToString()),
                Convert.ToInt32(idcode), -1);
        }
    }




    public void update(string idcode)
    {
        new MainDataModuleTableAdapters.tbl_ones_employersTableAdapter().DeleteQuery(Convert.ToInt32(idcode));
        MainDataModule.tmptbl_employersDataTable dt = (MainDataModule.tmptbl_employersDataTable)Session["tmptbl_employersDataTable"];
        if (dt != null) 
            foreach (MainDataModule.tmptbl_employersRow row in dt.Rows)
        {
            new MainDataModuleTableAdapters.tbl_ones_employersTableAdapter().Insert
                (
                "",
                Convert.ToInt32(row["کد نوع پرسنل"].ToString()),
                Convert.ToInt32(row["تعداد"].ToString()),
                Convert.ToInt32(idcode), -1);
        }
    }

}
