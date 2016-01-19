<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<my:head>
<script type="text/javascript">
	$(function() {
		  $("span.zmsz").each(function(){
			  var zmsz = $(this).attr("zmsz");
			  if(zmsz!=""){
				   $.post("${ctx}/system/desksetting_"+zmsz+".do",function(ret) {
				       $("#"+zmsz+"Content").html(ret);
			      }, "html");
			  }
		  });
		//$(".itemContent").jscroll();//设置了滚动条宽度
	});
</script>
</my:head>
<body>
<div id="bottomNav" style="text-align: center;display: none" ><b><a href="">我要留言</a></b></div>
<div class="bodybox" style="padding-top: 10px;text-align: center;">
	<img alt="" src="${ctx }/js_css_image/images/manageimage.jpg">
</div>
</body>
</html>