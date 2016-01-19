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
		            	<h2>${title }</h2>
		                <h4>发布时间：${fn:substring(releaseDate, 0, 10)}&nbsp;&nbsp;&nbsp;&nbsp;文章来源：${origin}
		                	&nbsp;&nbsp;&nbsp;&nbsp;作者：${author }&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：${visitTotal }</h4>
		            	${content }
		            	<c:if test="${!empty uploadFileList && channel.channelType == 'download'}">
		            		<hr size="1" style="border-bottom:1px dashed #cfcac1; border-top:none;">
		            		<div style="text-indent: 2em;">
		            		附件：
		            		<c:forEach items="${uploadFileList}" var="upfile">
						        <span id="${upfile.id}span">
						            <a href="${ctx}/cms/article_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载" target="_blank">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
						            <br/>
						         </span>
						    </c:forEach>
							</div>
						</c:if>
		            </div>
		            <div class="pglist">
		            	<div class="pgfyl" style="display:none;">
			            	<p class="last"><b>上一条：</b><a href="#" title="没有了">没有了</a></p>
			                <p class="next"><b>下一条：</b><a href="#" title="石家庄科技大市场是由石家庄市政府建设的">石家庄科技大市场是由石家庄市政府建设的石家庄科技大市场是由石家庄市政府建设的石家庄科技大市场是由石家庄市政府建设的</a></p>
			            </div>
			            <div class="pgfyr"><a href="#" title="[返回列表]">[返回列表]</a></div>
			            <div class="clear"></div>
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
