<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
  		
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			var addordetail = true;
			$(function() {
				$("#submitBtn").submitForm({ formId:"userForm"});
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
		        	<form id="userForm" action="${ctx }/system/user_updatePassword.do" method="post">
			        	<h3>修改密码</h3>           
			            <div class="maincont">
			            	<dl class="geren">
			                	<dt><font color="red">*</font>旧密码：</dt>
			                    <dd>
			                    	<input type="password" name="oldPassword" value="" class="gereninput" id="oldPassword" 
										rules="[{notNull:true, message:'请输入旧密码'}]">
			                    </dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>新密码：</dt>
			                    <dd>
			                    	<input type="password" name="newPassword" value="" class="gereninput" id="newPassword"
										rules="[{notNull:true, message:'请输入新密码'}]">
			                    </dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>确认新密码：</dt>
			                    <dd>
			                    	<input type="password" name="conNewPassword" value="" class="gereninput" id="conNewPassword"
										rules="[{notNull:true, message:'请再次输入新密码'},{equalWith:'newPassword',message:'两次输入的新密码不一致'}]">
			                    </dd>
			                </dl>
			                <button type="button" class="gerenbtn" id="submitBtn" onclick="">提交</button>
			            </div>
		            </form>
				</div><!--右侧内容结束-->      
		    </div>
		    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
		</div><!--内容页结束-->
		<!--底部开始-->
		<%@ include file="/front/jsp/include/foot.jsp" %>
		<!--底部结束-->
	</body>
</html>
