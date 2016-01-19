<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head>
   <link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/tab.css"/>
	<script type="text/javascript">
		var list=true;
		var deleteAndRemoveTreeNode=true;
		var deleteurl = "${ctx4ej }/system/role_delete.do";
		$(function() {
			
		});
	</script>
</my:head>
<body>
<div class="bodybox">
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tabs1" >
				<tr>
					<td>
						 <div align="center" id="uldiv">
							<ul>
								<li><a href="${ctx4ej }/system/role_update.do?id=${id }"><span><my:i18n zhText="角色信息" enText="Role Info"/></span></a></li>
								<li id="current"><a href="${ctx4ej }/system/role_list.do?id=${id }"><span><my:i18n zhText="下级角色列表" enText="Sub Role List"/></span></a></li>
								<li><a href="${ctx4ej }/system/role_add.do?id=${id }"><span><my:i18n zhText="新增下级角色" enText="Add A New Role"/></span></a></li>
							</ul>
						    </div>
						</td>
					</tr>
				</table>
		</div>
		<c:if test="${!empty actionMessages}">
		       <div id="result" align="center" style="color: red;height: 16px;padding-top: 9px"></div>
		    </c:if>
		    <form action="${ctx4ej }/system/role_list.do" method="post" id="roleForm">
		          <input type="hidden" name="id" value="${id }"/>
		          <table class="ltable" width="100%">
			        <thead class="ltablehead">
			                <tr>
			                	<th width="5%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="5%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th><my:i18n zhText="角色名称" enText="Role Name"/></th>
			                	<%--<th><my:i18n zhText="备注" enText="Remark"/></th> --%>
			                	<th><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			             <tbody class="ltablebody">
			            <c:if test="${empty page.list}">
				            <tr>
								<td align="center" colspan="6"><font color="red"><my:i18n zhText="当前角色没有下级角色" enText="There are no Sub Roles"/></font> </td>
						    </tr>
			           </c:if>
			           <c:forEach items="${page.list}" var="role" varStatus="status">
			               <tr id="${role.id }">
								<td align="center"><input type="checkbox" name="ids" value="${role.id}"/></td>
								<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
								<td>
								 <a href="${ctx4ej}/system/role_update.do?id=${role.id}"><my:i18n zhText="${role.roleName}" enText="${role.enRoleName}"/></a>
								<!--
								   <a href="${ctx }/system/role_update.do?id=${id}" title="${roleName}" name="roleDetail"><u>${roleName}</u></a>
								--></td>
								<%--<td align="center">${role.remark}</td> --%>
								<td align="center">
									<my:auth fixedValue="W" value="${auth}"><a href="javascript:" class="deleteOne"  param="ids=${role.id}"><my:i18n zhText="删除" enText="Delete"/></a></my:auth>
								</td>
							</tr>
			           </c:forEach>
		             </tbody>
		         </table>
	        <div class="ltablebottom">
	 	      <div style="float: left;"><my:auth fixedValue="W" value="${auth}"><input type="button" class="button orange"  value="<my:i18n zhText="批量删除" enText="Batch Delete"/>" id="batchDelete"/></my:auth></div>
			  <div class="lpage"><my:page page="${page}"/></div>  
		    </div>
	       </form>
	    </div>
	 </body>
</html>