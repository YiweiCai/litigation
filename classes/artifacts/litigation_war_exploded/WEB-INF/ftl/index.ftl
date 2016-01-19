<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/ftl/includes/js_css.html">
	<script type="text/javascript" src="${ctx}/js_css_image/front/js/koala.min.1.5.js"></script>
    <title>评讼服务网络系统</title>
    <meta name="keywords" content="科技创新,创业支撑,创业支持,网络平台 " />
    <meta name="description" content="评讼服务网络系统" />
</head>
<body>
     <#--头部开始-->
     <#assign current="sy">
     <#include "/WEB-INF/ftl/includes/head.html">
     <#--头部结束-->
	
     <#--正文开始-->
     <!--新闻登录开始-->
     <div class="container">
		<div class="contleft">
	    	<!--图片新闻开始-->
	    	<#include "/front/home/tpxw.html">
	    </div><!--左侧内容结束-->    
	    <div class="contright">
	    	<!--登录开始-->
	    	<div class="register">
	        	<div class="regtitle">登录</div>
	            <div class="regcont" id="divNoLogin">
	            	<h6>如果您是石家庄科技大市场的用户，您可以直接登录。</h6>
	                <form method="post" action="${ctx}/login/login_login.do" id="">
	                	<input type="hidden" value="${ctx}/index.html" id="from" name="from" />
	                	<div class="cang">用户名或密码不正确，请重新输入。</div>
	                	<dl>
	                    	<dt>用户名：</dt>
	                        <dd><input type="text" value="" name="loginName" class="reginput" /></dd>
	                    </dl>
	                    <dl>
	                    	<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码：</dt>
	                        <dd><input type="password" value="" name="password" class="reginput" /></dd>
	                    </dl>
	                    <div class="wangji"><a href="#" target="_blank">忘记密码了?</a></div>
	                    <div class="regbtn">
	                    	<button value="" name="" id="" class="left">登 录</button>
	                        <button value="" name="" id="" class="right" onclick="javascript:location='http://www.sjzkjdsc.org/register.jspx';return false;">注 册</button>
	                    </div>
	                </form>
	            </div>
	            <div class="regcont" style="display:none;" id="divLogined">
	            	<h6>欢迎您来到评讼服务网络系统！</h6>
	                <form method="post" action="" id="">
	                	<div class="alreg">
	                        <p><b>用户名：</b><label id="lblUserName"></label></p>
	                        <p><b>用户类型：</b>个人用户</p>
	                        <p><b>注册日期：</b><label id="lblRegisterTime"></label></p>
	                	</div>
	                    <div class="regbtn">
	                    	<button value="" name="" id="" class="left">注  销</button>
	                        
	                    </div>
	                </form>
	            </div>
	        </div><!--登录结束-->
	    </div><!--右侧内容结束-->
	    <div class="clearbh"></div>
	    <div class="adbar"><img src="${ctx}/js_css_image/front/images/adbar.jpg" width="960" height="86" alt="" title="" /></div>
	</div>
	<!--新闻登录结束-->
	<!--服务、库开始-->
	<div class="container">
		<div class="contleft">
	    	<!--网络服务开始-->
	    	<div class="wlfuwu">
	        	<div class="wltitle">
	            	<span class="wlfront">网络服务</span>                
	                <span class="wlback"><img src="${ctx}/js_css_image/front/images/main_right.jpg" /></span>
	                <a href="${ctx}/fwqtg/index_1.html" target="_blank"><img src="${ctx}/js_css_image/front/images/more.jpg" /></a>
	            </div>
	            <ul class="wlul">
	            	<li>
	                	<h4><a href="${ctx}/fwqtg/index_1.html" target="_blank">服务器托管</a></h4>
	                    <p>为推动高等院校和科研院所科技成果的有效转化，解决企业在技术创新、转型升级过程中遇到的各类技术难题，了解各单位在人才、投融资等方面的需求。</p>
	                    <img src="${ctx}/js_css_image/front/images/wl01.png" width="170" height="148" alt="" title="" />
	                </li>
	                <li>
	                	<h4><a href="${ctx}/wztg/index_1.html" target="_blank">网站托管</a></h4>
	                    <p>为推动高等院校和科研院所科技成果的有效转化，解决企业在技术创新、转型升级过程中遇到的各类技术难题，了解各单位在人才、投融资等方面的需求。</p>
	                    <img src="${ctx}/js_css_image/front/images/wl02.png" width="170" height="148" alt="" title="" />
	                </li>
	                <li>
	                	<h4><a href="${ctx}/xnzj/index_1.html" target="_blank">虚拟主机</a></h4>
	                    <p>为推动高等院校和科研院所科技成果的有效转化，解决企业在技术创新、转型升级过程中遇到的各类技术难题，了解各单位在人才、投融资等方面的需求。</p>
	                    <img src="${ctx}/js_css_image/front/images/wl03.png" width="170" height="148" alt="" title="" />
	                </li>
	            </ul>
	        </div><!--网络服务结束-->
	        <!--创业支持开始-->
	        <div class="cyzc">
	        	<div class="wltitle">
	            	<span class="wlfront">创业支撑</span>                
	                <span class="wlback"><img src="${ctx}/js_css_image/front/images/main_right.jpg" /></span>
	                <a href="${ctx}/zlfwjs/index_1.html" target="_blank"><img src="${ctx}/js_css_image/front/images/more.jpg" /></a>
	            </div>
	            <dl class="zcdl">
	            	<dt><img src="${ctx}/js_css_image/front/images/js01.jpg" width="99" height="90" alt="" title="" /></dt>
	                <dd>
	                	<h4><a href="${ctx}/zlfwjs/index_1.html" target="_blank">专利服务介绍</a></h4>
	                    <p>为推动高等院校和科研院所科技成果的有效转化，解决企业在技术创新、转型升级过程中遇到的各类技术难题，了解各单位在人才、投融资等方面的需求。</p>
	                </dd>
	            </dl>
	            <dl class="zcdl">
	            	<dt><img src="${ctx}/js_css_image/front/images/js01.jpg" width="99" height="90" alt="" title="" /></dt>
	                <dd>
	                	<h4><a href="${ctx}/kjwxjs/index_1.html" target="_blank">科技文献检索</a></h4>
	                    <p>为推动高等院校和科研院所科技成果的有效转化，解决企业在技术创新、转型升级过程中遇到的各类技术难题，了解各单位在人才、投融资等方面的需求。</p>
	                </dd>
	            </dl>            
	        </div><!--创业支持结束-->
	    </div><!--左侧内容结束-->
	    <div class="contright">
	    	<!--人才库开始-->
	        <div class="rencai">
	        	<div class="rctitle">科技人才库</div>
	            <div class="rcku">
	            	<ul class="rcul">
	                	<li><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/rc.jpg" width="105" height="110" alt="" title="" /></a></li>
	                    <li><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/rc.jpg" width="105" height="110" alt="" title="" /></a></li>
	                    <li><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/rc.jpg" width="105" height="110" alt="" title="" /></a></li>
	                    <li><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/rc.jpg" width="105" height="110" alt="" title="" /></a></li>
	                </ul>
	                <div class="clearbh"></div>
	                <div class="kumore"><a href="#" target="_blank">查看更多</a></div>
	            </div>
	        </div>
	        <!--人才库结束-->
	        <!--专家库开始-->
	        <div class="zhuanjia">
	        	<div class="rctitle">专家导师库</div>
	            <div class="zjku">
	            	<dl class="rcdl">
	                	<dt><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/zj.jpg" width="75" height="90"></a></dt>
	                    <dd>
	                    	<h4><b>专家姓名：</b>吴振强</h4>
	                        <p><b>研究成果：</b>为推动高等院校和科研院所科技成果的有效转化，解决为推动高等院校和科研院所科技成果的有效转化，解决为推动高等院校和科研院所科技成果的有效转化，解决</p>
	                    </dd>
	                </dl>
	                <dl class="rcdl">
	                	<dt><a href="#" target="_blank"><img src="${ctx}/js_css_image/front/images/zj.jpg" width="75" height="90"></a></dt>
	                    <dd>
	                    	<h4><b>专家姓名：</b>吴振强</h4>
	                        <p><b>研究成果：</b>为推动高等院校和科研院所科技成果的有效转化，解决为推动高等院校和科研院所科技成果的有效转化，解决为推动高等院校和科研院所科技成果的有效转化，解决</p>
	                    </dd>
	                </dl>
	                <div class="kumore"><a href="#" target="_blank">查看更多</a></div>
	            </div>
	        </div>
	        <!--专家库结束-->
	    </div><!--右侧内容结束-->
	</div>
	<!--服务、库结束-->
	<!--科技成果开始-->
	<div class="container">
		<div class="chengguo">
	    	<div class="wltitle">
	        	<span class="wlfront">科技成果</span>                
	            <span class="wlback"><img src="${ctx}/js_css_image/front/images/main_right.jpg" /></span>
	            <a href="#"><img src="${ctx}/js_css_image/front/images/more.jpg" /></a>
	        </div>
	        <ul class="cgku">
	        	<li><a href="#" target="_blank">为推动高等院技成果的有效转化，解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动高等院校和科研技成果的有效转化，解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动高等院校和研院所科技成果的有效转化，解决企解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动高等院校和科研院所科企业在技术创新解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动所科技成果的有效转化，解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动高等院校和科研院解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动高等院校和科研院所科企业在技术创新解决企业在技术创新</a></li>
	            <li><a href="#" target="_blank">为推动所科技成果的有效转化，解决企业在技术创新</a></li>
	        </ul>
	    </div>
	</div>
	<!--科技成果结束-->
   <#--正文结束-->
	
   <#--友情链接开始-->
   <#include "/WEB-INF/ftl/includes/links.html">
   <#--友情链接结束-->
	
   <#--底部开始-->
   <#include "/WEB-INF/ftl/includes/footer.html">
   <#--底部结束-->
</body>
</html>