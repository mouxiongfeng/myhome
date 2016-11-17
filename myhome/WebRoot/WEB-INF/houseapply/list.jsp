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
	
	function agree(id){
		$.ajax({
		  type:"get",
		  url: "/myhome/houseapply/applyAgree?id="+id,
		  dataType: 'json',
		  contentType : "application/json",
		  success: function(data){
		  	if(data.msg == 2){
		  		window.wxc.xcConfirm("已成功处理", window.wxc.xcConfirm.typeEnum.success,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/houseapply/getIsApplyList?owner=1";
						}
					});
		  	}else{
		  		window.wxc.xcConfirm("操作失败", window.wxc.xcConfirm.typeEnum.error,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/houseapply/getIsApplyList?owner=1";
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
						<th>申请人</th>
						<th>联系电话</th>
						<th>房屋类型</th>
						<th>房屋描述</th>
						<th>申请时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${houseApplyList }" varStatus="status" var="apply">
					<tr>
						<td>${status.count}</td>
						<td class="user-name">${apply.userName }</td>
						<td class="user-name">${apply.phone }</td>
						<td class="user-email">${apply.house.typeName }</td>
						<td class="user-email">${apply.house.houseIntroduce }</td>
						<td class="user-name">${apply.applyDate }</td>
						<td class="user-location"><a onClick="agree(${apply.id })" href="#">同意</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		
		</body>
		</html>