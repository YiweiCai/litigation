<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head tree3="true" datePicker="true" lhgdialog="true">
     <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
	<script type="text/javascript">
	    var checkSetting;
	    var radioSetting;
		//dept数据
		var curDeptId = "${user.sysDept.id}";
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
       
        var addordetail = true;
		var tolisturl = "${ctx4ej}/system/user_list.do?deptId=${deptId}&roleId=${roleId}";
		$(function(){
			
			$("input[type='text']").lengthLimit();
			$(".number").number();
	    	$(".Wdate").click(function(){
	    		WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',lang:$.i18n("lang")});
	        });
	    	//$("#showPassword").click(function(){$(".passWord").showHidePassword();});
	    	
	    	//setting.expandSpeed = ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast";
			//zTree = $("#tree").zTree(setting, zNodes);
			
			$("#submitBtn").submitForm({ 
				formId:"userForm",
				onComplete:function(){
				    window.location.href = tolisturl;
				}
			});
			
			$("#tolistButton").click(function(){window.location.href=tolisturl;});
			
			$.fn.zTree.init($("#deptTree"), radioSetting, zNodesDept);
			$.fn.zTree.init($("#roleTree"), checkSetting, zNodesRole);
			
			   $("#selectDept").click(function(){
					var url = 'system/dept_chooseDept.do?id='+$("#deptId").val();
					$.dialog({
						title:'选择部门',
						content: 'url:'+url,
					    width: '700px',
					    height: 500,
					    data:$("#deptId").val()
					});
					$("label[for='deptName']").html("");
			  });
			
			
			$("#tree :checkbox").change(function(){
				$("label[for='roleIds']").html("");
			})
		});
        function zTreeOnChange(){
        	$("label[for='roleIds']").html("");
        }

	</script>
