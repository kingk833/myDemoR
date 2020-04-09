<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>uploadify测试二进制流图片</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/uploadify/uploadify.css">
</head>
<body>
	<div style="height:34px;margin-top:10px;">
		<span>上传一张或多张图片点击：</span>
		<input type="file" name="upload" id="file_upload" />
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		findPhotoById();
		//uploadifyEvent();
	});
	function uploadifyEvent(){
		$("#file_upload").uploadify({
			'queueSizeLimit' : 50,
			'fileSizeLimit' : '6MB',
			'fileTypeExts' : '*.gif; *.jpg; *.png',
			'swf': '<%=request.getContextPath()%>/js/uploadify/uploadify.swf',
			'uploader': '<%=request.getContextPath()%>/user/admin/uploadify.action',
			'fileObjName':'upload',
			'width':140,
			'height': 34,
			buttonText:'选择菜品图片',
			'onUploadStart':function(file){
				
			},
			formData:{ //附带值
				
			},
			'onUploadSuccess' : function(file, data, response) {
				var result = eval("("+data+")");
				console.info(result);
				
			},
			'onQueueComplete' : function(queueData) {

			}
		});
	}
	
	function findPhotoById(){
		var url = "<%=request.getContextPath()%>/user/findPhotoById.action";
		$.post(url, {}, function(result) {
			console.info(result);
		}, 'json');
	}
</script>
</html>

