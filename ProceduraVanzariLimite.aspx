<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProceduraVanzariLimite.aspx.cs" Inherits="ProjectBDI.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="color: #7200BF; font-size: small; font-weight: 700;">
            <br />
            <asp:Button ID="btnDropCreate" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderWidth="3px" Font-Bold="True" Text="Drop&amp;Create" Width="150px" Font-Names="Cambria" Font-Size="Small" ForeColor="#660066" OnClick="btnDropCreate_Click" />
            <br />
            <br />
            <asp:TextBox ID="tbMes" runat="server" BackColor="#FFDFFF" BorderColor="#CC0099" Height="288px" ReadOnly="true" TextMode="MultiLine" Width="537px" Font-Names="Cambria" ForeColor="#660066"></asp:TextBox>
            <br />
            <br />
            <br />
            <strong style="font-size: small; display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min&nbsp;&nbsp; </strong>
            <asp:TextBox ID="tbMin" runat="server" BackColor="#CCCCFF" BorderColor="#9900FF" Font-Names="Cambria" ForeColor="#660066" Width="100px">0</asp:TextBox>
            &nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCall" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderWidth="3px" Font-Bold="True" style="margin-left: 130px" Text="Apel" Font-Names="Cambria" Font-Size="Small" ForeColor="#660066" OnClick="btnCall_Click" Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Profit mediu<asp:TextBox ID="tbMedie" runat="server" BackColor="#CCCCFF" BorderColor="#9900FF" Font-Names="Cambria" ForeColor="#660066" style="margin-left: 8px" Width="153px" ReadOnly="true"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max
            <asp:TextBox ID="tbMax" runat="server" BackColor="#CCCCFF" BorderColor="#9900FF" Font-Names="Cambria" ForeColor="#660066" style="margin-left: 4px" Width="100px">25</asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnBack" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderWidth="3px" Font-Bold="True" ForeColor="#660066" OnClick="btnBack_Click" Text="Back" Width="100px" Font-Names="Cambria" />
        </div>
    </form>
</body>
</html>
