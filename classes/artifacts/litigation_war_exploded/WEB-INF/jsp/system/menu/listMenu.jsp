<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head>
   <link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/tab.css"/>
	<script type="text/javascript">
		var list=true;
		var deleteAndRemoveTreeNode=true;
		var deleteurl = "${ctx44ej }/system/menu_delete.do";
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
						    <input type="hidden" name="parentId" id="parentId" value="${id }">
							<ul >
								<li><a href="${ctx4ej }/system/menu_update.do?id=${id }"><span><my:i18n zhText="菜单信息" enText="Menu Info"/></span></a></li>
								<li id="current"><a href="${ctx4ej }/system/menu_list.do?id=${id }"><span><my:i18n zhText="下级菜单列表" enText="Sub Menu List"/></span></a></li>
								<li><a href="${ctx4ej }/system/menu_add.do?id=${id }"><span><my:i18n zhText="新增下级菜单" enText="Add A New Menu"/></span></a></li>
							</ul>
						    </div>
						</td>
					</tr>
				</table>
		</div>
		    <form action="${ctx4ej }/system/menu_list.do" method="post" id="menuForm">
		      <input type="hidden" name="id" value="${id }"/>
			  <table class="ltable" width="100%">
			        <thead class="ltablehead">
			                <tr>
			                	<th width="5%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="5%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th width="30%"><my:i18n zhText="菜单名称" enText="Menu Name"/></th>
			                	<th ><my:i18n zhText="路径" enText="Path"/></th>
			                    <%--	<th><my:i18n zhText="备注" enText="Remark"/></th> --%>
			                	<th width="15%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			              <tbody class="ltablebody">
			            <c:if test="${empty page.list}">
				            <tr>
								<td align="center" colspan="6"><font color="red"><my:i18n zhText="当前菜单没有下级菜单" enText="There are no Sub Menus"/></font> </td>
						    </tr>
			           </c:if>
			           <c:forEach items="${page.list}" var="menu" varStatus="status">
			               <tr id="${menu.id }">
								<td align="center"><input type="checkbox" name="ids"  value="${menu.id}"/></td>
								<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
								<td>
								   <a href="${ctx4ej }/system/menu_update.do?id=${menu.id}" name="menuDetail"><my:i18n zhText="${menu.menuName}" enText="${menu.enMenuName}"/></a>
								</td>
								<td>${menu.menuPath}</td>
								<%--<td align="center">${menu.remark}</td> --%>
								<td align="center">
									<my:auth fixedValue="W" value="${auth}"><a href="javascript:" class="deleteOne" param="ids=${menu.id}"><my:i18n zhText="删除" enText="Delete"/></a></my:auth>
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