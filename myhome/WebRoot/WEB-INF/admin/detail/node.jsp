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
        <a class="snacks" href="#">用户管理</a>
        <ul>
          <li><a class="snickers" id="userList" href="/myhome/user/list">查看用户</a></li>
          <li><a class="snickers" href="/myhome/user/list?isLandlord=1">查看房主</a></li>
          <li><a class="snickers" href="/myhome/user/list?isApplyOwner=1">查看申请</a></li>
        </ul>
      </li>
      <li>
        <a class="drinks" href="#">房屋信息管理</a>
        <ul>
          <li><a class="cocktails" href="/myhome/house/manageHouseList">查看所有</a></li>
          <li><a class="cocktails" href="/myhome/house/manageHouseList">分类查找</a>
            <ul>
              <li><a class="non-alcoholic" href="#">按类型查看</a>
                <ul>
                 <c:forEach items="${typeList }" var="type">
	                <li><a href="/myhome/house/manageHouseList?typeId=${type.id }">${type.typeName }</a></li>
	            </c:forEach>
                </ul>
              </li>
              <li><a class="non-alcoholic" href="#">按入住查找查看</a>
                <ul>
	                <li><a href="/myhome/house/manageHouseList?ischeck=1">已入住</a></li>
	                <li><a href="/myhome/house/manageHouseList?ischeck=0">未入住</a></li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <li>
        <a class="meat" href="#">房屋类型管理</a>
        <ul>
          <li><a class="beef" href="/myhome/type/list">查看房屋类型</a></li>
        </ul>
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
