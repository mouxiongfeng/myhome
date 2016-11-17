<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
	<link rel="stylesheet" href="/myhome/css/user/information/platform-1.css">
    <link rel="stylesheet" href="/myhome/css/user/information/easyform.css">

    <link rel="stylesheet" href="/myhome/css/user/information/tab.css">

    <script src="/myhome/js/user/information/jquery-2.1.0.min.js"></script>
    <script src="/myhome/js/user/information/easyform.js"></script>
    <style type="text/css">
    	.form-div{
    		margin-top: 183px;
    	}
    	body{
			background-size : 100% 100%;
			background-repeat:no-repeat;
    	}
    
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#form").easyform();
    	});
    	function pwdIsNull(){
    		var pwd = $("#adminPassword").val();
    		var name = $("#adminLoginName").val();
    		if(pwd == '' || name == ''){
    			return false;
    		}else{
    			return true;
    		}
    	}
    </script>
  </head>
  
  <body>
        <div class="form-div">
        <form id="form" action="/myhome/admin/loginAdmin" method="post">

            <table>
                <tr>
                    <td>登录名</td>
                    <td><input name="adminLoginName" type="text" id="adminLoginName" value="admin"
                               data-easytip="class:easy-red;"
                               data-message="请输入登录名"
                               >
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="adminPassword" type="password" id="adminPassword"  value="admin"
                               data-easytip="class:easy-red;"
                               data-message="请输入密码"
                               ></td>
                </tr>
            </table>

            <div class="buttons" style="margin-top: 50px;">
                <input value="登录" type="submit" onClick="pwdIsNull();" style="margin-right:180px; margin-top:20px;">
            </div>

            <br class="clear">
        </form>
		
    </div>
  </body>
</html>
