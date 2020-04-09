<html>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqueryform/jquery.form.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var url = "<%=request.getContextPath()%>/user/findUser.action";
		$.post(url, {}, function(result) {
			console.info(result);
		}, 'json');
		
		
		$("#addForm").ajaxForm({
		    dataType:'json',
		    success: function(result) {
		    	console.info(result);
		    	alert(result.returnCode);
		    }
		});
		
		
	});

function gotoWebSocketTest(){
	console.info(111);
	window.location.href="<%=request.getContextPath()%>/user/gotoWebSocketTest.action";
}

</script>

<body>
	<h1>Hello SSM</h1>
<div onclick="gotoWebSocketTest();">websocket</div>
</body>
</html>

