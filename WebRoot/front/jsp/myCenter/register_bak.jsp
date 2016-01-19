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
			
			// 检查用户名是否存在
			function checkLoginName(val){
				var isExist = true;
				$.ajax({
					type:"post",
					url:"${ctx }/system/user_checkLoginName.do",
					data:"loginName="+val,
					async:false,
					dataType:"json",
					success:function(data){
						isExist = data.msg;
					}
				})
				return isExist;
			}
			
			// 检查邮箱是否存在
			function checkEmail(val){
				var isExist = true;
				$.ajax({
					type:"post",
					url:"${ctx }/system/user_checkEmail.do",
					data:"email="+val,
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
		    	<div class="iregister">
		        	<form action="${ctx }/myCenter/saveUser.htm" id="userForm" method="post">
		        		<input type="hidden" name="deptId" value="${deptId }" />
		        		<input type="hidden" name="roleIds" value="${roleIds }" />
		                <h1>新用户注册</h1>
		                <div class="regtip" style="visibility:hidden;">请按照格式正确输入您的信息！带 * 为必填项</div>
		                <dl class="regdl">
		                    <dt><i>*</i> 用&nbsp;&nbsp;户&nbsp;&nbsp;名：</dt>
		                    <dd>
		                    	<input type="text" name="loginName" id="loginName" class="reginput" placeholder="请输入6-16位的用户名"  maxlength="16"
		                    		title="请输入6-16位的用户名" rules="[{notNull:true, message:'请输入用户名'},{minLength:6, message:'用户名至少为6位'},{fn:checkLoginName,message:'该用户名已存在'}]" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt><i>*</i> 设置密码：</dt>
		                    <dd>
		                    	<input type="password" name="password" id="password1" class="reginput" placeholder="请输入6-16位的密码" title="请输入6-16位的密码"
		                    		 maxlength="16" rules="[{notNull:true, message:'请输入密码'},{minLength:6, message:'密码至少为6位'}]" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt><i>*</i> 确认密码：</dt>
		                    <dd>
		                    	<input type="password" name="conPassword" id="conPassword" class="reginput" placeholder="请再次输入密码" title="请再次输入密码" 
		                    		 maxlength="16" rules="[{notNull:true, message:'请再次输入密码'},{equalWith:'password1',message:'两次输入的密码不一致'}]" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt><i>*</i> 姓名：</dt>
		                    <dd>
		                    	<input type="text" name="userName" id="userName" class="reginput" placeholder="请输入姓名" title="请输入姓名" 
		                    		 maxlength="10" rules="[{notNull:true, message:'请输入姓名'}]" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt><i>*</i> 性别：</dt>
		                    <dd>
		                    	<my:radio pvalue="sex" name="sex" value="M"/>
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt><i>*</i> 电子邮箱：</dt>
		                    <dd>
		                    	<input type="text" name="mailbox" id="mailbox" class="reginput" placeholder="请输入电子邮箱" title="请输入电子邮箱" 
		                    		 maxlength="50" rules="[{notNull:true, message:'请输入电子邮箱'},{isEmail:true, message:'电子邮箱格式不正确'},{fn:checkEmail,message:'该电子邮箱已存在'}]" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt>联系电话：</dt>
		                    <dd>
		                    	<input type="text" name="mphone" id="mphone" class="reginput" placeholder="请输入联系电话" title="请输入联系电话" maxlength="20" />
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</dt>
		                    <dd>
		                    	<input type="text" name="workPlace" id="workPlace" class="reginput" placeholder="请输入地址" title="请输入地址" maxlength="50" />
		                    </dd>
		                </dl>
		                <div class="btn">
		                	<button type="button" class="ibtn" id="submitBtn">注&nbsp;&nbsp;&nbsp;册</button>
		                    <button type="reset" class="ibtn">重&nbsp;&nbsp;&nbsp;置</button>
		                </div>
		            </form>
		        </div>
		    </div>
		    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
		</div><!--内容页结束-->
		<!--底部开始-->
		<%@ include file="/front/jsp/include/foot.jsp" %>
		<!--底部结束-->
	</body>
</html>
