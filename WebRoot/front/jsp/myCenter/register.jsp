<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<my:head>
  		<%@include file="/common/title.jsp" %>
  		<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
  		<%--<script src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>--%>
	<script src="${ctx }/js_css_image/js/hintTip/hintTip.js" type="text/javascript"></script>
	<link href="${ctx }/js_css_image/css/hintTip/hintTip.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	label{ width:auto; text-align:left;}
	
	</style>
		<script type="text/javascript">
			var addordetail = true;
			$(function() {
				hintTip();
				$("#submitBtn").submitForm({ 
					formId:"userForm",
					onComplete:function(){//easyui form,server返回json时，contentType需为text/html，否则将提示下载内容
							window.location.href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=add";
					}
				});
			});	
			
			// 检查用户名是否存在
			function checkLoginName(val){
				var isExist = true;
				$.ajax({
					type:"post",
					url:"${ctx4ej }/system/user_checkLoginName.do",
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
					url:"${ctx4ej }/system/user_checkEmail.do",
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
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace }.png" /></h1>

    <div class="nav"><a href="${ctx4ej}/index.htm">首页</a>
    <a href="${ctx4ej }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=add" class="choose">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>

  </div>
</div>
<div class="layout">
  <%-- <div class="sidenav"><img src="${ctx }/js_css_image/images/caseitem.png" />
    <div class="navlist" id="navlist">
      <ul>
        <li class="selected"><a href="#"><img src="${ctx }/js_css_image/images/caseicon1.png" />网上立案</a></li>
        <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon2.png" />提交预约申请</a></li>
        <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon3.png" />查询结果</a></li>
        <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon4.png" />案件进展查询</a></li>
 <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon5.png" />网上答疑</a></li>
        <div class="line"></div>
      </ul>
    </div>
  </div> --%>
  <div class="regcontent" id="regcontent">
  <form action="${ctx4ej }/myCenter/saveUser.htm" id="userForm" method="post">
  	<input type="hidden" name="deptId" value="${deptId }" />
	<input type="hidden" name="roleIds" value="${roleIds }" />
    <div class="regtitle" >填写注册信息</div>
    <ul>
	  <li>
        <label class="length">用户名：</label>
        <input type="text" name="loginName" id="loginName" class="inputstyle" placeholder="请输入6-16位的用户名"  maxlength="16"
		                    		title="请输入6-16位的用户名" HintInfo="唯一标示，作为登陆的账号字母和数字；例：zhangsan123" rules="[{notNull:true, message:'请输入用户名'},{minLength:6, message:'用户名至少为6位'},{fn:checkLoginName,message:'该用户名已存在'}]" />
		                    
      </li>
      <li>
        <label class="length">密码：</label>
        <input type="password" class="inputstyle" name="password" id="password1" placeholder="请输入6-16位的密码" title="请输入6-16位的密码"
		                    		 maxlength="16"HintInfo="唯一标示，作为登陆密码；字母区分大小写,请牢记" rules="[{notNull:true, message:'请输入密码'},{minLength:6, message:'密码至少为6位'}]" />
		                    
      </li>
      <li>
        <label class="length">确认密码：</label>
        <input type="password" class="inputstyle" name="conPassword" id="conPassword" placeholder="请再次输入密码" title="请再次输入密码" 
		                    		 maxlength="16" rules="[{notNull:true, message:'请再次输入密码'},{equalWith:'password1',message:'两次输入的密码不一致'}]" />
		                    
      </li>
      <li>
        <label class="length">您的姓名：</label>
        <input type="text" class="inputstyle" name="userName" id="userName" placeholder="请输入姓名" title="请输入姓名" 
		                    		 maxlength="10" HintInfo="您身份证上的真实姓名；例：张三" rules="[{notNull:true, message:'请输入姓名'}]" />
	  </li>
      <li>     
        <label class="length">您的身份证号码：</label>
        <input type="text" class="inputstyle" name="idcard" HintInfo="您的身份证号码" id="idcard" placeholder="请输入身份证号码" title="请输入身份证号码" 
		                    		 maxlength="18" rules="[{notNull:true, message:'请输入身份证号码'},{idCard:true,message:'身份证格式不正确'}]" />
      </li>
      <li>
        <label class="length">您的手机号：</label>
        <input type="text" class="inputstyle" name="mphone" id="mphone" HintInfo="请填写真实有效的手机号码" placeholder="请输入联系电话" title="请输入联系电话" maxlength="20" />
      </li>
      
      <li>
        <label class="length">联系地址：</label>
        <input type="text" class="inputstyle" HintInfo="现居住地址；例：河南省新郑市市新华路**街道(小区)" name="workPlace" id="workPlace" class="reginput" placeholder="请输入地址" title="请输入地址" maxlength="50" />
      </li>
      <li>
        <label class="length">其他联系方式：</label>
        <input id="regcontent" type="text" HintInfo="建议填写家属的有效手机号码"  class="inputstyle"/>
        <br />
        <br />
        
        <input class="nextbut" id="submitBtn"/>
                            已有账号？<a href="${ctx4ej }/myCenter/login.htm?logout=timeout&from=${ctx }%2Flawsuit%2Flaxx_myCase.htm%3Fop%3Dadd">请登录</a>
      </li>
    </ul>
    </form>
  </div>
</div>
<%@include file="/common/static.jsp" %>
</body>
</html>
