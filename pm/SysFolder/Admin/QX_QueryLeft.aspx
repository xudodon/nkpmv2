<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QXList.aspx.cs" Inherits="EIS.WebBase.SysFolder.Limit.QXList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>员工查询</title>
    <link rel="stylesheet" type="text/css" href="../../grid/css/flexigrid.css"/>
    <link rel="stylesheet" type="text/css" href="../../Css/DefStyle.css"/>
    <script type="text/javascript" src="../../grid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="../../grid/flexigrid.js"></script>
    <style type="text/css">
        .red{color:red;text-decoration:none;font-weight:normal;border:0px solid #eee;padding:2px;}
        .red:hover{color:white;text-decoration:none;background-color:#aaa;border:0px solid gray;}
        .green{color:green;text-decoration:none;font-weight:normal;border:0px solid #eee;padding:2px;}
        .green:hover{color:white;text-decoration:none;background-color:#aaa;border:0px solid gray;}
        
    </style>
</head>
<body style="margin:1px">
    <form id="form1" runat="server">
    <div id="griddiv">
        <table id="flex1" style="display:none"></table>    
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
<!--
    $("#flex1").flexigrid
	({
	    url: '../../getdata.ashx?ds=org_data',
	    params: [{ name: "queryid", value: "Org_EmpList" }
			    , { name: "condition", value: "<%=RoleOrgFilter%>" }
			    ],
	    colModel: [
			{ display: '序号', name: 'rowindex', width: 30, sortable: false, align: 'center' },
			{ display: '姓名-工号', name: 'EmployeeName', width: 80, sortable: true, align: 'left', renderer: transName },
			{ display: '部门', name: 'DeptName', width: 80, sortable: false, align: 'center' },
            { display: '单位', name: 'CompanyName', width: 100, sortable: false, align: 'left' }
			],
	    buttons: [
			{ name: '查询', bclass: 'view', onpress: app_query },
			{ name: '清空', bclass: 'clear', onpress: app_reset }

			],
	    searchitems: [{ display: '工号 / 姓名', name: 'EmployeeName', type: 1}],
	    sortname: "",
	    sortorder: "",
	    usepager: true,
	    singleSelect: false,
	    onToggleCol: false,
	    useRp: false,
	    rp: 15,
	    multisel: false,
	    showToggleBtn: false,
	    resizable: false,
	    height: 'auto'
	}
	);

	function transName(v, row) {
        var empId = $(row).attr("id");
        var empName = $("EmployeeName", row).text();
        var url = "QX_QueryEmp.aspx?roleId=" + empId + "&rolename=" + empName;
        return "<a href=\"javascript:openMain('" + url + "');\">" + v + "</a>";
    }
    function openMain(url) {
        window.parent.frames["main"].location = url;
    }
	function app_select() {
		jQuery(".chkcol").attr("checked",true);
	}

	function app_reset(cmd,grid)
	{
        $("#flex1").clearQueryForm();
	}
			
	function app_query()
	{
		$("#flex1").flexReload();
	}
//-->
</script>
