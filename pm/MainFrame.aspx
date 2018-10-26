﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainFrame.aspx.cs" Inherits="NTJT.Web.MainFrame" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>项目管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="Theme/AdminLTE/bootstrap/css/bootstrap.min.css"> 
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Theme style -->
    <link rel="stylesheet" href="Theme/AdminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" id="skinlink" href="Theme/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="Static/mainpm/iconfont/iconfont.css">
    <style>
        .hidden {
            display: none;
        }

        .control-sidebar-subheading {
            font-size: 12px;
        }

        .skin-blue-light .sidebar-menu > li.active > a {
            color: dodgerblue;
        }

        .sidebar-menu > li > a {
            padding: 12px 5px 12px 15px;
            display: block;
            font-size: 15px;
            color: #fff !important;
        }

            .sidebar-menu > li > a > i {
                font-size: 14px;
                display: inline-block;
                zoom: 1;
                width: 16px;
                color: #fff;
                vertical-align: middle;
                margin-right: 5px;
            }

        .sidebar-menu .treeview-menu > li > a {
            padding: 5px 5px 5px 25px;
            display: block;
            font-size: 14px;
            /*margin-right: 5px;*/
        }
         .sidebar-menu .treeview-menu > li > a >i{

            margin-right: 5px;
        }
        .user-menu {
            font-size: 10px;
        }

        .btn {
            font-size: 12px;
        }

        .dropdown-menu {
            font-size: 12px;
        }

        .navbar-nav > .user-menu > .dropdown-menu > li.user-header > p {
            font-size: 12px;
        }

        .main-header .logo {
            font-size: 16px;
        }

        p {
            font-size: 12px;
        }

        #FirstMenu {
            width: 400px;
            padding-top: 0px;
            padding-bottom: 0px;
        }

            #FirstMenu a {
                color: dodgerblue;
                padding-top: 0px;
                margin-bottom: 0px;
                line-height: 40px;
            }

        #SearMenu {
            color: dodgerblue;
            padding-top: 0px;
            margin-bottom: 0px;
            line-height: 40px;
            padding-bottom: 0px;
        }

            #SearMenu li {
                float: left;
                display: inline;
                line-height: 100px;
                width: 100%;
            }

                #SearMenu li a {
                    line-height: 35px;
                }

                    #SearMenu li a i {
                        font-size: 14px;
                    }
                    
                #SkinMenu li a {
                    line-height: 35px;
                }
        #FirstMenu li {
            float: left;
            display: inline;
            line-height: 100px;
            width: 33.33%;
        }

        .liborder {
            border-bottom: 1px solid #EFECEC;
        }

        .sidebar-menu .fa {
            font-size: 14px;
            margin-right: 5px;
        }

        .pull-center {
            width: 100px;
            margin: 0 auto;
            float: left;
            display: table;
            margin-left: 25px;
        }

        @media (min-width: 768px) {
            .sidebar-mini.sidebar-collapse .sidebar-menu > li:hover > .treeview-menu {
                top: 40px !important;
                margin-left: 0;
            }

            .sidebar-mini.sidebar-collapse .sidebar-menu > li:hover > a > span:not(.pull-right), .sidebar-mini.sidebar-collapse .sidebar-menu > li:hover > .treeview-menu {
                display: block !important;
                position: absolute;
                width: 200px !important;
                left: 50px;
            }
        }

        #searchMore-btn {
            /*background: rgba(255,255,255,0.2);
            border-color: transparent;*/
            height: 34px;
        }

        .navbar-form .input-group-btn {
            background: rgba(255,255,255,0.2);
            border-color: transparent;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5.min.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var FirstLoad=0;
        function autoHeight(){
            FirstLoad++;
            var iframe = document.getElementById("ifxMain");
            if(iframe.Document){//ie自有属性
                iframe.style.height = iframe.Document.documentElement.scrollHeight;
            }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
                var height=$('.content-wrapper').height();	
                //iframe.contentDocument.body.height=height-38+'px';			
                if(iframe.contentDocument.body.offsetHeight<(height-50)){	
                    iframe.height =height-50+'px';
                }else{				
                    iframe.height = iframe.contentDocument.body.offsetHeight+20+'px' ;
                }
            }
        }
    </script>
