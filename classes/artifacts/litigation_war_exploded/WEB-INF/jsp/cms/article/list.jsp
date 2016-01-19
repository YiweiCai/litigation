<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true">
	<script type="text/javascript">
	var list=true;
	var addnewurl = "${ctx}/${requestNameSpace}/cms/article_add.do?channelId=${channel.id}";
	var deleteurl = "${ctx}/${requestNameSpace}/cms/article_delete.do";
	$(function() {
			$("#addnewButton").click(function(){window.location.href=addnewurl;});
			$("#searchButton").click(function(){$("#cmForm").submit();
			});
	});
	function batchRelease(isReleased){//发布或取消发布
		var ids = "";

		$("input[name=ids]:checked").each(function(){
			//if($(this).attr("isReleased")!=isReleased){
			ids+=","+$(this).val();
			//}else{
            //   $(this).attr("checked",false);
            //   $("#checkId").attr("checked",false);
		    //}
		});
		ids = ids.substring(1);
		if(ids==""){
			if(isReleased=="Y"){
			   alert("请选择要发布的文章");
		    }else{
		    	alert("请选择要取消发布的文章");
			}
	     }else{
	    	 $.post("${ctx}/${requestNameSpace}/cms/article_release.do",
	    			 { "ids": ids, "isReleased" : isReleased } ,
	    			 function(data){
			    	     alert(data.msg); 
			    	     $("#cmForm")[0].submit();
			    	 }, "json");
		 }
     }
	</script>
</my:head>
<body>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： 文章列表 - ${channel.channelName} </div>
	<div class="pheadbutton">
	 <input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />
	   <c:if test="${empty channel.cmsChannels}">
	     <input type="button" class="button orange"  value="添加文章" id="addnewButton"/>
	   </c:if>
	</div>
	<div class="clear"></div>
</div>
<form id="cmForm" method="post" action="${ctx }/${requestNameSpace}/cms/article_list.do">
    <input type="hidden" name="channelId" value="${channel.id }"/>
    <div class="psearchhead">
		标题：<input type="text" name="title" id="title" value="${title }"/>&nbsp;&nbsp;
		<%-- 是否草稿：<my:select pvalue="yesornot" name="isDraft" value="${isDraft}" firstoption="--"/>--%>
		是否已发布：<my:select pvalue="yesornot" name="isReleased" value="${isReleased}" firstoption="--"/>
	</div>
<table class="ltable" width="100%">
	<thead class="ltablehead">
	<tr>
		<th width="25px">
		<input type="checkbox" id="checkId"/></th>
		<th width="5%"><my:i18n zhText="序号" enText="No."/></th>
		<th>标题<my:order orderattr="article.title"/></th>
		<th>来源<my:order orderattr="article.origin"/></th>
		<th>作者<my:order orderattr="article.author"/></th>
		<th>发布时间<my:order orderattr="article.releaseDate"/></th>
		<%--<th>是否草稿<my:order orderattr="article.isDraft"/></th> --%>
		<th>是否已发布<my:order orderattr="article.isReleased"/></th>
		<th>浏览次数<my:order orderattr="article.visitQuarter"/></th>
		<th><my:i18n zhText="操作" enText="Action"/></th>
	</tr>
	</thead>
	<tbody class="ltablebody">
		<c:if test="${empty page.list}">
			<tr>
				<td colspan="9" align="center"><font color="red">当前尚未添加文章</font></td>
			</tr>
		</c:if>
		<c:forEach items="${page.list}" var="article" varStatus="status">
			<tr id="${article.id }">
				<td><input type="checkbox" name="ids" value="${article.id }" isDraft="${article.isDraft }" isReleased="${article.isReleased }"/></td>
				<td><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
				<td><a href="${ctx }/${requestNameSpace}/cms/article_detail.do?articleId=${article.id }&channelId=${article.cmsChannel.id }" target="_blank">${article.title }</a></td>
				<td>${article.origin }</td>
				<td>${article.author }</td>
				<td>${article.releaseDate }</td>
				<td align="center"><my:view value="${article.isReleased }" pvalue="yesornot"/> </td>
				<td>${article.visitQuarter }</td>
				<td>
					<a href="${ctx}/${requestNameSpace}/cms/article_update.do?articleId=${article.id }&channelId=${article.cmsChannel.id }" >修改</a>
					<a href="javascript:" class="deleteOne" param="ids=${article.id}"><my:i18n zhText="删除" enText="Delete"/></a>
				</td>
			</tr>
		  </c:forEach>
	</tbody>
</table>
 <div class="ltablebottom">
 	<c:if test="${auth == 'W' }">
		<div style="float: left;"><input type="button" class="button orange"  value="发布" onclick="batchRelease('Y')"/>&nbsp;&nbsp;&nbsp;</div>
		<%--<div style="float: left;"><input type="button" class="button orange"  value="取消发布" onclick="batchRelease('N')"/>&nbsp;&nbsp;&nbsp;</div>--%>
    </c:if>
    <div style="float: left;"><input type="button" class="button orange"  value="<my:i18n zhText="批量删除" enText="Batch Delete"/>" id="batchDelete"/></div>
	<div class="lpage"><my:page page="${page}"/></div>  
 </div>
</form>
</div>
</body>
