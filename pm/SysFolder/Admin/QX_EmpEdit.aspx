﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefEmployeeLimitEdit.aspx.cs" Inherits="EIS.Sudio.SysFolder.Permission.DefEmployeeLimitEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>授权设置</title>
    <meta content="no-cache" http-equiv="Pragma"/>
    <link href="../../Css/AppStyle.css" rel="stylesheet" type="text/css" />
    <script src="../../Js/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/jquery.notice.js"></script>
    <script type="text/javascript" src="../../js/lhgdialog.min.js?t=self"></script>
    <script src="Js/limit.js?v=1" type="text/javascript"></script>
    <style type="text/css">
    body
    {
	    font-size: 12px;
	    font-family: "Verdana", "Arial", "宋体", "sans-serif";
	    background:#ffffff;
	    color: #606060;
	    width:100%;
	    height:100%;
	
    }
    .level1{color:#007fff;font-weight:bold;}
    /* 容器,主要控件放这里面*/
    .ViewGridContain
    {
	    border:0;
	    position:relative;
	    background-color:#ffffff;
        margin:5px;/*180px;*/
	    width:760px;
	    padding:10px;
	
    }
    .table_title
    {
    	height:26px;
    	background:#efefef;
    }
    input[type=checkbox]{
    	margin-left:3px;
        vertical-align:middle;
    }
    table.bodystyle{
        table-layout:fixed;
        border-collapse:collapse;
        border:1px solid #a0a0a0;
        }
     table.bodystyle td{
         padding:0px;
         text-align:center;
         border:1px solid #a0a0a0;
         }
    table.bodystyle td.nodetd{
        text-align:left;
        border-top-width:0px;
        border-bottom-width:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
            <div class="menubar">
            <div class="topnav">
                <span style="float:left;margin-left:10px">目前员工：<a id="A1" href="javascript:;" title="查看员工信息"><%=Request["rolename"] %></a>&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    切换系统：
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </span>
                <span style="float:right;margin-right:10px">

                        &nbsp;&nbsp;
                        <a id="A3" href="javascript:SaveRoleLimit();"  title="保存权限">保存</a>
                        &nbsp;
                 </span>       
            </div>
            </div>
            <div class="ViewGridContain">
                <div id="TContent">
                    <table id="" class="bodystyle"  width="100%" border="1"  onclick="tableclick()">
                        <tr class="table_title">
                        <th style="text-align:left;border:1px solid #a0a0a0;"  width="260">&nbsp;&nbsp;选择方式：
                        <input id="chkrelation" type="checkbox" checked="checked"/><label for="chkrelation">级联选择</label></th>
                        <th >显示</th>
                        <th >新建</th>
                        <th >修改</th>
                        <th >删除</th>
                        <th >条件</th>
                        <th >布局</th>
                        <th >导出</th>
                        <th >导入</th>
                        <th width="120">扩展</th>
                    </tr>
                    <%=strTreeHtml%>
                    </table>
                
                </div>
            </div>
    


    </form>
</body>
</html>

<script type="text/javascript">
	var _curClass = EIS.Sudio.SysFolder.Permission.DefEmployeeLimitEdit;
	var LimitData = $($.parseXML('<%= strLimitData %>'));
	var curval; //当前进行批处理的全局值
	var curvalint; //当前进行批处理的全局值
	var curvalrow; //当前进行批处理的全局值
	function SaveRoleLimit() {
	    var changednodes = LimitData.find('tn[EditFlag=1]');
	    if (changednodes.length == 0) {
	        alert("没有结点需要保存");
	        return ; //没有结点需要保存
	    }
	    var ret = _curClass.SaveLimit("<%= roleid %>", _serializeToString(LimitData), "<%=webId %>");
	    if (!ret.error) //同步数据
	    {
	        $.noticeAdd({ text: '保存成功！' });
	        LimitData = $($.parseXML(ret.value));
	    }
	    else {
	        alert(ret.error.Message);
	    }

	}
	jQuery(function () {
	    $(".hlink").click(function () {
	        var funId = $(this).prop("funid");
	        var url = "QX_QueryLimit.aspx?empId=<%=roleid %>&funId=" + funId;
	        var dlg = new jQuery.dialog({ title: '权限分析', maxBtn: true, page: url
                , btnBar: false, cover: false, lockScroll: true, width: 700, height: 400, bgcolor: 'black', cancelBtnTxt: '关闭'
	        });
	        dlg.ShowDialog();
	    });
	});
</script>
