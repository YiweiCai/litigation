<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
		<script type="text/javascript">
			var listurl = "${ctx }/core/resource_flist.htm";
			
			$(document).ready(function(){
				<c:if test="${!empty title}">
					$("#title").val("${title}")
				</c:if>
			});
			
			// 获取页面跳转参数
			function getParams(){
				var params = "";
				<c:if test="${!empty mode}">
					params += "&mode=${mode}";
				</c:if>
				<c:if test="${!empty type}">
					params += "&type=${type}";
				</c:if>
				<c:if test="${!empty category}">
					params += "&category=${category}";
				</c:if>
				if($("#name").val() != ""){
					params += "&name=" + $("#name").val();
				}
				
				return params.substring(1);
			}
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
	    	<!--左侧内容开始-->
	    	<div class="leftcont">        	
	        	<!--精品推荐开始-->
	        	<iframe width="198" height="228" src="${ctx }/core/resource_quality.htm?page.pageSize=2" frameborder="0" scrolling="no"></iframe>
	        	<!--精品推荐结束-->
	            <!--下载排行开始-->
	            <iframe width="198" height="330" src="${ctx }/core/resource_downtop.htm?page.pageSize=8" frameborder="0" scrolling="no"></iframe>
	        	<!--下载排行结束-->
	            
	        </div><!--左侧内容结束-->
	        <div class="rightcontent">
	        	<div class="righttitle">
	        		<c:choose>
	        			<c:when test="${mode == 'type' }">
			            	<div class="fla">
			           			<my:view value="${type }" pvalue="resourceType" />库
			            	 </div>
			            	<div class="fra">当前位置：<a href="${ctx }/index.htm">首页</a> - <my:view value="${type }" pvalue="resourceType" />库</div>
	        			</c:when>
	        			<c:when test="${mode == 'category' }">
			            	<div class="fla">
			           			<my:view value="${category }" pvalue="resourceCategory" />
			            	 </div>
			            	<div class="fra">当前位置：<a href="${ctx }/index.htm">首页</a> - 资源库   - <my:view value="${category }" pvalue="resourceCategory" /></div>
	        			</c:when>
	        			<c:when test="${mode == 'quality' }">
	            			<div class="fla">
			           			精品推荐
			            	 </div>
			            	<div class="fra">当前位置：<a href="${ctx }/index.htm">首页</a> - 资源库 - 精品推荐</div>
	        			</c:when>
	        			<c:otherwise>
	            			<div class="fla">
			           			资源搜索结果
			            	 </div>
			            	<div class="fra">当前位置：<a href="${ctx }/index.htm">首页</a> - 资源库 - 资源搜索结果</div>
	        			</c:otherwise>
	        		</c:choose>
	            </div>           
	            <div class="maincont">
	            	<div class="kusearch">
	                	<form name="formsearch" action="#" class="search cf" style="width:680px;">
	                		<input type="hidden" name="type" value="${type }" />
	                		<input type="hidden" name="category" value="${category }" />
	                		<input type="hidden" name="mode" value="${mode }" />
	                        <input type="text" name='name' id="name" placeholder="请输入搜索内容" class="search-input" value="${name }" style="width:614px;">                    
	                        <a class="search-btn" onclick="$(this).parent().submit();">搜 索</a>
	                    </form>
	                </div>
	            	<ul class="newslist">
	            		<c:if test="${empty page.list }">
	            			<li style="color:red; text-align:center;">不存在符合条件的资源</li>
	            		</c:if>
	            		<c:forEach items="${page.list}" var="item" varStatus="status">
		                	<li>
		                    	<h5><a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank">${item.name }</a></h5>
		                        <p>${item.description }</p>
		                    </li>
	                    </c:forEach>
	                </ul>
	            	<%@ include file="/front/jsp/include/pager.jsp" %>
	            </div>
	        </div><!--右侧内容结束-->      
	    </div>
	    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
	</div><!--内容页结束-->
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
