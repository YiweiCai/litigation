<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/common/title.jsp"%>
<script type="text/javascript" src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}");
				</c:if>
				$("#${channelId}").attr("class","selected");
				$("a[initClick]").each(function(){
					if($(this).attr("initClick")=="${channelId}"){
						$(this).click();
					}
				});
			});  
			
			
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

<form id="formSearch" method="post" action="${ctx4ej }/cms/article_search.htm">
   <%@ include file="/front/jsp/include/head.jsp" %>
	    
<div class="layout">
  <div class="leftnav">
   <ul>
<c:if test="${channel.cmsChannel.id == '1' }">
	<li class="blue">${channel.channelName }</li>
	<div class="leftnavline"></div>
	<c:choose>

		<c:when test="${(item.isDynamicUrl=='1'||item.isDynamicUrl=='3')&&! empty item.dynamicUrl}">
			<c:if test="${fn:contains(item.dynamicUrl, 'front')==true}" >
				<li  id="${item.id}"><a href="#" initClick="${item.id}" onclick="changeDiv('${item.dynamicUrl}','${item.id}')">${item.channelName }</a></li>
			</c:if>
			<c:if test="${fn:contains(item.dynamicUrl, 'front')==false}" >
				<li  id="${item.id}"><a href="#" initClick="${item.id}" onclick="changeDiv('${ctx4ej}${item.dynamicUrl}','${item.id}')">${item.channelName }</a></li>
			</c:if>
		</c:when>
			<c:when test="${channel.isDynamicUrl=='2'&&! empty channel.dynamicUrl}"><li id="${channel.id}"><a href="${channel.dynamicUrl}" target="_">${channel.channelName }</a></li></c:when>
			<c:otherwise><li  id="${channel.id}"><a href="${ctx4ej}/cms/article_flist.htm?channelId=${channel.id}">${channel.channelName }</a></li></c:otherwise>
	</c:choose>
</c:if>
<%-- 二级栏目 --%>
<c:if test="${channel.cmsChannel.id != '1' }">
<li class="blue">${channel.cmsChannel.channelName }</li>
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
	<iframe src="" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="1000" ></iframe>
	</div>
  <div class="aside" id="aside">
    <div class="guidetitlebg"><a href="${ctx }">首页</a>>
<%-- 一级栏目 --%>
	<c:if test="${channel.cmsChannel.id == '1' }">${channel.channelName }</c:if>
	
	<%-- 二级栏目 --%>
	<c:if test="${channel.cmsChannel.id != '1' }">
		${channel.cmsChannel.channelName }> 
		<a href="#">${channel.channelName }</a>
	</c:if>
</div>
    <div class="guidetext">
      <div class="guidename">${title }</div>
      	<h4>发布时间：${fn:substring(releaseDate, 0, 10)}&nbsp;&nbsp;&nbsp;&nbsp;文章来源：${origin}
		                	&nbsp;&nbsp;&nbsp;&nbsp;作者：${author }&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：${visitTotal }</h4>
		            	
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${content } 
      
      <c:if test="${!empty uploadFileList && channel.channelType == 'download'}">
		            		<hr size="1" style="border-bottom:1px dashed #cfcac1; border-top:none;">
		            		<div style="text-indent: 2em;">
		            		附件：
		            		<c:forEach items="${uploadFileList}" var="upfile">
						        <span id="${upfile.id}span">
						            <a href="${ctx4ej}/cms/article_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载" target="_blank">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
						            <br/>
						         </span>
						    </c:forEach>
							</div>
						</c:if>
      </div>
  </div>
</div>
</form>

<%@include file="/common/commonfooter.jsp" %>
</body>
</html>
