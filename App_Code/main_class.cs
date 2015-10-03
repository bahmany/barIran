using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MainDataModuleTableAdapters;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.UI;

/// <summary>
/// Summary description for main_class
/// </summary>
public class main_class
{
	public main_class()
	{
		//
		// TODO: Add constructor logic here
		//
	}



    public bool IsTimeOfLogin(string StartTimefromDB, string EndTimefromDB)
    {
        bool bl = false;
        DateTime starttime = Convert.ToDateTime(DateTime.Now.ToString("YYYY/MM/DD") + " " + StartTimefromDB);
        DateTime endtime = Convert.ToDateTime(DateTime.Now.ToString("YYYY/MM/DD") + " " + EndTimefromDB);
        if (DateTime.Now > starttime || DateTime.Now < endtime)
        {
            bl = true;
        }
        
        return bl;
    }


    public string GetCompanyName(int CodePeigiri)
    {
        string msg = "0";
        if (new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().GetDataBy4(CodePeigiri).Rows.Count != 0)
        {
            DataRow dr = new MainDataModuleTableAdapters.tbl_ones_haghighiTableAdapter().GetDataBy4(CodePeigiri)[0];
            XmlDocument doc_address = new XmlDocument();
            doc_address.InnerXml = dr["oh_personal_inf"].ToString();
            XmlNode xnl = doc_address.ChildNodes[0];
            XmlNode xms = xnl.ChildNodes[2];
            msg = xms.InnerText;

        }
        else
        {
            if (new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().GetDataBy3(CodePeigiri).Rows.Count != 0)
            {
                DataRow dr = new MainDataModuleTableAdapters.tbl_ones_hoghoghiTableAdapter().GetDataBy3(CodePeigiri)[0];
                msg = dr["oho_name"].ToString();

            }
        }



        return msg;
    }


    // checking for Duplicate rows incompleted.
    public bool IsDuplicateRow(DataTable dt, DataRow dr)
    {
        if (dt.Rows.Count == 0) return false;
        bool res = false;
        foreach (DataRow tdr in dt.Rows)
        {
            DataRow d1 = tdr;
            DataRow d2 = dr;
              if (  d1==d2  )
                {
                    return true;
                }
        }
        return res;
    }

    public int GetIndex(GridView grd, string fieldName)
    {
        for (int i = 0; i < grd.Columns.Count; i++)
        {
            DataControlField field = grd.Columns[i];

            //BoundField bfield = field as BoundField;
            HyperLinkField hfield = field as HyperLinkField;



            //if (bfield != null && bfield.DataField == fieldName)

            // return i;

            //if (hfield != null && hfield.DataTextField == fieldName)
            if (hfield != null && hfield.HeaderText == fieldName) return i;

        }
        return -1;

    }
    public int execute_command(string command)
    {

        SqlConnection sqlc = new SqlConnection(new main_class().get_connection_string());
        sqlc.Open();
        SqlCommand sqlcm = new SqlCommand(command, sqlc);
        return sqlcm.ExecuteNonQuery();
        sqlc.Close();
    }

    public string get_connection_string()
    {
        System.Configuration.Configuration rootWebConfig =
        System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~\\");
        System.Configuration.ConnectionStringSettings connString;

        connString = rootWebConfig.ConnectionStrings.ConnectionStrings["bariranConnectionString"];
        if (connString != null) { return connString.ConnectionString.ToString(); }
        else
        {
            return "";
        }
    }



