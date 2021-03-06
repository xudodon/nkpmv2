<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupRoleList.aspx.cs" Inherits="EIS.Sudio.SysFolder.Permission.GroupRoleList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Pragma" content="no-cache" />
    <title>角色列表</title>
    <link rel="stylesheet" type="text/css" href="../../grid/css/flexigrid.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/DefStyle.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/ymPrompt_vista/ymPrompt.css" />
    
    <script type="text/javascript" src="../../grid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="../../grid/flexigrid.js"></script>
    <script type="text/javascript" src="../../DatePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="../../js/ymPrompt.js"></script> 
</head>

<body style="margin:1px;" scroll="no">
    <form id="form1" runat="server">
    <div id="griddiv" >
        <table id="flex1" style="display:none"></table>    
    </div>

    </form>
</body>
</html>
<script type="text/javascript"> 
<!--
    var curClass = EIS.Sudio.SysFolder.Permission.GroupRoleList;
    var para = "";
    $(function () {
    });
    $("#flex1").flexigrid
			(
			{
			    url: '../../getxml.ashx',
			    params: [{ name: "queryid", value: "T_E_Org_Role" }
			        , { name: "cryptcond", value: "" }
			        , { name: "sindex", value: "" }
			        , { name: "condition", value: "CompanyID=[QUOTES][!CompanyID!][QUOTES]" }
			        ],
			    colModel: [
	            { display: '序号', name: 'rowindex', width: 30, sortable: false, align: 'center' },
                { display: '角色名称', name: 'RoleName', width: 120, sortable: true, align: 'left', hide: false, renderer: fnName },
                { display: '设置人员', name: '_AutoID', width: 80, sortable: true, align: 'left', hide: false, renderer: setEmpCol },
                { display: '角色类别', name: 'RoleType', width: 60, sortable: true, align: 'left', hide: false, renderer: false },
                { display: '排序', name: 'OrderID', width: 40, sortable: true, align: 'center', hide: false, renderer: false},
                { display: '说明', name: 'RoleNotes', width: 120, sortable: true, align: 'left', hide: false, renderer: false}

				],
			    buttons: [
				{ name: '新建角色', bclass: 'add', onpress: app_add },
				{ name: '删除', bclass: 'delete', onpress: app_delete },
				{ separator: true },
				{ name: '查询', bclass: 'view', onpress: app_query },
				{ name: '清空', bclass: 'clear', onpress: app_reset }

				],
			    searchitems: [
			    { display: '角色名称', name: 'RoleName', type: 1 },
                { display: '角色编号', name: 'RoleCode', type: 1 }
			    ],
			    sortname: "OrderID",
			    sortorder: "asc",
			    usepager: true,
			    singleSelect: true,
			    useRp: true,
			    rp: 15,
			    multisel: false,
			    showTableToggleBtn: false,
			    resizable: false,
			    height: 'auto',
			    onError: showError,
			    preProcess: false,
			    onColResize: fnColResize
			}
	);
	function showError(data) {
        alert("加载数据出错");
    }
    function app_add(cmd, grid) {
        openCenter("../AppFrame/AppInput.aspx?tblName=T_E_Org_Role&sindex=1", "_blank", 800, 500);
    }
    function setEmpCol(fldval, row) {
        var rowId = $(row).attr("id");
        var empNum = $("EmpNum", row).text();
        var empName = $("RoleName", row).text();
        var roleType = $("RoleType", row).text();
        var arr = [];
        if (roleType == "普通") {
            arr.push("<a href=\"javascript:setEmp('"+rowId+"','" + fldval + "','" + empName + "');\" >设置");
            if (empNum != "0")
                arr.push("（", empNum, "）");
            arr.push("</a>");
        }
        else if (roleType == "动态") {
            var roleSQL = $("RoleSQL", row).text().replace(/'/g,"[QUOTES]");
            arr.push("<a style='color:#444;' href='javascript:viewEmp(\""+rowId+"\",\"" + roleSQL + "\");' >查看");
            arr.push("</a>");
        }
        else{
            return "";
        }
        return arr.join("");

    }
    function setEmp(rowId,roleId,roleName) {

        $("tr.trSelected").removeClass("trSelected");
        $("#row"+rowId).addClass("trSelected");

        var d = new Date();
        var url = "RoleEmployeeSet.aspx?tblName=T_E_Org_RoleEmployee&RoleId="+roleId
        window.parent.frames["main"].location =url ;

    }
    function viewEmp(rowId,roleSQL) {

        $("tr.trSelected").removeClass("trSelected");
        $("#row"+rowId).addClass("trSelected");

        var d = new Date();
        var url = "../AppFrame/AppQuery.aspx?tblName=Q_Org_SQLRoleEmp&defaultvalue=@RoleSQL=" + roleSQL +"&t="+d.getMilliseconds();
        window.parent.frames["main"].location = url;

    }
    function fnName(roleName, row) {
        var roleId = $(row).attr("id");
        return "<a href=\"javascript:roleEdit('" + roleId + "')\">" + roleName + "</a>";
    }
    function roleEdit(roleId) {
        openCenter("../AppFrame/AppInput.aspx?tblName=T_E_Org_Role&sindex=1&condition=_AutoID='" + roleId + "'", "_blank", 800, 500);
    }
    function fnColResize(fieldname, width) {

    }
    function app_layout(cmd, grid) {
        //暂时有点儿问题，应该把fieldname 换成fieldid
        var fldlist = [];
        $('th', grid).each(function () {

            fldlist.push((this.fieldid || this.field) + "=" + ($(this).width() - 10) + "=" + $(this).css("display"));
        });
        var ret = curClass.saveLayout(fldlist, "T_E_Org_Department", "");
        if (ret.error) {
            alert("保存出错：" + ret.error.Message);
        }
        else {
            alert("保存成功！");
        }
    }
    function app_reset(cmd, grid) {
        $("#flex1").clearQueryForm();
    }
    function app_delete(cmd, grid) {
        if ($('.trSelected', grid).length > 0) {
            if (confirm('确定删除这个角色吗?')) {
                $('.trSelected', grid).each
			            (
			                function () {
			                    var ret = curClass.RemoveRole(this.id.substr(3));
			                    if (ret.error) {
			                        alert("删除出错：" + ret.error.Message);
			                    }
			                    else {
			                        alert("删除成功！");
			                        $("#flex1").flexReload();
			                    }
			                }
			            );

            }
        }
        else {
            alert("请选中一条记录");
        }
    }
    function addCallBack() {
        $("#flex1").flexReload();
    }
    function app_setquery() {
        var ret = window.showModalDialog("AppConditionDef.aspx?tblname=T_E_Org_Department&sindex=", "", "dialogHeight=500px;dialogWidth=400px;status=no;center=yes;resizable=yes;");
        if (ret == "ok")
            window.location.reload();
    }
    function app_query() {
        $("#flex1").flexReload();
    }

    function openCenter(url, name, width, height) {
        var str = "height=" + height + ",innerHeight=" + height + ",width=" + width + ",innerWidth=" + width;
        if (window.screen) {
            var ah = screen.availHeight - 30;
            var aw = screen.availWidth - 10;
            var xc = (aw - width) / 2;
            var yc = (ah - height) / 2;
            str += ",left=" + xc + ",screenX=" + xc + ",top=" + yc + ",screenY=" + yc;
            str += ",resizable=yes,scrollbars=yes,directories=no,status=no,toolbar=no,menubar=no,location=no";
        }
        return window.open(url, name, str);
    }
            
//-->
</script>