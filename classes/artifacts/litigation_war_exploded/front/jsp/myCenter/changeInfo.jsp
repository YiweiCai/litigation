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
				$("#submitBtn").submitForm({ 
					formId:"userForm",
					onComplete:function(){
					    window.location.href="${ctx }/myCenter/info.htm";
					}
				});
			});	
			
			// 检查邮箱是否存在
			function checkEmail(val){
				var isExist = true;
				$.ajax({
					type:"post",
					url:"${ctx }/system/user_checkEmail.do",
					data:"id=${user.id}&email="+val,
					async:false,
					dataType:"json",
					success:function(data){
						isExist = data.msg;
					}
				})
				return isExist;
			}
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
		        	<form id="userForm" action="${ctx }/system/user_updateUserBasicInfo.do" method="post">
		        		<input name="id" type="hidden" value="${user.id }"/>
		        		<input type="hidden" name="deptId" id="deptId" value="${user.sysDept.id}"/>
		        		<input type="hidden" name="roleIds" id="roleIds" value="${roleIds}"/>
			        	<h3>更改信息</h3>           
			            <div class="maincont">
			            	<dl class="geren">
			                	<dt><font color="red">*</font>用户名：</dt>
			                    <dd>
			                    	<input type="text" class="gereninput" value="${user.loginName }" disabled="disabled" />
			                    </dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>姓名：</dt>
			                    <dd><input name="userName" type="text" value="${user.userName }" class="gereninput" maxlength="10"
			                    	 rules="[{notNull:true, message:'请输入姓名'}]" /></dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>性别：</dt>
			                    <dd><my:radio pvalue="sex" name="sex" value="${user.sex }"/></dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>邮箱：</dt>
			                    <dd><input name="mailbox" type="text" class="gereninput" value="${user.mailbox }" maxlength="50"
			                    	 rules="[{notNull:true, message:'请输入电子邮箱'},{isEmail:true, message:'电子邮箱格式不正确'},{fn:checkEmail,message:'该电子邮箱已存在'}]" /></dd>
			                </dl>
			                <dl class="geren">
			                	<dt>联系电话：</dt>
			                    <dd><input name="mphone" type="text" value="${user.mphone}" class="gereninput" maxlength="20" /></dd>
			                </dl>
			                <dl class="geren">
			                	<dt>地址：</dt>
			                    <dd><input name="workPlace" type="text" value="${user.workPlace}" class="gereninput" maxlength="50" /></dd>
			                </dl>                
			                <button id="submitBtn" type="submit" class="gerenbtn" onclick="return false;">提交</button>
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