</my:head>
<body>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： <my:i18n zhText="用户管理" enText="User Mgt"/> - <my:i18n zhText="添加用户" enText="Add A New User"/></div>
	<div  class="pheadbutton">
	   <input type="button" class="button orange" value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
	    <div id="result" align="center" style="color: red"></div>
		  <form id="userForm" action="${ctx4ej}/system/user_save.do" method="post">
		   <table width="100%" class="ftable">
	           <tr>
	            <td colspan="4" style="padding-left: 20px"><b><my:i18n zhText="登录信息" enText="The Info Of Login"/></b></td>
	          </tr>
          <tr>
            <th width="12%"><font color="red">*</font><my:i18n zhText="帐号" enText="Account"/>：</th>
            <td>
              <input type="text" name="loginName" value="" id="loginName"  rules="[{notNull:true, message:'<my:i18n zhText="请输入账号" enText="Please Enter Account"/>'}]"></input>
            </td>
            <th width="12%"><font color="red">*</font><my:i18n zhText="密码" enText="Password"/>：</th>
            <td>
               <input type="password" name="passWord" id="passWord" value="123456" class="passWord" style="width: 148px;height: 16px" rules="[{notNull:true, message:'<my:i18n zhText="请输入密码" enText="Please Enter Password"/>'}]"/>
               <my:i18n zhText="【注：密码默认为123456】" enText="[The Password default is 123456]"/>
             </td>
          </tr>
          <tr>
            <td colspan="4" style="padding-left: 20px"><b><my:i18n zhText="基本信息" enText="Basic Infomation"/></b></td>
          </tr>
          <tr>
            <th ><font color="red">*</font><my:i18n zhText="姓名" enText="Chinese Name"/>：</th>
            <td><input type="text" name="userName" value="${userName}" id="userName" rules="[{notNull:true, message:'<my:i18n zhText="请输入姓名" enText="Please Enter User Name"/>'}]"/></td>
            <th ><font color="red">*</font><my:i18n zhText="性别" enText="Gender"/>：</th>
            <td><my:radio pvalue="sex" name="sex" value="M"/></td>
          </tr>
           <tr>
            <th ><font color="red">*</font><my:i18n zhText="部门" enText="Deptment"/>：</th>
            <td>
                <input id="deptName" type="text" readonly="readonly" value="${user.sysDept.deptName}"  rules="[{notNull:true, message:'<my:i18n zhText="请选择部门" enText="Please Choose Dept"/>'}]" onclick="showTreeList('deptTree'); return false;"/>
                <my:auth fixedValue="W" value="${auth}"><a style="cursor: pointer; display: none" id="selectDept" >另一种方式选择部门</a></my:auth>
                <input type="hidden" name="deptId" id="deptId" value="${user.sysDept.id}"/>
            </td>
         
            <th ><font color="red">*</font><my:i18n zhText="角色" enText="Role"/>：</th>
            <td>
				<input id="roleNames" type="text" readonly="readonly" value="" rules="[{notNull:true, message:'<my:i18n zhText="请选择角色" enText="Please Choose Role"/>'}]" onclick="showTreeList('roleTree'); return false;"/>&nbsp;
                <input type="hidden" name="roleIds" id="roleIds" value="" />
             <%--
             <select name="roleId"> 
                 <c:forEach items="${roleList}" var="role">
                   <option value="${role.id }">${role.roleName }</option>
                  </c:forEach>
             </select>
             --%>
            </td>
          </tr>
           <tr>
            <th ><my:i18n zhText="手机" enText="Moblie Telephone"/>：</th>
            <td><input type="text" name="mphone" value="${mphone}" id="mphone" class="number" number="11" rules="[{isDigit:true, message:'只能是数字'}]"/></td>
            <th ><%--<font color="red">*</font>--%><my:i18n zhText="邮箱" enText="Email"/>：</th>
             <td><input type="text" name="mailbox" value="${mailbox}" id="mailbox" rules="[{isEmail:true,message:'电子邮件格式不正确'}]"/></td>
          </tr>
          <c:if test="${sessionUser.userRoleType == 'Y' }">
	          <tr>
	            <th >超级管理员：</th>
	            <td colspan="3">
	              <my:radio pvalue="yesornot" name="userRoleType" value="N"/>
	            </td>
	          </tr>
          </c:if>
          <tr>
            <th >地址：</th>
            <td colspan="3">
              <input type="text" name="workPlace" value="${workPlace}" id="workPlace" size="50" maxlength="50"/><span id="limitMsg"></span>
              <div id="func">
              
              </div>
            </td>
          </tr>
         <%--
          <tr>
            <th>用户类型：</th>
            <td>
                <input type="radio" name="userRoleType" value="1"/>系统管理员&nbsp;&nbsp;&nbsp;
                <input type="radio" name="userRoleType" value="2" checked="checked"/>普通用户
            </td>
          </tr>
          
          <tr>
            <th >桌面设置：</th>
            <td colspan="3">
              <my:checkbox pvalue="zmsz" name="myselfDesk" checked="checked"/>
            </td>
          </tr>
         --%>
           <tr>
			<td colspan="4" class="ftablebutton">
				<my:auth fixedValue="W" value="${auth}">
				   <input type="button" class="button orange" class="button orange"  value="<my:i18n zhText="保存" enText="Save"/>" id="submitBtn"/> &nbsp; 
				   <input type="reset" class="button orange"  class="button orange" value="<my:i18n zhText="重置" enText="Reset"/>"/>
				</my:auth>
			</td>
	      </tr>
        </table>
        </form>
        
         <div id="menuContentDeptTree" class="menuContentDeptTree" style="display:none; position: absolute;">
			<ul id="deptTree" class="ztree" style="margin-top:0;border: 1px solid #617775;background: #f0f6e4;width:180px;height:300px;overflow-y:scroll;overflow-x:auto;"></ul>
	    </div>
	    <div id="menuContentRoleTree" class="menuContentRoleTree" style="display:none; position: absolute;">
			<ul id="roleTree" class="ztree" style="margin-top:0;border: 1px solid #617775;background: #f0f6e4;width:180px;height:200px;overflow-y:scroll;overflow-x:auto;"></ul>
	    </div>
    </div>
</body>
</html>