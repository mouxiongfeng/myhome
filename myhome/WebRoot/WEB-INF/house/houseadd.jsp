<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>房屋添加</title>
	<link rel="stylesheet" href="/myhome/css/user/information/platform-1.css">
    <link rel="stylesheet" href="/myhome/css/user/information/easyform.css">

    <link rel="stylesheet" href="/myhome/css/user/information/tab.css">
    	<link type="text/css" href="/myhome/css/type/xcConfirm.css" media="all" rel="stylesheet" />
    	<link type="text/css" href="/myhome/css/bootstrap.min.css" rel="stylesheet" />
	<script class="resources library" src="/myhome/js/house/area.js" type="text/javascript"></script>
    <script src="/myhome/js/user/information/jquery-2.1.0.min.js"></script>
    <script src="/myhome/js/user/information/easyform.js"></script>
    	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#form").easyform();
    	});
    	function houseimgfour(){
			$("input[name='file']").each(  
			function(){  
				if(this.value == ""){
					window.wxc.xcConfirm("必须上传四张图片");
					return false;
				}
			}); 
    	}
    	
    	var Gid  = document.getElementById ;
	var showArea = function(){
	Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
	Gid('s_city').value + " - 县/区" + 
	Gid('s_county').value + "</h3>";
							};
    </script>
    <style type="text/css">
    	.form-div{
    		width:60%;
    	}
    	.form-div select, .form-div textArea, .form-div input[type="file"]{
    		margin: 10px;
    		border-radius: 8px;
    	}
    	.form-div textArea {
    		height: 80px;
    	}
    	tbody{
    		width:80%;
    	}
    	.smartselet{
    		width:100px;
    	}
    	.lefttd{
    		margin-left: 10px;
    	}
    </style>
  </head>
  
  <body>
        <div class="form-div">

        <%-- <form id="form" action="/myhome/house/addHouse" enctype="multipart/form-data" method="post">
            <table>
            	<tr>
            		<td>房屋地址</td>
            		<td>
            			    <div class="info">
							<div>
							<select class="smartselet" id="s_province" name="province"></select>  
						    <select class="smartselet"  id="s_city" name="city" ></select>  
						    <select class="smartselet"  id="s_county" name="county"></select>
						    <script class="resources library" src="area.js" type="text/javascript"></script>
						    
						    <script type="text/javascript">_init_area();</script>
						    </div>
						    <div id="show"></div>
						</div>
            		</td>
            	</tr>
                <tr>
                    <td>房屋介绍</td>
                    <td><input name="houseIntroduce" type="text" id="houseIntroduce" 
                               data-easyform="length:10 20;"
                               data-message="长度10-20字的介绍"
                               data-easytip="position:right;class:easy-red;">
                    </td>
                </tr>
                <tr>
                    <td>房屋类型</td>
                    <td>
                    	<select class="lefttd" name="typeId">
                    		<c:forEach items ="${typeList }" var="type">
                    			<option value="${type.id }">${type.typeName }</option>
                    		</c:forEach>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td><input  class="lefttd" name="housePrice" type="text" id="housePrice" data-easyform="money"
                               data-message="输入类型错误" data-easytip="class:easy-blue;"></td>
                </tr>
                <tr>
                	<td>上传图片：</td>
                	<td><input  class="lefttd" type="file" name="file" /></td>
                </tr>
                <tr>
                	<td>上传图片：</td>
                	<td><input  class="lefttd" type="file" name="file" /></td>
                </tr>
                <tr>
                	<td>上传图片：</td>
                	<td><input  class="lefttd" type="file" name="file" /></td>
                </tr>
                <tr>
                	<td>上传图片：</td>
                	<td><input class="lefttd" type="file" name="file" /></td>
                </tr>
                <tr>
                    <td>房屋描述</td>
                    <td><textarea  class="lefttd" id="description" name="description" style="width: 270px;" rows="5"
                    	data-easyform="length:10 300;"
                               data-message="必须是10-300字"
                               data-easytip="position:right;class:easy-red;"
                    ></textarea></td>
                </tr>
            </table>

            <div class="buttons" style="margin-top: 50px;">
            	<input type="hidden" id="id" name="id" value="${sessionScope.user.id }">
                <input value="确认" type="submit" onClick="houseimgfour();" style="margin-right:180px; margin-top:20px;">
            </div>

            <br class="clear">
        </form>  --%>
        
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
					<form id="form" class="form-horizontal" action="/myhome/house/addHouse" enctype="multipart/form-data" method="post">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">房屋地址</label>
							<div class="col-sm-2">
								<select class="form-control" id="s_province" name="province">
								<option>1111</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select class="form-control" id="s_city" name="city">
								<option>1111</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select class="form-control" id="s_county" name="county">
								<option>1111</option>
								</select>
							</div>
							</div>
						</div>
					  <div class="col-sm-12">
					  	<div class="form-group">
						    <label for="houseIntroduce" class="col-sm-2 control-label">房屋介绍</label>
						    <div class="col-sm-10">
						      <input name="houseIntroduce" type="text" id="houseIntroduce"  class="form-control"  placeholder="长度10-20字的介绍" 
						      data-easytip="position:right;class:easy-red;">
						    </div>
					  	</div>
					  </div>
					  <div class="col-sm-12">
					  	<div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label" >房屋类型</label>
						    <div class="col-sm-2">
								<select class="form-control" name="typeId">
								<c:forEach items ="${typeList }" var="type">
                    			<option value="${type.id }">${type.typeName }</option>
                    			</c:forEach>
								<option>1111</option>
								</select>
							</div>
					  	</div>
					  </div>
					  <div class="col-sm-12">
					  	<div class="form-group">
						    <label for="housePrice" class="col-sm-2 control-label">房屋价格</label>
						    <div class="col-sm-10">
						      <input name="housePrice" type="text" id="housePrice" class="form-control" placeholder="请输入价格" data-easyform="money"
                               data-message="输入类型错误" data-easytip="class:easy-red;">
						    </div>
					  	</div>
					  </div>
					  		
					  <div class="col-sm-12">
					  	<div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">房间图片</label>
						    <div class="col-sm-10">
						      <input type="file" class="" name="file" >
						      <input type="file" class="" name="file" >
						      <input type="file" class="" name="file" >
						      <input type="file" class="" name="file" >
						    </div>
					  	</div>
					  </div>
					  
					  <div class="col-sm-12">
					  	<div class="form-group">
						    <label for="description" class="col-sm-2 control-label">房屋描述</label>
						    <div class="col-sm-6">
						      <textArea class="form-control" id="description" name="description" placeholder="请输入10-300字" data-message="必须是10-300字" data-easytip="position:right;class:easy-red;"></textArea>
						    </div>
					  	</div>
					  </div>
					  
					  <div class="col-sm-10">
					  		
            					<input type="hidden" id="id" name="id" value="${sessionScope.user.id }">
                				<input value="确认" type="submit" class="btn btn-primary pull-right"  onClick="houseimgfour();">
            		 		
					  </div>
					  			 
					 </form>
        		</div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">_init_area();</script>
  </body>
</html>
