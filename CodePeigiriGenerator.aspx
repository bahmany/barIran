<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodePeigiriGenerator.aspx.cs" Inherits="CodePeigiriGenerator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="text-align: left">
    <div style="border: 1px none #333333; width:  230px; height:320px; font-family: tahoma; font-size: 12px; text-align: left;" 
        dir="rtl">
    <div style="float: left; display: block;">
        <table>
            <tr>
                <td>
                    <img alt="" src="images/Peigiri_TopCart.jpg" 
                        style="width: 210px; height: 95px" /></td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <asp:Label ID="lbl_date" runat="server" Text="Label"></asp:Label>
                    <br />
                    
                <br />
                <div lang="en" dir="ltr" style="font-family: Courier; font-size: medium; font-weight: normal; font-style: normal; font-variant: normal; text-transform: capitalize; color: #000000">
                    <asp:Label ID="lbl_code" runat="server" Text="Label" Font-Bold="True" 
                        Font-Names="Tahoma"></asp:Label>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" src="images/Peigiri_LowCart.jpg" 
                        style="width: 210px; height: 89px" /></td>
            </tr>
        </table>
    </div>
    </div>
    </form>
</body>
</html>
