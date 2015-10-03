<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select_Language.aspx.cs" Inherits="Select_Language" ViewStateEncryptionMode="Never" ValidateRequest="False" EnableViewStateMac="False" EnableViewState="False" EnableSessionState="False" EnableEventValidation="False" %>

<%@ Register assembly="FlashControl" namespace="Bewise.Web.UI.WebControls" tagprefix="Bewise" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body style="vertical-align: middle; text-align: center; background-color: #333333;">
<center>
    <form id="form1" runat="server" enableviewstate="False">
    <div>
    <center>
    
        <table>
            <tr>
                <td>
    <center>
        <Bewise:FlashControl ID="FlashControl1" runat="server" Height="374px" 
            MovieUrl="~/images/language.swf" Width="765px" Loop="True" />
                </center></td>
            </tr>
            <tr>
                <td><center style="font-size: x-large">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="tahoma" 
                        NavigateUrl="login.aspx" ForeColor="White" 
                        Font-Bold="True" Font-Size="X-Large">فارسی</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink 
                        ID="HyperLink2" runat="server" Font-Names="tahoma" 
                        NavigateUrl="UnderCon.aspx" Font-Bold="True" 
                        Font-Size="X-Large" ForeColor="White">English</asp:HyperLink>&nbsp;
                </center></td>
            </tr>
        </table>
        </center>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</center>
</body>
</html>
