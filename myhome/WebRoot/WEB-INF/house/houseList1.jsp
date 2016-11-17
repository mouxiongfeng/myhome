<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>myhome</title>
	<link rel="stylesheet" href="/myhome/css/house/normalize.css">
	<link rel="stylesheet" href="/myhome/css/house/houselist.css">
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/default.css">
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/list.css"/>
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/city-picker.css">
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/manhuaDate.1.0.css"/>
	<script type="text/javascript" src="/myhome/js/house/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="/myhome/js/house/cityData.js"></script>
	<script type="text/javascript" src="/myhome/js/house/IIInsomniaCityPicker.js"></script>
	<script src="/myhome/js/house/pinterest_grid.js"></script>
	<script class="resources library" src="/myhome/js/house/area.js" type="text/javascript"></script>
	<style type="text/css">
	.info select{ border:1px #993300 solid; 
		height:30px;
	background:#FFFFFF;}
	.info{ margin:5px; text-align:left;}
	.info #show{ color:#3399FF; }
	.bottom{ text-align:right; font-size:12px; color:#CCCCCC; width:1000px;}
	.price{
		left:-15px; 
	}
	.seeTime{
		left:-40px; 
	}
	.common{
		border:1px solid #faa121;
		float: right;
		height:60px;
		width:60px;
		line-height:54px;
		position: relative;
		top:-29px;
		border-radius:100%;
		text-align: center;
		font-weight:bold;
		font-size: 20px;
		background:#fff;
		color:#faa121;
	}
	.userImg{
			height: 65px;
			width: 65px;
			border-radius:100%;
			margin-left: 52px;
			margin-top:8px;
			cursor:pointer;
		}
		.housePage{
			margin-left:650px;
		}
		.housePage a{
			font-size: 25px;
		}
		.currpage{
			color:#faa121;
		}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".w1200"). hide();
	$("#search").click(function(){
		$(".w1200"). slideToggle(1000);
	});
	$("#login").click(function(){
		window.location.href="../user/login";
	});
	$("#register").click(function(){
		window.location.href="../user/register";
	});
	$("#userDetail,#userImg").click(function(){
		window.location.href="../user/detail";
	});
	$("#gallery-wrapper").pinterest_grid({
		no_columns: 4,
            padding_x: 10,
            padding_y: 10,
            margin_bottom: 50,
            single_column_breakpoint: 700
	});
});

var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
	Gid('s_city').value + " - 县/区" + 
	Gid('s_county').value + "</h3>"
							};
</script>
</head>
<body>
	<div class="top">
		<div id="logo" class="top_children"> 
			<div class="logo">
	  			<img src="/myhome/images/logoyellow.png" height="70px" width="200px"/>
	  		</div>
  		</div>
		<div class="top_children search">
			<div class="searchtext">
				<input id="cityChoice" type="text" />
			</div>
		</div>
		<div class="top_children searchbtn">
			<div id="search" class="font">
				高级搜索
			</div>
		</div>
		<c:if test="${sessionScope.user == null}">
  			<div class="top_children beOwner">
			<div class="font">
				成为房东
			</div>
			</div>
			<div class="top_children register">
				<div id="register" class="font">
					注册
				</div>
			</div>
			<div class="top_children login">
				<div id="login" class="font">
					登录
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<div class="top_children beOwner">
			<div class="font">
				成为房东
			</div>
			</div>
			<div class="top_children register">
				<img id="userImg" src="${sessionScope.user.userImg }" class="userImg"/>
			</div>
			<div class="top_children login">
				<div id="userDetail" class="font">
					${sessionScope.user.userName }
				</div>
			</div>
		</c:if>
	</div>
	<div class="w1200">
  <form action="../house/getHouseList" method="post">
  <div class="list-screen">
        <div class="screen-top" style="position:relative;">
       	<div class="info">
		<div>
	<select id="s_province" name="province"></select>  
    <select id="s_city" name="city" ></select>  
    <select id="s_county" name="county"></select>
    
    <script type="text/javascript">_init_area();</script>
    </div>
    	<div id="show"></div>
	</div>
		<input type="submit" id="submit-btn" value="搜索"/>
		</div>
    <div style="padding:10px 30px 10px 10px;">
    <div class="screen-term">
      <div class="selectNumberScreen">
        <div id="selectList" class="screenBox screenBackground">
          <dl class="listIndex" attr="价格范围">
            <dt>房屋价格</dt>
            <dd>
              <label><a href="javascript:;">不限</a></label>
              <label>
                <input name="price" type="radio" value="1" />
                <a href="javascript:;">100元以下</a></label>
              <label>
                <input name="price" type="radio" value="2" />
                <a href="javascript:;">100-300元 </a></label>
              <label>
                <input name="price" type="radio" value="3" />
                <a href="javascript:;">300-600元</a></label>
              <label>
                <input name="price" type="radio" value="4" />
                <a href="javascript:;">600-1500元</a></label>
              <div class="custom"><span>自定义</span>&nbsp;
                <input name="lowPrice" type="text" id="custext1"/>
                &nbsp;-&nbsp;
                <input name="upPrice" type="text" id="custext2"/>
                <input name="housePrice" type="button" id="cusbtn"/>
              </div>
            </dd>
          </dl>
          <dl class=" listIndex" attr="terminal_os_s">
            <dt>房屋类型</dt>
            <dd>
              <label><a href="javascript:;">不限</a> </label>
	            <c:forEach items="${typeList }" var="type">
	              <label>
	                <input name="typeId" type="checkbox" value="${type.id }"/>
	                <a href="javascript:;">${type.typeName }</a></label>
	            </c:forEach>
            </dd>
          </dl>
        </div>
      </div>   
    </div>
    </div>
  </div>
  </form>
</div>
	<section id="gallery-wrapper">
		<c:forEach items="${houseList }" var="house">
			<article class="white-panel" onclick="window.open('/myhome/house/getHouseById?id=${house.id }','房屋详情')">
				<img src="${house.houseImgList[0].imgLocation }" class="thumb">
				<div name="price" class="price common" title="价格" id="prcie">￥${house.housePrice }</div>
				<div name="seeTime" class="seeTime common" title="浏览次数" id="seeTime">${house.seeTime }</div>
				<h1>${house.houseIntroduce }</h1>
			</article>
		</c:forEach>
    </section>	
    <div class="housePage">
		 <input type="hidden" id="PageCount" value="${PageCount }" />
		 <input type="hidden" id="currentPage" value="${currentPage }" />
		 <a href="/myhome/house/getHouseList?currentPage=1">首页</a>
		 <c:forEach begin="1" end="${totalPage }" varStatus="status">
		 	<c:if test="${status.count == currentPage}">
		 		<a href="/myhome/house/getHouseList?currentPage=${status.count}" class="currpage">${status.count}</a>
		 	</c:if>
		 	<c:if test="${status.count != currentPage}">
		 		<a href="/myhome/house/getHouseList?currentPage=${status.count}">${status.count}</a>
		 	</c:if>
		 </c:forEach>
		 <a href="/myhome/house/getHouseList?currentPage=${totalPage}">末页</a>
    </div>
        <script type="text/javascript">
        function loadData(num) {
        }
    </script>
</body>
</html>