<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%
    String appPath = request.getContextPath();
    String theme = "default";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>�������б�</title>
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

<div data-options="region:'center',title:'�� ��ǰλ�ã�ͷͼ����'" style="padding: 5px;">

    <div class="easyui-panel" id="agent_query_Form" data-options="boder:'true'" style="height: 90px">
			<table style="margin: 25px 0px 0px 50px">
				<tr>
					<td><label>���������ƣ�</label></td>
					<td><span style="margin-left: 10px"> <input
							id="name_query" name="name_query" style="width: 150px" />
					</span></td>
					<td><label>��ϵ�˵绰��</label></td>
					<td><span style="margin-left: 10px"> <input
							id="mobile_query" name="mobile_query" style="width: 150px" />
					</span></td>

					<td><span style="margin-left: 40px;"> <a id="queryBtn"
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'" onclick="queryAgent()">��ѯ</a>
					</span></td>

					<td><span style="margin-left: 20px;"> <a id="clearBtn"
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-remove'" onclick="clearqueryForm()">���</a>
					</span></td>
					<td><span style="margin-left: 20px;"> <a 
							href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-add'" onclick="gotoAdd()">��Ӵ�����</a>
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
//��ͨ�Żݶ���Ӫ������
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

//��ͨ�Żݶ���Ӫ������
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
	
//��ͨ��������
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
						title : '����������',
						width : 200,
	                    formatter: function (value, row, index) {
	            			var detailUrl = "<a href=\"gotoDetail.action?agentId=" + row.oid +"\">" +row.name+ "</a>";
	            			return detailUrl;
	                    }
					},
					{
						field : 'managerName',
						title : '��ϵ������',
						width : 100
					},
					{
						field : 'mobile',
						title : '��ϵ�˵绰',
						width : 100
					},
					{
						field : 'trialNum',
						title : '��������',
						width : 60
					},
					{
						field : 'addr',
						title : '��ַ',
						width : 240
					},				
					{
						field : 'operator',
						title : '����',
						width : 450,
	                    formatter: function (value, row, index) {
	            			var updateUrl = "<a href=\"gotoEdit.action?agentId=" + row.oid +"\">" + "�޸�</a>";
						    var addAccountUrl = "<a href=\"gotoaddAccount.action?agentId=" + row.oid +"\">" + "��ͨЭ��</a>";
						    var addStartTrialUrl = "<a href=\"toStartTrial.action?agentId=" + row.oid +"\">" + "��ͨ����</a>";
						    var changeTrialnumUrl = "<a href=\"toStartTrial.action?agentId=" + row.oid +"\">" + "�޸���������</a>";
						    var openMessage = "<a href='javascript:openMessage();'>" + "��ͨ�Żݶ���</a>";
						    var cancelMessage = "<a href='javascript:cancelMessage();'>" + "ȡ���Żݶ���</a>";
						    var openEnhance = "<a href='javascript:openEnhance();'>" + "��ͨ��ǿ���ܰ�����</a>";
						    var cancelEnhance = "<a href='javascript:cancelEnhance();'>" + "�ر���ǿ���ܰ�����</a>";
						    var openMoreTrial = "<a href='javascript:openMoreTrial();'>" + "��ͨ��������</a>";
						    var closeMoreTrial = "<a href='javascript:closeMoreTrial();'>" + "�ر���������</a>";
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