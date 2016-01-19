<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="pagebar">
	<ul>
		<li>
			<c:if test="${page.hasPrevious }">
				<a id="" href="javascript:void(0);" onclick="goPage(1);">首页</a>
				<a id="" href="javascript:void(0);" onclick="goPage(${page.previousPage});" >上一页</a>
			</c:if>
			<c:if  test="${!page.hasPrevious }">
				<a id="" href="javascript:void();" class="nolink">首页</a>
				<a id="" href="javascript:void();" class="nolink">上一页</a>
			</c:if>
		</li>
		<li>
			共有${page.totalRecords}条记录 当前显示第
			<b>${page.currentPage}</b> /
			<b>${page.totalPage}</b> 页
		</li>
		<li>
			<c:if test="${page.hasNext }">
				<a id="" href="javascript:void(0);" onclick="goPage(${page.nextPage});">下一页</a>
				<a id="" href="javascript:void(0);" onclick="goPage(${page.totalPage});" >尾页</a>
			</c:if>
			<c:if test="${!page.hasNext }">
				<a id="" href="javascript:void();" class="nolink">下一页</a>
				<a id="" href="javascript:void();" class="nolink">尾页</a>
			</c:if>
		</li>
		<li>
			转到第
			<input name="page.currentPage" type="text" id="gotopages" class="input_pager" value="${page.currentPage}"
				onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'') " />
			页
			<button class="pagebutton" onclick="goPage($('#gotopages').val());return false;">
				
			</button>
		</li>
	</ul>
</div>
<script type="text/javascript">
    function goPage(pnum) {
    	var url = listurl;
    	// 获取页面跳转参数
    	var params = getParams();
    	if(pnum == ''){
    		alert('请输入要跳转的页数！');
    	}
	    else if(pnum > ${page.totalPage} || pnum <= 0){
	        alert('页号超出允许的范围！');
	        $("#gotopages").val("${page.currentPage}");
	        return;
	    }
	    //window.location.href='${ctx}/cms/article_flist.htm?channelId=${channel.id}&page.currentPage='+pnum;
	    url += '?page.CurrentPage=' + pnum;
	    if(params!="undefind" && params!=""){
	    	url += "&" + params;
	    }
	    window.location.href =  url;
	}
</script>