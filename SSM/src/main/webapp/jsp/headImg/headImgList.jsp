<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%
    String appPath = request.getContextPath();
    String theme = "default";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>代理商列表</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-3.3.1/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <!--  
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/appframe/yui/fonts/fonts-min.css"/>
    -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/staticres/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
   	<script type="text/javascript" src="<%=request.getContextPath()%>/staticres/js/utility.js"></script>
</head>
<body class="easyui-layout layout">

<div data-options="region:'center',title:'■ 当前位置：头图管理'" style="padding: 5px;">

    <div class="easyui-panel" id="agent_query_Form" data-options="boder:'true'" style="height: 90px">
			<table style="margin: 25px 0px 0px 50px">
				<tr>
					<td><label>代理商名称：</label></td>
					<td><span style="margin-left: 10px"> <input
							id="name_query" name="name_query" style="width: 150px" />
					</span></td>
					<td><label>联系人电话：</label></td>
					<td><span style="margin-left: 10px"> <input
							id="mobile_query" name="mobile_query" style="width: 150px" />
					</span></td>

					<td><span style="margin-left: 40px;"> <a id="queryBtn"
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'" onclick="queryAgent()">查询</a>
					</span></td>

					<td><span style="margin-left: 20px;"> <a id="clearBtn"
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-remove'" onclick="clearqueryForm()">清空</a>
					</span></td>
					<td><span style="margin-left: 20px;"> <a 
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-add'" onclick="gotoAdd()">添加代理商</a>
					</span></td>
				</tr>
			</table>
		</div>
		<div style="margin: 20px 0px 0px 0px">
			<table id="dg"></table>
		</div>

	</div>

</body>
<script type="text/javascript">
//开通优惠短信营销策略
function openMessage()
    {
	var row = $('#dg').datagrid('getSelected');
	$.ajax({
		   type: "POST",
	       url: getRootPath()+'/supportAgent/openMessage.action',
		   data: 'agent.oid='+row.oid,
		   dataType:'json',
		   success: function(data){
		   	$.messager.alert('Warning',data.msg); 
		   	$('#dg').datagrid('reload',{});
		   }
	});
	}

function cancelMessage()
{
var row = $('#dg').datagrid('getSelected');
$.ajax({
	   type: "POST",
       url: getRootPath()+'/supportAgent/cancelMessage.action',
	   data: 'agent.oid='+row.oid,
	   dataType:'json',
	   success: function(data){
	   	$.messager.alert('Warning',data.msg); 
	   	$('#dg').datagrid('reload',{});
	   }
});
}

//开通优惠短信营销策略
function openEnhance()
    {
	var row = $('#dg').datagrid('getSelected');
	$.ajax({
		   type: "POST",
	       url: getRootPath()+'/supportAgent/openEnhance.action',
		   data: 'agent.oid='+row.oid,
		   dataType:'json',
		   success: function(data){
		   	$.messager.alert('Warning',data.msg); 
		   	$('#dg').datagrid('reload',{});
		   }
	});
	}
	
//开通试用延期
function openMoreTrial()
{
var row = $('#dg').datagrid('getSelected');
$.ajax({
	   type: "POST",
       url: getRootPath()+'/supportAgent/openMoreTrial.action',
	   data: 'agent.oid='+row.oid,
	   dataType:'json',
	   success: function(data){
	   	$.messager.alert('Warning',data.msg); 
	   	$('#dg').datagrid('reload',{});
	   }
});
}

