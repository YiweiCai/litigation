<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
		<script type="text/javascript">
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}")
				</c:if>
			});  
		</script>
	</head>
	<body>
	<form id="formSearch" method="post" action="${ctx }/cms/article_search.htm">
   		<!--头部开始-->
		<%@ include file="/front/jsp/include/head.jsp" %>
		<!--头部结束-->
	    <!--内容页开始-->
		<div class="container">
			<div class="banner"><img src="${ctx}/js_css_image/front/images/banner.jpg" width="960" height="217" alt="" title="" /></div>
		    <div class="icont">
		    	<!--左侧栏目开始-->
		    	<div class="icontleft">
		        	<div class="leftmenu">
		            	<div class="lmenutitle"><span>联系我们</span></div>
		            	<ul class="icontleftul">
		            		<li><span></span><a href="${ctx}/lxwm/index_1.html">联系我们</a></li>
		                </ul>
		                <div class="lmenubt"><img src="${ctx}/js_css_image/front/images/icont_bt.jpg" width="208" height="26" title="" alt="" /></div>
		            </div>
		            <div class="download">
		            	<a href="#"><img src="${ctx}/js_css_image/front/images/xz.jpg" width="208" height="75" alt="" title="" /></a>
		            </div>
		            <div class="download">
		            	<a href="${ctx}/lxwm/index_1.html"><img src="${ctx}/js_css_image/front/images/lx.jpg" width="208" height="75" alt="" title="" /></a>
		            </div>
		        </div><!--左侧栏目结束-->			
		    	<!--右侧内容开始-->
				<div class="icontright">
					<div class="icontrtitle">
						<div class="titleicon"><img src="${ctx}/js_css_image/front/images/home.png" width="34" height="40" alt="" title="" /><span>搜索结果</span></div>
						<div class="rtitle">
							<span>当前位置：</span><a href="${ctx}/index.html">首页</a> &gt; 搜索结果
						</div>
					</div>
					<div class="mainright">
						<ul class="newslist">
							<c:if test="${empty page.list}">
								<li style="text-align:center;">对不起，未找到您需要的信息</li>
							</c:if>
							<c:forEach items="${page.list}" var="article" varStatus="status">
								<c:if test="${article.cmsChannel.channelType != 'download' }">
									<li><a href="${article.outerUrl}" title="${article.title}" target="_blank">${article.title}</a>
										<span>[${fn:substring(article.releaseDate,0,10) }]</span></li>
								</c:if>
								<c:if test="${article.cmsChannel.channelType == 'download' }">
									<li><a href="${ctx}/cms/article_download.htm?articleId=${article.id }" title="${article.title}" target="_blank">${article.title}</a>
										<span>[${fn:substring(article.releaseDate,0,10) }]</span></li>
								</c:if>
						    </c:forEach>
						</ul>
						<div class="ltablebottom" style="margin-top:15px; text-align:right;">
							<div class="lpage"><my:page page="${page}"/></div>  
						 </div>
							<script type="text/javascript">
						    function goPage() {
						    	var pnum = $("#gotopages").val();
						    	
						    	if(pnum == ''){
						    		alert('请输入要跳转的页数！');
						    	}
							    else if(pnum > ${page.totalPage} || pnum <= 0){
							        alert('页号超出允许的范围！');
							        $("#page").val("${page.currentPage}");
							        return;
							    }
							    window.location.href='${ctx}/${channel.path}/index_'+pnum+'.html';
							}
							</script>
					</div>
				</div><!--右侧内容结束-->
			</div>
		</div><!--内容页结束-->
	</form>
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
