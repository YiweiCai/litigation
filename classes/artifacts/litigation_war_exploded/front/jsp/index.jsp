<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<c:forEach items="${user.sysRoles}" var="role" varStatus="status">
    
    <c:if test="${role.id=='8ae99b51511de52301512e40e3ff000d' }">
    	<c:set var="isDaibiao" value="true"/>
    </c:if>
    
</c:forEach>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/title.jsp" %>
<link href="${ctx}/js_css_image/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" >
		function submitLogin(){
		    	var valid = true;
		    	if ($("#loginName").val() == "") {
					alert("&nbsp;&nbsp;请输入用户名");
		    		valid=false;
				}
		    	if ($("#password").val() == "") {
					alert("&nbsp;&nbsp;请输入密码");
			    	valid=false;
				}
		    	
		    	if(!valid){
		    		return false;
		    	}
		    	 
	    		$("#submitBtn").attr("disabled","disabled");
		    	$.post("${ctx}/login/login_login.do", 
		    		  {"loginName": $("#loginName").val(),"password":$("#password").val(),"forceLogin":$("#forceLogin").val()},
				      function(data){
		    			window.location.reload();
				      }
				 );
	         }
	         
	         
	    function cancelLogin(){
	    	$.post("${ctx}/login/login_logoutAjax.do", 
		    		  {},
				      function(data){
		    			window.location.reload();
				      }
				 );
	    
	    }

</script>
</head>

<body>
<%@ include file="/front/jsp/include/head.jsp" %>
<div class="layout">
  <div class="wearth">
    <!-- <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=7" style="background:url(${ctx }/js_css_image/images/wearthbg.jpg) no-repeat; padding-top:6px"  width="283" height="100" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>-->
      <c:if test="${requestNameSpace eq 'zzfy'}">
            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=7" style="background:url(/js_css_image/images/wearthbgsm.jpg) no-repeat; padding-top:6px"  width="283" height="100" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
            <a href="${ctx}/front/jsp/myCenter/hnzzweb3d.jsp" target="_">
                <div class="loginbg"></div>
      </c:if>
      <c:if test="${requestNameSpace ne 'zzfy'}">
          <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=82" width="250" height="160" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
      </c:if>

    <!-- <div class="loginbg">
  <!--  <c:choose>
    	<c:when test="${empty user}">
	    <div class="logineare">
	    <label class="labewidth">用户名</label>
	    <input type="text" name="loginName" id="loginName" class="logininput" /><br/>
	    <label  class="labewidth">密&nbsp;&nbsp;&nbsp;码</label>
	    <input type="password" name="password" id="password" class="logininput" />
	    </div>
   
    <div class="loginbutton" onclick="submitLogin();"></div>
    </c:when>
    <c:otherwise>
    <div class="loginin">

    	欢迎您<a href="${ctx }/system/layout_layout.do"><my:i18n zhText="${user.userName}" enText="${user.enUserName}"/></a><a href="#" onclick="cancelLogin();">立即退出</a><br />
    <a href="${ctx}/myCenter/readAgreement.htm">网上立案</a>|<a href="${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509dffd66e0007">律师咨询</a><br />
    <a href="${ctx }/cms/article_detail.do?articleId=97&channelId=402881fb5093521c01509363720a0006">联系法官</a>|<a href="${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509e0206b6000a">代表委员监督</a>
    </div>
 </c:otherwise>
    </c:choose> 
    </div> -->
    </a>
    </div>
  <div class="service">
    <h2>诉讼服务指南</h2>
    <div class="servicebg">
    <a href="${ctx4ej}/cms/article_detail.do?articleId=105&channelId=402881fb5098c0fa015098d2c3d50001">
    <div class="servicebut01 ">如何打官司
     </div> </a>
    <a href="${ctx4ej}/cms/article_detail.do?articleId=103&channelId=402881fb5098c0fa015098d360510002">
    <div class="servicebut02">
      风险告知</div>
    </a> <a href="${ctx4ej}/cms/article_detail.do?articleId=104&channelId=402881fb5098c0fa015098d3bf040003">
    <div class="servicebut03">
      网上诉讼指南 </div>
    </a> <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">
    <div class="servicebut04">
      裁判文书查询</div>
    </a>
     <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881fb5098c0fa015098d4f4720005">
    <div class="servicebut05">
      案件查询</div>
      </a>
   <!-- <a href="${ctx }/cms/article_flist.htm?channelId=402881fb5098c0fa015098d54e550006"> -->
   <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881fb5098c0fa015098d54e550006">
   <div class="servicebut06">
      开庭公告</div>
      </a>
  </div>
  </div>
 <div class="tongzhi">
    <span><a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150886dcc4e0000">更多</a></span><h1>通知公告</h1>
    <ul>
    <c:forEach items="${articleNotice}" var="item" varStatus="status">
	  <li><a href="${ctx4ej }/cms/article_detail.do?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	</c:forEach>
      
    </ul>
  </div>
