<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <%@include file="/common/title.jsp"%>
	 
	 <link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/main.css" media="screen" />
	 <link rel="StyleSheet" type="text/css" href="${ctx}/js_css_image/css/dtree.css"/>
	 <script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
	 <script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.easyui.min_1.0.4.js"></script>
	 <script type="text/javascript" src="${ctx}/js_css_image/js/dtree/dtree.js"></script>
	 <script type="text/javascript" src="${ctx}/js_css_image/js/layout.js"></script>
	 <script type="text/javascript">
	    var ctx = '${ctx}';
	 </script>
 </head>
<body class="easyui-layout">
   <div region="west" split="true" title="角色导航" border="false" style="width:196px;padding:10px;padding-top:1px;">
		 <script type="text/javascript">
	       d = new dTree('d');
			<c:forEach items="${roleList}" var="role">
			    var parentId = "-1";
			    var menuId = "${role.id}";
			    var menuName = "${role.roleName }";
			    var menuPath = "${ctx4ej}/system/role_update.do?id=1";
			    <c:if test="${!empty role.sysRole}">
			    	parentId = "${role.sysRole.id}";
				</c:if>
			    if(parentId!="-1"){
			    	menuPath="${ctx4ej}/system/role_update.do?id="+menuId;
				}
			    d.add(menuId,parentId,menuName,"javascript:addTab('"+menuName+"','"+menuPath+"','"+menuId+"')");
			</c:forEach>
		    document.write(d);
		 </script>
	  </div>
    <div region="center" border="false">
		<div id="main-center" fit="true">
		 </div>			
	 </div>
<!-- 以前的 
 <div class="phead">
		<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： 角色管理</div>
		<div class="clear"></div>
	  </div>
	<div class="dtree">
	 <script type="text/javascript">
	       d = new dTree('d');
			<c:forEach items="${roleList}" var="role">
				 <c:choose>
			      <c:when test="${empty role.sysRole}">
			         <c:set var="parentId" value="-1"></c:set>
			         <c:set var="rolePath" value="${ctx4ej}/system/role_list.do?id=${role.id }"></c:set>
			       </c:when>
			      <c:otherwise>
			         <c:set var="parentId" value="${role.sysRole.id }"></c:set>
			         <c:set var="rolePath" value="${ctx4ej}/system/role_update.do?id=${role.id }"></c:set>
			       </c:otherwise>
			  </c:choose>
			   d.add('${role.id }','${parentId}','${role.roleName }','${rolePath}','','rightframe_role');
			</c:forEach>
		   document.write(d);
		 </script>
	</div>
-->
</body>
</html>