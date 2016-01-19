<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<my:head>
  		<title><my:view value="InternetTitle" pvalue="xitong"/></title>
  		<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
  		<%--<script src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>
	--%><style type="text/css">
	label{ width:auto; text-align:left;}
	
	</style>
		<script type="text/javascript">
			var addordetail = true;
			$(function() {
				$("#submitBtn").submitForm({ 
					formId:"userForm",
					onComplete:function(){//easyui form,server返回json时，contentType需为text/html，否则将提示下载内容
						
						
							window.location.href="${ctx }/system/layout_layout.do";
						
					    
					    
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
		<script type="text/javascript">
		      $(function() {
				 $("#navlist").height($("#regcontent").outerHeight()) ;
		      });
		    </script>
	</my:head>

<body>
<div class="bannerbg">
  <div class="layout">
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace}.png" /></h1>
    <div class="nav">
    <a href="${ctx }/index.htm">网站首页</a>
    <a href="${ctx }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx}/myCenter/readAgreement.htm">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>
    <a href="${ctx}/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>
  </div></div>
</div>
<div class="layregbg">

<div class="layregtitle">
<form action="${ctx }/myCenter/saveUser.htm" id="userForm" method="post">
<input type="hidden" name="deptId" value="${deptId }" />
	<input type="hidden" name="roleIds" value="${roleIds }" />
  <div class="layregname">律师用户注册</div> 
   
   
    <ul>
      <li>
        <label class="length">您的姓名：</label>
        <input type="text" class="inputstyle" name="userName" id="userName" placeholder="请输入姓名" title="请输入姓名" 
		                    		 maxlength="10" rules="[{notNull:true, message:'请输入姓名'}]" />
      </li>
      
      <li>
        <label class="length">律师证号：</label>
        <input type="text" name="loginName" id="loginName" class="inputstyle" placeholder="请输入律师证号"  maxlength="16"
		                    		title="请输入6-16位的用户名" rules="[{notNull:true, message:'请输入律师证号'},{minLength:6, message:'律师证号至少为6位'},{fn:checkLoginName,message:'该律师证号已存在'}]" />
		    
      </li>
      <li>
        <label class="length">您的手机号：</label>
        <input type="text" class="inputstyle" name="mphone" id="mphone" placeholder="请输入联系电话" title="请输入联系电话" maxlength="20" />
      </li>
      <li>
        <label class="length">密码：</label>
        <input type="password" class="inputstyle" name="password" id="password1" placeholder="请输入6-16位的密码" title="请输入6-16位的密码"
		                    		 maxlength="16" rules="[{notNull:true, message:'请输入密码'},{minLength:6, message:'密码至少为6位'}]" />
      </li>
      <li>
        <label class="length">确认密码：</label>
        <input type="password" class="inputstyle" name="conPassword" id="conPassword" placeholder="请再次输入密码" title="请再次输入密码" 
		                    		 maxlength="16" rules="[{notNull:true, message:'请再次输入密码'},{equalWith:'password1',message:'两次输入的密码不一致'}]" />
		                    
      </li>
      <li>
        <label class="length">联系地址：</label>
        <input type="text" class="inputstyle" name="workPlace" id="workPlace" class="reginput" placeholder="请输入地址" title="请输入地址" maxlength="50" />
      </li>
      <li>
        <label class="length">其他联系方式：</label>
        <input id="regcontent" type="text"  class="inputstyle"/>
        <br />
        <br />
        <input  class="layregnextbut" id="submitBtn"/>
                            已有账号？<a href="${ctx }/myCenter/layerlogin.htm">请登录</a>
      </li>
    </ul>
    </form>
 </div>

</div>
<%@include file="/common/static.jsp" %>
</body>
</html>