</div>
<div id="lian">
  <h3>网上预约立案</h3>
 <a href="${ctx4ej}/myCenter/readAgreement.htm"> <div class="reg"><img src="${ctx }/js_css_image/images/reg.png" /><br />
    填写注册信息<br />
    <span class="font12">认真阅读立案须知，进行实名注册进行网上立案！</span> </div></a>
 <a href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=add"> <div class="lianeara"><img src="${ctx }/js_css_image/images/lianicon.png" width="57" height="47" /><br />
    我要立案<br />
    <span class="font12">按要求上传诉讼材料并提交，进行立案，方便、快捷。</span></div></a>
 <a href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=caseProceed"> <div class="progress"><img src="${ctx }/js_css_image/images/liansearchicon.png" width="50" height="47" /><br />
    立案进展查询<br/>
    <span class="font12">实时跟踪进度，第一时间了解自己案件的诉讼情况！</span></div></a>
</div>
<div class="layout">
<h5></h5>
<div class="layeare">
<ul><a href="<c:choose><c:when test="${empty user }">${ctx4ej }/myCenter/totallogin.htm</c:when><c:otherwise>${ctx4ej }/cms/article_flist.htm?channelId=402881fb509d319901509dffd66e0007</c:otherwise></c:choose>"><li  class="buttonbg"><img src="${ctx }/js_css_image/images/layicon.jpg"/>提供免费法律咨询、律师在线咨询、法律法规查询、点对点法律咨询解答、在线案件委托。[详细]</li></a>
<li><a href="${ctx4}/front/jsp/myCenter/contextLaw.jsp"><img src="${ctx }/js_css_image/images/layerenter.jpg"/></a></li>
</ul>
</div>
<div class="grayline"></div>
<div class="layeare">
<ul><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb509d319901509e0149bd0009"><li  class="buttonbg"><img src="${ctx }/js_css_image/images/wenshuicon.jpg"/>法律文书具有内容上的合法性、形式上的规范性、语言上的准确性等，可以下载常用的文书 [详细]</li></a>
<li><a href="${ctx4ej }/myCenter/address.htm"><img src="${ctx }/js_css_image/images/mapenter.jpg"/></li></a>
</ul>
</div>
<div class="grayline"></div>
<div class="layeare">
<ul><a href="${ctx4ej }/cms/article_detail.do?articleId=97&channelId=402881fb5093521c01509363720a0006"><li  class="buttonbg"><img src="${ctx }/js_css_image/images/faguanicon.jpg"/>当事人可以通过本栏目邮箱与法官进行交流，咨询案件办理情况和具体的开庭时间和相关事宜 [详细]</li></a>
<li>
<c:choose>
<c:when test="${empty user }"><a href="${ctx4ej }/myCenter/totallogin.htm"></c:when>
<c:when test="${isDaibiao }"><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb509d319901509e0206b6000a"></c:when>
<c:otherwise><a href="javascript:void(0);" onclick="javascript:alert('该用户不是代理委员账户！')"></c:otherwise>

</c:choose><img src="${ctx }/js_css_image/images/daibiaoenter.jpg"/></a></li>
</ul>
</div>
  <!-- <div class="layeare">
    <div class="laytitle">法律服务指南</div>
    <ul>
    <li class="laybutton">
    <a href="${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509e0149bd0009"><img src="${ctx }/js_css_image/images/index_34.jpg" /></a>
    <a href="${ctx }/cms/article_detail.do?articleId=97&channelId=402881fb5093521c01509363720a0006"><img src="${ctx }/js_css_image/images/index_36.jpg" /></a>
    <a href="<c:choose><c:when test="${empty user }">${ctx }/myCenter/login.htm</c:when><c:otherwise>${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509dffd66e0007</c:otherwise></c:choose>"><img src="${ctx }/js_css_image/images/index_38.jpg" /></a>
    <a href="<c:choose><c:when test="${empty user }">${ctx }/myCenter/login.htm</c:when><c:otherwise>${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509e0206b6000a</c:otherwise></c:choose>"><img src="${ctx }/js_css_image/images/index_40.jpg" /></a>
    </li>
    <li><a href="${ctx }/cms/article_flist.htm?channelId=402881fb509d319901509e00c82a0008"><img src="${ctx }/js_css_image/images/index_50.jpg" /></a><a href="${ctx }/myCenter/address.htm"><img src="${ctx }/js_css_image/images/index_47.jpg" /></a></li>

    </ul> </div>
  <div class="liucheng">
    <div class="liuchengtitle"><a href="${ctx }/cms/article_flist.htm?channelId=402881f7508813af0150887e28e60003"><span>更多</span></a>流程指南</div>
    <ul>
     <c:forEach items="${articleProcedure}" var="item" varStatus="status">
	  <li><a href="${ctx4ej }/cms/article_detail.htm?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	 </c:forEach>
     
    </ul>
  </div>

    </ul> </div> -->


