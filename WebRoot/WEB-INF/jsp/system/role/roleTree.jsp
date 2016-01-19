<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head easyui="true" tree3="true">
	<script type="text/javascript">
	    <%--var ctx = '${ctx}';--%>
	    <%--var ctx = '${ctx4ej}';--%>
		var setting = {data: {simpleData: {enable: true}}};
		var treeNodeArray = new Array();
		 <c:forEach items="${roleList}" var="role">
			    var pId = "${role.sysRole.id}";
			    var id = "${role.id}";
			    var name = "<my:i18n zhText="${role.roleName}" enText="${role.enRoleName}"/>";
//			    var url = "/system/role_update.do?id="+id;
			    var url = "${ctx4ej}/system/role_update.do?id="+id;
			    var click="javascript:$.loadIframe('contentIframe','"+url+"')";
			    var open = false;
			    if(pId==""){open = true; }
			    var oneTreeNode='{id:"'+id+'",pId:"'+pId+'",name:"'+name+'",click:"'+click+'",open:'+open+'}';
			    treeNodeArray.push(oneTreeNode);
		    </c:forEach>
		    var zNodeStr = '['+treeNodeArray.join(",")+']';
 		    var zNodes = (new Function("return " + zNodeStr))();//;eval('(' + zNodeStr + ')'); 两种方式转化成json，选其一
			$(function(){
				$.fn.zTree.init($("#tree"), setting, zNodes);
				<c:forEach items="${roleList}" var="role" end="0">
 		           <%--$.loadIframe("contentIframe","/system/role_update.do?id=${role.id}")--%>
 		           $.loadIframe("contentIframe","${ctx4ej}/system/role_update.do?id=${role.id}")
 		        </c:forEach>
			});
	 </script>
</my:head>
<body class="easyui-layout">
   <div region="west" split="true" title="<my:i18n zhText="角色导航" enText="Role Navigation"/>" border="false" style="width:200px;padding-top:1px;">
		 <ul id="tree" class="ztree" style="width:185px; overflow:auto;height: 98%"></ul>
	  </div>
    <div region="center" border="false">
         <iframe id="contentIframe" style="width:100%;height:98%;"  frameborder="0"></iframe>
			<!-- 
			<div id="main-center" fit="true"  border="false">
			  <div title="功能介绍" style="padding:20px;">
			      
			 </div>
			 </div>	
			 -->
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
			         <%--<c:set var="rolePath" value="${ctx}/system/role_list.do?id=${role.id }"></c:set>--%>
			         <c:set var="rolePath" value="${ctx4ej}/system/role_list.do?id=${role.id }"></c:set>
			       </c:when>
			      <c:otherwise>
			         <c:set var="parentId" value="${role.sysRole.id }"></c:set>
			         <%--<c:set var="rolePath" value="${ctx}/system/role_update.do?id=${role.id }"></c:set>--%>
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