</head>
<!--skin-blue-light sidebar-mini sidebar-collapse-->
<!--skin-blue sidebar-mini wysihtml5-supported sidebar-collapse-->
<body class="skin-blue-light sidebar-mini fixed" style="overflow-y: hidden;">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="SysFolder/Extension/HomePM.aspx" target="ifxMain" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>PM</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>项目管理系统</b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" title="展开/收起菜单" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <ul class="nav navbar-nav">
                    <li><a title="流程桌面" href="SysFolder/Extension/HomePM.aspx" onclick="ShowTitle(this)" data-top="1" data-partitle="流程桌面" target="ifxMain"><i class="iconfont">&#xe68c;</i></a></li>
                    <li><a title="项目桌面" href="SysFolder/Extension/HomePMPro.aspx" onclick="ShowTitle(this)" data-top="1" data-partitle="项目桌面" target="ifxMain"><i class="iconfont">&#xe609;</i></a></li>
                    <%--<li><a title="图表桌面" href="SysFolder/Extension/HomePMRp.aspx" onclick="ShowTitle(this)" data-top="1" data-partitle="图表桌面" target="ifxMain"><i class="iconfont">&#xe609;</i></a></li>--%>
                    <li class="dropdown" style="display: none;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">应用中心 <span class="caret"></span></a>
                        <ul class="dropdown-menu" id="FirstMenu" role="menu">
                        </ul>
                    </li>
                    <%--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span id="ChangeSkin">皮肤</span><span class="caret"></span></a>
                        <ul class="dropdown-menu" id="SkinMenu" role="menu">
                            <li class="liborder"><a path=""><i class="fa fa-address-card-o "></i>黑色</a></li>
                            <li><a path="blue"><i class="fa fa-paper-plane-o "></i>蓝色</a></li> 
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span id="SearTitle">搜索</span><span class="caret"></span></a>
                        <ul class="dropdown-menu" id="SearMenu" role="menu">
                            <li class="liborder"><a href="#"><i class="fa fa-address-card-o "></i>员工</a></li>
                            <li class="liborder"><a href="#"><i class="fa fa-paper-plane-o "></i>合同</a></li>
                            <li><a href="#"><i class="fa fa-object-ungroup"></i>待办</a></li>
                        </ul>
                    </li>--%>
                </ul>
                <%--<form class="navbar-form navbar-left" style="padding-left: 0px;" role="search">
                    <div class="input-group">

                        <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">
                        <span class="input-group-btn">
                            <button type="button" name="searchMore-btn" id="searchMore-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>--%>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu" style='display: none;'>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <%-- <img src="Theme/AdminLTE/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">--%>
                                                </div>
                                                <h4>Developers
                            <small><i class="fa fa-clock-o"></i>Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <%-- <img src="Theme/AdminLTE/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">--%>
                                                </div>
                                                <h4>Sales Department
                            <small><i class="fa fa-clock-o"></i>Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <%--<li class="dropdown notifications-menu">
                            <a href="#" title="全屏" data-top="1" isfull="0" onclick="IsFullScreen(this)" class="dropdown-toggle">
                                <i class="fa fa-arrows-alt"></i>
                            </a>
                            <ul class="dropdown-menu">
                            </ul>
                        </li>
                        <li class="dropdown notifications-menu">
                            <a href="Sysfolder/workflow/flowtodo.aspx" title="我的待办" data-top="1" target="ifxMain" onclick="ShowTitle(this)" class="dropdown-toggle">
                                <i class="fa fa-object-group"></i>
                                <span class="label label-warning" id="todo_num"></span>
                            </a>
                            <ul class="dropdown-menu">
                            </ul>
                        </li>
                        <!--流程大厅-->
                        <li class="dropdown online-menu">
                            <a href="SysFolder/WorkFlow/flowList.aspx" title="流程大厅" data-top="1" onclick="ShowTitle(this)" target="ifxMain" class="dropdown-toggle"><i class="fa fa-random"></i></a>
                            <ul class="dropdown-menu">
                                <li class="header"></li>
                            </ul>

                        </li>--%>


                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="SysFolder/AppFrame/AppDefault.aspx?TblName=T_PM_T_RemindItems&condition=K_UserName=[QUOTES]<%=EmployeeID %>[QUOTES] or RemindManID=[QUOTES]<%=EmployeeID %>[QUOTES] "
                                 title="提醒事项" data-top="1" target="ifxMain" onclick="ShowTitle(this)" class="dropdown-toggle">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning" id="sms_num"></span>
                            </a>
                            <ul class="dropdown-menu">
                            </ul>
                        </li>
                        <!--在线人数-->
                        <%--<li class="dropdown online-menu">
                            <a href="online.aspx" title="在线人数" onclick="ShowTitle(this)" data-top="1" target="ifxMain" class="dropdown-toggle"><i class="fa fa-users"></i><span class="label label-warning" id="user_count"></span></a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                            </ul>

                        </li>--%>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu" style='display: none;'>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>Design some buttons
                            <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>Create a nice theme
                            <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>Some task I need to do
                            <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>Make beautiful transitions
                            <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="img/slogo.png" class="user-image" alt="User Image">
                                <span class="hidden-xs"><%=base.EmployeeName %></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="img/slogo.png" class="img-circle" alt="User Image">
                                    <p>
                                        <%=base.PositionName %>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <li class="user-body" style="display: none;"><%=sbPosList %></li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="ChangePass.aspx" data-top="1" data-partitle="桌面" data-title="个人资料" onclick="ShowTitle" target="ifxMain" class="btn btn-default btn-flat" title="修改密码"><i class="fa fa-user-o"></i>&nbsp;&nbsp;修改密码</a>
                                    </div>
                                    <div class="pull-center" style="display: none;">
                                        <a href="#" class="btn btn-default btn-flat"><i class="fa fa-bell-o"></i>岗位切换</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="default.aspx?logout=1" target="_self" class="btn btn-default btn-flat"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;退出系统</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->
                        <li style='display: none;'>
                            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- 左侧导航栏. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel hidden">
                    <div class="pull-left image">
                        <img src="Theme/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><%=base.EmployeeName %> <%=UserInfo.DeptName %></p>
                        <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
                    </div>
                </div>
                <!-- search form -->
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" id="SearchMenu" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <button type="button" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
                <!-- /.search form -->
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li id="leftHeader" class="header" style="display: none;">左侧导航栏</li>

                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <form id="form2" runat="server">
        <!-- 内容区域 -->
        <div class="content-wrapper" style="background-color: #e8edf6;">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 0px; border-bottom: 1px solid #eee;">
                <div>
                    <ol class="breadcrumb" style="float: none; margin-bottom: 0px;">
                        <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;&nbsp;<span id="DeskMenu">桌面</span></a></li>
                        <li class="active">首页</li>
                    </ol>
                </div>
            </section>

            <!-- Main content -->
            <section class="content" id="secContent" style="padding: 5px;"><%--onload="autoHeight();"--%>
                <iframe name="ifxMain" id="ifxMain" src="SysFolder/Extension/HomePM.aspx"  scrolling="auto" border="0" frameborder="0" style="width: 100%;height:100%;" allowtransparency="true"></iframe>
                <!-- Small boxes (Stat box) -->
                <div class="row" style="display: none;">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>150</h3>
                                <p>New Orders</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>
                                <p>Bounce Rate</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>44</h3>
                                <p>User Registrations</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>65</h3>
                                <p>Unique Visitors</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
                <!-- Main row -->
                <div class="row" style="display: none;">
                    <!-- Left col -->
                    <section class="col-lg-7 connectedSortable">
                        <!-- Custom tabs (Charts with tabs)-->
                        <div class="nav-tabs-custom">
                            <!-- Tabs within a box -->
                            <ul class="nav nav-tabs pull-right">
                                <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
                                <li><a href="#sales-chart" data-toggle="tab">Donut</a></li>
                                <li class="pull-left header"><i class="fa fa-inbox"></i>Sales</li>
                            </ul>
                            <div class="tab-content no-padding">
                                <!-- Morris chart - Sales -->
                                <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
                                <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
                            </div>
                        </div>
                        <!-- /.nav-tabs-custom -->

                        <!-- Chat box -->
                        <div class="box box-success">
                            <div class="box-header">
                                <i class="fa fa-comments-o"></i>
                                <h3 class="box-title">Chat</h3>
                                <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                                    <div class="btn-group" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i></button>
                                        <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body chat" id="chat-box">
                                <!-- chat item -->
                                <div class="item">
                                    <%-- <img src="Theme/AdminLTE/dist/img/user4-128x128.jpg" alt="user image" class="online">--%>
                                    <p class="message">
                                        <a href="#" class="name">
                                            <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>2:15</small>
                                            Mike Doe
                                        </a>
                                        I would like to meet you to discuss the latest news about
                      the arrival of the new theme. They say it is going to be one the
                      best themes on the market
                                    </p>
                                    <div class="attachment">
                                        <h4>Attachments:</h4>
                                        <p class="filename">
                                            Theme-thumbnail-image.jpg
                                        </p>
                                        <div class="pull-right">
                                            <button class="btn btn-primary btn-sm btn-flat">Open</button>
                                        </div>
                                    </div>
                                    <!-- /.attachment -->
                                </div>
                                <!-- /.item -->
                                <!-- chat item -->
                                <div class="item">
                                    <%--  <img src="Theme/AdminLTE/dist/img/user3-128x128.jpg" alt="user image" class="offline">--%>
                                    <p class="message">
                                        <a href="#" class="name">
                                            <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>5:15</small>
                                            Alexander Pierce
                                        </a>
                                        I would like to meet you to discuss the latest news about
                      the arrival of the new theme. They say it is going to be one the
                      best themes on the market
                                    </p>
                                </div>
                                <!-- /.item -->
                                <!-- chat item -->
                                <div class="item">
                                    <%-- <img src="Theme/AdminLTE/dist/img/user2-160x160.jpg" alt="user image" class="offline">--%>
                                    <p class="message">
                                        <a href="#" class="name">
                                            <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>5:30</small>
                                            Susan Doe
                                        </a>
                                        I would like to meet you to discuss the latest news about
                      the arrival of the new theme. They say it is going to be one the
                      best themes on the market
                                    </p>
                                </div>
                                <!-- /.item -->
                            </div>
                            <!-- /.chat -->
                            <div class="box-footer">
                                <div class="input-group">
                                    <input class="form-control" placeholder="Type message...">
                                    <div class="input-group-btn">
                                        <button class="btn btn-success"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box (chat box) -->

                        <!-- TO DO List -->
                        <div class="box box-primary">
                            <div class="box-header">
                                <i class="ion ion-clipboard"></i>
                                <h3 class="box-title">To Do List</h3>
                                <div class="box-tools pull-right">
                                    <ul class="pagination pagination-sm inline">
                                        <li><a href="#">&laquo;</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <ul class="todo-list">
                                    <li>
                                        <!-- drag handle -->
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <!-- checkbox -->
                                        <input type="checkbox" value="" name="">
                                        <!-- todo text -->
                                        <span class="text">Design a nice theme</span>
                                        <!-- Emphasis label -->
                                        <small class="label label-danger"><i class="fa fa-clock-o"></i>2 mins</small>
                                        <!-- General tools such as edit or delete-->
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <input type="checkbox" value="" name="">
                                        <span class="text">Make the theme responsive</span>
                                        <small class="label label-info"><i class="fa fa-clock-o"></i>4 hours</small>
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <input type="checkbox" value="" name="">
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="label label-warning"><i class="fa fa-clock-o"></i>1 day</small>
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <input type="checkbox" value="" name="">
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="label label-success"><i class="fa fa-clock-o"></i>3 days</small>
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <input type="checkbox" value="" name="">
                                        <span class="text">Check your messages and notifications</span>
                                        <small class="label label-primary"><i class="fa fa-clock-o"></i>1 week</small>
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="handle">
                                            <i class="fa fa-ellipsis-v"></i>
                                            <i class="fa fa-ellipsis-v"></i>
                                        </span>
                                        <input type="checkbox" value="" name="">
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="label label-default"><i class="fa fa-clock-o"></i>1 month</small>
                                        <div class="tools">
                                            <i class="fa fa-edit"></i>
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix no-border">
                                <button class="btn btn-default pull-right"><i class="fa fa-plus"></i>Add item</button>
                            </div>
                        </div>
                        <!-- /.box -->

                    </section>
                    <!-- /.Left col -->
                    <!-- right col (We are only adding the ID to make the widgets sortable)-->
                    <section class="col-lg-5 connectedSortable">

                        <!-- Map box -->
                        <div class="box box-solid bg-light-blue-gradient">
                            <div class="box-header">
                                <!-- tools box -->
                                <div class="pull-right box-tools">
                                    <button class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range"><i class="fa fa-calendar"></i></button>
                                    <button class="btn btn-primary btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                </div>
                                <!-- /. tools -->

                                <i class="fa fa-map-marker"></i>
                                <h3 class="box-title">Visitors
                                </h3>
                            </div>
                            <div class="box-body">
                                <div id="world-map" style="height: 250px; width: 100%;"></div>
                            </div>
                            <!-- /.box-body-->
                            <div class="box-footer no-border">
                                <div class="row">
                                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                        <div id="sparkline-1"></div>
                                        <div class="knob-label">Visitors</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                        <div id="sparkline-2"></div>
                                        <div class="knob-label">Online</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-xs-4 text-center">
                                        <div id="sparkline-3"></div>
                                        <div class="knob-label">Exists</div>
                                    </div>
                                    <!-- ./col -->
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                        <!-- /.box -->

                        <!-- solid sales graph -->
                        <div class="box box-solid bg-teal-gradient">
                            <div class="box-header">
                                <i class="fa fa-th"></i>
                                <h3 class="box-title">Sales Graph</h3>
                                <div class="box-tools pull-right">
                                    <button class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body border-radius-none">
                                <div class="chart" id="line-chart" style="height: 250px;"></div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer no-border">
                                <div class="row">
                                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                        <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgcolor="#39CCCC">
                                        <div class="knob-label">Mail-Orders</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                        <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgcolor="#39CCCC">
                                        <div class="knob-label">Online</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-xs-4 text-center">
                                        <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgcolor="#39CCCC">
                                        <div class="knob-label">In-Store</div>
                                    </div>
                                    <!-- ./col -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.box-footer -->
                        </div>
                        <!-- /.box -->

                        <!-- Calendar -->
                        <div class="box box-solid bg-green-gradient">
                            <div class="box-header">
                                <i class="fa fa-calendar"></i>
                                <h3 class="box-title">Calendar</h3>
                                <!-- tools box -->
                                <div class="pull-right box-tools">
                                    <!-- button with a dropdown -->
                                    <div class="btn-group">
                                        <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#">Add new event</a></li>
                                            <li><a href="#">Clear events</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">View calendar</a></li>
                                        </ul>
                                    </div>
                                    <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                                <!-- /. tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <!--The calendar -->
                                <div id="calendar" style="width: 100%"></div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer text-black">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- Progress bars -->
                                        <div class="clearfix">
                                            <span class="pull-left">Task #1</span>
                                            <small class="pull-right">90%</small>
                                        </div>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                                        </div>

                                        <div class="clearfix">
                                            <span class="pull-left">Task #2</span>
                                            <small class="pull-right">70%</small>
                                        </div>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                                        </div>
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-sm-6">
                                        <div class="clearfix">
                                            <span class="pull-left">Task #3</span>
                                            <small class="pull-right">60%</small>
                                        </div>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                                        </div>

                                        <div class="clearfix">
                                            <span class="pull-left">Task #4</span>
                                            <small class="pull-right">40%</small>
                                        </div>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                                        </div>
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                        <!-- /.box -->

                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        </form>

        <footer class="main-footer hidden">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.3.0
            </div>
            <strong>Copyright &copy; 2014-2015 <a href="#">Almsaeed Studio</a>.</strong> All rights reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane" id="control-sidebar-home-tab">
                    <h3 class="control-sidebar-heading">Recent Activity</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                    <p>Will be 23 on April 24th</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-user bg-yellow"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                                    <p>New phone +1(800)555-1234</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                                    <p>nora@example.com</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-file-code-o bg-green"></i>
                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                                    <p>Execution time 5 seconds</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Tasks Progress</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Update Resume
                    <span class="label label-success pull-right">95%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Laravel Integration
                    <span class="label label-warning pull-right">50%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">Back End Framework
                    <span class="label label-primary pull-right">68%</span>
                                </h4>
                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                </div>
                <!-- /.tab-pane -->
                <!-- Stats tab content -->
                <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                <!-- /.tab-pane -->
                <!-- Settings tab content -->
                <div class="tab-pane" id="control-sidebar-settings-tab">
                    <form method="post">
                        <h3 class="control-sidebar-heading">常规设置</h3>
                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Report panel usage
                  <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Some information about this general settings option
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Allow mail redirect
                  <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Other sets of options are available
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Expose author name in posts
                  <input type="checkbox" class="pull-right" checked>
                            </label>
                            <p>
                                Allow the user to show his name in blog posts
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <h3 class="control-sidebar-heading">Chat Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Show me as online
                  <input type="checkbox" class="pull-right" checked>
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Turn off notifications
                  <input type="checkbox" class="pull-right">
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Delete chat history
                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                            </label>
                        </div>
                        <!-- /.form-group -->
                    </form>
                </div>
                <!-- /.tab-pane -->
            </div>
        </aside>
        <!-- /.control-sidebar -->

        <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script type="text/javascript" src="Theme/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script type="text/javascript" src="Theme/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
    <!-- Slimscroll -->
    <script type="text/javascript" src="Theme/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script type="text/javascript" src="Theme/AdminLTE/dist/js/app.min.js"></script>
    <script type="text/javascript" src="Theme/AdminLTE/main.js"></script>
    <script type="text/javascript" src="js/layer/3.0.2/layer.js"></script>

