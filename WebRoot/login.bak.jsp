<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>评讼服务网络系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  type="text/css" rel="stylesheet" href="${ctx}/js_css_image/css/login.css"/>
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx}/js_css_image/js/base/jquery.core.utils-1.0.js"></script>
<script type="text/javascript">
        var ctx = "${ctx}";
	    $(function() {
	    	if($("#password").val()!=""){
	    		$("#password").show();
	    		$("#passwordTemp").hide();
	    	}
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
	    	$("#loginName,#passwordTemp,#password").focus(function(){$(".errtips").hide();$(this).addClass("focus")}).blur(function(){$(this).removeClass("focus")});
	    
	    	$("#loginName,#passwordTemp,#password").textRemindAuto();
	    	
	    	$("#passwordTemp").focus(function(){
	    		$(this).hide();
	    		$("#password").show().focus();
	    	});
	    	$("#password").blur(function(){
	    		if($(this).val()==""){
	    			$(this).hide();
	    		    $("#passwordTemp").show();
	    		}
	    	});
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
	          if($("#loginName").val()!="" && $("#loginName").val()!="请输入账号" && $("#password").val()!="" && $("#password").val()!="请输入密码"){
	    		$("#submitBtn").val("登录中...").removeClass("green").addClass("grey").attr("disabled","disabled");
		    	$.post("${ctx}/login/login_login.do", 
		    		  {"loginName": $("#loginName").val(),"password":$("#password").val(),"forceLogin":$("#forceLogin").val()},
				      function(data){
		    			loginSuccess(data);
				      }
				 );
	        }
         }
	     
	     //登录成功
	     function loginSuccess(data){
	    	  // $.cookie('core_login_info', $("#loginName").val()+"_"+$("#password").val(), {expires: 7, path: '/core', domain: '127.0.0.1'});
		     var msg = data.msg;
			 if(msg=="success"){
				    var from = "<%=request.getParameter("from")%>";
		    		if(from==null || from=="null" || from==""){
		    			from="${ctx}/system/layout_layout.do";
		    		}
					window.location.href = from;
			 }else{
				 $("#submitBtn").val("登录").removeClass("grey").addClass("green").removeAttr("disabled");
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
<body style="background:#fff;">
<div class="login">
  <div class="loginBg">
    <h1 class="loginH1">you&amp;me，轻松快乐的工作</h1>
    <div class="loginForm">
    <form id="loginForm" method="post" action="${ctx}/login/login_login.do">
          <input type="hidden" name="forceLogin" id="forceLogin" value="N"/>
	      <input type="text" class="txt focus" id="loginName" name="loginName" value="system" title="请输入账号"/>
	      
	      <input type="text" class="txt" id="passwordTemp" value="" title="请输入密码"/>
	      <input type="password" style="display: none" class="txt" id="password" name="password" value="111111" onkeydown="if(event.keyCode==13||event.which==13)submitLogin();"/>
	      
	      <input type="button" class="button green"  value="登录" id="submitBtn" onclick="submitLogin()"  style="width: 120px;height: 38px;font-size: 18px"/>
	     
	      <span class="errtips" id="tips" >${loginMessage}</span>
      </form>
    </div>
  </div>
</div>
</body>
</html> 