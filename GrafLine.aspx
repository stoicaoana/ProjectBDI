<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrafLine.aspx.cs" Inherits="ProjectBDI.GrafLine" %>
<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formLine" runat="server">
        <div>
            <cc1:ZedGraphWeb ID="ZedGraphWebLine" runat="server">
            </cc1:ZedGraphWeb>
        </div>
    </form>
</body>
</html>
