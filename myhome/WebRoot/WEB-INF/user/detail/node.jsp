<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Tendina plugin</title>

  <link rel="stylesheet" href="/myhome/css/user/detail/demo.css">
</head>
  <body>
    <ul class="dropdown">
    <li>
        <a class="snacks" href="#">个人信息管理</a>
        <ul>
          <li><a class="snickers" id="userList" href="/myhome/user/information">修改个人资料</a></li>
          <li><a class="snickers" href="/myhome/user/toUpdatImg">修改头像</a></li>
        </ul>
      </li>
      <li>
      <c:if test="${sessionScope.user.isLandlord == 1 }">
	        <a class="drinks" href="#">房屋信息管理</a>
	        <ul>
	        	<li><a class="cocktails" href="/myhome/house/add">添加房屋</a></li>
	          <li><a class="cocktails" href="/myhome/house/manageHouseList">查看所有</a></li>
	          <li><a class="cocktails" href="/myhome/houseapply/getIsApplyList?owner=${sessionScope.user.id }">申请入住</a></li>
	          <li><a class="cocktails" href="/myhome/houseagree/getAgreeList?owner=${sessionScope.user.id }">同意入住</a></li>
	           <li>
		        <a class="snacks" href="#">按入住查看</a>
		        <ul>
		          <li><a class="snickers" href="/myhome/house/manageHouseList?ischeck=1">已入住</a></li>
		          <li><a class="snickers" href="/myhome/house/manageHouseList?ischeck=0">未入住</a></li>
		        </ul>
		      </li>
	        </ul>
        </c:if>
         <c:if test="${sessionScope.user.isLandlord == 0 }">
         	 <a class="drinks" href="#">申请房屋信息</a>
	        <ul>
	          <li><a class="cocktails" href="/myhome/houseapply/getIsApplyList?userId=${sessionScope.user.id }">已申请入住</a></li>
	          <li><a class="cocktails" href="/myhome/houseagree/getAgreeList?userId=${sessionScope.user.id }">同意入住</a></li>
	        </ul>
         </c:if>
      </li>
    </ul>

    <script src="/myhome/js/user/jquery-1.11.0.min.js"></script>
    <script src="/myhome/js/user/tendina.min.js"></script>
    <script>
    $(function(){
    	$('a').attr("target","right"); 
    });
      $('.dropdown').tendina({
        // This is a setup made only
        // to show which options you can use,
        // it doesn't actually make sense!
        animate: true, 
        speed: 500, 
        onHover: false, 
        hoverDelay: 300,
        activeMenu: $('#userList'), 
        openCallback: function(clickedEl) { 
        },
        closeCallback: function(clickedEl) {
        }
      });
    </script>
  </body>
</html>
