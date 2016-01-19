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
			var listurl = "${ctx }/myCenter/uploads.htm";
			
			// 获取页面跳转参数
			function getParams(){
				return "";
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
		    	<div class="leftcont" style=" min-height:390px;">
		    		<%-- 导航 --%>
		            <%@ include file="/front/jsp/myCenter/include/nav.jsp" %>
		        </div><!--左侧内容结束-->
		        <div class="rightcontent">
		        	<h3>我发布的资源</h3>           
		            <div class="maincont">
		            	<ul class="gerenul">
		            		<c:forEach items="${page.list}" var="item" varStatus="status">
			                	<li>
			                    	<h6><a href="${ctx }/core/resource_detail.htm?id=${item.id}" target="_blank">${item.name }</a></h6>
			                        <p>${item.description }</p>
			                    </li>
		                    </c:forEach>
		                    <c:if test="${empty page.list }">
		                    	<h6 style="color:red; text-align:center;">没有找到您要的资源</h6>
		                    </c:if>
		                </ul>
		                <%@ include file="/front/jsp/include/pager.jsp" %>
		            </div>
		        </div><!--右侧内容结束-->  
	        </div>    
		</div><!--内容页结束-->
		<!--底部开始-->
		<%@ include file="/front/jsp/include/foot.jsp" %>
		<!--底部结束-->
	</body>
</html>
