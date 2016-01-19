<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/front/css/base.css"/>
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 二级导航栏
		$('li.wzli').mousemove(function() {
			$(this).find('ul').slideDown();//you can give it a speed
		});
		$('li.wzli').mouseleave(function() {
			$(this).find('ul').slideUp();
		});
		
		// 登录框
		$(".nav li").hover(function() {
			$(this).addClass("hover");
			$(this).find("div.nav_slide").stop(true, true).show();
		}, function() {
			$(this).removeClass("hover");
			$(this).find("div.nav_slide").stop(true, true).hide();
		});
		
		// 登录
		$("#btnLogin").click(function(){
			login();
		});
		
		<c:if test="${empty userSession.id}">
			$("#ulLogin").show();
			$("#ulLogged").hide();
		</c:if>
		<c:if test="${!empty userSession.id}">
			$("#ulLogin").hide();
			$("#ulLogged").show();
		</c:if>
	});
	
	// 登录
	function login(){
		if($.trim($("#loginNameIndex").val()) == ""){
			$("#errorMsg").text("请输入用户名").css("visibility","visible");
			$("#loginNameIndex").focus();
			return false;
		} else if($("#passwordIndex").val() == ""){
			$("#errorMsg").text("请输入密码").css("visibility","visible");
			$("#passwordIndex").focus();
			return false;
		}
		
		$.post("${ctx}/login/login_login.do", 
				{"loginName":$("#loginNameIndex").val(),"password":$("#passwordIndex").val()},function(data){
					if(data.msg == "success"){
						$("#errorMsg").text("登录成功").css("visibility","hidden");
						location = location;
					}else{
						$("#errorMsg").text(data.msg).css("visibility","visible");
					}
				},"json");
	}
	
	// 注销
	function logout(){
		$.post("${ctx}/login/login_logoutAjax.do", function(data){
					location.reload();
				},"json");
	}
	
</script>