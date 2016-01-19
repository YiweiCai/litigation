<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
     <script type="text/javascript">
		
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
				$("#userForm").attr("action","${ctx4ej }/lawsuit/laxx_list.do").submit();
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
	   <div class="phead">
			<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： <my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - <my:i18n zhText="立案审核" enText="立案审核"/> 
			</div>
			<div class="pheadbutton">
			   <!--   <input type="button" class="button orange"  value="刷新" id="refreashButton"/> -->
			   <input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />
			   <my:auth fixedValue="W" value="${auth}">
				  
				   <!--
				    <input type="button" class="button orange"  value="<my:i18n zhText="添加用户" enText="Add A New User"/>"  id="addnewButton"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导入用户" enText="Import Users"/>"  id="importExcel"/> 
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出excel" enText="Export Excel"/>"  id="exportExcel"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出word" enText="Export Word"/>"  id="exportWord"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出pdf" enText="Export Pdf"/>"  id="exportPdf"/>
				  -->
			   </my:auth>
			</div>
			<div class="clear"></div>
			</div>
		   <form action="${ctx4ej }/lawsuit/laxx_list.do" method="post" id="userForm">
			   <div class="psearchhead">
					案件类型：<my:select pvalue="ajlx" name="lsLaxx.ajlx"  firstoption="--"/>&nbsp;&nbsp;
		状态：<my:select pvalue="state" name="lsLaxx.state"  firstoption="--"/>
			  </div>	
		          <%-- 
		            <input type="hidden" name="deptId" value="${deptId }"/>
		            <input type="hidden" name="roleId" value="${roleId }"/>
		          --%>
		           <table class="ltable" width="100%">
			            <thead class="ltablehead">
			                <tr>
			                	<th width="4%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="4%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th width="10%"><my:i18n zhText="案件类型" enText="案件类型"/><my:order orderattr="laxx.ajlx"/></th>
			                	<th width="10%"><my:i18n zhText="诉的种类" enText="诉的种类"/><my:order orderattr="laxx.sdzl"/></th>
			                	<th width="10%"><my:i18n zhText="状态" enText="状态"/><my:order orderattr="laxx.state"/></th>
			                	<th width="15%"><my:i18n zhText="申请日期" enText="Create Time"/><my:order orderattr="laxx.createTime"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th style="width: 15%"><my:i18n zhText="操作" enText="Action"/></th>
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
									<td align="center"><input type="checkbox" name="ids" value="${laxx.id}"/></td>
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									
									<td><my:view value="${laxx.ajlx}" pvalue="ajlx"/> </td>
									<td><my:view value="${laxx.sdzl}" pvalue="sdzl"/> </td>
									<td><my:view value="${laxx.state}" pvalue="state"/> </td>
									<td>${laxx.createTime}</td>
									<td align="center">
								      <my:auth fixedValue="W" value="${auth}">
									   <a href="${ctx4ej }/lawsuit/laxx_shenhe.do?id=${laxx.id}"><my:i18n zhText="审核" enText="Edit"/></a>
									   <%--<a href="javascript:" title="resetpassword" onclick="resetPassword('<my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>','${user.id}')"><my:i18n zhText="重置密码" enText="Reset Password"/></a>	 --%>
									   </my:auth>
									</td>
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