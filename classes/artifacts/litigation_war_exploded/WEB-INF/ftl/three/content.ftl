<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/ftl/includes/js_css.html">
    <title>评讼服务网络系统 </title>
	<link href="${ctx}/js_css_image/front/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
     <#--头部开始-->
     <#assign current="${article.cmsChannel.cmsChannel.path}">
     <#include "/WEB-INF/ftl/includes/head.html">
     <#--头部结束-->
     
     <!--内容页开始-->
	<div class="container">
		<div class="banner"><img src="${ctx}/js_css_image/front/images/banner.jpg" width="960" height="217" alt="" title="" /></div>
	    <div class="icont">
	    	<!--左侧栏目开始-->
	    	<div class="icontleft">
	        	<div class="leftmenu">
	            	<div class="lmenutitle"><span>${article.cmsChannel.cmsChannel.channelName}</span></div>
	            	<ul class="icontleftul">
	            		<#list article.cmsChannel.cmsChannel.cmsChannels as item>
	            			<li><span></span><a href="${ctx}/${item.path}/index_1.html">${item.channelName}</a></li>
	            		</#list>
	                </ul>
	                <div class="lmenubt"><img src="${ctx}/js_css_image/front/images/icont_bt.jpg" width="208" height="26" title="" alt="" /></div>
	            </div>
	            <div class="download">
	            	<a href="#"><img src="${ctx}/js_css_image/front/images/xz.jpg" width="208" height="75" alt="" title="" /></a>
	            </div>
	            <div class="download">
	            	<a href="${ctx}/lxwm/index_1.html"><img src="${ctx}/js_css_image/front/images/lx.jpg" width="208" height="75" alt="" title="" /></a>
	            </div>
	        </div><!--左侧栏目结束-->			
	    	<!--右侧内容开始-->
			<div class="icontright">
				<div class="icontrtitle">
					<div class="titleicon"><img src="${ctx}/js_css_image/front/images/home.png" width="34" height="40" alt="" title="" /><span>${article.cmsChannel.cmsChannel.channelName}</span></div>
					<div class="rtitle">
						<span>当前位置：</span><a href="${ctx}/index.html">首页</a> &gt; ${article.cmsChannel.cmsChannel.channelName} &gt;
						<a href="${ctx}/${article.cmsChannel.path}/index_1.html">${article.cmsChannel.channelName}</a>
					</div>
				</div>
	            <div class="mainright">            	
	            	<h2>${(article.title)?html}</h2>
	                <h4 class="titles">文章来源：${(article.origin)?html}&nbsp;&nbsp;&nbsp;&nbsp;时间：${((article.releaseDate)!'0000-00-00 ')[0..9]}</h4>
	                <#if (((article.cmsChannel.channelType)!'') != 'download') && (uploadFileList)??>
	                	<div style="text-align:center; margin-bottom:15px;">
	                		<#list uploadFileList as upfile>
	                			<img src="${ctx}/${(upfile.uploadFilePath)!'js_css_image/front/images/nopic.png'}" style="max-width:600px">
	                		</#list>
	                	</div>
	                </#if>
	                ${article.content}
	            </div>
	        </div><!--右侧内容结束-->
	    </div>
	</div><!--内容页结束-->

   <#--底部开始-->
   <#include "/WEB-INF/ftl/includes/footer.html">
   <#--底部结束-->
</body>
</html>