    public bool is_user_available_by_username(string username)
    {

        bool is_ava = false;
        SqlConnection sqlc = new SqlConnection(get_connection_string());
        sqlc.Open();
        SqlCommand sqlcm = new SqlCommand("select count(*) as total from tbl_users where (cast(u_username as nvarchar(max)) = '" + username + "')", sqlc);
        SqlDataReader sqldr = sqlcm.ExecuteReader();
        if (sqldr.HasRows != true)
        { is_ava = false; }
        else
        {
            if (sqldr.HasRows)
            {
                while (sqldr.Read())
                {
                    if (sqldr["total"].ToString() != "1")
                    {
                        is_ava = false;
                    }
                    else { is_ava = true; }
                }
            }
            sqldr.Close();
            sqlc.Close();

        }
        return is_ava;
    }
    public string Load_Control(string form_name, string username, string password)
    {

        tbl_users_permissionTableAdapter upta = new tbl_users_permissionTableAdapter();
        MainDataModule.tbl_users_permissionDataTable dta = new MainDataModule.tbl_users_permissionDataTable();
        upta.Fill(dta, username, password, form_name);
        int user_premission = 0;
        int u_moduleid = 0;
        int group_id = 0;
        string m_name = "";
        try
        {
            DataRow dr = dta[0];
            user_premission = Convert.ToInt16(Convert.ToBoolean(dr["up_blocked"].ToString()));
            u_moduleid = Convert.ToInt16(dr["up_module_link"].ToString());
            //  group_id = Convert.ToInt16(dr["up_module_link"].ToString());
        }
        catch
        {
            user_premission = 2;
        }

        try
        {
            tbl_modulesTableAdapter mta = new tbl_modulesTableAdapter();
            MainDataModule.tbl_modulesDataTable mdt = new MainDataModule.tbl_modulesDataTable();
            mta.FillBy(mdt, form_name);
            DataRow drm = mdt[0];
            m_name = drm["m_frm_name"].ToString();
            //m_frm_name
        }
        catch
        { m_name = ""; }

        // 1 = blocked
        // 0 = true
        // 2 = null

        int group_premission = 0;
        try
        {
            group_id = Convert.ToInt32(new tbl_usersTableAdapter().ScalarQuery_GetUserGroupID(username));
            tbl_groups_permissionTableAdapter gpta = new tbl_groups_permissionTableAdapter();
            MainDataModule.tbl_groups_permissionDataTable gta = new MainDataModule.tbl_groups_permissionDataTable();
            gpta.Fill(gta, group_id, form_name);
            DataRow drm = gta[0];
            group_premission = Convert.ToInt16(Convert.ToBoolean(drm["gd_blocked"].ToString()));
        }
        catch
        {
            group_premission = 2;
        }




        bool load = false;

        if (group_premission == 0)
        {
            if (user_premission == 0) { load = true; }
            if (user_premission == 2) { load = true; }
            if (user_premission == 1) { load = false; }
        }
        if (group_premission == 1)
        {
            if (user_premission == 0) { load = true; }
            if (user_premission == 2) { load = false; }
            if (user_premission == 1) { load = false; }
        }
        if (group_premission == 2)
        {
            if (user_premission == 0) { load = true; }
            if (user_premission == 2) { load = false; }
            if (user_premission == 1) { load = false; }
        }
        //Control ctr = 
        if (load == true)
        {
            if (m_name == "") { return "~\\ascx\\frm_AccessDenied.ascx"; } else { return "~\\ascx\\" + m_name + ".ascx"; }
        }
        else
        {
            return "~\\ascx\\frm_AccessDenied.ascx";
        }
        //return ctor;

    }
    public string Convert_to_Midaly(string ShamsiDate, string time)
    {
        string str = "";
        string year = "";
        string month = "";
        string day = "";
        string hour = "";
        string min = "";
        string sec = "";
        DateTime dtt;


        FarsiLibrary.Utils.PersianDate pd = new FarsiLibrary.Utils.PersianDate(ShamsiDate);
        dtt = FarsiLibrary.Utils.PersianDateConverter.ToGregorianDateTime(pd);

        year = dtt.Year.ToString();
        month = dtt.Month.ToString();
        day = dtt.Day.ToString();
        if (month.Length == 1) { month = "0" + month; }
        if (day.Length == 1) { day = "0" + day; }
        DateTime dt = Convert.ToDateTime(year + "/" + month + "/" + day + " " + time);



        year = dt.Year.ToString();
        month = dt.Month.ToString();
        day = dt.Day.ToString();
        hour = dt.Hour.ToString();
        min = dt.Minute.ToString();
        sec = dt.Second.ToString();

        if (month.Length == 1) { month = "0" + month; }
        if (day.Length == 1) { day = "0" + day; }
        if (hour.Length == 1) { hour = "0" + hour; }
        if (min.Length == 1) { min = "0" + min; }
        if (sec.Length == 1) { sec = "0" + sec; }


        str = year + "/" + month + "/" + day + " " + hour + ":" + min + ":" + sec;

        return str;

    }


