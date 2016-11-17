<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>详情</title>
	<link rel="stylesheet" href="/myhome/css/user/information/platform-1.css">
    <link rel="stylesheet" href="/myhome/css/user/information/easyform.css">

    <link rel="stylesheet" href="/myhome/css/user/information/tab.css">

    <script src="/myhome/js/user/information/jquery-2.1.0.min.js"></script>
    <script src="/myhome/js/user/information/easyform.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#form").easyform();
    	});
    	function pwdIsNull(){
    		var pwd = $("#userPassword").val();
    		var pwd1 = $("#userPassword1").val();
    		if((pwd == '' && pwd1 == '') || (pwd != '' && pwd1 != '')){
    			return true;
    		}else{
    			return false;
    		}
    	}
    </script>
  </head>
  
  <body>
        <div class="form-div">
        <form id="form" action="/myhome/user/update" method="post">

            <table>
                <tr>
                    <td>昵称</td>
                    <td><input name="userName" type="text" id="userName" value="${sessionScope.user.userName}"
                               data-easyform="length:1 10;char-normal;real-time;"
                               data-message="用户名必须为1—10位的字符"
                               data-easytip="position:top;class:easy-red;">
                    </td>
                </tr>
                <tr>
                    <td>新密码</td>
                    <td><input name="userPassword" type="password" id="userPassword" data-easyform="length:6 16;null;"
                               data-message="密码必须为6—16位"
                               data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>确认密码</td>
                    <td><input name="userPassword1" type="password" id="userPassword1" data-easyform="length:6 16;equal:#userPassword;null;"
                               data-message="两次密码输入要一致" data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                    <td>联系方式</td>
                    <td><input name="phone" type="text" id="phone"  value="${sessionScope.user.phone}"
                    			data-easyform="number;real-time;easytip:false;"
                               data-message="电话格式要正确"
                               data-easytip="class:easy-blue;"></td>
                </tr>
            </table>

            <div class="buttons" style="margin-top: 50px;">
            	<input type="hidden" id="id" name="id" value="${sessionScope.user.id }">
                <input value="确认" type="submit" onClick="pwdIsNull();" style="margin-right:180px; margin-top:20px;">
            </div>

            <br class="clear">
        </form>
    </div>
  </body>
</html>
