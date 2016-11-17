
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
	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#basic table').stickySort();
	});
	function AgreeUser(id){
		$.ajax({
		  type:"get",
		  url: "/myhome/user/agreeUser?id="+id,
		  dataType: 'json',
		  contentType : "application/json",
		  success: function(data){
		  	if(data.msg == 1){
		  		window.wxc.xcConfirm("操作成功", window.wxc.xcConfirm.typeEnum.success,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/user/list";
						}
					});
		  	}else{
		  		window.wxc.xcConfirm("操作失败", window.wxc.xcConfirm.typeEnum.error,{
						onOk:function(v){ //点击确定按钮，跳转
							window.location.href = "/myhome/user/list";
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
	<style type="text/css">
		.owner{
			color:#faa121;
		}
	</style>
</head>
<body>
		<section class="demo" id="basic">
			<table>
				<thead>
					<tr>
						<th>序号</th>
						<th>头像</th>
						<th>名字</th>
						<th>电话</th>
						<th>登录名</th>
						<th>身份</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userList }"  varStatus="status" var="user">
					<tr>
						<td class="user-name">${status.count}</td>
						<td class="user-avatar">
							<img src="/myhome/images/15.jpg" alt="samantha morgan" title="samantha morgan" />
						</td>
						<td class="user-name">${user.userName }</td>
						<td class="user-email">${user.phone }</td>
						<td class="user-phone">${user.userLoginName }</td>
						<c:if test="${user.isLandlord == 0 }">
							<td class="user-location">用户</td>
						</c:if>
						<c:if test="${user.isLandlord == 1 }">
							<td class="user-location owner">房主</td>
						</c:if>
						<c:if test="${applyOwner != null }">
							<td class="user-location"><a onClick="AgreeUser(${user.id})" href="#">同意</a></td>
						</c:if>
						<c:if test="${applyOwner == null }">
							<td class="user-location"><a onClick="deleteUser(${user.id})" href="#">删除</a></td>
						</c:if>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		
		</body>
		</html>