<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>Java后端WebSocket的Tomcat实现</title>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqueryform/jquery.form.min.js"></script>
</head>
<body>
	Welcome
	<br />
	<input id="text" type="text" />
	<button onclick="send()">发送消息</button>
	<hr />
	<button onclick="closeWebSocket()">关闭WebSocket连接</button>
	<hr />
	<div id="message"></div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		test();
	});
	function test(){
		  $.ajax({
			   type: "POST",
			   url: "<%=request.getContextPath()%>/login/test.action",
			   data: {},
			   success: function(msg){
				   console.log( "Data Saved: " + msg);
			   }
			});
	}
</script>
</html>

