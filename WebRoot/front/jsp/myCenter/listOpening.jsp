<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="keywords" content="易云V1.0">
		<title>庭审直播列表</title>
		<%@ include file="/common/include.jsp"%>
		<script type="text/javascript" src="${ctx}/common/DatePicker/WdatePicker.js" language="javascript" ></script>
		<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		$(function(){
			$(".searchbut").click(function(){
				$("#frm").attr("action","${ctx }/app/welcome!getAllVideo.action");
				$("#frm").submit();
			});
		})
		
		</script>
		
</head>

<body>
<form action="${ctx }/app/welcome!getOpening.action" id="frm" method="post">
	<input type="hidden" id="did" name="did" value="${did}">

<div id="bannerbg">
  <div class="layout"><img src="${ctx}/images/video_02.png" /></div>
</div>
<div class="main">
  <div id="lefteare">
   <a href="${ctx }"> <img src="${ctx}/images/homeicon.jpg" style="border:0"></a>
   <div class="videosearch">
      <h2>视频搜索</h2>
      <p>
        <label for="textfield">案件名称：</label>
        <input name="dirName" type="text" class="inputstyle" value="${dirName }"/>
      </p>
      <p>
        <label for="textfield">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间：</label>
        <input name="beginTimeStart" type="text" class="inputstyle" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${beginTimeStart }"/>
      </p>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至
      <p>
        <input name="beginTimeEnd" type="text" class="inputright" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${beginTimeEnd }"/>
      </p>
      <!-- <p>
        <label for="textfield">法庭选择：</label>
        <input type="text" class="inputstyle" />
      </p> -->
      <a href="#" class="searchbut"></a> </div>
    <div class="courtlist">
      <h3>法庭列表</h3>
      <ul>
        <c:forEach items="${dirStructures }" var="d">
	    	  <li><a href="${ctx }/app/welcome!getVideoFileByCourt.action?did=${d.id}">${d.dirName }</a></li>
    	</c:forEach>
      </ul>
    </div>
  </div>
  <div class="content">
    <h1>直播列表</h1>
    <div class="courtbg">
    <ul>
    <c:forEach items="${dirStructures }" var="d">
    	 <c:if test="${d.courtEquipment.status==1 || d.courtEquipment.status==3}">
	    	 <a href="${ctx }/app/welcome!toViewVideo.action?did=${d.id}">
	        <li>${d.dirName }：直播</li>
	        </a>
	        </c:if>
    	</c:forEach>
      
    </ul>
    </div>
    <div class="pagelist">
    <%@ include file="/common/page.jsp"%>
     </div>
</div>
  </div>
 
<%@include file="/common/static.jsp" %>
</form>
</body>
</html>
