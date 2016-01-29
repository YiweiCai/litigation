<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/common/title.jsp"%>
<script type="text/javascript" src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
			var listurl = "${ctx4ej }/cms/article_flist.htm";
			
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}")
				</c:if>
				$("#${channelId}").attr("class","selected");
				$("a[initClick]").each(function(){
					if($(this).attr("initClick")=="${channelId}"){
						$(this).click();
					}
				});
			});  
			
			// 获取页面跳转参数
			function getParams(){
				return "channelId=${channel.id}";
			}
			function changeDiv(u,channelId){
				$(".selected").removeAttr("class");
				$("#"+channelId).attr("class","selected");
				document.getElementById('aside').style.display = "none";
				document.getElementById('iframeDiv').style.display = "";
				document.getElementById('iframepage').src=u;
			}
			function iFrameHeight() {   
			var ifm= document.getElementById("iframepage");   
			var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
			if(ifm != null && subWeb != null) {
			   ifm.height = subWeb.body.scrollHeight;
			   ifm.width = subWeb.body.scrollWidth;
			}   
			} 

    
		</script>
<link href="${ctx}/js_css_image/css/common.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%@ include file="/front/jsp/include/head.jsp" %>
<div class="layout">
<div class="leftnav">
<ul>
<c:if test="${channel.cmsChannel.id == '1' }">
	<li class="blue">${channel.channelName }</li>
	<c:choose>
			
			<c:when test="${(channel.isDynamicUrl=='1'||channel.isDynamicUrl=='3')&&! empty channel.dynamicUrl}"><li id="${channel.id}"><a initClick="${channel.id}" href="#" onclick="changeDiv('${ctx4ej}${channel.dynamicUrl}','${channel.id}')">${channel.channelName }</a></li></c:when>
			<c:when test="${channel.isDynamicUrl=='2'&&! empty channel.dynamicUrl}"><li id="${channel.id}"><a href="${channel.dynamicUrl}" target="_">${channel.channelName }</a></li></c:when>
			<c:otherwise><li id="${channel.id}"><a href="${ctx4ej}/cms/article_flist.htm?channelId=${channel.id}">${channel.channelName }</a></li></c:otherwise>
	</c:choose>
</c:if>
<%-- 二级栏目 --%>
<c:if test="${channel.cmsChannel.id != '1' }">
<li class="blue">${channel.cmsChannel.channelName }</li>
<div class="leftnavline"></div>
	<!-- 下面c:foreach 中的 第一个 c:choose 中的c:when 里面的fn:contains 函数 判断意义是：判断循环遍历的菜单是否是本身的前台页面，主要是针对案件查询菜单 -->
<c:forEach  items="${channel.cmsChannel.cmsChannels}" var="item" varStatus="status">
		<c:choose>

			<c:when test="${(item.isDynamicUrl=='1'||item.isDynamicUrl=='3')&&! empty item.dynamicUrl}">
				<c:if test="${fn:contains(item.dynamicUrl, 'front')==true}" >
					<li  id="${item.id}"><a href="#" initClick="${item.id}" onclick="changeDiv('${item.dynamicUrl}','${item.id}')">${item.channelName }</a></li>
				</c:if>
				<c:if test="${fn:contains(item.dynamicUrl, 'front')==false}" >
				<li  id="${item.id}"><a href="#" initClick="${item.id}" onclick="changeDiv('${ctx4ej}${item.dynamicUrl}','${item.id}')">${item.channelName }</a></li>
				</c:if>
			</c:when>
			<c:when test="${item.isDynamicUrl=='2'&&! empty item.dynamicUrl}"><li  id="${item.id}"><a href="${item.dynamicUrl}" target="_">${item.channelName }</a></li></c:when>
			<c:otherwise><li  id="${item.id}"><a href="${ctx4ej}/cms/article_flist.htm?channelId=${item.id}">${item.channelName }</a></li></c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>
</ul>








</div>
<div style="display: none;" class="aside" id="iframeDiv">
<iframe src="" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="800" ></iframe>
</div>
<div class="aside" id="aside">
<form id="formSearch" method="post" action="${ctx4ej }/cms/article_search.htm">
<div class="guidetitlebg"><a href="${ctx4ej }">首页</a>>
<%-- 一级栏目 --%>
	<c:if test="${channel.cmsChannel.id == '1' }">${channel.channelName }</c:if>
	
	<%-- 二级栏目 --%>
	<c:if test="${channel.cmsChannel.id != '1' }">
		${channel.cmsChannel.channelName }> 
		<a href="#">${channel.channelName }</a>
	</c:if>
</div>
<div class="guidetext">
<ul>
			<c:if test="${channel.channelType == 'single' }">
		            		<c:forEach items="${page.list}" var="item" varStatus="status">
					            <div class="maincont">
					            	<h2>${item.title }</h2>
					                <h4>发布时间：${fn:substring(item.releaseDate, 0, 10)}&nbsp;&nbsp;&nbsp;&nbsp;文章来源：${item.origin}
					                	&nbsp;&nbsp;&nbsp;&nbsp;作者：${item.author }&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：${item.visitTotal }</h4>
					            	${item.content }
					            	<c:if test="${!empty uploadFileList}">
					            		<hr size="1" style="border-bottom:1px dashed #cfcac1; border-top:none;">
					            		<div style="text-indent: 2em;">
					            		附件：
					            		<c:forEach items="${uploadFileList}" var="upfile">
									        <span id="${upfile.id}span">
									            <a href="${ctx4ej}/cms/article_download.do?id=${item.id}&uploadFileId=${upfile.id}" title="下载" target="_blank">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
									            <br/>
									         </span>
									    </c:forEach>
										</div>
									</c:if>
					            </div>
				            </c:forEach>
				            <c:if test="${empty page.list }">
				            	<div class="maincont">
					            	<h2 style="text-align:center; color:red;">${channel.channelName }尚未添加</h2>
					            </div>
				            </c:if>
		            	</c:if>
		            	<%-- 非单页 --%>
		            	<c:if test="${channel.channelType != 'single' }">
			            	<ul class="newslist">
			            		<c:forEach items="${page.list}" var="item" varStatus="status">
				                	
				                    <li><a href="article_detail.do?articleId=${item.id }&channelId=${channel.id }" target="_blank">${item.title }<div class="guidedate">${fn:substring(item.releaseDate, 0, 10)}</div>
				                   <%--  <p>${item.description }</p> --%></a></li>
			                    </c:forEach>
					            <c:if test="${empty page.list }">
					            	<li>
						            	<h6 style="text-align:center; color:red;">未找到符合条件的文章</h6>
						            </li>
					            </c:if>
			                </ul>
			            	
						</c:if>



</ul>

</div>
<div class="newspage"><%@ include file="/front/jsp/include/pager.jsp" %></div>
</form>
</div>

</div>








<%@include file="/common/commonfooter.jsp" %>
</body>
</html>
