<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <link href="${ctx}/js_css_image/css/common.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <%@ include file="/front/jsp/include/head.jsp" %>
    <div class="layout">
    <iframe src="http://zhenzhengapp.com/index.php?m=consultation&c=index&a=addcon" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="1000" height="800 " ></iframe>
    </div>
  </body>
</html>
