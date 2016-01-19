<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<my:head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
</my:head>

<body>
<form id="frm" name="frm" method="post" action="${ctx4ej}/lawsuit/laxx_caseProceed.htm">
    <div class="result">
    <div class="resulttitle">
    ◆查询结果列表</div>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
  <thead>
        <tr class="resultitem">
          <th bgcolor="#1A7AC4">案件类型</th>
          <th bgcolor="#1A7AC4">诉的种类</th>
          <th bgcolor="#1A7AC4">申请日期</th>
          <th bgcolor="#1A7AC4">状态</th>
          <th bgcolor="#1A7AC4">操作</th>
          <th bgcolor="#1A7AC4">来院时间</th>
        </tr></thead>
        <tbody>
        <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有立案申请" enText="No Lawsuit"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="laxx" varStatus="status">
				              <tr id="${laxx.id }">
									
									
									
									<td><my:view value="${laxx.ajlx}" pvalue="ajlx"/> </td>
									<td><my:view value="${laxx.sdzl}" pvalue="sdzl"/> </td>
									
									<td>${laxx.createTime}</td>
									<td>
										
										<c:choose>
											<c:when test="${laxx.state eq '1'}">
												<a href="${ctx4ej }/lawsuit/laxx_showYyly.do?id=${laxx.id}">预约来院时间</a>
											</c:when>
											<c:otherwise>
												<my:view value="${laxx.state}" pvalue="state"/> 
											</c:otherwise>
										
										</c:choose>
									</td>
									<td align="center">
								      
									   <a href="${ctx4ej }/lawsuit/laxx_detail.do?id=${laxx.id}">查看详细</a>
									   
									</td>
									
									<td>${laxx.yyrq}</td>
								</tr>
				              </c:forEach>
       </tbody>
      </table>
    
    
    
    
    <div class="lpage"><my:page page="${page}"/></div> 
    
  </div>
    
    </form>
    
    
    
 


</body>
</html>
