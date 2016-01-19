<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
		<script type="text/javascript">
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}")
				</c:if>
			});  
		</script>
	</head>
	<body>
	<!--头部开始-->
	<%@ include file="/front/jsp/include/head.jsp" %>
	<!--头部结束-->
    <!--内容页开始-->
	<div class="container">
		<div class="conttop"><img src="${ctx}/js_css_image/front/images/conttop.jpg" width="980" height="40" alt="" title="" /></div>    
	    <div class="content">
	    	<div class="resource">
	        	<h1>资源信息</h1>
	            <table border="0" cellpadding="0" cellspacing="1" bgcolor="#e1e1e1">
	            	<thead><tr><td colspan="4" align="center" height="60"><b class="tabtop">基本信息</b></td></tr></thead>
	                <tbody>
	                	<tr>
	                    	<td width="12%" align="center"><b>资源名称</b></td>
	                        <td width="88%" colspan="3">
	                        	${name }（浏览：${visitCount }次&nbsp;&nbsp;下载：${downloadCount }次）
	                        </td>
	                        
	                    </tr>
	                	<tr>
	                    	<td width="12%" align="center"><b>资源类型</b></td>
	                        <td width="38%"><my:view value="${type }" pvalue="resourceType"/></td>
	                        <td width="12%" align="center"><b>资源分类</b></td>
	                        <td width="38%"><my:view value="${category }" pvalue="resourceCategory"/></td>
	                    </tr>
	                    <tr>
	                    	<td width="12%" align="center"><b>发布者</b></td>
	                        <td width="38%">${createUser.userName }</td>
	                        <td width="12%" align="center"><b>发布时间</b></td>
	                        <td width="38%">${publishTime }</td>
	                    </tr>
	                    <tr>
	                    	<td width="12%" align="center"><b>目标环境</b></td>
	                        <td width="88%" colspan="3">${environment }</td>
	                        
	                    </tr>
	                    <tr>
	                    	<td width="12%" align="center"><b>资源描述</b></td>
	                        <td width="88%" colspan="3">${description }</td>
	                        
	                    </tr>
	                </tbody>            	
	            </table>
	            <table border="0" cellpadding="0" cellspacing="1" bgcolor="#e1e1e1" style=" margin-top:20px;">
	            	<thead><tr><td colspan="4" align="center" height="60"><b class="tabtop">下载信息</b></td></tr></thead>
	                <tbody>
	                	<tr>
	                    	<td width="12%" align="center"><b>下载地址</b></td>
	                        <td width="88%" colspan="3">
	                        	<c:forEach items="${uploadFileList}" var="upfile">
							        <span id="${upfile.id}span">
							            <a href="${ctx}/core/resource_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载" target="_blank">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
							            <br/>
							         </span>
							     </c:forEach>
	                        </td>                        
	                    </tr>                	
	                </tbody>            	
	            </table>
	        </div>
	    </div>
	    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
	</div><!--内容页结束-->
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
