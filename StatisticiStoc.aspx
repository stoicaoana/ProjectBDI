<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticiStoc.aspx.cs" Inherits="ProjectBDI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestiune Stoc Diamante</title>
    <style type="text/css">
        #btnSubmit {
            height: 24px;
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h2>Gestiune Stoc Diamante pe categorii</h2>
            <asp:Label ID="lblNumeFilter" runat="server" Text="Filtru Nume:"></asp:Label>
           <asp:TextBox ID="txtNumeFilter" runat="server" AutoPostBack="True" Height="26px" Width="176px"></asp:TextBox>

            <button id="btnSubmit">Enter</button>
<asp:GridView ID="GridViewDiamante" runat="server" DataSourceID="sqlDataSource" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
    <Columns>
        <asp:BoundField DataField="DiamantId" HeaderText="ID Diamant" SortExpression="DiamantId" />
        <asp:BoundField DataField="Denumire" HeaderText="Denumire" SortExpression="Denumire" />
        <asp:BoundField DataField="Culoare" HeaderText="Culoare" SortExpression="Culoare" />
        <asp:BoundField DataField="categorii" HeaderText="Categorii" SortExpression="categorii" />
    </Columns>
    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#594B9C" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#33276A" />
</asp:GridView>


<asp:SqlDataSource ID="sqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
    SelectCommand="SELECT Diamant.diamantId, Diamant.denumire, Diamant.culoare, STRING_AGG(Categorie.numeCategorie, ', ') AS categorii FROM Diamant INNER JOIN ClasificareDiamant ON Diamant.diamantId = ClasificareDiamant.diamantId INNER JOIN Categorie ON ClasificareDiamant.categorieId = Categorie.categorieId WHERE (Diamant.denumire LIKE '%' + @denumire + '%') GROUP BY Diamant.diamantId, Diamant.denumire, Diamant.culoare">

    <SelectParameters>
        <asp:ControlParameter ControlID="txtNumeFilter" Name="denumire" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

            <br />
            <br />
            Choose a graph in order to see some statistics</div>
        <asp:DropDownList ID="DropDownListGrafic" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">Choose graph</asp:ListItem>
            <asp:ListItem Value="Bars">Bars</asp:ListItem>
            <asp:ListItem Value="Line">Line</asp:ListItem>
            <asp:ListItem Value="Pie">Pie</asp:ListItem>
        </asp:DropDownList>
    </form>
</body>
</html>
