<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<link type="text/css" href="/myhome/css/bootstrap.min.css" rel="stylesheet" />
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
			height:35px;
			line-height: 35px;
			width:90px;
			text-align: center;
			background:#F4F5E2;
			color:#333;
			border-radius:3px;
			cursor: pointer;
			border: 1px solid #fff;
		}
		a{
			text-decoration: none;
			color:#FFBB86;
		}
		.common:hover {
			background-color: #B0B1AE;
			border: 1px solid #fff;
		}
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div>
		<a target="_top" href="/myhome/index/welcome"><img src="/myhome/images/logoyellow.png" width="250px" height="133px"></a>
	</div>
	<div class="logout common"><a target="_top"  href="/myhome/admin/logout">退出登录</a></div>
	<div class="goIndex common"><a target="_top" href="/myhome/index/welcome">前往首页</a></div>
</body>
</html>