<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<my:head datePicker="true">
    <title>历史回顾</title>
    <link href="${ctx}/js_css_image/css/index.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        var listurl = "${ctx4ej }/lawsuit/uv_flistVideo.htm";
        // 获取页面跳转参数
        function getParams() {
            return "type=${type}";
        }

        //window.parent.document.getElementById("iframepage").setAttribute("height", "1080");

    </script>

</my:head>

<body>
<div class="guidetext">
    <form action="${ctx4ej }/lawsuit/uv_flistVideo.htm" id="frm" method="post">


        <div class="content">
            <div class="titlebg">历史回顾</div>
            <div class="cou">
                <ul>
                    <c:forEach items="${page.list }" var="d">

                        <li><a href="${ctx4ej }/lawsuit/uv_view.htm?coid=${d[0].id}" target="coview">
                            <img alt="" src="${ctx}/${d[1]}"
                                 onerror="this.src='${ctx}/js_css_image/images/video_18.jpg'" width="230px"
                                 height="150px">

                            <div class="namefont" title="${d[0].title }">${d[0].title }</div>
                            <span>来源:${d[0].courtroom }&nbsp;&nbsp;&nbsp;&nbsp;时间:${d[0].issueTime }</span>
                        </a>
                        </li>

                    </c:forEach>

                </ul>

            </div>
        </div>
        <div class="newspage">
            <%@ include file="/front/jsp/include/pager.jsp" %>
        </div>
    </form>

</body>
</html>
