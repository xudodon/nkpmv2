﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrgSwitch.aspx.cs" Inherits="EIS.Web.OrgSwitch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>组织部门</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
	<link rel="stylesheet" href="css/appStyle.css?v=1" type="text/css"/>
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css"/>
	<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.all-3.4.min.js"></script>

     <style type="text/css">
         body{overflow:hidden;}
     	#tree
	    {
	        border:#c3daf9 1px solid;
	        background:#f9fafe;
	        overflow:auto;
	        padding:5px;
	        margin:5px;
	    }
	    a:hover{text-decoration:none;}
	    #txtSearch{padding:2px 3px;border:1px solid #bbb;}
     </style>    
	</head>
	<body>
		<form id="form1" method="post" runat="server">
         <div class="toolbar" style="background-image:url();border-bottom-color:#ddd;">
            <button id="btnExpand" type="button" title="全部展开"><img alt="全部展开" src="img/common/ico6.gif" />展开</button>
            <button id="btnFresh" type="button"><img alt="刷新" src="img/common/fresh.png" />刷新</button>
        	<input id="txtSearch"  type="text" size="8"/>
            <button id="btnFind" type="button"><img alt="查找" src="img/common/search.png" />查找</button>
            <button id="btnConfirm" type="button"><img alt="确定" src="img/common/accept.png" />确定</button>
        </div>
        <ul id="tree"  class="ztree"> 
        </ul>
       <script type="text/javascript">
        var setting = { 
           view:{
                 fontCss: getFont,
                 nameIsHTML: true
                },
            edit: {
                    drag:{
                        autoExpandTrigger: true,
                        isCopy:true,
                        isMove:true
                        },
				    enable: false,
                    showRenameBtn:false,
                    showRemoveBtn:false,
				    editNameSelectAll: false
			    },
            callback:{
                onClick:nodeClick
                }
        };

        function getFont(treeId, node){
            if(node.tag == "0"){
                return {color:'#aaa'};
            }
            else{
                return {color:'#333'};
            }
        }
        function nodeNameChange(name)
        {
            var nodes = zTree.getSelectedNodes();
            if(nodes.length>0)
            {
                nodes[0].name=name;
                zTree.updateNode(nodes[0]);
            }

        }
        function nodeClick(e,treeId,node)
        {
            if(node.tag=="0")
                $("#btnConfirm").prop("disabled",true).css("color","#aaa");
            else
                $("#btnConfirm").prop("disabled",false).css("color","#333");
        }

        function expandToRoot(node)
        {
            if(node.getParentNode())
            {
                var pNode =node.getParentNode();
                zTree.expandNode(pNode,true,false,true);
                expandToRoot(pNode);
            }
        }
        var searchKey="" ;
        var searchOrder = 0;
        var searchNodes =[];
        function searchNode()
        {
            if(!$("#txtSearch").val())
            {
                return;
            }
            if(searchKey != $("#txtSearch").val())
            {
                //新的查询
                searchKey = $("#txtSearch").val();
                searchNodes = zTree.getNodesByParamFuzzy("name", searchKey);
                searchOrder = 0;
            }
            if(searchOrder<searchNodes.length)
            {
                if(searchNodes.length>0)
                {
                    zTree.selectNode(searchNodes[searchOrder]);
                    expandToRoot(searchNodes[searchOrder]);
                    searchOrder++;
                }
            }
            else
            {
                searchOrder=0;
            }
        }
        var zTree;
        var zNodes =<%=treedata %>;
        $(function () {
            var h=$(document).height();
            $("#tree").height(h-60);
            $(window).resize(function(){
                var h=$(document).height();
                $("#tree").height(h-60);
            });
            $.fn.zTree.init($("#tree"), setting, zNodes);
            zTree = $.fn.zTree.getZTreeObj("tree");
            var root =zTree.getNodeByTId("tree_1");
            $("#btnExpand").toggle(function(){
                $.each(root.children,
                function(i,n){
                    zTree.expandNode(n,true,true,false);
                });
            },function(){
                $.each(root.children,
                function(i,n){
                    zTree.expandNode(n,false,true,false);
                });
            });
            $("#btnFresh").click(function(){
                window.location.reload();
            });
            $("#btnFind").click(function(){
                searchNode();
            });
            $("#txtSearch").keydown(function(e){
                if(e.keyCode == 13){
                    searchNode();
                    $("#txtSearch").focus();
                    return false;
                }
            });
            $("#btnConfirm").click(function(){
                var nodes = zTree.getSelectedNodes();
                if(nodes.length>0){
                    var orgId= nodes[0].value;
                    window.open('<%=Request["page"] %>.aspx?OrgId=' + orgId,"_top");
                }
                else{
                    alert("请选择要切换的组织名称");
                }
            });
        });
       </script>
		</form>
	</body>
</html>
