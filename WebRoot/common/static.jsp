<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:choose>

    <c:when test="${requestNameSpace eq 'xzfy'}">
        <div class="copyrightbg">
            <div class="copyright">服务中心咨询电话：0371-62671216 &nbsp;&nbsp;
                <c:choose>
                    <c:when test="${empty user }">
                        <a href="${ctx4ej}/system/layout_layout.do">登录</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx4ej}/system/layout_layout.do"><my:i18n zhText="${user.userName}" enText="${user.enUserName}"/></a>
                    </c:otherwise>
                </c:choose>
                <br/>
                地址：河南省新郑市金城路中段 <br/>版权所有：河南省新郑市人民法院&nbsp;&nbsp;豫ICP备12000402号-1<br/>
                技术支持 ： 北京易云华控技术有限公司
                <!-- <div class="weixin">
                    <ul><li><img src="/xzfy/js_css_image/images/sina.jpg" /><br />郑州中院新浪微博</li><li class="top20"><img src="/xzfy/js_css_image/images/jiguan.jpg" /></li><li><img src="/xzfy/js_css_image/images/weixin.jpg" /><br />郑州中院官方微信</li></ul></div>
                </div> -->
            </div>
        </div>
    </c:when>
    <c:when test="${requestNameSpace eq 'xyfy'}">
        <div class="copyrightbg">
            <div class="copyright">服务中心咨询电话：0371-64601832 &nbsp;&nbsp;
                <c:choose>
                    <c:when test="${empty user }">
                        <a href="${ctx4ej}/system/layout_layout.do">登录</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx4ej}/system/layout_layout.do"><my:i18n zhText="${user.userName}" enText="${user.enUserName}"/></a>
                    </c:otherwise>
                </c:choose><br/>
                地址：荥泽大道与康泰路交叉路口<br/>版权所有：河南省郑州市荥阳市人民法院&nbsp;&nbsp;豫ICP备12000402号-1<br/>
                技术支持 ： 北京易云华控技术有限公司
                <!-- <div class="weixin">
                    <ul><li><img src="/xyfy/js_css_image/images/sina.jpg" /><br />郑州中院新浪微博</li><li class="top20"><img src="/xyfy/js_css_image/images/jiguan.jpg" /></li><li><img src="/xyfy/js_css_image/images/weixin.jpg" /><br />郑州中院官方微信</li></ul></div>
                </div> -->
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="copyrightbg">
            <div class="copyright">服务中心咨询电话：0371-69520000&nbsp;&nbsp;
                <c:choose>
                    <c:when test="${empty user }">
                        <a href="${ctx4ej}/system/layout_layout.do">登录</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx4ej}/system/layout_layout.do"><my:i18n zhText="${user.userName}" enText="${user.enUserName}"/></a>
                    </c:otherwise>
                </c:choose><br/>
                地址：郑州市郑东新区金水东路与黄河南路交叉口向东200米<br />
                版权所有：郑州市中级人民法院 &nbsp;&nbsp;豫ICP备15036078号-1<br />
                技术支持 ： 北京易云华控技术有限公司
            </div>
        </div>
    </c:otherwise>

</c:choose>
