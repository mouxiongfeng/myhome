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
	<script src="/myhome/js/user/jquery-2.1.1.min.js"></script>
	<script src="/myhome/js/user/jquery.ba-throttle-debounce.min.js"></script>
	<script type="text/javascript" src="/myhome/js/user/jquery.stickysort.js"></script>
	<script type="text/javascript" src="/myhome/js/user/jQuery.rTabs.js"></script>
	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#basic table').stickySort();
		$("#addType").click(function(){
			window.wxc.xcConfirm("增加类型", window.wxc.xcConfirm.typeEnum.input,{
						onOk:function(typeName){ //点击确定按钮，跳转
						if(typeName != ''){
							$.ajax({
								type:"get",
								  url: "/myhome/type/add",
								  data:{
								  	typeName : typeName
								  },
								  dataType: 'json',
								  contentType : "application/json",
								  success: function(data){
								  	if(data.msg == 0){
								  		window.wxc.xcConfirm("添加失败", window.wxc.xcConfirm.typeEnum.error,{
											onOk:function(v){ //点击确定按钮，跳转
												window.location.href = "/myhome/type/list";
											}
										});
								  	}else if(data.msg == 1){
								  		window.wxc.xcConfirm("添加成功", window.wxc.xcConfirm.typeEnum.success,{
											onOk:function(v){ //点击确定按钮，跳转
												window.location.href = "/myhome/type/list";
											}
										});
								  	}else{
								  		window.wxc.xcConfirm("数量不能超过10", window.wxc.xcConfirm.typeEnum.error,{
											onOk:function(v){ //点击确定按钮，跳转
												window.location.href = "/myhome/type/list";
											}
										});
								  	}
								  },
								error:function(){
								  	window.wxc.xcConfirm("系统运行错误", window.wxc.xcConfirm.typeEnum.error);
								  }
							});
							}else{
								window.wxc.xcConfirm("名称不能为空", window.wxc.xcConfirm.typeEnum.error);
							}
						}
					});
		});
	});
	function deleteType(id){
		$.ajax({
		  type:"get",
		  url: "/myhome/type/deleteType?id="+id,
		  dataType: 'json',
		  contentType : "application/json",
		  success: function(data){
		  	if(data.msg == 1){
		  		window.wxc.xcConfirm("删除成功", window.wxc.xcConfirm.typeEnum.success,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/type/list";
						}
					});
		  	}else if(data.msg == 0){
		  		window.wxc.xcConfirm("删除失败", window.wxc.xcConfirm.typeEnum.error,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/type/list";
						}
					});
		  	}else{
		  		window.wxc.xcConfirm("删除失败，此类型下存在房屋", window.wxc.xcConfirm.typeEnum.error,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/type/list";
						}
					});
		  	}
		  },
		  error:function(){
		  	window.wxc.xcConfirm("系统运行错误", window.wxc.xcConfirm.typeEnum.error);
		  }
		});
	}
		function updateType(id){
		window.wxc.xcConfirm("增加类型", window.wxc.xcConfirm.typeEnum.input,{
						onOk:function(typeName){ //点击确定按钮，跳转]
						if(typeName != ''){
								$.ajax({
								  type:"get",
								  url: "/myhome/type/updateType",
								  data:{
								  	id:id,
								  	typeName : typeName
								  },
								  dataType: 'json',
								  contentType : "application/json",
								  success: function(data){
								  		if(data.msg == 0){
								  		window.wxc.xcConfirm("修改失败", window.wxc.xcConfirm.typeEnum.error,{
											onOk:function(v){ //点击确定按钮，跳转
												window.location.href = "/myhome/type/list";
											}
										});
								  	}else if(data.msg == 1){
								  		window.wxc.xcConfirm("修改成功", window.wxc.xcConfirm.typeEnum.success,{
											onOk:function(v){ //点击确定按钮，跳转
												window.location.href = "/myhome/type/list";
											}
										});
								  }
								  },
								  error:function(){
								  	window.wxc.xcConfirm("系统运行错误", window.wxc.xcConfirm.typeEnum.error);
								  }
								});
							}else{
								window.wxc.xcConfirm("名称不能为空", window.wxc.xcConfirm.typeEnum.error);
							}
						}
			});
	}
	</script>
	<style>
		#addType{
			width:89px;
			height:35px;
			line-height: 35px;
			border:1px solid #fff;
			background:#B99999;
			text-align: center;
			color:#fff;
			cursor: pointer;
			border-radius:5px;
		}
	</style>
</head>
<body>
<div id="addType">添加</div>
	<section class="demo" id="basic">
		<table>
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${typeList }" var="type" varStatus="status">
				<tr>
					<td class="user-email">${status.count}</td>
					<td class="user-phone">${type.typeName }</td>
					<td class="user-location"><a onClick="deleteType(${type.id})">删除</a>&nbsp;<a onClick="updateType(${type.id })">修改</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</section>
		</body>
		</html>