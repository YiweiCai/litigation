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
				$("#userForm").attr("action","${ctx4ej }/lawsuit/lo_list.do").submit();
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
			   <%--<input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />--%>
			   
			</div>
			<div class="clear"></div>
			</div>
		   <form action="${ctx4ej }/lawsuit/lo_list.do" method="post" id="userForm">
			   <!-- <div class="psearchhead">
					案件类型：<my:select pvalue="ajlx" name="lsLaxx.ajlx"  firstoption="--"/>&nbsp;&nbsp;
		状态：<my:select pvalue="state" name="lsLaxx.state"  firstoption="--"/>
			  </div> -->	
		          <%-- 
		            <input type="hidden" name="deptId" value="${deptId }"/>
		            <input type="hidden" name="roleId" value="${roleId }"/>
		          --%>
		           <table class="ltable" width="100%">
			            <thead class="ltablehead">
			                <tr>
			                	<th width="4%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="4%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th width="10%"><my:i18n zhText="提问标题" enText="提问标题"/><my:order orderattr="laxx.ajlx"/></th>
			                	<th width="10%"><my:i18n zhText="提问类别" enText="提问类别"/><my:order orderattr="laxx.sdzl"/></th>
			                	<th width="15%"><my:i18n zhText="申请日期" enText="Create Time"/><my:order orderattr="laxx.createTime"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th style="width: 15%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有提问问题" enText="No Lawsuit"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="lo" varStatus="status">
				              <tr id="${lo.id }">
									<td align="center"><input type="checkbox" name="ids" value="${lo.id}"/></td>
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									<td align="center">${lo.questionTitle }</td>
									
									<td align="center">${lo.questionType } </td>
									<td align="center">${lo.createTime} </td>
									<td align="center">
									<c:choose>
										<c:when test="${empty lo.status||lo.status=='0' }"><a href="${ctx4ej }/lawsuit/lo_edit.do?loid=${lo.id}&type=${type}"><my:i18n zhText="回复" enText="reply"/></a></c:when>
										<c:when test="${lo.status=='1' }"><a href="${ctx4ej }/lawsuit/lo_view.do?loid=${lo.id}&type=${type}">查看</a></c:when>
									</c:choose>
									   <%--<a href="javascript:" title="resetpassword" onclick="resetPassword('<my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>','${user.id}')"><my:i18n zhText="重置密码" enText="Reset Password"/></a>	 --%>
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