<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<%--<my:head fck="true" datePicker="true" multiFile="true">--%>
<my:head fck="true" datePicker="true" multiFile="true">
<!-- 配置文件 -->
    <link href="/js_css_image/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js_css_image/js/umeditor/umeditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/js_css_image/js/umeditor/umeditor.js"></script>
    <script type="text/javascript" src="/js_css_image/js/umeditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		var addordetail = true;
		var tolisturl = "${ctx4ej}/cms/article_list.do?channelId=${channel.id}";
		$(function() {
			$(".Wdate").click(function(){WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',lang:$.i18n("lang")});});
			if("${isDraft}"==""){$(":radio[value='N']").attr("checked","checked");}
			$("#submitBtn").submitForm({
				formId:"articleForm",
				onSubmit:function(){
					$("#content").val(UM.getEditor('myEditor').getContent());
				},
				onComplete:function(){
				    window.location.href = tolisturl;
				}
			});
			$("#tolistButton").click(function(){window.location.href=tolisturl;});
		});
		
		 function deleteUploadFile(id){
		      if(confirm("删除将不可恢复，您确定要删除吗")){
		    	  $.post("${ctx4ej}/cms/article_deleteUploadFileByAjax.do",{"uploadFileId":id},
		    		     function(ret){
		    		    	 if(ret.code=="0"){
		    		    		 alert("删除成功");
		    		    		 $("#"+id+"span").remove();
				   				 $("#contentImgTr2").hide();
				   				 $("#contentImgTr1").show();
		    		    	 }
		    		     }
		    	   );
	          }
	        }
	</script>
</my:head>
<body>
<div>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>：文章内容  - <my:position value="${articleId}"/> </div>
	<div class="pheadbutton" >
		   <input type="button" class="button orange"  value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
  <div id="result" align="center" style="color: red;padding-top: 10px"></div>
<form method="post" action="${ctx4ej}/cms/article_save.do" id="articleForm" enctype="multipart/form-data">
     <input type="hidden" name="articleId" value="${articleId}"/>
     <input type="hidden" name="channelId" value="${channel.id}"/>
     <input type="hidden" name="filePath" value='uploadfile/cms/content/${channel.path}'/>
     <input type="hidden" id="content" name="content"/>
  	 <table width="100%" class="ftable">
		<tr>
		  <th width="10%" >所属栏目：</th>
		  <td>
		    ${channel.channelName }
		  </td>
		  <c:if test="${channel.channelName=='日志' }">
		     <th width="10%" >日志分类：</th>
		     <td>
		        <my:select pvalue="rzfl" name="rzfl"/>
		     </td>
		  </c:if>
		   <c:if test="${channel.channelName!='日志' }">
			   <th width="10%" >文章属性：</th>
			   <td>
			    <my:view value="${channel.channelType}" pvalue="channelType"/>
			   </td>
		   </c:if>
		</tr>
		 <tr>
		  <th width="10%" >作者：</th>
		  <td colspan="1" width="35%">
		      <input type="text" name="author" value='<c:out value="${author}" default="${user.userName }" escapeXml="false"/>' maxlength="100" />
		  </td>
		  <th width="10%" >标题颜色：</th>
		  <td >
		    
		    <select name="titleColor"  onchange="this.blur();">
				<option value="">--默认--</option>
				<%--<option value="#FFFFFF" style="background-color:#FFFFFF"></option> --%>
				<option value="#FF0000" style="background-color:#FF0000"></option>
				<option value="#FFFF00" style="background-color:#FFFF00"></option>
				<option value="#00FF00" style="background-color:#00FF00"></option>
				<option value="#00FFFF" style="background-color:#00FFFF"></option>
				<option value="#0000FF" style="background-color:#0000FF"></option>
				<option value="#FF00FF" style="background-color:#FF00FF"></option>
				<option value="#808080" style="background-color:#808080"></option>
				<option value="#C0C0C0" style="background-color:#C0C0C0"></option>
				<option value="#800000" style="background-color:#800000"></option>
				<option value="#808000" style="background-color:#808000"></option>
				<option value="#008000" style="background-color:#008000"></option>
				<option value="#008080" style="background-color:#008080"></option>
				<option value="#000080" style="background-color:#000080"></option>
				<option value="#800080" style="background-color:#800080"></option>
				<option value="#000000" style="background-color:#000000"></option>
             </select>
             <input type="checkbox" value="1" id="isBold" name="isBold"/>加粗
		  </td>
		  <%--<th width="10%" >发布时间：</th>
		  <td colspan="1" width="35%">
		    <input type="text" name="releaseDate" value="${releaseDate }" maxlength="100" align="left" class="Wdate" readonly="readonly"/>
		  </td> --%>
		</tr>
		<tr>
		  <th width="10%" >标题：</th>
		  <td colspan="3">
		    <input type="text" name="title" value="${title }" class="required" maxlength="100" align="left" size="60"/>
		  </td>
		 </tr>
		<tr>
		   <th width="10%" >来源：</th>
		   <td colspan="3">
			 <input type="text" name="origin" value="${origin }" maxlength="100" align="left" size="60"/>
		   </td>
		</tr>
		<tr>
		 <th width="10%" >摘要：</th>
		 <td colspan="3">
			 <input type="text" name="description" value="${description }" maxlength="100" align="left" size="60"/>
		 </td>
		</tr>
		<!-- 
	   <tr>
		 <td width="10%" >简短标题：</td>
		 <td colspan="3" width="35%">
			 <input type="text" name="shortTitle" value="${shortTitle }" maxlength="100" align="left"/>
			 <span class="fhelp">在文章列表中显示，不填写则显示完整标题</span>
		 </td>
		</tr>
		<tr>
		 <td width="10%" >标题颜色：</td>
		 <td colspan="3" width="35%">
			<select name="titleColor"  onchange="this.blur();">
				<option value="">--默认--</option>
				<option value="#000000" style="background-color:#000000"></option>
				<option value="#FFFFFF" style="background-color:#FFFFFF"></option>
				<option value="#FF0000" style="background-color:#FF0000"></option>
				<option value="#FFFF00" style="background-color:#FFFF00"></option>
				<option value="#00FF00" style="background-color:#00FF00"></option>
				<option value="#00FFFF" style="background-color:#00FFFF"></option>
				<option value="#0000FF" style="background-color:#0000FF"></option>
				<option value="#FF00FF" style="background-color:#FF00FF"></option>
				<option value="#808080" style="background-color:#808080"></option>
				<option value="#C0C0C0" style="background-color:#C0C0C0"></option>
				<option value="#800000" style="background-color:#800000"></option>
				<option value="#808000" style="background-color:#808000"></option>
				<option value="#008000" style="background-color:#008000"></option>
				<option value="#008080" style="background-color:#008080"></option>
				<option value="#000080" style="background-color:#000080"></option>
				<option value="#800080" style="background-color:#800080"></option>
             </select>
             <input type="checkbox" value="1" id="isBold" name="isBold"/>加粗
             <span class="fhelp">在文章列表中的样式</span>
		 </td>
	  </tr>
		
		<tr>
		 <td width="10%" >tag标签：</td>
		 <td colspan="3" width="35%">
			 <input type="text" name="tags" value="${tags }" maxlength="100" align="left"/>
			 <span class="fhelp">关键字，用“,”分割</span>
		 </td>
		</tr>
		<tr>
		 <td width="10%" >相关文章：</td>
		 <td colspan="3" width="35%">
			 <input type="text" name="relatedIds" value="${relatedIds }" maxlength="100" align="left"/>
			 <span class="fhelp">填写文章ID，多篇文章用,分割</span>
		 </td>
		</tr>
		 -->
		 <!-- 
		<tr>
		  <td width="10%" >指定模板：</td>
		  <td colspan="3" width="35%">
			  <select name="tplContent"/>
				<option value="" selected="selected">使用栏目选择的模板</option>
				<c:forEach var="cmsTemplet" items="${channel.cmsTemplets}">
				      <option value="${cmsTemplet.templetPath }${cmsTemplet.templetFileName}">${cmsTemplet.templetPath }${cmsTemplet.templetFileName}</option>
				</c:forEach>
			</select>
		  </td>
		 
		    <td width="10%" >置顶级别：</td>
		    <td colspan="1" width="35%">
		     <select name="topLevel"/>
			     <option value="0"></option>
			     <option value="24">置顶一天</option>
			     <option value="48">置顶二天</option>
			     <option value="72">置顶三天</option>
			     <option value="168">置顶一周</option>
			     <option value="720">置顶一月</option>
			     <option value="2160">置顶三月</option>
			     <option value="4320">置顶半年</option>
			     <option value="8760">置顶一年</option>
		     </select>
		    </td>
		  
		</tr>
		 -->
		<!-- 
		<tr>
		  <td width="10%" >阅读权限：</td>
		  <td colspan="1" width="35%">
			 <input type="radio" value="0" checked="checked" name="isReject"/>不受限制
		     <input type="radio" value="1" name="isReject"/>普通会员
		  </td>
		  <td width="10%" >允许评论：</td>
		  <td colspan="1" width="35%">
		     <input type="radio" value="1" checked="checked" name="isAllowComment"/>是
		     <input type="radio" value="0" name="isAllowComment"/>否
		  </td>
		</tr>
		
		 <tr>
		  <th width="10%" >是否草稿：</th>
		  <td colspan="3" width="35%">
		    <my:radio pvalue="yesornot" name="isDraft" value="${isDraft}"/>
		  </td>
		 
		   <th width="10%" >是否推荐：</th>
		   <td colspan="1" width="35%">
		     <input type="radio" value="1" name="isRecommend"/>是
             <input type="radio" value="0" checked="checked" name="isRecommend"/>否
		   </td>
		   
		</tr>-->
		<tr>
		  <th width="10%" >内容：</th>
		  <td colspan="3" width="35%">
		   <script type="text/plain" id="myEditor" style="width:1000px;height:240px;">${content}</script>
		  </td>
		</tr>
		<tr id="contentImgTr1" <c:if test="${!empty uploadFileList}"> style="display: none" </c:if>>
			  <th width="10%" >上传附件： </th>
			  <td colspan="3" width="35%">
			     <input type="file" class="multi" id="upload" name="upload" size="40" maxlength="1" accept="doc|docx|xls|xlsx|ppt|pptx|rar|zip|gif|jpg|png|bmp|jpeg"/>
			  </td>
		</tr>
		<c:if test="${!empty uploadFileList}">
			<tr id="contentImgTr2">
			 <th width="10%" >已上传的附件： </th>
		     <td colspan="3" width="35%">
			    <c:forEach items="${uploadFileList}" var="upfile">
			        <span id="${upfile.id}span">
			            <a href="${ctx4ej}/cms/article_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
			            <a href="javascript:" title="删掉" onclick="deleteUploadFile('${upfile.id}')">[删除]</a>
			            <br/>
			         </span>
			     </c:forEach>
		  	</td>
			</tr>
		</c:if>
	  <tr>
		<td colspan="4" class="ftablebutton">
			<input type="button" class="button orange"  value="<my:i18n zhText="保存" enText="Save"/>"  id="submitBtn"/> &nbsp; <input type="reset" class="button orange"  value="<my:i18n zhText="重置" enText="Reset"/>"/>
		</td>
	 </tr>
	</table>
</form>
</div>
</div>
</body>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
</script>
</html>