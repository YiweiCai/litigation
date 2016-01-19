<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head tree2="true">
   <link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/tab.css"/>
	<style type="text/css">.tree li a:hover {text-decoration:none;}</style>
	<script type="text/javascript">
		 var treeurl="${ctx4ej}/system/role_getMenu.do";
	     var showcheck=true;
	     var customerParam = '${id}';
	        var zTree;
	        var zLmTree;
			var setting = {
					isSimpleData: true,
					checkable: true,
					treeNodeKey: "id",
					treeNodeParentKey: "pId",
					addDiyDom: addDiyDom,
					callback: {
						change:	zTreeOnChange
					}
				};
			var lmSetting = {
					isSimpleData: true,
					checkable: true,
					treeNodeKey: "id",
					treeNodeParentKey: "pId",
					callback: {
						change:	zTreeOnChange
					}
				};
				var zNodes;
				var treeNodeArray = new Array();
				
			    <c:forEach items="${menuList}" var="menu">
				    var pId = "${menu.sysMenu.id}";
				    var id = "${menu.id}";
				    var name = "<my:i18n zhText="${menu.menuName}" enText="${menu.enMenuName}"/>";
				    var _url = "${menu.menuPath}";
				    var checked =false;
				    var oneTreeNode='{id:"'+id+'",pId:"'+pId+'",name:"'+name+'",checked:'+checked+',_url:"'+_url+'"}';
				    treeNodeArray.push(oneTreeNode);
			    </c:forEach>
			    var zNodeStr = '['+treeNodeArray.join(",")+']';
	 		    var zNodes = (new Function("return " + zNodeStr))();//;eval('(' + zNodeStr + ')'); 两种方式转化成json，选其一
	 		    
	 		    
			    var lmTreeNodeArray = new Array();
				
			    <c:forEach items="${channelList}" var="channel">
				    var pId = "${channel.cmsChannel.id}";
				    var id = "${channel.id}";
				    var name = "<my:i18n zhText="${channel.channelName}" enText="${channel.channelName}"/>";
				    //var _url = "${channel.channelName}";
				    var checked =false;
				    var oneTreeNode='{id:"'+id+'",pId:"'+pId+'",name:"'+name+'",checked:'+checked+'}';
				    lmTreeNodeArray.push(oneTreeNode);
			    </c:forEach>
			   	var zLmNodeStr = '['+lmTreeNodeArray.join(",")+']';
	 		    var zLmNodes = (new Function("return " + zLmNodeStr))();//;eval('(' + zNodeStr + ')'); 两种方式转化成json，选其一
				$(function(){
					setting.expandSpeed = ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast";
					zTree = $("#tree").zTree(setting, zNodes);
					zLmTree = $("#tree_lm").zTree(lmSetting, zLmNodes);
					$("#submitBtn").submitForm({ 
						formId:"roleForm",
						onSubmit:function(){
							var checkedNodes = zTree.getCheckedNodes();
				  			if(checkedNodes.length==0){
	                            //alert("请至少选择一个权限");
					  	    }else{
					  			var checkedNodeArray = [];
					  			var rwArray = [];
					  			for(var i=0;i<checkedNodes.length;i++){
					  			      checkedNodeArray.push(checkedNodes[i].id);
					  				  rwArray.push($("#diyBtn_"+checkedNodes[i].id).val());
						  	     }
						  	     var checkIds = checkedNodeArray.join(",");
	                             $("#checkIds").val(checkIds);
	                             
	                             $("#rwAuths").val(rwArray.join(","));
				            	 //return true;
						  	}
						  	
						  	
						  	var checkedLmNodes = zLmTree.getCheckedNodes();
				  			if(checkedLmNodes.length==0){
	                            //alert("请至少选择一个权限");
					  	    }else{
					  			var checkedLmNodeArray = [];
					  			var rwArray = [];
					  			for(var i=0;i<checkedLmNodes.length;i++){
					  			      checkedLmNodeArray.push(checkedLmNodes[i].id);
					  				 // rwArray.push($("#diyBtn_"+checkedLmNodes[i].id).val());
						  	     }
						  	     var checkLmIds = checkedLmNodeArray.join(",");
	                        	$("#checkLmIds").val(checkLmIds);
	                            
				            	 //return true;
						  	}
						  	
						  	
				  			return true;
						},
						onComplete:function(id){
							parent.addNode('contentIframe',$("#parentRoleId").val(),id,$("#${locale.language}RoleName").val(),"/system/role_update.do?id="+id);
						}
					});
				});
		        function zTreeOnChange(){
		        	$("label[for='checkIds']").html("");
		        }
		        
	    var IDMark_A = "_a";
		function addDiyDom(treeId, treeNode) {
			/*
			if (!treeNode.parentNode || treeNode.parentNode.id=='1'){
				return;
			}
			*/
		    if (treeNode._url==''){
		    	return;
		    }
		    var aObj = $("#" + treeNode.tId + IDMark_A);
		    var optionStr = $("select[name='authTree']").attr("id",'diyBtn_" +treeNode.id+ "').html();
		    var editStr = "<select id='diyBtn_" +treeNode.id+ "'>" + optionStr +"</select>";
		    
		    aObj.after(editStr);
			//var btn = $("#diyBtn_"+treeNode.id);
			//if (btn) btn.bind("change", function(){alert("diy Select value="+btn.attr("value")+" for " + treeNode.name);});
	}
	</script>
