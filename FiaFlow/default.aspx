<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FiaFlow._default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DDLUser" runat="server" DataSourceID="DS_DDL" DataTextField="Name" DataValueField="UserID" ></asp:DropDownList>
            <asp:SqlDataSource ID="DS_DDL" runat="server" ConnectionString="<%$ ConnectionStrings:fiaflowConnectionString %>" SelectCommand="SELECT [UserID], [Name] FROM [User]"></asp:SqlDataSource>
            <br /><br />
            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" meta:resourcekey="TxtPasswordResource1"></asp:TextBox><br /><br />
            <asp:Button ID="BtnLogin" runat="server" Text="Login" meta:resourcekey="BtnLoginResource1" OnClick="BtnLogin_Click" />
            <asp:Label ID="LblAlert" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
