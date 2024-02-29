<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="ListaFurnizori.aspx.cs" Inherits="ProjectBDI.ListaFurnizori" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #FFFFFF; font-family: Georgia, 'Times New Roman', Times, serif; font-size: medium">
            <p style="font-size: xx-large">Lista de furnizori</p>
            <asp:GridView ID="GrdViewListaFurnizori" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="furnizorId"
                DataSourceID="SDS_Furnizori" OnRowEditing="GrdViewListaFurnizori_RowEditing" OnRowUpdating="GrdViewListaFurnizori_RowUpdating"
                OnRowDeleting="GrdViewListaFurnizori_RowDeleting" OnRowCancelingEdit="GrdViewListaFurnizori_RowCancelingEdit" DeleteCommand="DeleteProducer" DeleteCommandType="StoredProcedure"
                OnSelectedIndexChanged="GrdViewListaFurnizori_SelectedIndexChanged" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
                <Columns>
                    <asp:BoundField DataField="furnizorId" HeaderText="furnizorId" InsertVisible="False" ReadOnly="True" SortExpression="furnizorId" />
                    <asp:BoundField DataField="numeFurnizor" HeaderText="numeFurnizor" SortExpression="numeFurnizor" />
                    <asp:BoundField DataField="taraOrigine" HeaderText="taraOrigine" SortExpression="taraOrigine" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True" />
                    
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
            <asp:SqlDataSource ID="SDS_Furnizori" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="GetProducerInfo" SelectCommandType="StoredProcedure" DeleteCommand="DeleteProducer" DeleteCommandType="StoredProcedure"
                UpdateCommand="UpdateProducer" UpdateCommandType="StoredProcedure" 
                InsertCommand="InsertFurnizor" InsertCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="numeFurnizor" Type="String" />
        <asp:Parameter Name="taraOrigine" Type="String" />
    </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="furnizorId" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="furnizorId" Type="Int32" />
                    <asp:Parameter Name="numeFurnizor" Type="String" />
                    <asp:Parameter Name="taraOrigine" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDS_DiamanteFurnizorList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="GetDiamondListByProducer" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="GrdViewListaFurnizori" Name="furnizorId" PropertyName="SelectedDataKey.Value" Type="Int32" />
    </SelectParameters>
                
</asp:SqlDataSource>

            <asp:GridView ID="GrdViewDiamanteFurnizorList" runat="server" AutoGenerateColumns="True" DataKeyNames="diamantId">
  
</asp:GridView>
            <asp:TextBox ID="txtNumeFurnizor" runat="server" placeholder="Nume Furnizor"></asp:TextBox>
<asp:TextBox ID="txtTaraOrigine" runat="server" placeholder="Țara de Origine"></asp:TextBox>

            <asp:Button ID="btnAdaugaFurnizor" runat="server" Text="Adaugă Furnizor" OnClick="btnAdaugaFurnizor_Click" />

            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Selectati un furnizor pentru a afisa diamantele furnizate de acesta</p>
<asp:GridView ID="GridView1" runat="server" DataKeyNames="diamantId"
    DataSourceID="SDS_DiamanteFurnizorList" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
    <AlternatingRowStyle BackColor="#F7F7F7" />
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <SortedAscendingCellStyle BackColor="#F4F4FD" />
    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
    <SortedDescendingCellStyle BackColor="#D8D8F0" />
    <SortedDescendingHeaderStyle BackColor="#3E3277" />
  
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="GetDiamondListByProducer" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="GrdViewListaFurnizori" Name="furnizorId" PropertyName="SelectedDataKey.Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

 

        </div>
    </form>
</body>
</html>
