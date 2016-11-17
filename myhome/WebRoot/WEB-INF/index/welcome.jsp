<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
	<link rel="stylesheet" type="text/css" href="/myhome/css/index.css">
	<script type="text/javascript" src="/myhome/js/house/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
	<link type="text/css" href="/myhome/css/type/xcConfirm.css" media="all" rel="stylesheet" />
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").click(function(){
				$(this).css("background-image","url(../images/shufang.jpg)");
				$(this).css("background-size","100% 100%");
				$(this).css("background-repeat","no-repeat");
			});
			$("#login").click(function(){
				window.location.href="../user/login";
			});
			$("#register").click(function(){
				window.location.href="../user/register";
			});
			$("#user").click(function(){
				window.location.href="../user/detail";
			});

		});
		function applyOwner(id){
					$.ajax({
					  type:"get",
					  url: "/myhome/user/applyOwner?id="+id,
					  dataType: 'json',
					  contentType : "application/json",
					  success: function(data){
					  	if(data.msg == 1){
					  		window.wxc.xcConfirm("申请成功，等待审批", window.wxc.xcConfirm.typeEnum.success,{
									onOk:function(v){ //点击确定按钮，跳转
									 location.replace(location);
									}
								});
					  	}else{
					  		window.wxc.xcConfirm("申请失败", window.wxc.xcConfirm.typeEnum.error,{
									onOk:function(v){ //点击确定按钮，跳转
									}
								});
					  	}
					  },
					  error:function(){
					  	window.wxc.xcConfirm("系统运行错误", window.wxc.xcConfirm.typeEnum.error);
					  }
				});
		}
	</script>
  	<style type="text/css">
  		.userImg{
			height: 65px;
			width: 65px;
			border-radius:100%;
		}
		.username{
			height: 30px;
			width:40px;
			margin-left:28px;
			margin-top:20px;
			float: right;
		}
		.logout{
			float:right;
			margin-left:52px;
			margin-top:20px;
		}
  	</style>
  </head>
  <body> 
  		<div class="rightTop">
  		<c:if test="${sessionScope.user == null}">
  			<div id="beOwen" class="beOwen all cursor">成为房东</div>
  			<div id="register" class="register all cursor">注册</div>
  			<div id="login" class="userlogin all cursor">登录</div>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<c:if test="${sessionScope.user.isLandlord == 0 and sessionScope.user.isApplyOwner == 0}">
				<div id="beOwen" onclick="applyOwner(${sessionScope.user.id})" class="beOwen all cursor">成为房东</div>
			</c:if>
			<c:if test="${sessionScope.user.isLandlord == 1 }">
				<div  class="beOwen all cursor">你已是房主</div>
			</c:if>
  			<div id="user" class="register all cursor"><img class="userImg" src="${sessionScope.user.userImg}"/>
  				<div class="logout"><a  href="/myhome/user/logout" style="color: #fff;">退出登录</a></div>
  				<div class="username">${sessionScope.user.userName}</div>
  			</div>
		</c:if>
  		</div>
  		<div class="middle">
  			<div class="welcome">欢迎回家</div>
  			
  			<div class="home">让你感受家的温暖，成为家的一员    ${sessionScope.user.isApplyOwner }</div>
  			<div class="search">
  				<form action="../house/getHouseList" method="post">
  					<div class="homesearch">
  						<input type="text" placeholder="四川 ·成都"  id="addressName" name="addressName">
  						<input type="hidden" value="1" name="currentPage">
  						<input type="submit" id="submit" value="搜   索">
  					</div>
  				</form>
  			</div>
  		</div>
  </body>
</html>
