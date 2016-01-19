<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
     <script type="text/javascript">
		//dept数据
		var curDeptId = "${deptId}";
		var treeNodeArrayDept = new Array();
		<c:forEach items="${deptList}" var="dept">
				 var pId = "${dept.sysDept.id}";
				 var id = "${dept.id}";
				 var name = "<my:i18n zhText="${dept.deptName}" enText="${dept.enDeptName}"/>";
				 var checked =false;
				 var open = false;
				 if(pId==""){open = true; }
			     if(curDeptId==id){checked = true; open = true;}
				 var oneTreeNode='{id:"'+id+'",pId:"'+pId+'",name:"'+name+'",checked:'+checked+',open:'+open+'}';
				 treeNodeArrayDept.push(oneTreeNode);
		</c:forEach>
	    var zNodeStrDept = '['+treeNodeArrayDept.join(",")+']';
	 	var zNodesDept = (new Function("return " + zNodeStrDept))();//;eval('(' + zNodeStr + ')'); 两种方式转化成json，选其一
		
		//role 数据
		var checkIds = "${roleIds}";
		var checkedIdArray = new Array();
		if(checkIds!=""){checkedIdArray = checkIds.split(",");}
	    var treeNodeArrayRole = new Array();
        <c:forEach items="${roleList}" var="role">
			    var pId = "${role.sysRole.id}";
			    var id = "${role.id}";
			    var name = "<my:i18n zhText="${role.roleName}" enText="${role.enRoleName}"/>";
			    var checked =false;
				if($.containObj(checkedIdArray,id)){
					checked = true;
				}
			    var oneTreeNode='{id:"'+id+'",pId:"'+pId+'",name:"'+name+'",checked:'+checked+', open:true}';
			    treeNodeArrayRole.push(oneTreeNode);
        </c:forEach>
        var zNodeStrRole = '['+treeNodeArrayRole.join(",")+']';
        var zNodesRole = (new Function("return " + zNodeStrRole))();//;eval('(' + zNodeStrRole + ')'); 两种方式转化成json，选其一
		
        <%--var addnewurl = "${ctx}/system/user_add.do?deptId=${deptId}&roleId=${roleId}";--%>
		<%--var deleteurl = "${ctx }/system/user_delete.do";--%>
		var addnewurl = "${ctx4ej}/system/user_add.do?deptId=${deptId}&roleId=${roleId}";
		var deleteurl = "${ctx4ej}/system/user_delete.do";
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
				$("#userForm").attr("action","${ctx4ej }/system/user_list.do").submit();
			});
			
			$.fn.zTree.init($("#deptTree"), radioSetting, zNodesDept);
			$.fn.zTree.init($("#roleTree"), radioSetting, zNodesRole);
			
			$("#clearDept").click(function(){$("#deptName,#deptId").val("");});
			$("#clearRole").click(function(){$("#roleNames,#roleIds").val("");});
		    
		    $("#addnewButton").click(function(){window.location.href=addnewurl;});
		    
		    $("#importExcel").click(function(){
				var url = '${ctx4ej }/system/userreport_toImportUser.do';
				$.dialog({id:'importExcel',title:'<my:i18n zhText="导入用户" enText="Import Users From A Excel"/>',content: 'url:'+url,cancelVal: '关闭',cancel: true,width: '700px',height: 500});
			});
		});
		function resetPassword(userName,id){
			
			if(window.confirm("<my:i18n zhText="您确定要重置用户" enText="Are You Sure To Reset "/>【"+userName+"】<my:i18n zhText="的密码吗？" enText="Password?"/>")){
				$.post("${ctx4ej}/system/user_resetPassword.do", {'id':id}, function(data){
				     alert("<my:i18n zhText="密码重置成功，新密码为:" enText="Password Reset Success,The New Password is:"/>123456");
				 });
			}
		}
		function reload(){
		    location.reload();
		}
	 $(function() {
        
        $("table tr:nth-child(even)").addClass("striped");
      });
		   
	</script>
