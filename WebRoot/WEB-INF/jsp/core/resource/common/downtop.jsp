<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	<body style="background: rgba(0, 0, 0, 0) url('${ctx}/js_css_image/front/images/contbg.jpg') repeat-y scroll 0px 0px;">
		<div class="cylink">
        	<div class="ltitle" style="font:bold 14px/28px Arial,Helvetica,sans-serif;">下载排行</div>
            <ul class="cylinkul">
            	<c:forEach items="${page.list}" var="item" varStatus="status">
               		<li><span></span><a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank" title="${item.name }">${item.name }</a></li>
               	</c:forEach>
            </ul>
        </div>
	</body>
</html>
