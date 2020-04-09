<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.licz.ssm.po.SysUser"%>
<%
	SysUser sysUser = (SysUser)request.getSession().getAttribute("APP_USER_SESSION_KEY");  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
<title>诚亦车行汽车美容中心后台管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/staticres/css/wu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-3.3.1/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div style="margin-left:30%; margin-top: 20%;">
		<h1>欢迎来到诚亦车行汽车美容中心后台管理系统</h1>
	</div>
</body>
</html>
