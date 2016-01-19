<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
     <script type="text/javascript">
		var listurl = "${ctx4ej }/lawsuit/laxx_flist.do";
        var addnewurl = "${ctx4ej}/system/user_add.do?deptId=${deptId}&roleId=${roleId}";
		var deleteurl = "${ctx4ej }/system/user_delete.do";
		$(function() {
			//alert($.i18n("lang"));
			//alert($.i18n("helloParam",["12222","233333"]));
			$(".roletd").each(function(){
				var t = $.trim($(this).text());
				$(this).html(t.substring(0,t.length-1));
			});
			$("#exportExcel").click(function(){
				$("#userForm").attr("action","${ctx4ej }/system/userreport_exportExcel.do").submit();
			});
			$("#exportWord").click(function(){
				$("#userForm").attr("action","${ctx4ej }/system/userreport_exportWord.do").submit();
			});
			$("#exportPdf").click(function(){
				$("#userForm").attr("action","${ctx4ej }/system/userreport_exportPdf.do").submit();
			});
			$("#searchButton").click(function(){
				$("#userForm").attr("action",listurl).submit();
			});
			
			
		    
		    $("#addnewButton").click(function(){window.location.href=addnewurl;});
		    
		    
		});
		
		function reload(){
		    location.reload();
		}
	</script>
</my:head>
<body>
<div class="bodybox">
	  
		   <form action="${ctx4ej }/lawsuit/laxx_flist.do" method="post" id="userForm">
			 	
		          <%-- 
		            <input type="hidden" name="deptId" value="${deptId }"/>
		            <input type="hidden" name="roleId" value="${roleId }"/>
		          --%>
		           <table class="ltable" width="100%">
			            <thead class="ltablehead">
			                <tr>
			                	
			                  	
			                	<th width="10%"><my:i18n zhText="案件类型" enText="案件类型"/></th>
			                	<th width="10%"><my:i18n zhText="诉的种类" enText="诉的种类"/></th>
			                	<th width="10%"><my:i18n zhText="状态" enText="状态"/></th>
			                	<th width="15%"><my:i18n zhText="申请日期" enText="Create Time"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th width="15%"><my:i18n zhText="操作" enText="操作"/></th>
			                	<th style="width: 10%"><my:i18n zhText="来院时间" enText="来院时间"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有立案申请" enText="No Lawsuit"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="laxx" varStatus="status">
				              <tr id="${laxx.id }">
									
									
									
									<td><my:view value="${laxx.ajlx}" pvalue="ajlx"/> </td>
									<td><my:view value="${laxx.sdzl}" pvalue="sdzl"/> </td>
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
									<td>${laxx.createTime}</td>
									<td align="center">
								      
									   <a href="${ctx4ej }/lawsuit/laxx_detail.do?id=${laxx.id}">查看详细</a>
									   
									</td>
									<td>${laxx.yyrq}</td>
								</tr>
				              </c:forEach>
			            </tbody>
		         </table>
		       <div class="ltablebottom">
		           
			       <div class="lpage"><my:page page="${page}"/></div> 
			  </div>
	       </form>
	       
	     
</div>
</body>
</html>