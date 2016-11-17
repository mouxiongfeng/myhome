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
	  		window.wxc.xcConfirm("删除成功", window.wxc.xcConfirm.typeEnum.success);
	  		window.location.href = "/myhome/house/manageHouseList";
	  	}else{
	  		window.wxc.xcConfirm("删除失败", window.wxc.xcConfirm.typeEnum.error);
	  		window.location.href = "/myhome/house/manageHouseList";
	  	}
	  },
	  error:function(){
	  	alert("错误");
	  }
	});
}