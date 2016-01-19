<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true" tree3="true">
	 <link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
     <script type="text/javascript">
		var listurl = "${ctx }/lawsuit/xf_flist.do";
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
		    $("#add").click(function(){window.location.href="${ctx }/lawsuit/xf_add.htm";});
		    
		});
		
		function reload(){
		    location.reload();
		}
	</script>
</my:head>
<body>
<div class="bodybox">
	   	<div class="resulttitle"> ◆判后答疑</div>
		   <form action="${ctx }/lawsuit/xf_flist.do" method="post" id="userForm">
			  	
		          <%-- 
		            <input type="hidden" name="deptId" value="${deptId }"/>
		            <input type="hidden" name="roleId" value="${roleId }"/>
		          --%>
		          <table class="table" width="100%">
			            <thead >
			                <tr class="resultitem">
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
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有答疑信息" enText="No Data"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="xf" varStatus="status">
				              <tr id="${xf.id }">
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									
									<td>${xf.name}</td>
									<td>${xf.sjhm}</td>
									<td>${xf.zjhm}</td>
									<td>${xf.createTime}</td>
									<td align="center">
								      <my:auth fixedValue="W" value="${auth}">
								      
								      		<a href="${ctx }/lawsuit/xf_fdetail.do?id=${xf.id}"><my:i18n zhText="查看详细" enText="Edit"/></a>	
								      	
									   
									   <%--<a href="javascript:" title="resetpassword" onclick="resetPassword('<my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>','${user.id}')"><my:i18n zhText="重置密码" enText="Reset Password"/></a>	 --%>
									   </my:auth>
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