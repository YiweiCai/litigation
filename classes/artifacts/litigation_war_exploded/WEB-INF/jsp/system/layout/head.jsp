<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<link href="${ctx }/js_css_image/css/sys.css" rel="stylesheet" type="text/css" />
<div id="head"  class="sysbanner">
<img src="${ctx }/js_css_image/images/sys_logo.png"/>
<div class="sysuser">
	<form action="${ctx4ej }/system/layout_layout.do" method="post" id="changeRoleForm">
	   <input type="hidden" value="${locale }" name="request_locale" id="request_locale"/>
		<a href="${ctx4ej }/index.htm" target="_blank"><my:i18n zhText="首页" enText="Home"/></a>
		   <my:i18n zhText="欢迎您" enText="Welcome You"/> <my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>
		<a href="${ctx4ej }/login/login_logout.do"><my:i18n zhText="注销" enText="Logout"/></a>
		   <%--<select id="changeRoleId" name="changeRoleId">
		       <c:forEach items="${user.sysRoles}" var="role" varStatus="status">
		           <option value="${role.id }" <c:if test="${role.id==changeRoleId}">selected="selected"</c:if>> 
		              <my:i18n zhText="${role.roleName}" enText="${role.enRoleName}"/>
		           </option>
		       </c:forEach>
		   </select>	--%>
	</form>
	</div>
	<div class="sysquit">

		<%-- |
		<a href="#">
		   <my:i18n zhText="当前在线" enText="Online"/>
		   <span id="loginUserCount">0</span> 
		   <my:i18n zhText="人" enText="People"/>
		</a>--%>

		  <%-- <select name="request_locale" id="change_request_locale">
		       <option value="zh_CN" <c:if test="${locale=='zh_CN'}">selected="selected"</c:if>><my:i18n zhText="中文版" enText="Chinese"/></option>
               <option value="en_US" <c:if test="${locale=='en_US'}">selected="selected"</c:if>><my:i18n zhText="英文版" enText="English"/></option>
		   </select>
		 | --%>

		</div>


 </div>

 <div class="customer1" style="display: none"> 
	  <img id="headUpDown" border="0" src="${ctx }/js_css_image/images/up.png" alt="" />
</div>