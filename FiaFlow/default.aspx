﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FiaFlow._default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Daniela Schunke" />
    <link rel="stylesheet" type="text/css" href="CSS/Style.css"  />
    <title>FiaFlow Login</title>
</head>
<body>
    
        <header>
            <h1>Zutritt nur für Eingeweihte...</h1>
        </header>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="PnlLogin" CssClass="Pnl" GroupingText="Login" runat="server">
                <asp:DropDownList ID="DDLUser" runat="server" DataSourceID="DS_DDL" DataTextField="Name" DataValueField="UserID"></asp:DropDownList>
                <asp:SqlDataSource ID="DS_DDL" runat="server" ConnectionString="<%$ ConnectionStrings:fiaflowConnectionString %>" SelectCommand="SELECT [UserID], [Name] FROM [User]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" meta:resourcekey="TxtPasswordResource1"></asp:TextBox><br />
                <br />
                <asp:ImageButton CssClass="IBtn" ImageUrl="Grafix/buttonLogin.png" ID="BtnLog"  runat="server" OnClick="BtnLog_Click" />
                <%--<asp:Button ID="BtnLogin" runat="server" Text="Login" meta:resourcekey="BtnLoginResource1" OnClick="BtnLogin_Click" />--%>
                <asp:Label ID="LblAlert" runat="server" Text=""></asp:Label>
            </asp:Panel>

        </div>
       
    </form>
</body>
</html>
