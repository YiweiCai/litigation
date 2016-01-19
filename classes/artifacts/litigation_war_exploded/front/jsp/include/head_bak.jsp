<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="header">
	<div class="logo">
        <img src="${ctx}/js_css_image/front/images/logo.png" width="980" height="63" alt="" title="" />                
    </div>
</div><!--头部结束-->
<!--导航开始-->
<div class="nagviton">
	<div class="menu">
    	<ul class="navmenu">
        	<li class="wzli"><a href="${ctx}/index.htm">首&nbsp;&nbsp;页</a></li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a></li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=4028e30a4d5a9ef3014d5abe758a0001">新闻中心</a>
            	
            </li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=4028e3484d676c2a014d6784a4990000">裁判文书</a></li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=4028e3484daf29d7014daf45db5a0000">诉讼服务</a>
            	<ul>
                	<li><a href="${ctx}/lawsuit/laxx_add.do">网上立案</a></li>
                </ul>
            </li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=402881ea4ef7a0da014ef8023a56001e">典型案例</a></li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=402881ea4ef7a0da014ef802dfda001f">法律法规</a></li>
            <li class="sxli"><img src="${ctx}/js_css_image/front/images/sx.png" width="2" height="47" alt="" title="" /></li>
            <li class="wzli"><a href="${ctx}/cms/article_flist.htm?channelId=402881ea4ef7a0da014ef80306170020">庭审直播</a></li> 
                 
        </ul>
        <ul id="ulLogin" class="nav">
        	<li class=""><a>登录</a>
            	<div class="nav_slide">
            		<form id="loginFormIndex" action="${ctx}/login/login_login.do" method="post">
	                	<p id="errorMsg" style="visibility:hidden;">用户名或密码有误，请重新输入</p>
	                    <dl>                    	
	                        <dd><input id="loginNameIndex" name="loginName" placeholder="请输入用户名" title="请输入用户名" type="text" class="inputtext" maxlength="20" /></dd>                                             
	                    </dl>
	                    <dl>                    	
	                        <dd><input id="passwordIndex" name="password" placeholder="请输入密码" title="请输入密码" type="password" class="inputtext" maxlength="20" /></dd>                                             
	                    </dl>
	                    <button id="btnLogin" class="fm-button" onclick="return false;">登录</button>
                    </form>
                    <div class="register"> 
                    	<a style="display:none;" href="zhaohui.html" class="rega left" target="_blank">忘记密码？</a> 
                    	<a href="${ctx }/myCenter/register.htm" class="rega right" target="_blank">免费注册</a> 
                    </div>                
                 </div>
            </li>                
            <li class=""><a href="${ctx }/myCenter/register.htm" target="_blank">注册</a></li>
        </ul>
        <ul id="ulLogged" class="nav" style="display:none;">
        	<c:set var="roleId" value=",${userSession.sysRole.id },"></c:set>
        	<c:choose>
        		<c:when test="${fn:contains(',0,4028e3484d9a91fa014d9a9ce0e00000,4028e3484d9a91fa014d9a9fce50006f,', roleId)}">
        			<h4><span style="cursor:pointer;" title="后台管理" onclick="location='${ctx}/system/layout_layout.do';">${userSession.userName }</span> <a onclick="logout()" href="javascript:void(0);">注销</a></h4>
        		</c:when>
        		<c:otherwise>
        			<h4><span style="cursor:pointer;" title="个人中心" onclick="location='${ctx}/myCenter/info.htm';">${userSession.userName }</span> <a onclick="logout()" href="javascript:void(0);">注销</a></h4>
        		</c:otherwise>
        	</c:choose>
        </ul>
    </div>    
</div><!--导航结束-->
<div class="banner">
	<div class="container">
    	<img src="${ctx}/js_css_image/front/images/banner.jpg" width="980" height="181" title="" alt="" />
    </div>
</div>