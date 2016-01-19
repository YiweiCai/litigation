<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace }.png" /></h1>
    <div class="nav">
    <a href="${ctx }/index.htm">网站首页</a>
    <a href="${ctx }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx}/myCenter/readAgreement.htm">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>
    <a href="${ctx}/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>
  </div>
  </div>
</div>
<div class="layregbg">
<div class="logintotal"><a href="#"><img src="${ctx }/js_css_image/images/layerregbutton.png" /></a><a href="#"><img src="${ctx }/js_css_image/images/dangshirenregbut.png" /></a><a href="#"><img src="${ctx }/js_css_image/images/weiyuanregbut.png" /></a></div>



</div>
<div class="copyrightbg">
  
<div class="copyright">版权所有：河南省新郑市人民法院 技术支持：北京易云华控技术有限公司<br />
   豫ICP备12000402号-1</div>

</div> 
</body>
</html>
