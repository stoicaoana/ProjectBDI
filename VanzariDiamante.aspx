<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VanzariDiamante.aspx.cs" Inherits="ProjectBDI.VanzariDiamante" %>
<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Aceastea sunt vanzarile avute</p>
<asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SDS_VanzariDiamante" DataTextField="statusPlata" DataValueField="statusPlata" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
    <asp:ListItem>Toate</asp:ListItem>
            </asp:RadioButtonList>

<asp:SqlDataSource ID="SDS_VanzariDiamante" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT distinct([statusPlata]) FROM [FacturaVanzare]"></asp:SqlDataSource>

          <asp:GridView ID="GridViewFacturaVanzareDiamant" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
              <Columns>
                  <asp:CheckBoxField />
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

        
            <br />
            <br />

        
        </div>
        <br />
       <div>
    
           <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    
 </div>

    </form>
</body>
</html>
