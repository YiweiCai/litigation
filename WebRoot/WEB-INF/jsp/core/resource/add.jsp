<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="/mytags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
	<my:head lhgdialog="true" multiFile="true">
		<script type="text/javascript">
			//var api = frameElement.api, W = api.opener;
			var addordetail = true;
			var tolisturl = "${ctx}/core/resource_list.do";
			$(function() {
				$(".Wdate").click(function() {
					WdatePicker({
						skin : 'blue',
						dateFmt : "yyyy-MM-dd"
					});
				});
				$("#submitBtn").submitForm({
					formId : "resourceForm",
					onComplete : function() {
						location=tolisturl;
					}
				});
			});
			
			 function deleteUploadFile(id){
				 if(confirm("删除将不可恢复，您确定要删除吗")){
			    	  $.post("${ctx}/core/resource_deleteUploadFileByAjax.do",{"uploadFileId":id},
			    		     function(ret){
			    		    	 if(ret.code=="0"){
			    		    		 alert("附件删除成功");
			    		    		 $("#"+id+"span").remove();
					   				 $("#uploadFileTr2").hide();
					   				 $("#uploadFileTr1").show();
			    		    	 }else {
				    		    	 alert("对不起，删除失败");
				    		     }
			    		     }
			    	   );
		          }
	        }
		</script>
	</my:head>
	<body>
		<div class="bodybox">
			<div class="phead">
				<div class="pheadposition">
					<my:i18n zhText="当前位置" enText="Current Position" />
					：
					<my:position value="${id}" />
					资源管理
				</div>
				<div class="clear"></div>
			</div>
			<form method="post" action="${ctx }/core/resource_save.do"
				id="resourceForm" enctype="multipart/form-data">
				<input type="hidden" value="${id}" id="id" name="id" />
				<table width="100%" class="ftable" id="ftable">
					<tr>
						<th width="15%">
							<font color="red">*</font>资源名称：
						</th>
						<td width="35%">
							<input type="text" name="name" size="40" maxlength="120" value="${name }"
								rules="[{notNull:true, message:'资源名称不能为空'}]" />
						</td>
						<th width="15%">
							目标环境：
						</th>
						<td>
							<input type="environment" name="environment" size="40" maxlength="120" value="${environment }" />
						</td>
					</tr>
					<tr>
						<th>
							<font color="red">*</font>资源类型：
						</th>
						<td>
							<my:select pvalue="resourceType" name="type" value="${type }" nullValue="false"/>
						</td>
						<th>
							<font color="red">*</font>资源分类：
						</th>
						<td>
							<my:select pvalue="resourceCategory" name="category" value="${category }" nullValue="false"/>
						</td>
					</tr>
					<tr>
						<th>
							<font color="red">*</font>资源描述：
						</th>
						<td colspan="3">
							<textarea name="description" cols="77" rows="8" rules="[{notNull:true, message:'资源描述不能为空'},{maxLength:1000, message:'资源描述不能超过1000个字符'}]">${description}</textarea>
						</td>
					</tr>
					<tr id="uploadFileTr1" <c:if test="${!empty uploadFileList}"> style="display: none" </c:if>>
						  <th width="10%" >上传附件： </th>
						  <td colspan="3" width="35%">
						     <input type="file" class="multi" id="upload" name="upload" size="40" maxlength="1" accept="doc|docx|xls|xlsx|ppt|pptx|rar|zip|ras"/>
						  </td>
					</tr>
					<c:if test="${!empty uploadFileList}">
						<tr id="uploadFileTr2">
						 <th width="10%" >已上传的附件： </th>
					     <td colspan="3" width="35%">
						    <c:forEach items="${uploadFileList}" var="upfile">
						        <span id="${upfile.id}span">
						            <a href="${ctx}/core/resource_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
						            <a href="javascript:" title="删掉" onclick="deleteUploadFile('${upfile.id}')">[删除]</a>
						            <br/>
						         </span>
						     </c:forEach>
					  	</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4" class="ftablebutton">
							<input type="button" class="button orange"
								value="<my:i18n zhText="保存" enText="Save"/>" id="submitBtn" />
							&nbsp;
							<input type="reset" class="button orange"
								value="<my:i18n zhText="重置" enText="Reset"/>" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>