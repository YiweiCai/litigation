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
      <div class="blue">法官专栏</div>
      <li  class="selected"><a href="#">联系法官</a></li>
     <div class="leftnavline"></div>
     <li><a href="#">法官答疑</a></li>
     <div class="leftnavline"></div>
     <li><a href="#">法官风采</a></li>
     <div class="leftnavline"></div>
       <li><a href="#">在线律师</a></li>
       <div class="leftnavline"></div>
       <li><a href="#">已解决法律咨询</a></li>  
    </ul>
  </div>
  <div class="layercontent">
  <h1>法官咨询</h1>
  <ul>
  <li><label class="labelstyle">问题标题：</label>
    <input type="text" name="textfield" id="textfield"  class="inputstyle"/>
  </li>
    <li><label class="labelstyle postion">问题内容：</label>
      
      <textarea name="textarea" id="textarea" cols="45" rows="5" class="selectsyle"></textarea>
    
  </li>
  <li><label class="labelstyle">问题地域：</label>
    <select name="select" id="select">
      <option>北京</option>
    </select>
    <select name="select" id="select">
      <option>东城区</option>
    </select>
  </li>
  <li><label class="labelstyle">问题分类：</label>
  
 <div class="typebuteare"> <a href="#" class="typebut">婚姻家庭</a><a href="" class="seltypebut">债权债务</a><a href="#" class="typebut">合同纠纷</a><a href="#" class="typebut">劳动纠纷</a>
  <a href="#" class="typebut">婚姻家庭</a><a href="" class="seltypebut">债权债务</a><a href="#" class="typebut">合同纠纷</a><a href="#" class="typebut">劳动纠纷</a></div>
  
  </li>
  <li><label class="labelstyle">联系方式：</label><input type="text" name="textfield" id="textfield" class="inputstyle"/></li>
  <div class="tips">建议填写真实手机号，有机会得到法官对该问题的电话回访。</div>
   <p class="layerbut"></p>
  
  </ul>
  
</div>
</div>
<%@include file="/common/static.jsp" %>
</body>
</html>
