<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="/myhome/css/user/reset.css">
        <link rel="stylesheet" href="/myhome/css/user/supersized.css">
        <link rel="stylesheet" href="/myhome/css/user/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
	<style type="text/css">
		
	</style>
	
        <!-- Javascript -->
		<script type="text/javascript" src="/myhome/js/house/jquery-2.1.3.min.js"></script>
        <script src="/myhome/js/user/supersized.3.2.7.min.js"></script>
        <script src="/myhome/js/user/supersized-init.js"></script>
		<script>
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
			$(".btn").click(function(){
				is_hide();
			});

			$("#submit").click(function(){
				var u = $("input[name=userLoginName]");
				var p = $("input[name=userPassword]");
				if(u.val() == '' || p.val() =='')
				{
					$("#ts").html("用户名或密码不能为空~");
					is_show();
					return false;
				}
				else{
					var reg = /^[0-9A-Za-z]+$/;
					if(!reg.exec(u.val()))
					{
						$("#ts").html("用户名错误");
						is_show();
						return false;
					}
				}
			});
		};
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300);}
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300);}
		</script>
    </head>

    <body oncontextmenu="return false">
    <div class="imgLogin"></div>
        <div class="page-container">
            <form action="/myhome/user/register" method="post">
				<div>
					<input type="text" name="userName" class="username" placeholder="用户名" autocomplete="off"/>
				</div>
				<div>
					<input type="text" name="userLoginName" class="username" placeholder="登录名" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="userPassword" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                <div>
					<input type="password" name="checkpassword" class="checkpassword" placeholder="重复输入密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                <div>
					<input type="number" name="phone" class="phone" placeholder="手机号码" autocomplete="off" />
                </div>
                <button id="submit" type="submit">注册</button>
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
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>
    </body>

</html>

