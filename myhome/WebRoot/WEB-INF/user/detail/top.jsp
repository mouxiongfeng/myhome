<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<style type="text/css">
	body{
			background:#EEEDED;
		}
		.logout{
			position:fixed;
			top:116px;
			left:1780px;
		}
		.goIndex{
			position:fixed;
			top:116px;
			left:1680px;
		}
		.common{
			float: right;
			height:21px;
			width:90px;
			text-align: center;
			background:#B0B1AE;
			color:#fff;
			border-radius:3px;
			cursor: pointer;
		}
		a{
			text-decoration: none;
			color:#fff;
		}
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div>
		<img src="/myhome/images/logoyellow.png" width="250px" height="133px">
	</div>
	<div class="logout common"><a target="_top" href="/myhome/user/logout">退出登录</a></div>
	<div class="goIndex common"><a target="_top" href="/myhome/index/welcome">前往首页</a></div>
</body>
</html>