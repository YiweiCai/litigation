<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true">
	<script type="text/javascript">
		var list=true;
		var addnewurl = "${ctx}/core/resource_add.do";
		var deleteurl = "${ctx}/core/resource_delete.do";
		$(function() {
				$("#addnewButton").click(function(){window.location.href=addnewurl;});
				$("#searchButton").click(function(){$("#listForm").submit();
				});
		});
		
		function check(id, state){
			$.post("${ctx}/core/resource_check.do",{id:id,state:state},function(data){
				if(data.code="0"){
					alert("操作成功！");
					location.reload();
				}else{
					alert("操作失败！");
				}
			},"json");
		}
	</script>
</my:head>
<body>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： 资源管理 </div>
	<div class="pheadbutton">
	 <input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />
     <input type="button" class="button orange"  value="添加" id="addnewButton"/>
	</div>
	<div class="clear"></div>
</div>
<form id="listForm" method="get" action="${ctx }/core/resource_list.do">
    <div class="psearchhead">
		资源名称：<input type="text" name="name" id="name" value="${name }"/>&nbsp;&nbsp;
		资源类型：<my:select pvalue="resourceType" name="type" value="${type }" />&nbsp;&nbsp;
		资源分类：<my:select pvalue="resourceCategory" name="category" value="${category }" />
	</div>
	<table class="ltable" width="100%">
		<thead class="ltablehead">
		<tr>
			<th width="25px">
			<input type="checkbox" id="checkId"/></th>
			<th width="5%"><my:i18n zhText="序号" enText="No."/></th>
			<th>资源名称</th>
			<th width="7%">资源类型</th>
			<th width="10%">资源分类</th>
			<th width="10%">发布人</th>
			<th width="15%">发布时间</th>
			<th width="7%">状态</th>
			<th width="13%"><my:i18n zhText="操作" enText="Action"/></th>
		</tr>
		</thead>
		<tbody class="ltablebody">
			<c:if test="${empty page.list}">
				<tr>
					<td colspan="9" align="center"><font color="red">不存在符合条件的资源</font></td>
				</tr>
			</c:if>
			<c:forEach items="${page.list}" var="resource" varStatus="status">
				<tr id="${resource.id }">
					<td align="center"><input type="checkbox" name="ids" value="${resource.id }"/></td>
					<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
					<td><a href="${ctx }/core/resource_detail.htm?id=${resource.id }" target="_blank">${resource.name }</a></td>
					<td><my:view value="${resource.type }" pvalue="resourceType"/></td>
					<td><my:view value="${resource.category }" pvalue="resourceCategory"/> </td>
					<td>${resource.createUser.userName }</td>
					<td>${resource.publishTime }</td>
					<td>
						<c:if test="${resource.state == 0 }">待审核</c:if>
						<c:if test="${resource.state == 1 }">审核通过</c:if>
						<c:if test="${resource.state == 2 }">审核未通过</c:if>
					</td>
					<td align="center">
						<a href="${ctx}/core/resource_update.do?id=${resource.id }" >修改</a>
						<c:if test="${auth == 'W' && resource.state == 0 }">
							<a href="javascript:void(0);" onclick="check('${resource.id}', '1')" >通过</a>
							<a href="javascript:void(0);" onclick="check('${resource.id}', '2')" >不通过</a>
						</c:if>
						<a href="javascript:" class="deleteOne" param="ids=${resource.id}"><my:i18n zhText="删除" enText="Delete"/></a>
					</td>
				</tr>
			  </c:forEach>
		</tbody>
	</table>
	 <div class="ltablebottom">
	    <div style="float: left;"><input type="button" class="button orange"  value="<my:i18n zhText="批量删除" enText="Batch Delete"/>" id="batchDelete"/></div>
		<div class="lpage"><my:page page="${page}"/></div>  
	 </div>
</form>
</div>
</body>
