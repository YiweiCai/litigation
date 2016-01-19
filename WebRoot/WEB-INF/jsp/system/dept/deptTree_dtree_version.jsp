<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
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
   <div region="west" split="true" title="部门导航" border="false" style="width:196px;padding:10px;padding-top:1px;">
		<script type="text/javascript">
	       d = new dTree('d');
			<c:forEach items="${deptList}" var="dept">
			    var parentId = "-1";
			    var menuId = "${dept.id}";
			    var menuName = "${dept.deptName}";
			    var menuPath = "/system/dept_update.do?id=1";
			    <c:if test="${!empty dept.sysDept}">
			    	parentId = "${dept.sysDept.id}";
				</c:if>
			    if(parentId!="-1"){
			    	menuPath="/system/dept_update.do?id="+menuId;
				}
			    d.add(menuId,parentId,menuName,"javascript:addTab('"+menuName+"','"+menuPath+"','"+menuId+"')");
			</c:forEach>
		   document.write(d);
		 </script>
	  </div>
    <div region="center" border="false">
		<div id="main-center" fit="true">
			<!-- 
			  <div title="功能介绍" style="padding:20px;">
			       这里是部门管理模块的功能介绍
			 </div>
			 -->
		 </div>			
	 </div>
</body>
</html>