<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/myhome/css/user/list/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/myhome/css/user/list/default.css">
	<link type="text/css" href="/myhome/css/user/list/styles.css" media="all" rel="stylesheet" />
	<link type="text/css" href="/myhome/css/user/list/stickysort.css" media="all" rel="stylesheet" />
	<link type="text/css" href="/myhome/css/type/xcConfirm.css" media="all" rel="stylesheet" />
	<script type="text/javascript" src="/myhome/js/user/prefixfree.min.js"></script>
	<script src="/myhome/js/jquery-1.4.2.min.js"></script>
	<script src="/myhome/js/user/jquery.ba-throttle-debounce.min.js"></script>
	<script type="text/javascript" src="/myhome/js/user/jquery.stickysort.js"></script>
	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
<script type="text/javascript">
	// JavaScript Document
	$(function() {
		$('#basic table').stickySort();
	});
	
	function deleteHouse(id){
		$.ajax({
		  type:"get",
		  url: "/myhome/house/deleteHouse?id="+id,
		  dataType: 'json',
		  contentType : "application/json",
		  success: function(data){
		  	if(data.msg == 1){
		  		window.wxc.xcConfirm("删除成功", window.wxc.xcConfirm.typeEnum.success,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/house/manageHouseList";
						}
					});
		  	}else{
		  		window.wxc.xcConfirm("删除失败", window.wxc.xcConfirm.typeEnum.error,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/house/manageHouseList";
						}
					});
		  	}
		  },
		  error:function(){
		  	window.wxc.xcConfirm("系统运行错误", window.wxc.xcConfirm.typeEnum.error);
		  }
		});
	}
</script>
</head>
<body>
		<section class="demo" id="basic">
			<table>
				<thead>
					<tr>
						<th>序号</th>
						<th>房屋介绍</th>
						<th>房屋类型</th>
						<th>房主</th>
						<th>房屋地址</th>
						<th>房屋价格</th>
						<th>点击次数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${houseList }" varStatus="status" var="house">
					<tr>
						<td>${status.count}</td>
						<td class="user-name">${house.houseIntroduce }</td>
						<td class="user-email">${house.typeName }</td>
						<td class="user-name">${house.houseOwnerName }</td>
						<td class="user-phone">${house.addressName }</td>
						<td class="user-name">${house.housePrice }</td>
						<td class="user-name">${house.seeTime }</td>
						<td class="user-location"><a onClick="deleteHouse(${house.id})" href="#">删除</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		
		</body>
		</html>