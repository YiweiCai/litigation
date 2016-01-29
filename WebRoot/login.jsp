<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  		<%@include file="/common/title.jsp"%>
  		
		<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.cookie.js"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>
		<script type="text/javascript">
			//var ctx = "${ctx}";
			var ctx = "${ctx4ej}";
			
			 function changeImg(){       
		        $("#authCode").attr("src","${ctx4ej}/login/login_getAuthCode.do?d="+new Date().valueOf());       
		    }  
		    $(function() {
		    	var ctx = "${ctx4ej}";
		    	//cookie自动登录
		    	var loca = window.location.href+"";
		    	var cookie_rememberme = $.cookie("cookie.rememberme");
		    	if(loca.indexOf("login.jsp")>0 && loca.indexOf("logout")<=0 && cookie_rememberme!=null){
		    		$.post("${ctx4ej}/login/login_login.do", 
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
		    			//alert("您已经登录超时，请重新登录");
		    		}else if(logout=="repeatlogin"){
		    			alert("您的账号已经在别处登录， 不可重复登录");
		    		}
		    	}
		    });
		    
		     function submitLogin(){
		    	var valid = true;
		    	if ($("#loginName").val() == "") {
					alert("请输入用户名!");
		    		valid=false;
				}
		    	if ($("#password").val() == "") {
					alert("请输入密码!");
			    	valid=false;
				}
		    	if ($("#yzm").val() == "") {
					$("#lblYzm").html("请输入验证码").show();
			    	valid=false;
				}
		    	if(!valid){
		    		return false;
		    	}
		    	 
	    		$("#submitBtn").attr("disabled","disabled");
		    	$.post("${ctx4ej}/login/login_login.do",
		    		  {"loginName": $("#loginName").val(),"password":$("#password").val(),"forceLogin":$("#forceLogin").val()},
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
			    			from="${ctx4ej}/index.htm";
			    		}
						window.location.href = from;
				 }else{
					 $("#submitBtn").removeAttr("disabled");
					 if(msg!="repeatLogin"){
					      alert(msg);
					 }else{
					     alert("您的账号已经在别处登录， 不可重复登录&nbsp;[<a href=\"#\" onclick=\"fLogin()\">强行登录</a>]");
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
<link href="${ctx }/js_css_image/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="navbg">
  <div class="layout"><img src="${ctx }/js_css_image/images/logintitle.jpg" />
    <div class="nav">
    <a href="${ctx4ej}/index.htm">网站首页</a>|
    <a href="${ctx4ej }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>|
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>|
    <a href="${ctx4ej}/myCenter/readAgreement.htm">诉讼服务</a>|
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>|
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>|
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>|
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>
  </div>
</div>
<div class="loginbg">
  <div class="layout">
    <div class="logineare">
      <div class="loginname">用户登录</div>
      <label class="label" for="textfield">用户名</label>
     <input type="text" class="inputstyle" id="loginName" name="loginName" value="" placeholder="请输入用户名" title="请输入用户名" maxlength="16" />
		                    	
      <label for="textfield" class="label">密&nbsp;&nbsp;&nbsp;码</label>
      <input type="password" class="inputstyle" id="password" name="password" value="" placeholder="请输入密码" 
		                    		onkeydown="if(event.keyCode==13||event.which==13)submitLogin();"/>
		                    	
      <br />
      <input  class="loginbut" id="submitBtn" onclick="submitLogin()"/>
      <br />
      <div class="reg">没有账号，<a href="/zzfy/myCenter/readAgreement.htm">立即注册</a></div>
    </div>
  </div>
</div>
<%@include file="/common/commonfooter.jsp" %>
</body>
</html>
