<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript"  src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
    <link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
		var listurl = "${ctx }/lawsuit/xf_list.do";
        var addnewurl = "${ctx}/system/user_add.do?deptId=${deptId}&roleId=${roleId}";
		var deleteurl = "${ctx }/system/user_delete.do";
		$(function() {
			//alert($.i18n("lang"));
			//alert($.i18n("helloParam",["12222","233333"]));
			$(".roletd").each(function(){
				var t = $.trim($(this).text());
				$(this).html(t.substring(0,t.length-1));
			});
			$("#exportExcel").click(function(){
				$("#userForm").attr("action","${ctx }/system/userreport_exportExcel.do").submit();
			});
			$("#exportWord").click(function(){
				$("#userForm").attr("action","${ctx }/system/userreport_exportWord.do").submit();
			});
			$("#exportPdf").click(function(){
				$("#userForm").attr("action","${ctx }/system/userreport_exportPdf.do").submit();
			});
			$("#searchButton").click(function(){
				$("#userForm").attr("action",listurl).submit();
			});
		    function goBack(){
		    	window.parent.document.getElementById("laxx_add").setAttribute("class","selected");
		    }
		   
		    
		});
		
		function reload(){
		    location.reload();
		}
	</script>
	<script type="text/javascript">
 $(function() {
        
        $("table tr:nth-child(even)").addClass("striped");
      });
</script>
</my:head>
<body>
<div class="bodybox">
	   
			<div class="resulttitle"> ◆未提交立案</div>
			
		   <form action="${ctx }/lawsuit/xf_list.do" method="post" id="userForm">
			  	
		          <%-- 
		            <input type="hidden" name="deptId" value="${deptId }"/>
		            <input type="hidden" name="roleId" value="${roleId }"/>
		          --%>
		           <table class="table" width="100%">
			            <thead >
			                <tr class="resultitem">
			                	<th width="4%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="4%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th width="11%"><my:i18n zhText="操作时间" enText="Create Time"/></th>
			                	<th width="20%">诉讼请求</th>
			                	<th width="10%">当前阶段</th>
			                	<th style="width: 10%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有未提交立案" enText="No Data"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="wc" varStatus="p">
				              <tr id="${wc.id }">
									<td align="center"><input type="checkbox" name="ids" value="${wc.id}"/></td>
									<td align="center">${p.index}</td>
									<td>${wc.createTime}</td>
									<td>${wc.ssqq }</td>
									<td>
										<c:choose>
											<c:when test="${wc.dqjd=='1'}">添加当事人信息</c:when>
											<c:when test="${wc.dqjd=='2'}">添加被告人信息</c:when>
											<c:when test="${wc.dqjd=='3'}">添加诉讼请求</c:when>
										</c:choose>
									</td>
									<td align="center">
								     <a href="${ctx }/lawsuit/laxx_deleteWWC.do?id=${wc.id}"><my:i18n zhText="删除" enText="Edit"/></a>
								     &nbsp;&nbsp;
								     <a onclick="goBack()" href="${ctx }/lawsuit/laxx_goBack.do?coid=${wc.id}&goTo=${wc.dqjd}"><my:i18n zhText="继续填写" enText="Edit"/></a>
									</td>
								</tr>
				              </c:forEach>
			            </tbody>
		         </table>
		           
			       <div class="lpage"><my:page page="${page}"/></div> 
			 
	       </form>
	       
	     
</div>
</body>
</html>