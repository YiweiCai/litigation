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
			$(function(){
				// 搜索框
				$("#header-search").hover(function(){
					$("#search-sort-list").show();
				},function(){
					$("#search-sort-list").hide();
				});
				//搜索选项选择
				$("#search-sort-list li").click(function(){
					var curTxt = $(this).text();
					var type = $(this).attr("val");
					$('#type').val(type);
					$(this).addClass("current").siblings().removeClass("current");
					$(this).parent().siblings(".search-sort-txt").text(curTxt);			
					
					$(this).parent().hide();
				});
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
	    	<!--左侧内容开始-->
	    	<div class="leftcont">
	        	<div class="jcfw"><a href="${ctx }/myCenter/info.htm" target="_blank"><img src="${ctx}/js_css_image/front/images/jcfw.jpg" width="180" height="110" alt="" title="" /></a></div><!--检测服务结束-->
	        	<!--常用连接开始-->
	        	<%@ include file="/front/jsp/include/home/serviceItem.jsp" %>
	        	<!--常用连接结束-->
	            
	            <!--友情连接开始-->
	            <%@ include file="/front/jsp/include/home/friendLink.jsp" %>
	            <!--友情连接结束-->
	        </div><!--左侧内容结束-->
	        <!--居中内容开始-->
	        <div class="middlecont">
	        	<!--搜索条开始-->            	
	        	<div class="searchbar">
	            	<form  name="formsearch" action="${ctx }/core/resource_flist.htm" class="search cf">
	                    <div id="header-search" class="search-sort">
	                    	<input type="hidden" id="type" name="type" />
	                        <span class="search-sort-txt">全部</span><em></em>				
	                        <ul id="search-sort-list" class="search-sort-list">
	                            <li val="">全部</li>
	                            <li val="type_01">构件库</li>
	                            <li val="type_02">软件工具库</li>
	                            <li val="type_03">开放源码库</li>                                                
	                        </ul>
	                    </div>                    				
	                    <input type="text" name='name' id="name" placeholder="请输入搜索内容" class="search-input" value="">                    
	                    <a class="search-btn" onclick="$(this).parent().submit();">搜 索</a>
	                </form>            	
	            </div><!--搜索条结束-->
	            <!--新闻开始-->
	            <div class="news">
	            	<div class="mtitle"><span>新闻资讯</span><a href="${ctx }/cms/article_flist.htm?channelId=4028e30a4d5a9ef3014d5abfc9c80002" target="_blank"><img src="${ctx}/js_css_image/front/images/more.jpg" width="45" height="13" alt="" title="查看更多" /></a></div>
	                <div class="newscont">
	                	<img src="${ctx}/js_css_image/front/images/news.jpg" width="108" height="85" alt="" title="" />
	                    <ul>
	                    	<c:forEach items="${articleNews}" var="item" varStatus="status">
	                    		<li><a href="${ctx }/cms/article_detail.do?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	                    	</c:forEach>
	                    </ul>
	                </div>
	            </div>
	            <!--新闻结束-->
	            <!--推荐开始-->
	            <div class="recommend">
	            	<div class="mtitle"><span>精品推荐</span><a href="${ctx }/core/resource_flist.htm?mode=quality" target="_blank"><img src="${ctx}/js_css_image/front/images/more.jpg" width="45" height="13" alt="" title="查看更多" /></a></div>
	                <ul class="irecommend">
	                	<c:forEach items="${page.list}" var="item" varStatus="status">
	                	<li>
	                    	<a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank"><img src="${ctx}/js_css_image/front/images/recom.png" width="70" height="75" alt="" title="" /></a>
	                        <h4><a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank" title="${item.name }">${item.name }</a></h4>
	                        <p>${item.description }</p>
	                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
	            <!--推荐结束-->
	            <!--资源分类开始-->
	            <div class="project">
	            	<div class="mtitle"><span>资源分类</span></div>
	                <ul class="profl">
	                	<c:forEach items="${categories}" var="item" varStatus="status">
	                		<li>
	                			<a href="${ctx }/core/resource_flist.htm?mode=category&category=${item[0] }" target="_blank">
	                				<my:view value="${item[0] }" pvalue="resourceCategory" />
	                			</a>
	                			(<span>${item[1] }</span>)
	                		</li>
	                	</c:forEach>
	                </ul>
	            </div>
	            <!--资源分类结束-->
	        </div><!--居中内容结束-->
	        <div class="rightcont">
	        	<!--平台介绍开始-->
	        	<div class="ptjs">
	            	<div class="ltitle">平台介绍</div>
	                <p>${articleIntro.description }<a href="${ctx }/cms/article_flist.htm?channelId=4028e30a4d5a9ef3014d5ab165b00000" target="_blank"><详情></a></p>
	            </div><!--平台介绍结束-->
	            <!--最新上传开始-->
	            <iframe width="198" height="307" src="${ctx }/core/resource_newtop.htm?page.pageSize=9" frameborder="0" scrolling="no"></iframe>
	            <!--最新上传结束-->
	            <!--会员单位开始-->
	            <%@ include file="/front/jsp/include/home/memberUnit.jsp" %>
	        	<!--会员单位结束-->
	        </div><!--右侧内容结束-->
	    </div>
	    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
	</div><!--内容页结束-->
	<!--底部开始-->
	<%@ include file="/front/jsp/include/foot.jsp" %>
	<!--底部结束-->
	</body>
</html>
