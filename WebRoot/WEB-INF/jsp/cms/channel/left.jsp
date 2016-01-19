<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/js/dtree/dtree.css"/>
    <script type="text/javascript" src="${ctx }/js/dtree/dtree.js"></script>
</head>
<body>
	<div class="phead">
		<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： 栏目结构</div>
		<div class="clear"></div>
	  </div>
	<div class="dtree">
	<script type="text/javascript">
	    d = new dTree('d');
		<c:forEach items="${channelList}" var="channel">
			<c:choose>
				<c:when test="${empty channel.cmsChannel}">
					<c:set var="parentId" value="-1"></c:set>
					<c:set var="channelPath" value="${ctx}/cms/channel_list.do?parentId=${channel.id }"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="parentId" value="${channel.cmsChannel.id }"></c:set>
					<c:set var="channelPath" value="${ctx4ej}/cms/channel_update.do?id=${channel.id }"></c:set>
					<c:if test="${!empty channel.cmsChannels}">
						<c:set var="channelPath" value="${ctx4ej}/cms/channel_list.do?parentId=${channel.id }"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose>
			d.add('${channel.id }','${parentId}','${channel.channelName }','${channelPath}','','rightframe_channel');
		</c:forEach>
		document.write(d);
	</script>
	</div>
</body>
</html>