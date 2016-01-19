<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<script type="text/javascript">
		var addordetail = true;
		var tolisturl = "${ctx }/lawsuit/co_list.do";
		var updateurl="${ctx }/lawsuit/laxx_update.do";
		$(function() {
			$("#replyWay").change(function(){
			
				if($(this).val() == 4){
					$("#replyContext").removeAttr("disabled");
				}else{
					$("#replyContext").attr("disabled","disabled");
				}
			});
			$("#submitBtn").submitForm({
				formId:"articleForm",
				onComplete:function(){
				    window.location.href = tolisturl;
				}
			});
			$("#tolistButton").click(function(){window.location.href=tolisturl;});
		});
		
		 
	</script>
</my:head>
<body>
<div>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>：<my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - 直播法庭管理 </div>
	<div class="pheadbutton" >
		   <input type="button" class="button orange"  value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
  <div id="result" align="center" style="color: red;padding-top: 10px"></div>
<form method="post" action="${ctx }/lawsuit/co_save.do" id="articleForm" >
     <input type="hidden" name="coid" value="${co.id}"/>
     <table width="100%" class="ftable">
		
		<tr>
			 	<th colspan="4" style="text-align:left;padding-left:20px;">提问回复：</th>
		</tr>
		<tr>
		  <th width="10%" >法庭名称：</th>
		  <td width="30%">
		    <input type="text" id="courtName" name="co.courtName" value="${co.courtName }" class="inputstyle"/>
		  </td>
		 <th width="10%" >直播链接：</th>
		  <td>
		      <input type="text" id="openingUrl" name="co.openingUrl" value="${co.openingUrl }" class="inputstyle"/>
		  </td>
		</tr>
		 
		
		
		
		
	  <tr>
		<td colspan="4" class="ftablebutton">
			<input type="button" class="button orange"  value="提交"  id="submitBtn" /> 
		</td>
	 </tr>
	</table>
</form>
</div>
</div>
</body>
</html>