﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocLimitFrame.aspx.cs" Inherits="EIS.Web.Doc.Limit.DocLimitFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>权限设置</title>
</head>
<frameset rows="40,*" frameborder="0">
	<frame name="limittop" id="limittop" src="DocLimitTop.aspx?funId=<%=Request["funId"] %>" noresize="noresize" />
	<frame name="limitmain" id="limitmain" src="FunLimitQuery.aspx?funId=<%=Request["funId"] %>"/>
</frameset>
</html>
