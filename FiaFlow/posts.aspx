<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="posts.aspx.cs" Inherits="FiaFlow.posts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Daniela Schunke" />
    <link rel="stylesheet" type="text/css" href="CSS/Style.css"  />
    <title>FiaFlow Talk</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <asp:HyperLink NavigateUrl="https://github.com/Dani1234567890123" Target="_blank" ID="HLGithub" runat="server">https://github.com/Dani1234567890123</asp:HyperLink>      </header>
        <div>
            <asp:ImageButton CssClass="IBtn" ImageUrl="Grafix/buttonNew.png" ID="BtnNeu" runat="server" OnClick="BtnNeu_Click" />
            <asp:ImageButton CssClass="IBtn" ImageUrl="Grafix/buttonLogout.png" ID="BtnLogout" runat="server" OnClick="BtnLogout_Click1"  />
           <br />
            <br />
            <asp:Panel ID="PnlNew" CssClass="Pnl" GroupingText="neuer Beitrag" runat="server">
                <br />
                <br />
                <asp:TextBox ID="TxtNew" runat="server" Columns="200" Rows="20" TextMode="MultiLine" onChange="if(this.value.length>1000)this.value = this.value.substring(0,1000);"></asp:TextBox><br />
                <br />
                <asp:Label ID="LblAlert" runat="server" Text=""></asp:Label>
                <asp:ImageButton CssClass="IBtn" ImageUrl="Grafix/buttonSend.png" ID="BtnSenden" runat="server" OnClick="BtnSenden_Click" />
               <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="PnlPosts" CssClass="Pnl" GroupingText="Posts..." runat="server">
                <asp:DataList ID="DL" runat="server" BackColor="White" CellPadding="3" 
                    DataSourceID="DSDataList" ForeColor="Black" GridLines="Vertical" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                    HorizontalAlign="Center" Width="1046px" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingItemStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        Name:
                    <asp:TextBox ID="NameTxt" TextMode="MultiLine" ReadOnly="true" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        Date:
                    <asp:TextBox ID="DateTxt" TextMode="MultiLine" ReadOnly="true"  runat="server"  Text='<%# Eval("Date") %>' />
                        <br />
                        Text:<br />
                        <asp:TextBox ID="TextTxt" TextMode="MultiLine" Columns="200" Rows="10" ReadOnly="true" runat="server"  Text='<%# Eval("Text") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DSDataList" runat="server" ConnectionString="<%$ ConnectionStrings:fiaflowConnectionString %>" SelectCommand="SELECT [User].Name, Post.Date, Post.Text FROM Post INNER JOIN [User] ON Post.[User] = [User].UserID ORDER BY Post.Date DESC"></asp:SqlDataSource>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
