<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/myhome/css/login.css">
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#returnindex").click(function(){
				window.location.href="index/welcome";
			});
		});
	</script>
	<style type="text/css">
		
	</style>
  </head>
  
  <body>
  <div class="logo">
  	<img src="images/logowhite.png" height="105px" width="180px"/>
  </div>
  <div class="userdo">
  </div>
  <div class="middle">
  	<div class="loginTop">账号密码登录</div>
	  <form action="user/login" method="post">
	  	<div class="loginmiddle">
	  	<input name="userLoginName" class="login" id="userLoginName" type="text"><br>
	  	<input name="userPassword" class="login" id="userPassword" type="password"><br>
	  	<div class="remember">
	  		<input type="checkbox" value="rememberMe">记住我
	  		<a href="#">忘记密码?</a>
	  	</div>
	  	<input type="submit" class="cursor" id="submit" value="登  录">
	  	</div>
	  </form>
	  <div class="right">
	  	<div  class="right_top">
	  		<div class="noNumber"> 
	  			还没有账号？
	  		</div>
	  		<a href="user/register">立即注册</a>
	  	</div>
	  	<div id="returnindex" class="right_buttom cursor">
	  		返回首页
	  	</div>
	  </div>
  </div>
  </body>
</html>
