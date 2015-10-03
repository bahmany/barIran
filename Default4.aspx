<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<%@ Register src="ascx/frm_users_add.ascx" tagname="frm_users_add" tagprefix="uc1" %>
<%@ Register src="ascx/frm_users_admin.ascx" tagname="frm_users_admin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:frm_users_admin ID="frm_users_admin1" runat="server" />
</asp:Content>

