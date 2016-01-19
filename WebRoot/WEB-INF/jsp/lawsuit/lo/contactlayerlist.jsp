<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx }/js_css_image/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
 	var listurl = "${ctx }/lawsuit/lo_flist.htm";
	// 获取页面跳转参数
	function getParams(){
		return "type=${type}";
	}
</script>
</head>

<body>
<form id="frm" name="frm" action="${ctx }/lawsuit/lo_flist.htm?type=${type}" method="post">

<div class="guidetitlebg"><a href="${ctx }/lawsuit/lo_add.htm?type=${type}" class="questiobut">我要提问</a>问答列表</div>

<div class="consulteare">
<c:forEach var="lo" items="${page.list }" varStatus="status">
<ul>
  <li>
  <span class="questionser"><img src="${ctx }/js_css_image/images/questionicon.png"/></span>
  <span class="questioncontent"><strong>${lo.questionTitle}</strong><br/>${lo.questionContext}</span>
  <div class="anthor">${lo.createUser.userName }&nbsp;&nbsp;&nbsp;&nbsp;${lo.createTime }</div></li>
   <div class="linestyle"></div>
 <li>
  <span class="questionser"><img src="${ctx }/js_css_image/images/answericon.png"/></span>
  <span class="questioncontent">${lo.replyContext}</span>
  <div class="anthor">${lo.replyUserName}&nbsp;&nbsp;&nbsp;&nbsp;${lo.replyTime}</div>
  </li>
</ul>
</c:forEach>
<div class="newspage"><%@ include file="/front/jsp/include/pager.jsp" %></div>
</div>

</form>

</body>
</html>