    public void clear_from(Page p)
    {
        for (int i = 0; i < p.Controls.Count; i++)
        {
            if (p.Controls[i] is TextBox)
            {
                (p.Controls[i] as TextBox).Text = "";
            }
        }

    }
    public string Convert_to_Midaly(string ShamsiDate)
    {
        string str = "";
        string year = "";
        string month = "";
        string day = "";

        DateTime dtt;





        FarsiLibrary.Utils.PersianDate pd = new FarsiLibrary.Utils.PersianDate(ShamsiDate);
        dtt = FarsiLibrary.Utils.PersianDateConverter.ToGregorianDateTime(pd);

        year = dtt.Year.ToString();
        month = dtt.Month.ToString();
        day = dtt.Day.ToString();
        if (month.Length == 1) { month = "0" + month; }
        if (day.Length == 1) { day = "0" + day; }
        DateTime dt = Convert.ToDateTime(year + "/" + month + "/" + day);

        year = dt.Year.ToString();
        month = dt.Month.ToString();
        day = dt.Day.ToString();

        if (month.Length == 1) { month = "0" + month; }
        if (day.Length == 1) { day = "0" + day; }

        str = year + "/" + month + "/" + day + " ";

        return str;

    }
    public string Convert_to_Shamsi(DateTime dt)
    {
        string str = "";

        FarsiLibrary.Utils.PersianDate pd = FarsiLibrary.Utils.PersianDateConverter.ToPersianDate(dt);


        string year = "";
        string month = "";
        string day = "";


        year = pd.Year.ToString();
        month = pd.Month.ToString();
        day = pd.Day.ToString();

        if (month.Length == 1) { month = "0" + month; }
        if (day.Length == 1) { day = "0" + day; }

        str = year + "/" + month + "/" + day;

        return str;

    }
    public string Convert_to_standard_time(TimeSpan tm)
    {
        string str = "";
        string hour = "";
        string min = "";
        string sec = "";

        hour = tm.Hours.ToString();
        min = tm.Minutes.ToString();
        sec = tm.Seconds.ToString();

        if (hour.Length == 1) { hour = "0" + hour; }
        if (min.Length == 1) { min = "0" + min; }
        if (sec.Length == 1) { sec = "0" + sec; }

        str = hour + ":" + min + ":" + sec;

        return str;

    }







    public static string Encrypt(string plainText, string passPhrase, string saltValue, string hashAlgorithm, int passwordIterations, string initVector, int keySize)
    {
        // Convert strings into byte arrays.
        // Let us assume that strings only contain ASCII codes.
        // If strings include Unicode characters, use Unicode, UTF7, or UTF8 
        // encoding.
        byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
        byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        // Convert our plaintext into a byte array.
        // Let us assume that plaintext contains UTF8-encoded characters.
        byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

        // First, we must create a password, from which the key will be derived.
        // This password will be generated from the specified passphrase and 
        // salt value. The password will be created using the specified hash 
        // algorithm. Password creation can be done in several iterations.
        PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                        passPhrase,
                                                        saltValueBytes,
                                                        hashAlgorithm,
                                                        passwordIterations);

        // Use the password to generate pseudo-random bytes for the encryption
        // key. Specify the size of the key in bytes (instead of bits).
        byte[] keyBytes = password.GetBytes(keySize / 8);

        // Create uninitialized Rijndael encryption object.
        RijndaelManaged symmetricKey = new RijndaelManaged();

        // It is reasonable to set encryption mode to Cipher Block Chaining
        // (CBC). Use default options for other symmetric key parameters.
        symmetricKey.Mode = CipherMode.CBC;

        // Generate encryptor from the existing key bytes and initialization 
        // vector. Key size will be defined based on the number of the key 
        // bytes.
        ICryptoTransform encryptor = symmetricKey.CreateEncryptor(
                                                         keyBytes,
                                                         initVectorBytes);

        // Define memory stream which will be used to hold encrypted data.
        MemoryStream memoryStream = new MemoryStream();

