<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin Template for Bootstrap</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.0.js"></script>
    <link href="<%=request.getContextPath()%>/staticres/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <form class="form-signin" action="<%=request.getContextPath()%>/login/login.action">
      <h1 class="h3 mb-3 font-weight-normal">欢迎来到登录页面</h1>
      <label for="inputEmail" class="sr-only">用户名</label>
      <input name="userName" type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">密码</label>
      <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>
  </body>
  <script type="text/javascript">
  function login(){
	 var userName = $("#inputEmail").val();
	 var password = $("#inputPassword").val();
	 console.log(password);
	  $.ajax({
		   type: "POST",
		   url: "<%=request.getContextPath()%>/login/login.action",
		   data: {'userName':userName,'password':password},
		   success: function(msg){
		     console.log( "Data Saved: " + msg);
		   }
		});
	  
  }
</script>
</html>
