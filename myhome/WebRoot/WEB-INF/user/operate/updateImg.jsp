<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateImg.jsp' starting page</title>


  </head>
  
  <body>
    <h3>头像上传</h3>
    <form action="/myhome/user/updateImg"  method="post" enctype="multipart/form-data">  
        <input type="file" name="file" />
        <input type="hidden" name="id" value="${sessionScope.user.id }">
        <input type="submit" value="上 传" />
    </form>
    <h5>上传结果：</h5>
    <img alt="暂无图片" src="${fileUrl }" width="100px" height="100px"/>
  </body>
</html>
