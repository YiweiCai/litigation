<#-- 创业支援二级栏目单页 -->
<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/ftl/includes/js_css.html">
    <title>评讼服务网络系统 </title>
	<link href="${ctx}/js_css_image/front/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <#--头部开始-->
    <#assign current="${channel.cmsChannel.path}">
    <#include "/WEB-INF/ftl/includes/head.html">
    <#--头部结束-->
    
    <!--内容页开始-->
	<div class="container">
		<div class="banner"><img src="${ctx}/js_css_image/front/images/banner.jpg" width="960" height="217" alt="" title="" /></div>
	    <div class="icont">
	    	<!--左侧栏目开始-->
	    	<div class="icontleft">
	        	<div class="leftmenu">
	            	<div class="lmenutitle"><span>创业支撑</span></div>
	            	<ul class="icontleftul">
	            		<li><span></span><a href="${ctx}/suport/achievement_flist.htm">科技成果库</a></li>
	            		<li><span></span><a href="${ctx}/suport/expert_flist.htm">专家导师库</a></li>
	            		<li><span></span><a href="${ctx}/lxwm/index_1.html">人才库</a></li>
	            		<li><span></span><a href="${ctx}/zlfwjs/index_1.html">专利服务介绍</a></li>
	            		<li><span></span><a href="${ctx}/kjwxjs/index_1.html">科技文献检索</a></li>
	                </ul>
	                <div class="lmenubt"><img src="${ctx}/js_css_image/front/images/icont_bt.jpg" width="208" height="26" title="" alt="" /></div>
	            </div>
	            <div class="download">
	            	<a href="#"><img src="${ctx}/js_css_image/front/images/xz.jpg" width="208" height="75" alt="" title="" /></a>
	            </div>
	            <div class="download">
	            	<a href="${ctx}/lxwm/index_1.html"><img src="${ctx}/js_css_image/front/images/lx.jpg" width="208" height="75" alt="" title="" /></a>
	            </div>
	        </div>
	    	<!--左侧栏目结束-->
	    	<!--右侧内容开始-->
			<div class="icontright">
				<div class="icontrtitle">
					<div class="titleicon"><img src="${ctx}/js_css_image/front/images/home.png" width="34" height="40" alt="" title="" /><span>${channel.cmsChannel.channelName}</span></div>
					<div class="rtitle">
						<span>当前位置：</span><a href="${ctx}/index.html">首页</a> &gt; ${channel.cmsChannel.channelName} &gt;
						<a href="${ctx}/${channel.path}/index_1.html">${channel.channelName}</a>
					</div>
				</div>
	            <div class="mainright">
					<#if  articleList?? && articleList?size gt 0>
	            	 	<#list articleList as article>
	            	 		${article.content}
	            	 	</#list>
	            	 <#else>
	            	 	<p>暂无${channel.channelName}信息</p>
	            	 </#if>
	            </div>
	        </div><!--右侧内容结束-->
	    </div>
	</div><!--内容页结束-->

   <#--底部开始-->
   <#include "/WEB-INF/ftl/includes/footer.html">
   <#--底部结束-->
</body>
</html>