</my:head>
<body>
    <my:select pvalue="qxsz" name="authTree" nullValue="false" style="display: none"/>
    <div class="bodybox">
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tabs1" >
				<tr>
					<td>
						 <div align="center" id="uldiv">
							<ul>
								<li><a href="${ctx4ej }/system/role_update.do?id=${id }"><span><my:i18n zhText="角色信息" enText="Role Info"/></span></a></li>
								<li><a href="${ctx4ej }/system/role_list.do?id=${id }"><span><my:i18n zhText="下级角色列表" enText="Sub Role List"/></span></a></li>
								<li id="current"><a href="${ctx4ej }/system/role_add.do?id=${id }"><span><my:i18n zhText="新增下级角色" enText="Add A New Role"/></span></a></li>
							</ul>
						    </div>
						</td>
					</tr>
				</table>
		</div>
		  <form id="roleForm" action="system/role_save.do" method="post">
		   <input type="hidden" name="sysRole.id" id="parentRoleId" value="${sysRole.id }">
		   <table width="100%" class="ftable"id="stripe_tb">
		     <c:if test="${!empty sysRole.roleName}">
			    <tr>
		            <th width="18%"><my:i18n zhText="上级角色" enText="Parent Role"/>：</th>
		            <td>
		               <my:i18n zhText="${sysRole.roleName}" enText="${sysRole.enRoleName}"/>
		            </td>
	          </tr>
		   </c:if>
          <tr>
            <th width="18%"><font color="red">*</font><my:i18n zhText="中文角色名称" enText="Chinese Role Name"/>：</th>
            <td><input type="text" id="zhRoleName" name="roleName" value="${roleName }" class="required" rules="[{notNull:true, message:'<my:i18n zhText="请输入角色名称" enText="Please Enter Role Name"/>'}]"></td>
          </tr>
          <tr>
            <th width="18%"><font color="red">*</font><my:i18n zhText="英文角色名称" enText="English Role Name"/>：</th>
            <td><input type="text" id="enRoleName" name="enRoleName" value="${enRoleName }" class="required" rules="[{notNull:true, message:'<my:i18n zhText="请输入角色名称" enText="Please Enter Role Name"/>'}]"></td>
          </tr>
           <tr>
            <th ><my:i18n zhText="备注" enText="Remark"/>：</th>
            <td><textarea style="width: 600px;height: 60px" name="remark">${remark }</textarea></td>
          </tr>
           <tr>
            <th ><font color="red">*</font><my:i18n zhText="可访问菜单" enText="Limits Of Permissions"/>：</th>
            <td >
              <ul id="tree" class="tree" style="margin-left: 0px"></ul>
              <input type="hidden" name="checkIds" id="checkIds" value="" rules="[{notNull:true, message:'<my:i18n zhText="请选择可访问的菜单" enText="Please Choose Some Limits Of Authority"/>'}]"/>
		      <input type="hidden" name="rwAuths" id="rwAuths" value=""/>
            </td>
          </tr>
          <tr>
            <th ><font color="red">*</font><my:i18n zhText="可访问栏目" enText="Limits Of Permissions"/>：</th>
            <td >
              <ul id="tree_lm" class="tree" style="margin-left: 0px"></ul>
              <input type="hidden" name="checkLmIds" id="checkLmIds" value="" rules="[{notNull:true, message:'<my:i18n zhText="请选择可访问的栏目" enText="Please Choose Some Limits Of Authority"/>'}]"/>
		     
            </td>
          </tr>
           <tr>
            <th ><my:i18n zhText="桌面设置" enText="Desk Setting"/>：</th>
            <td>
              <my:checkbox pvalue="zmsz" name="deskSetting" checked="checked"/>
            </td>
          </tr>
           <tr>
			<td colspan="2" class="ftablebutton">
				<my:auth fixedValue="W" value="${auth}"><input type="button" class="button orange"  value="<my:i18n zhText="保存" enText="Save"/>" id="submitBtn"/> &nbsp; <input type="reset" class="button orange"  value="<my:i18n zhText="重置" enText="Reset"/>"/></my:auth>
			</td>
	      </tr>
        </table>
        </form>
	</div>
	</body>
</html>