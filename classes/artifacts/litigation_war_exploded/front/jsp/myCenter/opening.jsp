<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="keywords" content="易云V1.0">
		<title>庭审播放</title>
		<%@ include file="/common/include.jsp"%>
		
		<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
body,td,th {
	font-size: 14px;
	line-height: 26px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#a1{
	position:relative;
	z-index: 100;
	width:600px;
	height:400px;
	float: center;
}
</style>
<script type="text/javascript" src="${ctx }/js/ckplayer/offlights.js"></script>
</head>

<body>

<!--
上面一行是播放器所在的容器名称，如果只调用flash播放器，可以只用<div id="a1"></div>
-->
<script type="text/javascript" src="${ctx }/js/ckplayer/ckplayer.js" charset="utf-8"></script>


<div id="bannerbg">
  <div class="layout"><img src="${ctx}/images/video_02.png" /></div>
</div>
<div class="main">
<h4>${sf.pdirFile.dirName }</h4>
<div class="source">来源：${ds.dirName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 发布时间：${ds.beginTime }<br />

<div id="a1" style="text-align: center;">
	<iframe id="zhibo_Court_iframe" name="zhibo_Court_iframe" scrolling='auto' frameborder='no' width="600px" height="400px" src="${ctx}/common/zb/zb.jsp?path=rtmp://${ds.courtEquipment.equipmentIp}:1935/flvplayback/session0.mpg" ></iframe>
</div><br /><br /></div>

<div class="detailtext" style="display: none;">
<%-- <p class="titlebg">案情介绍</p>
<p>
<strong>案由：</strong>${sf.pdirFile.summary }<br />
<strong>开庭时间：</strong>${sf.pdirFile.beginTime }<br />
<strong>开庭地点：</strong>${ds.dirName }<br />
<strong>基本案情：</strong>${sf.pdirFile.summary }</p>


<p class="titlebg">合议庭成员</p>
<p>
<strong>审判长：</strong>${sf.pdirFile.judge }<br />
<strong>审判员：</strong>${sf.pdirFile.jurors }
</p>

<p class="titlebg">庭审笔录</p>
<p><strong>·开庭笔录</strong><br>

${sf.pdirFile.recordText }

 </p> --%>
</div>


</div>

<div class="copyright">
  <div class="copyrighttext">版权所有：河南省新郑市人民法院 &nbsp;&nbsp;<a href="#">登录</a><br />
    技术支持：北京易云华控技术有限公司</div>
</div>
</body>
<script type="text/javascript">
	
	
	//document.getElementById("zhibo_Court_iframe").contentWindow.location.href="${ctx}/common/zb/zb.jsp?path=rtmp://${ds.courtEquipment.equipmentIp}:1935/flvplayback/session0.mpg";
	
</script>
</html>
