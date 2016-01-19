<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<my:head datePicker="true">
		<title>庭审直播列表</title>
		<script type="text/javascript" src="${ctx}/js_css_image/DatePicker/WdatePicker.js" language="javascript" ></script>
		<link href="${ctx}/js_css_image/css/index.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript">
		var listurl = "${ctx }/lawsuit/co_flist.htm";
	// 获取页面跳转参数
	function getParams(){
		return "type=${type}";
	}
		
		</script>
		
	</my:head>

<body>
<div class="guidetext">
<form action="${ctx }/app/welcome!getOpening.action" id="frm" method="post">
	

  
  <div class="content">
    <div class="titlebg">直播列表</div>
    <div class="courtbg">
    <ul>
    <c:forEach items="${page.list }" var="d">
	    	 <a href="${ctx }/lawsuit/co_view.htm?coid=${d.id}" target="coview">
	    	 
	        <li style="background: url(${ctx}/js_css_image/images/video_18.jpg) no-repeat">
	        ${d.courtName }：直播</li>
	        </a>
	        
    	</c:forEach>
      
    </ul>
    
    </div>
   
</div>
 <div class="newspage"><%@ include file="/front/jsp/include/pager.jsp" %></div>
</div>
</form>
</body>
</html>
