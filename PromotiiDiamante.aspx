<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromotiiDiamante.aspx.cs" Inherits="ProjectBDI.PromotiiDiamante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form style="margin=10px" id="form1" runat="server">
        <div style="background-image: https://www.conexelectronic.ro/c/821-category_default/promotii.jpg; background-repeat: no-repeat; background-color: #FFFFFF; height: 787px;">
            <p style="font-style: italic; font-size: xx-large; font-variant: normal; color: #000080; text-decoration: underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Promotiile disponibile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <p style="margin-left=50px">&nbsp;</p>
            <p style="margin-left=50px">
                <asp:Image ID="Image1" runat="server" Height="146px" ImageUrl="https://www.conexelectronic.ro/c/821-category_default/promotii.jpg" style="margin-left: 0px" Width="1164px" />
            </p>
                    <asp:RadioButtonList ID="RadioButtonListFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListFilter_SelectedIndexChanged">
    <asp:ListItem Text="Toate" Value="all" Selected="True" />
    <asp:ListItem Text="Valabile" Value="valabile" />
    <asp:ListItem Text="Invalide" Value="invalide" />
</asp:RadioButtonList>
            <asp:GridView ID= "GridViewPromotions" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_promotii" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:BoundField DataField="diamantId" HeaderText="diamantId" SortExpression="diamantId" InsertVisible="False" ReadOnly="True" />
        <asp:BoundField DataField="denumire" HeaderText="denumire" SortExpression="denumire" />
        <asp:BoundField DataField="promotieId" HeaderText="promotieId" SortExpression="promotieId" />
        <asp:BoundField DataField="datastart" HeaderText="datastart" SortExpression="datastart" />
        <asp:BoundField DataField="datasfarsit" HeaderText="datasfarsit" SortExpression="datasfarsit" />
        <asp:BoundField DataField="Valabila" HeaderText="Valabila" ReadOnly="True" SortExpression="Valabila" />
        <asp:BoundField DataField="ZileRamase" HeaderText="ZileRamase" ReadOnly="True" SortExpression="ZileRamase" />
    </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>

            <asp:SqlDataSource ID="SDS_promotii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetDiamondPromotions1" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadioButtonListFilter" Name="filter" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br /><br />
<br />
        </div>
           


    </form>
</body>
</html>
