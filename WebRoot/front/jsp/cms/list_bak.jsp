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
			var listurl = "${ctx }/cms/article_flist.htm";
			
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}")
				</c:if>
			});  
			
			// 获取页面跳转参数
			function getParams(){
				return "channelId=${channel.id}";
			}
		</script>
	</head>
	<body>
	<form id="formSearch" method="post" action="${ctx }/cms/article_search.htm">
   		<!--头部开始-->
		<%@ include file="/front/jsp/include/head.jsp" %>
		<!--头部结束-->
	    <!--内容页开始-->
		<div class="container">
			<div class="conttop"><img src="${ctx}/js_css_image/front/images/conttop.jpg" width="980" height="40" alt="" title="" /></div>    
		    <div class="content">
	    		<!--左侧内容开始-->
		    	<div class="leftcont">
		        	<!--栏目导航开始-->
		        	<div class="leftcolumn">
		        		<%-- 一级栏目 --%>
		        		<c:if test="${channel.cmsChannel.id == '1' }">
			            	<div class="ltitle">
			            		${channel.channelName }
			            	</div>
			                <ul class="lcolumn">
		                		<li><span></span><a href="${ctx}/cms/article_flist.htm?channelId=${channel.id}">${channel.channelName }</a></li>
			                </ul>
		                </c:if>
		                <%-- 二级栏目 --%>
		        		<c:if test="${channel.cmsChannel.id != '1' }">
			            	<div class="ltitle">
			            		${channel.cmsChannel.channelName }
			            	</div>
			                <ul class="lcolumn">
			                	<c:forEach  items="${channel.cmsChannel.cmsChannels}" var="item" varStatus="status">
			                		<li><span></span><a href="${ctx}/cms/article_flist.htm?channelId=${item.id}">${item.channelName }</a></li>
			                	</c:forEach>
			                </ul>
		                </c:if>
		            </div>
		            <!--栏目导航结束-->
		        	<!--精品推荐开始-->
		        	<iframe width="198" height="228" src="${ctx }/core/resource_quality.htm?page.pageSize=2" frameborder="0" scrolling="no"></iframe>
		        	<!--精品推荐结束-->
		        </div><!--左侧内容结束-->
	        	<div class="rightcontent">
		        	<div class="righttitle">
		            	<div class="fla">${channel.channelName }</div>            	
		                <div class="fra">当前位置：<a href="${ctx }">首页</a> - 
		                	<%-- 一级栏目 --%>
		                	<c:if test="${channel.cmsChannel.id == '1' }">${channel.channelName }</c:if>
		                	<%-- 二级栏目 --%>
		                	<c:if test="${channel.cmsChannel.id != '1' }">
		                		${channel.cmsChannel.channelName } - 
		                		<a href="#">${channel.channelName }</a>
		                	</c:if>
		                </div>                
		            </div>           
		            <div class="maincont">
		            	<%-- 单页 --%>
		            	<c:if test="${channel.channelType == 'single' }">
		            		<c:forEach items="${page.list}" var="item" varStatus="status">
					            <div class="maincont">
					            	<h2>${item.title }</h2>
					                <h4>发布时间：${fn:substring(item.releaseDate, 0, 10)}&nbsp;&nbsp;&nbsp;&nbsp;文章来源：${item.origin}
					                	&nbsp;&nbsp;&nbsp;&nbsp;作者：${item.author }&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：${item.visitTotal }</h4>
					            	${item.content }
					            	<c:if test="${!empty uploadFileList}">
					            		<hr size="1" style="border-bottom:1px dashed #cfcac1; border-top:none;">
					            		<div style="text-indent: 2em;">
					            		附件：
					            		<c:forEach items="${uploadFileList}" var="upfile">
									        <span id="${upfile.id}span">
									            <a href="${ctx}/cms/article_download.do?id=${item.id}&uploadFileId=${upfile.id}" title="下载" target="_blank">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
									            <br/>
									         </span>
									    </c:forEach>
										</div>
									</c:if>
					            </div>
				            </c:forEach>
				            <c:if test="${empty page.list }">
				            	<div class="maincont">
					            	<h2 style="text-align:center; color:red;">${channel.channelName }尚未添加</h2>
					            </div>
				            </c:if>
		            	</c:if>
		            	<%-- 非单页 --%>
		            	<c:if test="${channel.channelType != 'single' }">
			            	<ul class="newslist">
			            		<c:forEach items="${page.list}" var="item" varStatus="status">
				                	<li>
				                    	<h6><a href="article_detail.do?articleId=${item.id }&channelId=${channel.id }" target="_blank">${item.title }</a></h6>
				                        <p>${item.description }</p>
				                    </li>
			                    </c:forEach>
					            <c:if test="${empty page.list }">
					            	<li>
						            	<h6 style="text-align:center; color:red;">未找到符合条件的文章</h6>
						            </li>
					            </c:if>
			                </ul>
			            	<%@ include file="/front/jsp/include/pager.jsp" %>
						</c:if>
		            </div>
		        </div><!--右侧内容结束-->      
		    </div>
	    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
	</div><!--内容页结束-->
	</form>
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
