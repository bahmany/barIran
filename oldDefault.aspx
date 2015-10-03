<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="oldDefault.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>








<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" 
        EnableTheming="True">
    </telerik:RadScriptManager>

    




    <table width="100%">
        <tr>
            <td dir="rtl" style="text-align: right; width:150px; vertical-align: top;">
                <br />
&nbsp;<telerik:RadTreeView ID="RadTreeView1" Runat="server">
                    <Nodes>
                        <telerik:RadTreeNode runat="server" Text="ورود اطلاعات" >
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="راننده ها" 
                                    NavigateUrl="Default.aspx?pid=1">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="وسائط نقلیه" 
                                    NavigateUrl="Default.aspx?pid=2">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="پارکینگ/انبار" 
                                    NavigateUrl="Default.aspx?pid=3">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="شرکت ها" 
                                    NavigateUrl="Default.aspx?pid=4">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="اصناف" 
                                    NavigateUrl="Default.aspx?pid=5">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Text="اطلاعات پایه سیستم">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="شهر ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="محله ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="استان ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="رنگ ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع وسیله نقلیه">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع مالکیت">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع خودرو">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="پلاک ایران">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="الفبای پلاک">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="تیپ">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="نوع کاربری">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="رنگ">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="سیستم های سوخت رسانی">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع سوخت">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع پارکینگ">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="انواع مالکیت">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="پوشش ها">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Text="تنظیمات">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="مدیریت کاربران">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="مدیریت گروه های کاربری">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="مدیریت دسترسی ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="ساعات فعالیت سامانه">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Text="جستجو">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="استعلام">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="جستجوی پیشرفته">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Text="گزارشات">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="اصناف">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="شرکت ها">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="افراد">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                    </Nodes>
<CollapseAnimation Type="OutQuint" Duration="100"></CollapseAnimation>

<ExpandAnimation Duration="100"></ExpandAnimation>
                </telerik:RadTreeView>
                <br />
                <br />
            </td>
            <td>
                <asp:Panel ID="pnl_loader" runat="server">


                    <br />
                    
                    <br />
                    شما وارد نرم افزار شده اید از منوی سمت راست وارد شاخه مورد نظر شوید<br />
                    <br />
                
                </asp:Panel>
            </td>
        </tr>
    </table>



        
</asp:Content>