</my:head>
<body>
<div class="bodybox">
	   <div class="phead">
			<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： <my:i18n zhText="用户管理" enText="User Mgt"/> - <my:i18n zhText="用户列表" enText="The List Of Users"/> 
			</div>
			<div class="pheadbutton">
			   <!--   <input type="button" class="button orange"  value="刷新" id="refreashButton"/> -->
			   <input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />
			   <my:auth fixedValue="W" value="${auth}">
				   <input type="button" class="button orange"  value="<my:i18n zhText="添加用户" enText="Add A New User"/>"  id="addnewButton"/>
				   <!--
				   <input type="button" class="button orange"  value="<my:i18n zhText="导入用户" enText="Import Users"/>"  id="importExcel"/> 
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出excel" enText="Export Excel"/>"  id="exportExcel"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出word" enText="Export Word"/>"  id="exportWord"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出pdf" enText="Export Pdf"/>"  id="exportPdf"/>
				  -->
			   </my:auth>
			</div>
			<div class="clear"></div>
			</div>
		   <form action="${ctx4ej }/system/user_list.do" method="post" id="userForm">
			   <div class="psearchhead">
				<my:i18n zhText="姓名" enText="User Name"/>：<input type="text" name="userName" id="userName" value="${userName }"/>&nbsp;&nbsp;
				<my:i18n zhText="部门" enText="Department"/>：<input id="deptName" type="text" name="deptName" readonly="readonly" value="${deptName}"  onclick="showTreeList('deptTree'); return false;"/>&nbsp;<a style="cursor: pointer;" id="clearDept">[<my:i18n zhText="清空" enText="Clear"/>]</a>&nbsp;
                <input type="hidden" name="deptId" id="deptId" value="${deptId}"/> 
                <my:i18n zhText="角色" enText="Role"/>：<input id="roleNames" type="text" readonly="readonly" name="roleNames" value="${roleNames}" onclick="showTreeList('roleTree'); return false;"/>&nbsp;<a style="cursor: pointer;" id="clearRole">[<my:i18n zhText="清空" enText="Clear"/>]</a>
                <input type="hidden" name="roleIds" id="roleIds" value="${roleIds}" />
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
			                	<th width="10%"><my:i18n zhText="用户姓名" enText="User Name"/><my:order orderattr="user.userName"/></th>
			                	<th width="10%"><my:i18n zhText="性别" enText="Gender"/><my:order orderattr="user.sex"/></th>
			                	<th width="15%"><my:i18n zhText="部门" enText="Department"/><my:order orderattr="user.sysDept.deptName"/></th>
			                	<th width="15%"><my:i18n zhText="角色" enText="Role"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th style="width: 15%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有用户" enText="No User List"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="user" varStatus="status">
				              <tr id="${user.id }">
									<td align="center"><input type="checkbox" name="ids" value="${user.id}"/></td>
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									<td><my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>
								     <!--<a href="${ctx }/system/user_update.do?id=${id}&openInPopup=1" title="${userName}" name="userDetail"><u>${userName}</u></a>
								    --></td>
									<td><my:view value="${user.sex}" pvalue="sex"/> </td>
									<td><my:i18n zhText="${user.sysDept.deptName}" enText="${user.sysDept.enDeptName}"/></td>
									<td class="roletd">
									   <c:if test="${user.sysRoles!=null}">
									       <c:forEach items="${user.sysRoles}" var="role"><my:i18n zhText="${role.roleName}" enText="${role.enRoleName}"/>,</c:forEach>
									   </c:if>
									</td>
									<%--<td>${user.registerTime}</td> --%>
									<td align="center">
								      <my:auth fixedValue="W" value="${auth}">
									   <a href="${ctx4ej }/system/user_update.do?id=${user.id}&deptId=${deptId}&roleId=${roleId}"><my:i18n zhText="编辑" enText="Edit"/></a>
									   <a href="javascript:" title="deletesigle" class="deleteOne" param="ids=${user.id}"><my:i18n zhText="删除" enText="Delete"/></a>	
									   <%--<a href="javascript:" title="resetpassword" onclick="resetPassword('<my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>','${user.id}')"><my:i18n zhText="重置密码" enText="Reset Password"/></a>	 --%>
									   </my:auth>
									</td>
								</tr>
				              </c:forEach>
			            </tbody>
		         </table>
		       <div class="ltablebottom">
		           <div style="float: left; "><my:auth fixedValue="W" value="${auth}"><input type="button" class="button orange buttonwidth"  value="<my:i18n zhText="批量删除" enText="Batch Delete"/>" id="batchDelete"/></my:auth></div>
			       <div class="lpage"><my:page page="${page}"/></div> 
			  </div>
	       </form>
	       
	     <div id="menuContentDeptTree" class="menuContentDeptTree" style="display:none; position: absolute;">
			<ul id="deptTree" class="ztree" style="margin-top:0;border: 1px solid #617775;background: #f0f6e4;width:180px;height:250px;overflow-y:scroll;overflow-x:auto;"></ul>
	    </div>
	    <div id="menuContentRoleTree" class="menuContentRoleTree" style="display:none; position: absolute;">
			<ul id="roleTree" class="ztree" style="margin-top:0;border: 1px solid #617775;background: #f0f6e4;width:180px;height:150px;overflow-y:scroll;overflow-x:auto;"></ul>
	    </div>
</div>
</body>
</html>