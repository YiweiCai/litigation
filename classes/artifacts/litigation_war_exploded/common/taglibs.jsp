<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- ctx4ej:代表：二级子站的ctx。过滤器会在登陆之前将请求放入requestNameSpace中 -->
<!-- requestNameSpace: 
	  郑州中院 zzfy 
	  新郑法院：xzfy
	  荥阳法院：xyfy	
-->
<c:set var="ctx4ej" value="${pageContext.request.contextPath}/${requestNameSpace}"/>
