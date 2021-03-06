<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowChart.aspx.cs" Inherits="EZ.WebBase.SysFolder.WorkFlow.FlowChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>流程图</title>
    <style type="text/css">
    Table.NodeTipTable{border: #ff3366 2px solid;border-collapse: separate}
    Table.NodeTipTable TD{background-color: #ffffff;padding-left: 2px;padding-right: 2px;white-space:nowrap;color: red;}
    Table.NodeTipTable TR.head TD{background-color: #ffff99;color: black}
    Table.NodeTipTable TR.processing TD{color: green;}
    </style>
    <script type="text/javascript">
        var g_TipContainer = null;
        function ShowNodeTip(nodeName) {
            if (arrNodeToolTip == null)
                return;
            if (g_TipContainer != null)
                return;

            var tip = null;
            for (var i = 0; i < arrNodeToolTip.length; i++) {
                if (arrNodeToolTip[i][0] == nodeName) {
                    tip = arrNodeToolTip[i][1];
                    break;
                }
            }

            if (tip == null)
                return;

            var x = event.clientX + document.documentElement.scrollLeft - event.offsetX + 32;
            var y = event.clientY + document.documentElement.scrollTop - event.offsetY + 32;

            g_TipContainer = _nodeTipDiv;
            g_TipContainer.style.display = '';
            g_TipContainer.style.pixelLeft = x;
            g_TipContainer.style.pixelTop = y;

            g_TipContainer.innerHTML = tip;
        }

        function HideTip() {
            if (g_TipContainer != null) {
                g_TipContainer.style.display = 'none';
                g_TipContainer = null;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="90%" border="0" align="center">
        <tr><td height="30"><h4 style="float:left;color:#4677bf"><span>流程名称：</span><%=defModel.WorkflowName%></h4></td></tr>
        
        <tr><td style="color:Gray;font-size:12px;">创建人：管理员 &nbsp;&nbsp;&nbsp;&nbsp;版本：V<%=defModel.Version%>&nbsp;&nbsp;&nbsp;&nbsp;修改时间：<%=defModel.K_UpdateTime%></td></tr>
    </table>

    <div id="_dp" style="border:blue 1px solid;width:<%=MaxWidth%>px;height:<%=MaxHeight%>px;">
        <wf:WorkflowImg id="FlowImg" runat="server"></wf:WorkflowImg>
    </div>
    <div id="_nodeTipDiv" style="position:absolute; background-color:#cccccc; border-width:1px; border-color:Gray;">
    </div>

    <script type="text/javascript"> 
        var arrNodeToolTip = null;
    </script>
    </form>
</body>
</html>
