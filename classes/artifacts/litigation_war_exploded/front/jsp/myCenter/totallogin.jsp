<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
      $(function() {
	   
		 $("#navlist").height($("#regcontent").height()) ;
		
      });
    </script>
</head>

<body>
<div class="bannerbg">
  <div class="layout">
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace}.png" /></h1>
    <div class="nav">
    <a href="${ctx4ej }/index.htm">网站首页</a>
    <a href="${ctx4ej }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx4ej}/myCenter/readAgreement.htm">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>
  </div>
  </div>
</div>
<div class="layregbg">
<div class="logintotal"><a href="${ctx4ej}/myCenter/layerlogin.htm"><img src="${ctx }/js_css_image/images/layerloginbutton.png" /></a><a href="${ctx4ej}/myCenter/login.htm"><img src="${ctx }/js_css_image/images/dangshirenloginbut.png" /></a><a href="${ctx4ej}/myCenter/daibiaologin.htm"><img src="${ctx }/js_css_image/images/weiyuanloginbut.png" /></a></div>



</div>
<%@include file="/common/static.jsp"%>
</html>
