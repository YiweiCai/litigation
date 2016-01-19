<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript"  src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
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
			
			
		    
		    $("#addnewButton").click(function(){window.location.href=addnewurl;});
		    
		    
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
	   <div class="phead">
			<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： <my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - 判后答疑回复
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
		   <form action="${ctx }/lawsuit/xf_list.do" method="post" id="userForm">
			   <div class="psearchhead">
					
		回复方式：<my:select pvalue="replyWay" name="lsXf.replyWay"  firstoption="--"/>
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
			                	<th width="10%"><my:i18n zhText="姓名" enText="案件类型"/></th>
			                	<th width="10%"><my:i18n zhText="手机号码" enText="手机号码"/></th>
			                	<th width="10%">证件号码</th>
			                	<th width="15%"><my:i18n zhText="提交日期" enText="Create Time"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th style="width: 15%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有判后答疑信息" enText="No Data"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="xf" varStatus="status">
				              <tr id="${xf.id }">
									<td align="center"><input type="checkbox" name="ids" value="${xf.id}"/></td>
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									
									<td>${xf.name}</td>
									<td>${xf.sjhm}</td>
									<td>${xf.zjhm}</td>
									<td>${xf.createTime}</td>
									<td align="center">
								      <my:auth fixedValue="W" value="${auth}">
								      <c:choose>
								      	<c:when test="${xf.replyWay eq '3'}">
								      		<a href="${ctx }/lawsuit/xf_showReply.do?id=${xf.id}"><my:i18n zhText="回复" enText="Edit"/></a>	
								      	</c:when>
								      	<c:otherwise>
								      		<a href="${ctx }/lawsuit/xf_detail.do?id=${xf.id}"><my:i18n zhText="查看详细" enText="Edit"/></a>	
								      	</c:otherwise>
								      </c:choose>
									   
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