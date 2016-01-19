<div class="news">
    <!-- 代码 开始 -->
    <div id="fsD1" class="focus">  
        <div id="D1pic1" class="fPic">
        	<#if articleList?? && articleList?size gt 0>
				<#list articleList as article>
		            <div class="fcon" style="display: none;">
						<a target="_blank" href="${(article.outerUrl)!'#'}"><img src="${ctx}/${(article.contentImg)!'js_css_image/front/images/nopic.png'}" width="670" height="328" alt="" title=""  style="opacity: 1; "></a>
		                <span class="shadow"><a target="_blank" href="${(article.outerUrl)!'#'}">${(article.title)?html}</a></span>
	                </div>
				</#list>
			 <#else>
	            <div class="fcon" style="display: none;">
	                <a target="_blank" href="#"><img src="${ctx}/js_css_image/front/images/news01.png" width="670" height="328" alt="" title=""  style="opacity: 1; "></a>
	                <span class="shadow"><a target="_blank" href="#">石家庄科技大市场参加2015中国</a></span>
	            </div>
	            <div class="fcon" style="display: none;">
	                <a target="_blank" href="#"><img src="${ctx}/js_css_image/front/images/news02.jpg" width="670" height="328" alt="" title=""  style="opacity: 1; "></a>
	                <span class="shadow"><a target="_blank" href="#">红三庙办盛典 白色羽毛装高贵动人</a></span>
	            </div>
	            <div class="fcon" style="display: none;">
	                <a target="_blank" href="#"><img src="${ctx}/js_css_image/front/images/news01.png" width="670" height="328" alt="" title=""  style="opacity: 1; "></a>
	                <span class="shadow"><a target="_blank" href="#">红三代办盛典 白色羽装高贵动人</a></span>
	            </div>
	            <div class="fcon" style="display: none;">
	                <a target="_blank" href="#"><img src="${ctx}/js_css_image/front/images/news02.jpg" width="670" height="328" alt="" title=""  style="opacity: 1; "></a>
	                <span class="shadow"><a target="_blank" href="#">红三代叶明子毛装高贵动人</a></span>
	            </div>  
			 </#if>                  
        </div>
        <div class="fbg">  
            <div class="D1fBt" id="D1fBt">  
	        	<#if articleList?? && articleList?size gt 0>
					<#list articleList as article>
						<a href="javascript:void(0)" hidefocus="true" target="_self" <#if article_index == 0>class="current"</#if>><i>${article_index + 1}</i></a>  
					</#list>
				 <#else>
	                <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>1</i></a>  
	                <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>  
	                <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>3</i></a>  
	                <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a> 
				 </#if> 
            </div>  
        </div>  
        <span class="prev"></span>   
        <span class="next"></span>    
    </div>  
    <script type="text/javascript">
        Qfast.add('widgets', { path: "${ctx}/js_css_image/front/js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
        Qfast(false, 'widgets', function () {
            K.tabs({
                id: 'fsD1',   //焦点图包裹id  
                conId: "D1pic1",  //** 大图域包裹id  
                tabId:"D1fBt",  
                tabTn:"a",
                conCn: '.fcon', //** 大图域配置class       
                auto: 1,   //自动播放 1或0
                effect: 'fade',   //效果配置
                eType: 'click', //** 鼠标事件
                pageBt:true,//是否有按钮切换页码
                bns: ['.prev', '.next'],//** 前后按钮配置class                          
                interval: 3000  //** 停顿时间  
            }) 
        })  
    </script>
    <!-- 代码 结束 -->
</div>