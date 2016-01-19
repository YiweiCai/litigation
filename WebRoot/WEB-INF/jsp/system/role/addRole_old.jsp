<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Cache-Control" content="no-store"/>
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="0"/>
    <title></title>
	<link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/main.css" media="screen" />
    
	<link rel="stylesheet" type="text/css" href="${ctx}/js_css_image/css/tree.css" />
	<link rel="StyleSheet" type="text/css" href="${ctx}/js_css_image/css/tab.css"/>
	<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.easyui.min_1.0.4.js"></script>
	<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery.tree.temp.js"></script>
	<script type="text/javascript" src="${ctx}/js_css_image/js/treeCommon.js"></script>
	<script type="text/javascript" src="${ctx}/js_css_image/js/Loadingmask.js"></script>
	<script type="text/javascript" src="${ctx}/js_css_image/js/util.js" type="text/javascript"></script>
	<script type="text/javascript">
		 var treeurl="${ctx}/system/role_getMenu.do";
	     var showcheck=true;
	     var customerParam = '${id}';
	     function submitForm(){
	  		submitFormByAjax("#roleForm",function(){
	  			var s=$("#tree").getTSVs();
	            if(s!=null && s!=''){
	            	$("#authedFunction").val(s.join(","));
	            	 
	            	return true;
	             }else{
	                 alert("请选择权限");
	                 return false;
	             }
		    })
	     }
	</script>
</head>
<body>
    <div class="bodybox">
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tabs1" >
				<tr>
					<td>
						 <div align="center" id="uldiv">
							<ul>
								<li><a href="${ctx }/system/role_update.do?id=${id }"><span>角色信息</span></a></li>
								<li><a href="${ctx }/system/role_list.do?id=${id }"><span>下级角色列表</span></a></li>
								<li id="current"><a href="${ctx }/system/role_add.do?id=${id }"><span>新增下级角色</span></a></li>
							</ul>
						    </div>
						</td>
					</tr>
				</table>
		</div>
		  <div id="result" align="center" style="color: red"><s:actionmessage/> </div>
		  <form id="roleForm" action="system/role_save.do" method="post">
		  <input type="hidden" name="authedFunction" id="authedFunction" value=""/>
		  <s:token></s:token>
		  <input type="hidden" name="parentRoleId" id="parentRoleId" value="${parentRoleId }">
		   <table width="100%" class="ftable"id="stripe_tb">
           <tr>
            <td align="right" width="12%">上级角色</td>
            <td width="70%">${parentRoleName }</td>
          </tr>
          <tr>
            <td align="right" width="12%">角色名称</td>
            <td><input type="text" name="roleName" value="${roleName }" class="required" title="角色名称不能为空"></td>
          </tr>
           <tr>
            <td align="right" ><my:i18n zhText="备注" enText="Remark"/></td>
            <td><textarea cols="45" rows="3" name="remark">${remark }</textarea></td>
          </tr>
           <tr>
            <td align="right" >拥有的权限</td>
            <td >
               <div id="tree"></div>
            </td>
          </tr>
           <tr>
			<td colspan="4" class="ftablebutton">
				<input type="button" class="button orange"  value="<my:i18n zhText="保存" enText="Save"/>" onclick="submitForm()" class="submitForm"/> &nbsp; <input type="reset" class="button orange"  value="<my:i18n zhText="重置" enText="Reset"/>"/>
			</td>
	      </tr>
        </table>
        </form>
	</div>
	</body>
</html>