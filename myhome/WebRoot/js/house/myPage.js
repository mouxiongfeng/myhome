function exeData(num, type) {
    loadData(num);
    loadpage();
}
function loadpage() {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
    $("#countindex").val(countindex);
    var totalpage= parseInt(countindex);
    $.jqPaginator('#pagination', {
        totalPages: parseInt($("#countindex").val()),
        visiblePages: parseInt($("#visiblePages").val()),
        currentPage: 1,
        first: '<li class="first" onclick="getHouseByPage(1);"><a href="javascript:;">首页</a></li>',
        prev: '<li class="prev" onclick="getHouseByPage(1);"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next" onclick=""><a href="'+ (currentPage + 1) +'">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last" onclick="getHouseByPage('+totalpage+');"><a href="javascript:;">末页</a></li>',
        page: '<li class="page" onclick="getHouseByPage(1);"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (num, type) {
            if (type == "change") {
                exeData(num, type);
            }
        }
    });
}
function getHouseByPage(currentPage){
	   var pageSize = $("#PageSize").val();
	   window.location.href="/myhome/house/getHouseList?PageSize="+pageSize+"&currentPage="+currentPage;
}
$(function () {
    loadData(1);
    loadpage();
});