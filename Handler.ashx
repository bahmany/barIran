<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {














        if (context.Request.Params["international_code_check"] != null) // برای چک کردن کد ملیهای تکراری
        {
            string final_code = context.Request.Params["international_code_check"];
            if (new MainDataModuleTableAdapters.tbl_onesTableAdapter().Get_ID_from_international_code(final_code) != null)
            {
                final_code = new MainDataModuleTableAdapters.tbl_onesTableAdapter().Get_ID_from_international_code(final_code).Value.ToString();
            }
            else
            {
                final_code = "0";
            }

            context.Response.Write(final_code);
        }




        if (context.Request.Params["oho_unique_id"] != null) // برای چک کردن کد ملیهای تکراری
        {
            string final_code = context.Request.Params["oho_unique_id"];
            if (new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().Get_iD_from_international_code(final_code) != null)
            {
                final_code = new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().Get_iD_from_international_code(final_code).Value.ToString();
            }
            else
            {
                final_code = "0";
            }

            context.Response.Write(final_code);
        }
        
        
        
        
        if (context.Request.Params["vin"] != null)
        {
            if (new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_from_VIN(context.Request.Params["vin"]) != null)
            {
                context.Response.Write(new MainDataModuleTableAdapters.tbl_carsTableAdapter().Get_ID_from_VIN(context.Request.Params["vin"]).ToString());
            }
            else
            {
                context.Response.Write("0");
            }
        }
        
        if (context.Request.Params["international_code_check_haghighi"] != null)
        {
            string final_code = context.Request.Params["international_code_check_haghighi"];
            if (new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().Get_id_from_international_code(final_code) != null)
            {
                final_code = new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().Get_id_from_international_code(final_code).Value.ToString();
            }
            else
            {
                final_code = "0";
            }

            context.Response.Write(final_code);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}