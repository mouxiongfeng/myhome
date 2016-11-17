<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>登陆</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="/myhome/css/user/reset.css">
        <link rel="stylesheet" href="/myhome/css/user/supersized.css">
        <link rel="stylesheet" href="/myhome/css/user/style.css">
<!-- Javascript -->
		<script type="text/javascript" src="/myhome/js/house/jquery-2.1.3.min.js"></script>
        <script src="/myhome/js/user/supersized.3.2.7.min.js"></script>
        <script src="/myhome/js/user/supersized-init.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		});
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		}
	</script>
    </head>

    <body oncontextmenu="return false">
  <div class="imgLogin"></div>
        <div class="page-container">
            <form action="/myhome/user/loginUser" method="post">
				<div>
					<input type="text" name="userLoginName" value="aaa" id="userLoginName" class="username" placeholder="用户名" autocomplete="off"/>
					<p>${error }</p>
				</div>
                <div>
					<input type="password" name="userPassword" value="123456" id="userPassword" class="password" placeholder="密码" />
                </div>
                <input id="submit" type="submit" value="登录"/>
            </form>
            <div class="connect">
                <p>If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
				<p style="margin-top:20px;">如果只是遇见，不能停留，不如不遇见。</p>
            </div>
        </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p id="login" style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>
    </body>

</html>