        // Define cryptographic stream (always use Write mode for encryption).
        CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                     encryptor,
                                                     CryptoStreamMode.Write);
        // Start encrypting.
        cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

        // Finish encrypting.
        cryptoStream.FlushFinalBlock();

        // Convert our encrypted data from a memory stream into a byte array.
        byte[] cipherTextBytes = memoryStream.ToArray();

        // Close both streams.
        memoryStream.Close();
        cryptoStream.Close();

        // Convert encrypted data into a base64-encoded string.
        string cipherText = Convert.ToBase64String(cipherTextBytes);

        // Return encrypted string.
        return cipherText;
    }
    public static string Decrypt(string cipherText, string passPhrase, string saltValue, string hashAlgorithm, int passwordIterations, string initVector, int keySize)
    {
        // Convert strings defining encryption key characteristics into byte
        // arrays. Let us assume that strings only contain ASCII codes.
        // If strings include Unicode characters, use Unicode, UTF7, or UTF8
        // encoding.
        byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
        byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        // Convert our ciphertext into a byte array.
        byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

        // First, we must create a password, from which the key will be 
        // derived. This password will be generated from the specified 
        // passphrase and salt value. The password will be created using
        // the specified hash algorithm. Password creation can be done in
        // several iterations.
        PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                        passPhrase,
                                                        saltValueBytes,
                                                        hashAlgorithm,
                                                        passwordIterations);

        // Use the password to generate pseudo-random bytes for the encryption
        // key. Specify the size of the key in bytes (instead of bits).
        byte[] keyBytes = password.GetBytes(keySize / 8);

        // Create uninitialized Rijndael encryption object.
        RijndaelManaged symmetricKey = new RijndaelManaged();

        // It is reasonable to set encryption mode to Cipher Block Chaining
        // (CBC). Use default options for other symmetric key parameters.
        symmetricKey.Mode = CipherMode.CBC;

        // Generate decryptor from the existing key bytes and initialization 
        // vector. Key size will be defined based on the number of the key 
        // bytes.
        ICryptoTransform decryptor = symmetricKey.CreateDecryptor(
                                                         keyBytes,
                                                         initVectorBytes);

        // Define memory stream which will be used to hold encrypted data.
        MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

        // Define cryptographic stream (always use Read mode for encryption).
        CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                      decryptor,
                                                      CryptoStreamMode.Read);

        // Since at this point we don't know what the size of decrypted data
        // will be, allocate the buffer long enough to hold ciphertext;
        // plaintext is never longer than ciphertext.
        byte[] plainTextBytes = new byte[cipherTextBytes.Length];

        // Start decrypting.
        int decryptedByteCount = cryptoStream.Read(plainTextBytes,
                                                   0,
                                                   plainTextBytes.Length);

        // Close both streams.
        memoryStream.Close();
        cryptoStream.Close();

        // Convert decrypted data into a string. 
        // Let us assume that the original plaintext string was UTF8-encoded.
        string plainText = Encoding.UTF8.GetString(plainTextBytes,
                                                   0,
                                                   decryptedByteCount);

        // Return decrypted string.   
        return plainText;
    }
    public string Encode(string str)
    {
        string plainText = str;    // original plaintext

        string passPhrase = "bahmanymb@gmail.com";        // can be any string
        string saltValue = "mohammad_mrb@yahoo.com";        // can be any string
        string hashAlgorithm = "SHA1";             // can be "MD5"
        int passwordIterations = 2;                  // can be any number
        string initVector = "@1B2ceD4e5F6g7H8"; // must be 16 bytes
        int keySize = 128;                // can be 192 or 128
        return Encrypt(plainText, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);


    }
    public string Decode(string str)
    {
        string plainText = str;    // original plaintext

        string passPhrase = "bahmanymb@gmail.com";        // can be any string
        string saltValue = "mohammad_mrb@yahoo.com";        // can be any string
        string hashAlgorithm = "SHA1";             // can be "MD5"
        int passwordIterations = 2;                  // can be any number
        string initVector = "@1B2ceD4e5F6g7H8"; // must be 16 bytes
        int keySize = 128;                // can be 192 or 128
        return Decrypt(plainText, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);


    }








    public void XmlToFormForEditing(string XmlContent,System.Web.UI.Control ctrl)
    {
        XmlDocument xmld = new XmlDocument();
        xmld.InnerXml = XmlContent;
        XmlNode xnl = xmld.ChildNodes[0];
        for (int i = 0; i < xnl.ChildNodes.Count; i++)
        {
            XmlNode xms = xnl.ChildNodes[i];
            
            System.Web.UI.Control controlname = ctrl.FindControl(xms.Name);
            if (controlname is TextBox)
            {
                if ((controlname as TextBox).Enabled)
                {
                    (controlname as TextBox).Text = xms.InnerText;
                }
            }
            if (controlname is DropDownList)
            {
                if ((controlname as DropDownList).Enabled)
                {
                    (controlname as DropDownList).SelectedValue = xms.InnerText;
                }
            }

            
        }
        


    }



    public string ShowWithDeparated(int counter, string inputtext)
    {
     
        for (int i = counter; i < inputtext.Length; )
        {
            inputtext=inputtext.Insert(i, " ");

            i += counter+1;

        }


        return inputtext;
    }


}


