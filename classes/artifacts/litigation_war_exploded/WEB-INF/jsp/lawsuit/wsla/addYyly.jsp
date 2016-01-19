<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<script type="text/javascript">
		var list=true;
		var save = "";
		<%--var tolisturl = "${ctx4ej}/lawsuit/laxx_flist.do";--%>
		var tolisturl = "${ctx4ej}/lawsuit/laxx_myCase.htm?op=caseProceed";

		$(function() {
			$(".Wdate").click(function(){WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',lang:$.i18n("lang"),minDate:'%y-%M-{%d+1}'});});
			$("#submitBtn").submitForm({
				formId:"userForm",
				onComplete:function(){
				    window.parent.location.href = tolisturl;
				}
			});
			
		});
	</script>
</my:head>
<body>
<form action="${ctx4ej }/lawsuit/laxx_yyly.do" method="post" id="userForm">
<table>
	<input type="hidden" name="id" value="${id }" />
	
	<tr>
		<td>预约日期</td>
		<td><input type="text" name="yyrq" id="startLoginTime"  class="Wdate required" readonly="readonly" rules="[{notNull:true, message:'请输入预约日期'}]"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="submitBtn">提交</button>
			<button type="reset">重置</button>
		</td>
		
	</tr>
	
</table>
</form>
</body>
</html>