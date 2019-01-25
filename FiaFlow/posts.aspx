<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="posts.aspx.cs" Inherits="FiaFlow.posts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BtnNew" runat="server" Text="neuer Beitrag" OnClick="BtnNew_Click" /><br /> <br />
            <asp:Panel ID="PnlNew" runat="server"><br /><br />
                <asp:TextBox ID="TxtNew" runat="server" Columns="200" Rows="60"></asp:TextBox><br /><br />
                <asp:Label ID="LblAlert" runat="server" Text="" ></asp:Label>
                <asp:Button ID="BtnSend" runat="server" Text="senden" OnClick="BtnSend_Click" /><br /><br />
            </asp:Panel>

            <asp:DataList ID="DL" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="DSDataList" ForeColor="Black" GridLines="Both" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" Width="1046px">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Date:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    <br />
                    Text:
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="DSDataList" runat="server" ConnectionString="<%$ ConnectionStrings:fiaflowConnectionString %>" SelectCommand="SELECT [User].Name, Post.Date, Post.Text FROM Post INNER JOIN [User] ON Post.[User] = [User].UserID ORDER BY Post.Date DESC"></asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
