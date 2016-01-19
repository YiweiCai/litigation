<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<script type="text/javascript">
		var addordetail = true;
		var tolisturl = "${ctx }/lawsuit/xf_list.do";
		$(function() {
			$("#replyWay").change(function(){
			
				if($(this).val() == 4){
					$("#replyContent").removeAttr("disabled");
				}else{
					$("#replyContent").attr("disabled","disabled");
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
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>：<my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - 信访详细信息 </div>
	<div class="pheadbutton" >
		   <input type="button" class="button orange"  value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
  <div id="result" align="center" style="color: red;padding-top: 10px"></div>
<form method="post" action="${ctx }/lawsuit/xf_update.do" id="articleForm" enctype="multipart/form-data">
     <input type="hidden" name="lsXf.id" value="${lsXf.id}"/>
     <table width="100%" class="ftable">
		
		<tr>
			 	<th colspan="4" style="text-align:left;padding-left:20px;">诉讼请求：</th>
		</tr>
		<tr>
		  <th width="10%" >提出人姓名：</th>
		  <td>
		    ${lsXf.name }
		  </td>
		  <th width="10%" >提出人证件号码：</th>
		  <td>
		    ${lsXf.zjhm}
		  </td>
		</tr>
		 <tr>
		  <th width="10%" >提出人手机号码：</th>
		  <td colspan="3">
		      ${lsXf.sjhm }
		  </td>
		</tr>
		<tr>
		   <th width="10%" >邮件地址：</th>
		  <td colspan="3">
		      ${lsXf.yjdz}
		  </td>
		</tr>
		<tr>
		   <th width="10%" >与案关系：</th>
		  <td>
		    ${lsXf.yagx}
		  </td>
		  <th width="10%" >案号：</th>
		  <td>
		    ${lsXf.ah}
		  </td>
		</tr>
		<tr>
		   <th width="10%" >咨询内容：</th>
		  <td colspan="3">
		      ${lsXf.zxnr }
		  </td>
		</tr>
		
		
		<tr>
		   <th width="10%" >回复方式：</th>
		  <td colspan="3">
		    	<my:view pvalue="replyWay" value="${lsXf.replyWay }" />
		  </td>
		</tr>
		<tr>
		   <th width="10%" >回复内容：</th>
		  <td colspan="3">
		  	 ${lsXf.replyContent }
		  </td>
		</tr>
		<tr>
		   <th width="10%" >备注：</th>
		  <td colspan="3">
		  	  ${lsXf.bz }
		  </td>
		</tr>
	 	<tr>
		   <th width="10%" >回复时间：</th>
		  <td>
		    ${lsXf.replyTime}
		  </td>
		  <th width="10%" >回复用户：</th>
		  <td>
		    ${username}
		  </td>
		</tr>
	 
	</table>
</form>
</div>
</div>
</body>
</html>