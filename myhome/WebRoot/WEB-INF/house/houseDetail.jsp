<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>房屋详情</title>
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/detail/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/detail/default.css">
	<link rel="stylesheet" type="text/css" href="/myhome/css/house/detail/cntl.css">
	<link type="text/css" href="/myhome/css/type/xcConfirm.css" media="all" rel="stylesheet" />
	<script src="/myhome/js/house/detail/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/myhome/js/house/detail/jquery.cntl.js"></script>
	<script type="text/javascript" src="/myhome/js/type/xcConfirm.js"></script>
		<style type="text/css">
		#center{
			margin-top:100px;
			margin:0 auto;
			width:80%;
		}
		header a{
			cursor:pointer;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(e){
			$('.cntl').cntl({
				revealbefore: 300,
				anim_class: 'cntl-animate',
				onreveal: function(e){
					console.log(e);
				}
			});
		});
		function applyHouse(houseId,userId){
			$.ajax({
			  type:"get",
			  url: "/myhome/houseapply/userapply?houseId="+houseId+"&userId="+userId,
			  dataType: 'json',
			  contentType : "application/json",
			  success: function(data){
			  	if(data.msg == 1){
			  		window.wxc.xcConfirm("申请成功", window.wxc.xcConfirm.typeEnum.success,{
							onOk:function(v){ //点击确定按钮，跳转
								$("header").hide();
							}
						});
			  	}else{
			  		window.wxc.xcConfirm("申请失败", window.wxc.xcConfirm.typeEnum.error,{
							onOk:function(v){ //点击确定按钮，跳转
								
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
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<a onclick="applyHouse(${house.id },${sessionScope.user.id});">点击申请入住</a>
		</header>
		<div id="center">
		<div class="cntl">
			<span class="cntl-bar cntl-center">
				<span class="cntl-bar-fill"></span>
			</span>

			<div class="cntl-states">

				<div class="cntl-state">
					<div class="cntl-content">
						<h4>Title 1</h4>
						<p>欢迎光临进入苏州美臣不动产—刘德林网上店铺  href="/myhome/houseapply/userapply?houseId=${house.id }&userId=${sessionScope.user.id}"
						很高兴为您介绍本套房源：
						白塘一号，稀缺2房，客厅和卧室均朝南，精致装修，业主因要工作原因急于出租，低于市场价！希望能找个稳定、爱惜房子的租客。</p>
					</div>
					<div class="cntl-icon cntl-center">'00</div>
				</div>


				<div class="cntl-state">
					<div class="cntl-content">
						<h4>Title 2</h4>
						<p>
						内部有网球、篮球、乒乓球室、健身房，周边有方洲邻里中心、华润万家等商业配套；还有新街口商业街等便民小店；小区由栖霞物业管理，物业管理的A级资质的物业公司哦！
						</p>
					</div>

					<div class="cntl-image"><img src="${house.houseImgList[0].imgLocation }"></div>
					<div class="cntl-icon cntl-center">'03</div>
				</div>

				<div class="cntl-state">
					<div class="cntl-content">
						<h4>Title 3</h4>
						<p>
						整个小区规划居住户数约1500户，规划居住人数约5000人。东辰华都住宅类型有联排别墅、退台花园洋房、多层和小高层，此外还有车库、铺面销售。东辰华都户型设计新颖,区位优越、交通便利，项目与未来行政中心、职教园区相毗邻，周边有大型建材市场、五金机电市场，乘6路、21路公交车可到
						</p>
					</div>

					<div class="cntl-image"><img src="${house.houseImgList[1].imgLocation }"></div>
					<div class="cntl-icon cntl-center">'04</div>
				</div>

				<div class="cntl-state">
					<div class="cntl-content">
						<h4>Title 4</h4>
						<p>
						整个住宅群空间更显活泼有趣，充分展现设计师对居住者人性化的关怀。简约与和谐抛却媚俗主意的建筑。简洁的线条，内敛的的色彩，张扬的生命力，没有复杂的建筑语汇。
						</p>
					</div>

					<div class="cntl-image"><img src="${house.houseImgList[2].imgLocation }"></div>
					<div class="cntl-icon cntl-center">'07</div>
				</div>

				<div class="cntl-state">
					<div class="cntl-content">
						<h4>Title 5</h4>
						<p>
						整个住宅群空间更显活泼有趣，充分展现设计师对居住者人性化的关怀。简约与和谐抛却媚俗主意的建筑。简洁的线条，内敛的的色彩，张扬的生命力，没有复杂的建筑语汇。
						</p>
					</div>

					<div class="cntl-image"><img src="${house.houseImgList[3].imgLocation }"></div>
					<div class="cntl-icon cntl-center">'10</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>