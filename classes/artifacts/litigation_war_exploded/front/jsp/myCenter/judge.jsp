<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx }/js_css_image/css/common.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@ include file="/front/jsp/include/head.jsp" %>
<div class="layout">
  <div class="leftnav">
    <ul>
      <li class="blue">法官专栏</li>
      <div class="leftnavline"></div>
      <li class="selected"><a href="#">联系法官</a></li>
      <li><a href="#">法官风采</a></li>
    </ul>
  </div>
  <div class="aside">
    <div class="guidetitlebg">首页>法官专栏>联系法官</div>
    <div class="courtroom">第一法庭</div>
    <div class="judgelist"> <a href="${ctx }/siteshow/faguanmessage.html" target="_">安士勇</a><a href="#">张明浩</a><a href="#">李丽</a><a href="#">纪高</a><a href="#">王松华</a><a href="#">李月明</a> <a href="#">丹萱</a><a href="#">晴雪</a><a href="#">怜菡</a><a href="#">睿婕</a><a href="#">语琴</a><a href="#">松翠</a> </div>
    <div class="courtroom">第二法庭</div>
   <div class="judgelist"> <a href="${ctx }/siteshow/faguanmessage.html" target="_">安士勇</a><a href="#">张明浩</a><a href="#">李丽</a><a href="#">纪高</a><a href="#">王松华</a><a href="#">李月明</a> <a href="#">丹萱</a><a href="#">晴雪</a><a href="#">怜菡</a><a href="#">睿婕</a><a href="#">语琴</a><a href="#">松翠</a> </div>
  </div>
</div>
<%@include file="/common/commonfooter.jsp" %>
</body>
</html>