</div>
<div class="layout">
  <div class="videotitle"><span><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">更多</a></span>庭审直播</div>
  <div class="courtbg">
    <ul>
    <c:forEach items="${courtOpening }" var="co">
    	<a href="${ctx4ej }/lawsuit/co_view.htm?coid=${co.id}"><li>
    	${co.courtName }：直播</li></a>
    </c:forEach>
      
      
    </ul>
  </div>
</div>
<div class="layout">
  <div class="newseare">
   <div class="liucheng">
    <div class="liuchengtitle"><span><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881f7508813af0150887e28e60003">更多</a></span>流程指南</div>
    <ul>
     <c:forEach items="${articleProcedure}" var="item" varStatus="status">
	  <li><a href="${ctx4ej }/cms/article_detail.htm?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	 </c:forEach>
     
    </ul>
  </div>
  
    <span class="wid10"></span>
    <div class="contentnews">
      <div class="newstitle"><span><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881f7508813af0150887fd0700004">更多</a></span>减刑假释</div>
      <ul>
         <c:forEach items="${articleParole}" var="item" varStatus="status">
	     <li><a href="${ctx4ej }/cms/article_detail.do?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	 	</c:forEach>
      </ul>
    </div>
    <div style="clear:both"></div>
    <div class="case">
      <div class="casetitle"><span><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">更多</a></span>精选案例</div>
      <ul>
        <c:forEach items="${articleTypicalCases}" var="item" varStatus="status">
	     <li><a href="${ctx4ej }/cms/article_detail.do?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a><%--<span>2015-10-25</span>--%></li>
	 	</c:forEach>
      </ul>
    </div>
    <span class="wid10"></span>
    <div class="case">
      <div class="casetitle"><span><a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">更多</a></span>法官风采</div>
      <ul>
        <c:forEach items="${articleJudge}" var="item" varStatus="status">
	     <li><a href="${ctx4ej }/cms/article_detail.do?articleId=${item.id }&channelId=${item.cmsChannel.id }" target="_blank" title="${item.title }">${item.title }</a></li>
	 	</c:forEach>
      </ul>
    </div>
  </div>
  <span class="wid10"></span>
   
     <c:if test="${requestNameSpace eq 'zzfy'}">
      		<img src="${ctx }/js_css_image/images/index_55.jpg" />
     </c:if>
     <c:if test="${requestNameSpace ne 'zzfy'}">
      		<img src="${ctx }/js_css_image/images/index_56.jpg" />
     </c:if>		
  	
  <div class="court">
    <ul>
      <li>
      <c:if test="${requestNameSpace ne 'zzfy'}">
      		<a href="${ctx}/index.htm">郑州市中级人民法院</a>
      	</c:if>	
      	
      
      </li>
      <li><a href="${ctx}/xzfy/index.htm">新郑市法院</a>
      	<c:if test="${requestNameSpace eq 'zzfy'}">
      		&nbsp;<img src="${ctx }/js_css_image/images/hoticon.png" />
      	</c:if>
      </li>
      <li><a href="${ctx}/xyfy/index.htm">荥阳市法院</a>
      	<c:if test="${requestNameSpace eq 'zzfy'}">
      		&nbsp;<img src="${ctx }/js_css_image/images/hoticon.png" />
      	</c:if>
      </li>
      <li>巩义市法院</li>
      <li>登封市法院</li>
      <li>新密市法院</li>
      <li>中牟县法院</li>
      <li>航空港区法院</li>
      <li>金水区法院</li>
      <li>二七区法院</li>
      <li>中原区法院</li>
      <li>管城区法院</li>
      <li>惠济区法院</li>
      <li>上街区法院</li>
      <li>郑州高新区法院</li>
    </ul>
  </div>
</div>
<div class="linkbg">
<div class="link">
    <a href="http://hnfy.chinacourt.org/index.shtml" target="blank">河南法院</a>
    <a href="http://www.henandaily.cn/" target="blank">河南人民日报</a>
    <a href="http://www.hncourt.gov.cn/" target="blank">河南人民法院</a>
</div>

<%@include file="/common/commonfooter.jsp"%>
</div>
</body>
</html>