function closeMoreTrial()
{
var row = $('#dg').datagrid('getSelected');
$.ajax({
	   type: "POST",
       url: getRootPath()+'/supportAgent/closeMoreTrial.action',
	   data: 'agent.oid='+row.oid,
	   dataType:'json',
	   success: function(data){
	   	$.messager.alert('Warning',data.msg); 
	   	$('#dg').datagrid('reload',{});
	   }
});
}
function cancelEnhance()
{
var row = $('#dg').datagrid('getSelected');
$.ajax({
	   type: "POST",
       url: getRootPath()+'/supportAgent/cancelEnhance.action',
	   data: 'agent.oid='+row.oid,
	   dataType:'json',
	   success: function(data){
	   	$.messager.alert('Warning',data.msg); 
	   	$('#dg').datagrid('reload',{});
	   }
});
}


	function queryAgent() {
		var queryParams = $('#dg').datagrid('options').queryParams;
		queryParams["agent.name"] = $('#name_query').val();
		queryParams["agent.mobile"] = $('#mobile_query').val();
		$('#dg').datagrid('options').queryParams = queryParams;
		$('#dg').datagrid('options').pageNumber = 1;
		$('#dg').datagrid('getPager').pagination({pageNumber: 1});
		$("#dg").datagrid('reload');
	}

	function clearqueryForm() {
		$('#agent_query_Form').form('clear');
	}
	function gotoAdd() {
		//this.location = '<s:url action="gotoEdit" includeParams="none"/>';
		this.location = getRootPath() + '/supportAgent/gotoAdd.action';
	}

	$(function () {
	    $('#dg').datagrid({
	    	url : getRootPath()+ '/supportAgent/querySupportAgent.action',
	        pagination: true,
	        singleSelect: true,
	        autoRowHeight: true,
	        rownumbers: true,
			columns : [ [
					{
						field : 'name',
						title : '代理商名称',
						width : 200,
	                    formatter: function (value, row, index) {
	            			var detailUrl = "<a href=\"gotoDetail.action?agentId=" + row.oid +"\">" +row.name+ "</a>";
	            			return detailUrl;
	                    }
					},
					{
						field : 'managerName',
						title : '联系人姓名',
						width : 100
					},
					{
						field : 'mobile',
						title : '联系人电话',
						width : 100
					},
					{
						field : 'trialNum',
						title : '试用数量',
						width : 60
					},
					{
						field : 'addr',
						title : '地址',
						width : 240
					},				
					{
						field : 'operator',
						title : '操作',
						width : 450,
	                    formatter: function (value, row, index) {
	            			var updateUrl = "<a href=\"gotoEdit.action?agentId=" + row.oid +"\">" + "修改</a>";
						    var addAccountUrl = "<a href=\"gotoaddAccount.action?agentId=" + row.oid +"\">" + "开通协议</a>";
						    var addStartTrialUrl = "<a href=\"toStartTrial.action?agentId=" + row.oid +"\">" + "开通试用</a>";
						    var changeTrialnumUrl = "<a href=\"toStartTrial.action?agentId=" + row.oid +"\">" + "修改试用数量</a>";
						    var openMessage = "<a href='javascript:openMessage();'>" + "开通优惠短信</a>";
						    var cancelMessage = "<a href='javascript:cancelMessage();'>" + "取消优惠短信</a>";
						    var openEnhance = "<a href='javascript:openEnhance();'>" + "开通增强功能包体验</a>";
						    var cancelEnhance = "<a href='javascript:cancelEnhance();'>" + "关闭增强功能包体验</a>";
						    var openMoreTrial = "<a href='javascript:openMoreTrial();'>" + "开通试用延期</a>";
						    var closeMoreTrial = "<a href='javascript:closeMoreTrial();'>" + "关闭试用延期</a>";
						    var url;
				        	if(row.trialNum==0) {
				        		url= updateUrl +" &nbsp;&nbsp;";
				        	}else{
				        		url= updateUrl +" &nbsp;&nbsp;";
				        	}
				        	if(row.agentType!=12&&row.agentType!=3)
				        	{
				        		 url+=addAccountUrl+" &nbsp;&nbsp;" +changeTrialnumUrl ;
				        	}else{
				        		 url+=changeTrialnumUrl ;
				        	}
				        	if(row.openMessage==0)
				        	{
				        		url +="&nbsp;&nbsp;"+openMessage;
				        	}
				        	else
				        	{
				        		url +="&nbsp;&nbsp;"+cancelMessage;
				        	}
				        	if(row.trialEnhance==0)
				        	{
				        		url +="&nbsp;&nbsp;"+openEnhance;
				        	}
				        	else
				        	{
				        		url +="&nbsp;&nbsp;"+cancelEnhance;
				        	}
				        	if(row.trialMoreFlag==0){
				        		url +="&nbsp;&nbsp;"+openMoreTrial;
				        	}else
				        	{
				        		url +="&nbsp;&nbsp;"+closeMoreTrial;
				        	}
				        	return url;
	                    }
					}
					] ]
		});
 		 var pager = $('#dg').datagrid('getPager');                
		 $(pager).pagination({showPageList:false}); 
	});

</script>
</html>