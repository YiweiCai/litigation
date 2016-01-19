<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/title.jsp" %>
<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript"
		src="${ctx}/js_css_image/front/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript"
		src="${ctx}/js_css_image/front/js/jquery.Sonline.js"></script>
<script type="text/javascript">
	window.onload = function(){
		if('${op}'=="readAgreement"){
			window.location.href="${ctx4ej}/myCenter/readAgreement.htm";
			document.getElementById("laxx").src="${ctx4ej}/myCenter/readAgreement.htm"
		}else if('${op}'=="xf_flist"){
		
			document.getElementById("laxx").src="${ctx4ej}/lawsuit/xf_flist.htm"
			document.getElementById("xf_flist").setAttribute("class","selected");
		}else if('${op}'=="add"){
		
			document.getElementById("laxx").src="${ctx4ej}/lawsuit/laxx_add.htm"
			document.getElementById("laxx_add").setAttribute("class","selected");
		}else if('${op}'=="caseProceed"){
		
			document.getElementById("laxx").src="${ctx4ej}/lawsuit/laxx_caseProceed.htm"
			document.getElementById("laxx_caseProceed").setAttribute("class","selected");
		}else if('${op}'=="weiTiJiao"){
			document.getElementById("laxx").src="${ctx4ej}/lawsuit/laxx_weiTiJiao.htm"
			document.getElementById("laxx_weiTiJiao").setAttribute("class","selected");
		}else{
			document.getElementById("laxx").src="${ctx4ej}/lawsuit/${op}.htm"
		}
		/*$("#sl").Sonline({
			Position:"right",//left或right
			Top:200,//顶部距离，默认200px
			Effect:true, //滚动或者固定两种方式，布尔值：true或false
			DefaultsOpen:true, //默认展开：true,默认收缩：false
			href:"${ctx}/cms/article_detail.do?articleId=155&channelId=402881fb5098c0fa015098d3bf040003"
		});*/
	}
</script>
<script>
(function() {
	var $backToTopTxt = "帮助文档", $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body"))
		.text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
			$("html, body").animate({ scrollTop: 0 }, 100);
	}), $backToTopFun = function() {
		var st = $(document).scrollTop(), winh = $(window).height();
		(st > 0)? $backToTopEle.show(): $backToTopEle.hide();	
		//IE6下的定位
		if (!window.XMLHttpRequest) {
			$backToTopEle.css("top", st + winh - 166);	
		}
	};
	$(window).bind("scroll", $backToTopFun);
	$(function() { $backToTopFun(); });
})();
  </script>
</head>

<body id="sl">
<div class="bannerbg">
  <div class="layout">
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace}.png" /></h1>

   <div class="nav"><a href="${ctx4ej}/index.htm">首页</a>
    <a href="${ctx4ej }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=add" class="choose">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881f7508813af0150886dcc4e0000">通知公告</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>

  </div>
</div>
<div class="layout">
  <div class="sidenav"><img src="${ctx }/js_css_image/images/caseitem.png" />
    <div class="navlist">
      <ul>
        <li id="laxx_add" ><a href="${ctx4ej }/lawsuit/laxx_myCase.htm?op=add"><img src="${ctx }/js_css_image/images/caseicon1.png" />网上立案</a></li>
       <%--  <div class="line">阿萨德岁</div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon2.png" />提交预约申请</a></li> --%>
        <div class="line"></div>
        <li id="laxx_weiTiJiao" ><a href="${ctx4ej }/lawsuit/laxx_myCase.htm?op=weiTiJiao"><img src="${ctx }/js_css_image/images/caseicon3.png" />未提交立案</a></li> 
        <div class="line"></div>
        <li id="laxx_caseProceed"><a href="${ctx4ej }/lawsuit/laxx_myCase.htm?op=caseProceed"><img src="${ctx }/js_css_image/images/caseicon4.png" />案件进展查询</a></li>
 <div class="line"></div>
        <li id="xf_flist"><a href="${ctx4ej }/lawsuit/laxx_myCase.htm?op=xf_flist"><img src="${ctx }/js_css_image/images/caseicon5.png" />判后答疑</a></li>
        <div class="line"></div>
      </ul>
    </div>
  </div>
  <iframe id="laxx" name="laxx" frameborder="0" width="785" height="700" src=""></iframe>

</div> 


<div class="backToTop" title="帮助文档" style="display: block;"><a href="${ctx4ej}/cms/article_detail.do?articleId=155&channelId=402881fb5098c0fa015098d3bf040003" target=_blank>帮助<br>文档</a></div>



<%@include file="/common/static.jsp" %>
</body>
</html>
