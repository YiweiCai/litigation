<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/common/title.jsp"%>
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
			var listurl = "${ctx4ej }/lawsuit/courtOpenInfoList.htm";
			
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
<style type="text/css">
		table{border-collapse:collapse;border: none; }
    table td{empty-cells:show; border: solid #c3e4f5 1px;  color:#333333;
    }
</style>
</head>

<body>


<form id="formSearch" method="post" action="${ctx4ej }/cms/article_search.htm">
<div class="guidetitlebg"><a href="${ctx4ej }/index.htm">首页</a>>诉讼服务指南>开庭公告
<%-- 一级栏目 --%>
	<c:if test="${channel.cmsChannel.id == '1' }">${channel.channelName }</c:if>
	
	<%-- 二级栏目 --%>
	<c:if test="${channel.cmsChannel.id != '1' }">
		${channel.cmsChannel.channelName }> 
		<a href="#">${channel.channelName }</a>
	</c:if>
</div>
<div class="guidetext" align="center">
	<c:if test="${empty page.list}">
		<li>
           	<h6 style="text-align:center; color:red;">当前未发布任何开庭信息</h6>
        </li>
    </c:if>
    <c:if test="${!empty page.list}">
    	<table style="width:100%">
    	<thead bgcolor="#f0f7ff">
    		<tr>
	    		<td align="center">案号</td>
	    		<td align="center">案件名称</td>
	    		<td width="50px" align="center">审判长</td>
	    		<td align="center">审判员</td>
	    		<td align="center">开庭地点</td>
	    		<td align="center">开庭时间</td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="courtOpenInfo" items="${page.list}">
    			<tr>
    				<td align="center">${courtOpenInfo.caseNum }</td>
    				<td align="center">${courtOpenInfo.caseName }</td>
    				<td align="center">${courtOpenInfo.chiefJudge }</td>
    				<td align="center">${courtOpenInfo.viceJudges }</td>
    				<td align="center">${courtOpenInfo.courtPlace }</td>
    				<td align="center">${courtOpenInfo.startTime }</td>
    			</tr>
    		</c:forEach>
    	</tbody>
    	</table>
    </c:if>
</div>
<div class="newspage"><%@ include file="/front/jsp/include/pager.jsp" %></div>

</form>










</body>
</html>
