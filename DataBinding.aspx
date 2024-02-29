<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="ProjectBDI.DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BrillianceManager: Gestionarea Eficientă a Stocului de Diamante</title>
</head>
<body>
    <form id="form1" runat="server" style=" font-size: larger; font-style: oblique; color: #000080; height: 1506px;">
        <i><div style="margin-left: 300px">
            <br />
            <asp:Image ID="Image1" runat="server" Height="175px" ImageUrl="https://tse3.mm.bing.net/th?id=OIP.aoGa4pAn1Q10JsKRi9MuIgHaFW&amp;pid=Api" style="margin-left: 0px" Width="226px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 💎 BRILLIANCE MANAGER 💎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Image ID="Image2" runat="server" Height="173px" ImageUrl="https://northscottsdaleloan.com/wp-content/uploads/2016/10/Loose-diamonds.jpg" Width="218px" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Bine ați venit! </i></div>
        <p style="margin-left: 40px">
            _________________________________________________________________________________________________________________________________________________&nbsp;&nbsp; </p>
        <p style="margin-left: 40px">
            Acestea sunt diamantele pe care le avem pe stoc<br />
            <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SDS_Diamante" DataTextField="denumire" DataValueField="diamantId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" Height="18px" Width="213px">
            <asp:ListItem Value="0">Alegeti</asp:ListItem>
        </asp:DropDownList>
        </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SDS_Diamante" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Diamant]"></asp:SqlDataSource>
        &nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong aria-orientation="vertical">Informatii despre diamantul selectat
        <br />
        <br />
           <asp:Table runat="server" CellPadding="20" Font-Italic="True" Font-Size="Large">
    <asp:TableRow BackColor="#CCCCFF" Font-Size="Large">
        <asp:TableCell>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Height="91px" Width="764px" OnTextChanged="TextBox1_TextChanged" ReadOnly="true"></asp:TextBox>
        
</asp:TableCell>
        <asp:TableCell>
            <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="SDS_Diamante" Height="150px" ImageUrlField="url" Width="160px" OnAdCreated="AdRotator1_AdCreated" />
        
</asp:TableCell>
    </asp:TableRow>
</asp:Table>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
             
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
    DataSourceID="SDS_Recenzii" GridLines="None" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="860px"
    DataKeyNames="clientId" AutoGenerateSelectButton="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="recenzieId" HeaderText="recenzieId" InsertVisible="False" ReadOnly="True" SortExpression="recenzieId" />
        <asp:BoundField DataField="diamantId" HeaderText="diamantId" SortExpression="diamantId" />
        <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota" />
        <asp:BoundField DataField="comentariu" HeaderText="comentariu" SortExpression="comentariu" />
        <asp:BoundField DataField="clientId" HeaderText="clientId" SortExpression="clientId" />
        
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
            
        <asp:SqlDataSource ID="SDS_Recenzii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Recenzie] WHERE [recenzieId] = @recenzieId" InsertCommand="INSERT INTO [Recenzie] ([diamantId], [nota], [clientId], [comentariu]) VALUES (@diamantId, @nota, @clientId, @comentariu)" SelectCommand="SELECT * FROM [Recenzie] WHERE ([diamantId] = @diamantId)" UpdateCommand="UPDATE [Recenzie] SET [diamantId] = @diamantId, [nota] = @nota, [clientId] = @clientId, [comentariu] = @comentariu WHERE [recenzieId] = @recenzieId">
            <DeleteParameters>
                <asp:Parameter Name="recenzieId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="diamantId" Type="Int32" />
                <asp:Parameter Name="nota" Type="Single" />
                <asp:Parameter Name="clientId" Type="Int32" />
                <asp:Parameter Name="comentariu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="diamantId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="diamantId" Type="Int32" />
                <asp:Parameter Name="nota" Type="Single" />
                <asp:Parameter Name="clientId" Type="Int32" />
                <asp:Parameter Name="comentariu" Type="String" />
                <asp:Parameter Name="recenzieId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Introduceti o noua recenzie</p>
        <asp:DropDownList ID="DropDownListDiamantId" runat="server" DataSourceID="SDS_Diamante" DataTextField="denumire" DataValueField="diamantId">
        </asp:DropDownList>
        <asp:TextBox ID="txtbNota"  Placeholder="Introduceți nota" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtBComm" Placeholder="Comentariu" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SDS_Clienti" DataTextField="numePrenume" DataValueField="clientId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SDS_Clienti" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Client]">
        </asp:SqlDataSource>
        <asp:Button ID="btnInsertRecenzie" runat="server" Text="Insert" OnClick="btnInsertRecenzie_Click" BackColor="#9966FF" ForeColor="Black"  />
        <br />

        <br />
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Informatii client selectat</p>
          <div style="margin-left: 40px;width: 500px;">
            <asp:DetailsView ID="DetailsViewClient" runat="server" AutoGenerateRows="False" DataSourceID="SDS_ClientDetails" AutoGenerateColumns="True" Height="50px" Width="125px" DataKeyNames="clientId" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                
        <Fields>
            <asp:BoundField DataField="clientId" HeaderText="clientId" SortExpression="clientId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="numePrenume" HeaderText="numePrenume" SortExpression="numePrenume" />
            <asp:BoundField DataField="tipClient" HeaderText="tipClient" SortExpression="tipClient" />
            <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN" />
       
            <asp:BoundField DataField="CNP" HeaderText="CNP" SortExpression="CNP" />
       
    </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>
           </div>
<asp:SqlDataSource ID="SDS_ClientDetails" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM [Client] WHERE ([clientId] = @clientId)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="clientId" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
  
</asp:SqlDataSource>

           
           

        <br />
           
           

  <asp:Table runat="server">
    <asp:TableRow BackColor="#9999FF">
        <asp:TableCell>
            <asp:Button ID="Button1" runat="server" Text="Go to Stoc Page" OnClientClick="openNewTab('StatisticiStoc.aspx');" style="display: inline-block; margin-right: 10px;" />
        
</asp:TableCell>
        <asp:TableCell>
            <asp:Button ID="Button3" runat="server" Text="Go to Promotion Page" OnClientClick="openNewTab('PromotiiDiamante.aspx');" style="display: inline-block; margin-right: 10px;" />
        
</asp:TableCell>
        <asp:TableCell>
            <asp:Button ID="ImageButton1" runat="server" Text="Vanzari Diamante 💸" Height="26px" OnClientClick="openNewTab('VanzariDiamante.aspx');" Width="158px" style="display: inline-block;" />
        
</asp:TableCell>
        <asp:TableCell>
    <asp:Button ID="Button4" runat="server" Text="Lista furnizori" Height="26px" OnClientClick="openNewTab('ListaFurnizori.aspx');" Width="158px" style="display: inline-block;" />
</asp:TableCell>
                <asp:TableCell>
    <asp:Button ID="ButtonGraficLineVanzari" runat="server" Text="Grafic Vanzari" Height="26px" OnClientClick="openNewTab('GrafLine.aspx');" Width="158px" style="display: inline-block;" />
</asp:TableCell>
                        <asp:TableCell>
    <asp:Button ID="ButtonProceduraVanzari" runat="server" Text="Procedura Vanzari" Height="26px" OnClientClick="openNewTab('ProceduraVanzariLimite.aspx');" Width="158px" style="display: inline-block;" />
</asp:TableCell>
    </asp:TableRow>
</asp:Table>

<script type="text/javascript">
    function openNewTab(url) {
        window.open(url, '_blank');
        return false;
    }
</script>

      

    </form>
   
</body>
</html>
