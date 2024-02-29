<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Graph.aspx.cs" Inherits="ProjectBDI.Graph" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <cc1:ZedGraphWeb ID="ZedGraphWeb2" runat="server" OnRenderGraph="ZedGraphWeb1_RenderGraph" RenderedImagePath="~/Graphics/" Height="350" Width="600">
            </cc1:ZedGraphWeb>
        </div>
    
    </form>
    <p>
        &nbsp;</p>
</body>
</html>

