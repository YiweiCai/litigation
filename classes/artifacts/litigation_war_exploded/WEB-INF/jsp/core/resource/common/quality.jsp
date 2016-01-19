<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
	</head>
	<body style="background: rgba(0, 0, 0, 0) url('${ctx}/js_css_image/front/images/contbg.jpg') repeat-y scroll 0px 0px;">
		<div class="cylink">
        	<div class="ltitle" style="font:bold 14px/28px Arial,Helvetica,sans-serif;">精品推荐</div>
            <ul class="jptjul">
            	<c:forEach items="${page.list}" var="item" varStatus="status">
                	<li>
                    	<a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank"><img src="${ctx}/js_css_image/front/images/recom.png" width="50" height="54" /></a>
                    	<a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank" title="${item.name }"><h4>${item.name }</h4></a>
                        <p title="${item.description }">${item.description }</p>                    	
                    </li>
               	</c:forEach>
            </ul>
        </div>
	</body>
</html>
