<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
  		
		<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.cookie.js"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			var ctx = "${ctx}";
			 function changeImg(){       
		        $("#authCode").attr("src","${ctx}/login/login_getAuthCode.do?d="+new Date().valueOf());       
		    }  
		    $(function() {
		    	//cookie自动登录
		    	var loca = window.location.href+"";
		    	var cookie_rememberme = $.cookie("cookie.rememberme");
		    	if(loca.indexOf("login.jsp")>0 && loca.indexOf("logout")<=0 && cookie_rememberme!=null){
		    		$.post("${ctx}/login/login_login.do", 
			    		  {"cookieRememberme": cookie_rememberme},
					      function(data){
			    			  loginSuccess(data);
					      }
			        );
		    	}
		    	//$("#loginName,#passwordTemp,#password").focus(function(){$(".errtips").hide();$(this).addClass("focus")}).blur(function(){$(this).removeClass("focus")});
		    
		    	//$("#loginName,#passwordTemp,#password").textRemindAuto();
		    	
		    	var logout = "<%=request.getParameter("logout")%>";
		    	if(logout!=""){
		    		if(logout=="timeout"){
		    			$(".errtips").html("您已经登录超时，请重新登录").show();
		    		}else if(logout=="repeatlogin"){
		    			$(".errtips").html("您的账号已经在别处登录， 不可重复登录").show();
		    		}
		    	}
		    });
		    
		     function submitLogin(){
		    	var valid = true;
		    	if ($("#loginName").val() == "") {
					$("#lblLoginName").html("&nbsp;&nbsp;请输入用户名").show();
		    		valid=false;
				}
		    	if ($("#password").val() == "") {
					$("#lblPassword").html("&nbsp;&nbsp;请输入密码").show();
			    	valid=false;
				}
		    	if ($("#yzm").val() == "") {
					$("#lblYzm").html("&nbsp;&nbsp;请输入验证码").show();
			    	valid=false;
				}
		    	if(!valid){
		    		return false;
		    	}
		    	 
	    		$("#submitBtn").val("登录中...").attr("disabled","disabled");
		    	$.post("${ctx}/login/login_login.do", 
		    		  {"loginName": $("#loginName").val(),"yzm": $("#yzm").val(),"password":$("#password").val(),"forceLogin":$("#forceLogin").val()},
				      function(data){
		    			loginSuccess(data);
				      }
				 );
	         }
		     
		     //登录成功
		     function loginSuccess(data){
		    	  // $.cookie('core_login_info', $("#loginName").val()+"_"+$("#password").val(), {expires: 7, path: '/core', domain: '127.0.0.1'});
			     var msg = data.msg;
				 if(msg=="success"){
					    var from = "<%=request.getParameter("from")%>";
			    		if(from==null || from=="null" || from==""){
			    			from="${ctx}/index.htm";
			    		}
						window.location.href = from;
				 }else{
					 $("#submitBtn").val("登   录").removeClass("grey").addClass("green").removeAttr("disabled");
					 if(msg!="repeatLogin"){
					      $(".errtips").html(msg).show();
					 }else{
					     $(".errtips").html("您的账号已经在别处登录， 不可重复登录&nbsp;[<a href=\"#\" onclick=\"fLogin()\">强行登录</a>]").show();
					}
				}
		     }
		     function fLogin(){
		    	 if(confirm("\"强行登录\"将迫使该账号在别处自动注销，您确定要强行登录吗？")){
		    		 $("#forceLogin").val("Y");
		    	     submitLogin();
		    	 }
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
		        	<form id="loginForm" method="post" action="${ctx}/login/login_login.do">
		        		<input type="hidden" name="forceLogin" id="forceLogin" value="N"/>
		                <h1>用户登录</h1>
		                <dl class="regdl" style="margin-top:30px;">
		                    <dt style="width:250px;"> 用户名：</dt>
		                    <dd style="width:410px;">
		                    	<input type="text" class="reginput" id="loginName" name="loginName" value="" placeholder="请输入用户名" title="请输入用户名" maxlength="16" />
		                    	<label id="lblLoginName" style="color:red; display:none;" for="loginName">&nbsp;&nbsp;请输入用户名</label>
		                    </dd>
		                </dl>
		                <dl class="regdl">
		                    <dt style="width:250px;"> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</dt>
		                    <dd style="width:410px;">
		                    	<input type="password" class="reginput" id="password" name="password" value="" placeholder="请输入密码" 
		                    		onkeydown="if(event.keyCode==13||event.which==13)submitLogin();"/>
		                    	<label id="lblPassword" style="color:red; display:none;" for="password">&nbsp;&nbsp;请输入密码</label>
		                    </dd>
		                </dl>
		                <dl class="regdl" style="margin-top:30px;">
		                    <dt style="width:250px;"> 验证码：</dt>
		                    <dd style="width:510px;">
		                    	<input type="text" name="yzm" id="yzm" class="reginput" placeholder="请输入验证码" title="请输入验证码" 
		                    		 maxlength="10"  />
	      				<img src="${ctx}/login/login_getAuthCode.do" alt="验证码" id="authCode" onclick="changeImg()">   
        				<a href="#" onclick="changeImg()">看不清，换一张！</a><br/>
        				   </dd>
		                </dl>
		                <label id="lblYzm" style="color:red; display:none;" for="yzm">&nbsp;&nbsp;请输入用户名</label>
		                 
		                <div style="height:40px; margin-top:20px; width:760px; text-align:center;">
		                	<input type="button" class="ibtn" value="登&nbsp;&nbsp;&nbsp;录" id="submitBtn" 
		                		onclick="submitLogin()" style="margin-left:0px;float:none;"/>
		                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                	<input type="button" class="ibtn" value="注&nbsp;&nbsp;&nbsp;册" id="registerBtn" 
		                		onclick="location='${ctx}/myCenter/register.htm'" style="margin-left:0px;float:none;"/>
		                </div>
		                <div style="text-align:center;margin-bottom:50px;color:red;">
		                	<span class="errtips" id="tips" >${loginMessage}</span>
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
