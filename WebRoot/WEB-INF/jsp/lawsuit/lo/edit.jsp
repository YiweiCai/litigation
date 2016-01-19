<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<script type="text/javascript">
		var addordetail = true;
		var tolisturl = "${ctx }/lawsuit/lo_list.do?type=${type}";
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
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>：<my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - 判后答疑详细信息 </div>
	<div class="pheadbutton" >
		   <input type="button" class="button orange"  value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
  <div id="result" align="center" style="color: red;padding-top: 10px"></div>
<form method="post" action="${ctx }/lawsuit/lo_save.do" id="articleForm" >
     <input type="hidden" name="loid" value="${lo.id}"/>
     <input type="hidden" name="lo.status" value="1"/>
     <table width="100%" class="ftable">
		
		<tr>
			 	<th colspan="4" style="text-align:left;padding-left:20px;">提问回复：</th>
		</tr>
		<tr>
		  <th width="10%" >提出人姓名：</th>
		  <td width="30%">
		    ${lo.createUser.userName }
		  </td>
		 <th width="10%" >提出人手机号码：</th>
		  <td>
		      ${lo.questionerPhone }
		  </td>
		</tr>
		 
		
		
		<tr>
		   <th width="10%" >提问标题：</th>
		  <td colspan="3">
		      ${lo.questionTitle }
		  </td>
		</tr>
		<tr>
		   <th width="10%" >提问内容：</th>
		  <td colspan="3">
		      ${lo.questionContext }
		  </td>
		</tr>
		<tr>
		   <th width="10%" >回复方式：</th>
		  <td colspan="3">
		    	<my:select pvalue="replyWay" rules="[{notNull:true, message:'请选择回复方式'}]" name="lo.replyWay" id="replyWay" firstoption="--"/>
		  </td>
		</tr>
		<tr>
		   <th width="10%" >回复内容：</th>
		  <td colspan="3">
		  	  <textarea rows="3" cols="50" id="replyContext" name="lo.replyContext" disabled="disabled" maxlength="255" rules="[{notNull:true, message:'请输入回复内容'}]"></textarea>
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