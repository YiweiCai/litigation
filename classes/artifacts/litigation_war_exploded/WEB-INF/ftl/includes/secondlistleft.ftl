<div class="icontleft">
	<div class="leftmenu">
    	<div class="lmenutitle"><span>${channel.cmsChannel.channelName}</span></div>
    	<ul class="icontleftul">
    		<#list channel.cmsChannel.cmsChannels as item>
    			<li><span></span><a href="${ctx}/${item.path}/index_1.html">${item.channelName}</a></li>
    		</#list>
        </ul>
        <div class="lmenubt"><img src="${ctx}/js_css_image/front/images/icont_bt.jpg" width="208" height="26" title="" alt="" /></div>
    </div>
    <div class="download">
    	<a href="${ctx}/xzzx/index_1.html"><img src="${ctx}/js_css_image/front/images/xz.jpg" width="208" height="75" alt="" title="" /></a>
    </div>
    <div class="download">
    	<a href="${ctx}/lxwm/index_1.html"><img src="${ctx}/js_css_image/front/images/lx.jpg" width="208" height="75" alt="" title="" /></a>
    </div>
</div>