</body>
</html>
<script type="text/javascript">
</script>

<script type="text/javascript">
    var _curClass =NTJT.Web.MainFrame;
    var arrMenu =[];
    var func_Data = <%=func_Array %>;
    var func_Tree = func_Data[0].ChildNodes;
    var FirstMenu=[];
    if(func_Tree!=null){
        for(var i=0; i<func_Tree.length; i++){
            var arrText = func_Tree[i];
            var LiClass='';
            var IconArr='';
            //if((i/3)<((func_Tree.length/3)-1))
            LiClass='liborder';
            IconArr=GetIcon(arrText.icon);
            FirstMenu.push('<li class="',LiClass,'"><a href="#" id="',arrText.id,'" onclick="OpenLeftMenu(this,\'\')">',IconArr,arrText.text,'</a></li>');
		
            //FirstMenu.push('<li class="divider"></li>');		
        }
        $("#FirstMenu").html(FirstMenu.join('')); 
                 
        for(var i=0; i<func_Tree.length; i++){
            var menu1 = func_Tree[i];
            var icon = menu1.icon;
            var arrImg =["fa-files-o",""];
            //            arrMenu.push('<li class="header ">');
            //            $('#DeskMenu').html(menu1.text);
            //            arrMenu.push(GetIcon(icon));
            //            arrMenu.push('<span>',menu1.text,'</span>');
            if(menu1.text!='' && i==0){
                if(!menu1.ChildNodes) AcClass='';
                else AcClass='active';
            }else{
                AcClass='';
            }
            arrMenu.push('<li class="treeview ',AcClass,'"><a href="#">',GetIcon(menu1.icon),'<span>',menu1.text,'</span>');
            if(!!menu1.ChildNodes && menu1.ChildNodes.length>0){
                arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                var m1Nodes = menu1.ChildNodes;
                arrMenu.push('<ul class="treeview-menu">');
                for(var n=0; n<m1Nodes.length; n++){
                    var menu2 = m1Nodes[n];
                    arrMenu.push('<li class="treeview"><a href="',menu2.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu2.icon),'<span>',menu2.text,'</span>');
                    if(!!menu2.ChildNodes && menu2.ChildNodes.length>0){
                        var m2Nodes = menu2.ChildNodes;
                        arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                        arrMenu.push('<ul class="treeview-menu">');
                        for(var j=0; j< m2Nodes.length; j++){
                            var menu3 = m2Nodes[j];
                            arrMenu.push('<li><a href="',menu3.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu3.icon),menu3.text);

                            if(!!menu3.ChildNodes && menu3.ChildNodes.length>0){
                                var m3Nodes = menu3.ChildNodes;
                                arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                                arrMenu.push('<ul class="treeview-menu">');
                                for(var m=0; m< m3Nodes.length; m++){
                                    var menu4 = m3Nodes[m]
                                    arrMenu.push('<li><a href="',menu4.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu4.icon),menu4.text,'</a></li>');                        
                                }
                                arrMenu.push('</ul>');

                            }
                            else{
                                arrMenu.push('</a>');
                            }
                            arrMenu.push("</li>");

                        }
                        arrMenu.push('</ul>');

                    }
                    else{
                        arrMenu.push('</a>');
                    }
                    arrMenu.push("</li>");
                }
                arrMenu.push('</ul>');
            }
            arrMenu.push('</li>');
        }
        $("#leftHeader").after(arrMenu.join(""));
    }
    ShowTitle=function(Obj){
        var iframe = document.getElementById("ifxMain");
        var height=$('.content-wrapper').height();	
        iframe.height =height-60+'px';
        if($(Obj).attr('href')!=undefined){
            var ObjText = $(Obj).find("span").html();
            if($(Obj).attr('data-Top')=="1") {
                ObjText = $(Obj).attr('title');
                ParentText=$(Obj).attr('data-ParTitle');
                $('#DeskMenu').html(ParentText);
            }
            $('.breadcrumb').find('.active').html(ObjText);
        }
        $(".menuselect").removeClass("menuselect");
        $(Obj).addClass("menuselect");
    };
    OpenLeftMenu=function(Obj,Search){	   
        var arrHtml=[]
        var id=$(Obj).attr('id');
        for(var i=0; i<func_Tree.length; i++){
            var arrId = func_Tree[i].id;
            if(arrId==id){		                  			
                var menu1=func_Tree[i];
                $('#DeskMenu').html(menu1.text);	
                arrHtml.push('<li id="',id,'" class="header">');
                arrHtml.push(GetIcon(menu1.icon));
                arrHtml.push('<span>',menu1.text,'</span>');
                if(!!menu1.ChildNodes && menu1.ChildNodes.length>0){
                    var m1Nodes = menu1.ChildNodes;
                    //arrHtml.push('<ul class="treeview-menu">');
                    for(var n=0; n<m1Nodes.length; n++){
                        var menu2 = m1Nodes[n];
                        arrHtml.push('<li class="treeview"><a href="',menu2.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu2.icon),' <span>',menu2.text,'</span>');
                        if(!!menu2.ChildNodes && menu2.ChildNodes.length>0){
                            var m2Nodes = menu2.ChildNodes;
                            arrHtml.push('<i class="fa fa-angle-left pull-right"></i></a>');
                            arrHtml.push('<ul class="treeview-menu">');
                            for(var j=0; j< m2Nodes.length; j++){
                                var menu3 = m2Nodes[j];
                                arrHtml.push('<li><a href="',menu3.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu3.icon),menu3.text);

                                if(!!menu3.ChildNodes && menu3.ChildNodes.length>0){
                                    var m3Nodes = menu3.ChildNodes;
                                    arrHtml.push('<i class="fa fa-angle-left pull-right"></i></a>');
                                    arrHtml.push('<ul class="treeview-menu">');
                                    for(var m=0; m< m3Nodes.length; m++){
                                        var menu4 = m3Nodes[m]
                                        arrHtml.push('<li><a href="',menu4.value,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu4.icon),menu4.text,'</a></li>');                        
                                    }
                                    arrHtml.push('</ul>');

                                }
                                else{
                                    arrHtml.push('</a>');
                                }
                                arrHtml.push("</li>");

                            }
                            arrHtml.push('</ul>');

                        }
                        else{
                            arrHtml.push('</a>');
                        }
                        arrHtml.push("</li>");
                    }
                    //arrHtml.push('</ul>');
                }
                arrHtml.push('</li>');
					
                $(".sidebar-menu").html(arrHtml.join(""));
            }
        }
    }

    function GetIcon(icon){
        var arrImg =["&#xe61d;",""];
        var IconHtml=[];
        if(icon!=undefined){
            if(icon.length>0){
                arrImg=icon.split(":");
                if(arrImg.length==2 && arrImg[0].length>0){
                    if(arrImg[1].length>0){
                        IconHtml.push('<i class="icon iconfont icon-02">&#',arrImg[0],';</i>');
                    }
                    else{
                        IconHtml.push('<i class="icon iconfont icon-02">&#',arrImg[0],';</i>');
                    }
                }
                else{
                    IconHtml.push('<i class="icon iconfont icon-02">&#',arrImg[0],';</i>');
                }
               
            }
            else{
                IconHtml.push('<i class="icon iconfont icon-02">&#xe6e8;</i>');
            }
        }else{
            IconHtml.push('<i class="icon iconfont icon-02">&#xe609;</i>');
        }
        return IconHtml.join('');
    }
    function IsFullScreen(el){
        var Obj = $(el);
        var IsFull = Obj.attr('IsFull');
        if(IsFull=='0'){
            FullScreen();
            Obj.attr('IsFull','1');
            Obj.attr('title','退出全屏');
            Obj.find('i').removeClass('fa-arrows-alt');
            Obj.find('i').addClass('fa-compress');
        }else{
            ExitFullScreen();
            Obj.attr('IsFull','0');
            Obj.attr('title','全屏');	  
            Obj.find('i').addClass('fa-arrows-alt');
            Obj.find('i').removeClass('fa-compress');
        }
    }
    jQuery(function(){
        $.ajax({
            type: "get",
            url: 'getMsg.ashx?_r='+Math.random(),
            dataType: "html",
            success: function (result) {
                var ret = eval("(" + result + ")");

                $("#user_count").html(ret.online);
                $("#todo_num").html(ret.todo.num);
                $("#sms_num").html(ret.msg.num);
                $("#mail_num").html(ret.mail.num);
                if(ret.todo.num>100)  $("#todo_num").css('right','-5px');
                else if(ret.todo.num>10) $("#todo_num").css('right','0px');
                if(ret.online>100)  $("#user_count").css('right','-5px');
                else if(ret.online>10) $("#user_count").css('right','0px');
            }
        });
        if($.trim($('.user-body').html())!='') $('.user-body').show();
        var height=$('.content-wrapper').height();//-10; 
        if(navigator.userAgent.indexOf("Firefox")>-1){
            height=height-22; 
        }
        $('#secContent').slimScroll({
            height:  height + 'px',
            width:'100%',
            start: 'top'
        }); 
        //var Menuheight=$('.sidebar').height();
        //$('.sidebar').slimScroll({
        //    height:  height + 'px'
        //}); 
        $('#search-btn').click(function(){
            SearchMenu();
        });
        $('#SearMenu').find('a').each(function(i,e){
            $(e).click(function(){
                $('#SearTitle').html($(e).text());         
            });
        
        });
        $('#SkinMenu').find('a').click(function(){ 
            $('#ChangeSkin').html($(this).text());    
            $("#skinlink").attr("href","Theme/AdminLTE/dist/css/skins/"+$(this).attr("path")+"_all-skins.min.css");
        });
    })
    function FullScreen(){
        var docElm = document.documentElement;
        //W3C  
        if (docElm.requestFullscreen) {  
            docElm.requestFullscreen();  
        }
            //FireFox  
        else if (docElm.mozRequestFullScreen) {  
            docElm.mozRequestFullScreen();  
        }
            //Chrome等  
        else if (docElm.webkitRequestFullScreen) {  
            docElm.webkitRequestFullScreen();  
        }
            //IE11
        else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
    }
    function ExitFullScreen(){
        if (document.exitFullscreen) {  
            document.exitFullscreen();  
        }  
        else if (document.mozCancelFullScreen) {  
            document.mozCancelFullScreen();  
        }  
        else if (document.webkitCancelFullScreen) {  
            document.webkitCancelFullScreen();  
        }
        else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    }
    function SearchMenu(){
        var Title = $('#SearchMenu').val();
        var AcClass='';
        if(Title!='') AcClass='active ';
        var AllMenu=[],FirstMenu=[];
        var arrMenu=[],arrMenu1=[],arrMenu2=[],arrMenu3=[],arrMenu4=[];
        for(var i=0; i<func_Tree.length; i++){
            var arrText = func_Tree[i];
            var IconArr='';
            IconArr=GetIcon(arrText.icon);
            var menu1 = func_Tree[i];
            var icon = menu1.icon;
            var arrImg =["fa-files-o",""];
            if(IsAddMenu(menu1,Title)=="0") continue;
            if(Title!=''){
                if(!menu1.ChildNodes) AcClass='';
                else AcClass='active';
            }else{
                AcClass='';
            }
            arrMenu.push('<li class="treeview ',AcClass,'"><a href="#">',GetIcon(menu1.icon),'<span>',menu1.text,'</span>');
            if(!!menu1.ChildNodes && menu1.ChildNodes.length>0){
                arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                var m1Nodes = menu1.ChildNodes;
                arrMenu.push('<ul class="treeview-menu">');
                for(var n=0; n<m1Nodes.length; n++){
                    var menu2 = m1Nodes[n];
                    if(IsAddMenu(menu2,Title)=="0") continue;
                    if(Title!=''){
                        if(!menu2.ChildNodes) AcClass='';
                        else AcClass='active';
                    }else{
                        AcClass='';
                    }
                    arrMenu.push('<li class=" ',AcClass,'"><a href="',menu2.value,'" data-top="1" data-ParTitle="',menu1.text,'"  data-title="',menu2.text,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu2.icon),'<span>',menu2.text,'</span>');
                    if(!!menu2.ChildNodes && menu2.ChildNodes.length>0){
                        var m2Nodes = menu2.ChildNodes;
                        arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                        arrMenu.push('<ul class="treeview-menu">');
                        for(var j=0; j< m2Nodes.length; j++){
                            var menu3 = m2Nodes[j];
                            if(IsAddMenu(menu3,Title)=="0") continue;
                            if(Title!=''){
                                if(!menu3.ChildNodes) AcClass='';
                                else AcClass='active';
                            }else{
                                AcClass='';
                            }
                            arrMenu.push('<li  class=" ',AcClass,'"><a href="',menu3.value,'"  data-top="1" data-title="',menu3.text,'"  data-ParTitle="',menu1.text,'" onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu3.icon),menu3.text);
                            if(!!menu3.ChildNodes && menu3.ChildNodes.length>0){
                                var m3Nodes = menu3.ChildNodes;
                                arrMenu.push('<i class="fa fa-angle-left pull-right"></i></a>');
                                arrMenu.push('<ul class="treeview-menu">');
                                for(var m=0; m< m3Nodes.length; m++){
                                    if(IsAddMenu(menu4,Title)=="0") continue;
                                    var menu4 = m3Nodes[m];
                                    arrMenu.push('<li><a href="',menu4.value,'"  data-top="1" data-ParTitle="',menu1.text,'" data-title="',menu4.text,'"  onclick="ShowTitle(this)" target="ifxMain">',GetIcon(menu4.icon),menu4.text,'</a></li>');                        
                                }
                                arrMenu.push('</ul>');

                            }
                            else{
                                arrMenu.push('</a>');
                            }
                            arrMenu.push("</li>");

                        }
                        arrMenu.push('</ul>');

                    }
                    else{
                        arrMenu.push('</a>');
                    }
                    arrMenu.push("</li>");
                }
                arrMenu.push('</ul>');
            }
            arrMenu.push('</li>');
        }
         
        $(".sidebar-menu").html(arrMenu.join(""));
    }
    function IsAddMenu(Node,Title){
        var temp=0;
        if($.trim(Title)!=''){
	        
            if(Node.text.indexOf(Title)>-1){
                temp=1;
                return temp;
            }
            if(Node.ChildNodes!=null && Node.ChildNodes.length>0){
                for(var i=0;i<Node.ChildNodes.length;i++){
                    var Node1 = Node.ChildNodes[i];
                    if(Node1.text.indexOf(Title)>-1){
                        temp=1;
                        return temp;
                    }
                    if(Node1.ChildNodes!=null && Node1.ChildNodes.length>0){
                        for(var j=0;j<Node1.ChildNodes.length;j++){
                            var Node2 = Node1.ChildNodes[j];
                            if(Node2.text.indexOf(Title)>-1){
                                temp=1;
                                return temp;
                            }
                            if(Node2.ChildNodes!=null &&  Node2.ChildNodes.length>0){
                                for(var k=0;k<Node2.ChildNodes.length;k++){
                                    var Node3 = Node2.ChildNodes[k];
                                    if(Node3.text.indexOf(Title)>-1){
                                        temp=1;
                                        return temp;
                                    }
                                }
                            }
	                    
                        }
                    }
                }
            }
        }else{
            temp=1;
            return temp;
        }
        return temp;
    }

    //刷新提醒事项
    function UpdateRemind(){
        _curClass.FlashRemind('<%=base.EmployeeID%>',RemindCallBack);
    }
    function RemindCallBack(data){
        $("#sms_num").html(data.value);
        window.setTimeout("UpdateRemind()", 1000*60*20); 
    }
    UpdateRemind();
   
</script>
