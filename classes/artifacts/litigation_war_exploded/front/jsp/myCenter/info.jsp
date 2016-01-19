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
			$(function(){
			});	
		</script>
	</head>
	<body>
	<!--头部开始-->
	<%@ include file="/front/jsp/include/head.jsp" %>
	<!--头部结束-->
    <!--内容页开始-->
	<div class="container">
	<div class="conttop"><img src="${ctx}/js_css_image/front/images/conttop.jpg" width="980" height="40" alt="" title="" /></div>    
    <div class="content">
    	<!--左侧内容开始-->
    	<div class="leftcont" style=" min-height:390px;">
    		<%-- 导航 --%>
            <%@ include file="/front/jsp/myCenter/include/nav.jsp" %>
        </div><!--左侧内容结束-->
        <div class="rightcontent">
        	<h3>个人信息</h3>           
            <div class="maincont">
            	<dl class="geren">
                	<dt>用户名：</dt>
                    <dd>${user.loginName }</dd>
                </dl>
                <dl class="geren">
                	<dt>姓名：</dt>
                    <dd>${user.userName }</dd>
                </dl>
                <dl class="geren">
                	<dt>性别：</dt>
                    <dd><my:view value="${user.sex }" pvalue="sex" /> </dd>
                </dl>
                <dl class="geren">
                	<dt>电子邮箱：</dt>
                    <dd>${user.mailbox }</dd>
                </dl>
                <dl class="geren">
                	<dt>联系电话：</dt>
                    <dd>${user.mphone }</dd>
                </dl>
                <dl class="geren">
                	<dt>地址：</dt>
                    <dd>${user.workPlace }</dd>
                </dl>               
                
            </div>
        </div><!--右侧内容结束-->      
        
    </div>
    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
	</div><!--内容页结束-->
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
