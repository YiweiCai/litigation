<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
  		<%@ include file="/front/jsp/include/header.jsp" %>
  		
		<script src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/lang/zh_CN.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js" type="text/javascript"></script>
		<script src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js" type="text/javascript"></script>
		<script src="/core/js_css_image/js/jquery/jquery.MultiFile.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			var addordetail = true;
			var tolisturl = "${ctx}/myCenter/uploads.htm";
			$(function() {
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
	</head>
	<body>
		<!--头部开始-->
		<%@ include file="/front/jsp/include/head.jsp" %>
		<!--头部结束-->
	    <!--内容页开始-->
		<div class="container">
			<div class="conttop"><img src="${ctx}/js_css_image/front/images/conttop.jpg" width="980" height="40" alt="" title="" /></div>    
	    	<div class="content">
		    	<!--左侧内容开始-->
		    	<div class="leftcont" style=" min-height:390px;">
		    		<%-- 导航 --%>
		            <%@ include file="/front/jsp/myCenter/include/nav.jsp" %>
		        </div><!--左侧内容结束-->
		        <div class="rightcontent">
		        	<form method="post" action="${ctx }/core/resource_save.do" id="resourceForm" enctype="multipart/form-data">
		        		<input type="hidden" value="${resourceId}" id="id" name="id" />
			        	<h3>发布资源</h3>           
			            <div class="maincont">
			            	<dl class="geren">
			                	<dt><font color="red">*</font>资源名称：</dt>
			                    <dd>
									<input type="text" name="name" class="gereninput" maxlength="120" value="${name }"
										rules="[{notNull:true, message:'资源名称不能为空'}]" />
			                    </dd>
			                </dl>
			                <dl class="geren">
			                	<dt><font color="red">*</font>资源类型：</dt>
			                    <dd>
			                    	<my:select pvalue="resourceType" name="type" value="${type }" nullValue="false" styleClass="gereninput"/>
			                    </dd>
			                </dl>
			            	<dl class="geren">
			                	<dt><font color="red">*</font>资源分类：</dt>
			                    <dd>
			                    	<my:select pvalue="resourceCategory" name="category" value="${category }" nullValue="false" styleClass="gereninput"/>
			                    </dd>
			                </dl>
			                <dl class="geren">
			                	<dt>目标环境：</dt>
			                    <dd>
			                    	<input type="environment" name="environment" class="gereninput" maxlength="120" value="${environment }" />
			                    </dd>
			                </dl>
			                <dl class="geren" style="height:200px;">
			                	<dt><font color="red">*</font>资源描述：</dt>
			                    <dd>
			                    	<textarea name="description" class="gereninput" style="height:180px;width:400px;" rules="[{notNull:true, message:'资源描述不能为空'},{maxLength:1000, message:'资源描述不能超过1000个字符'}]">${description}</textarea>
			                    </dd>
			                </dl>
							<dl class="geren" id="uploadFileTr1" <c:if test="${!empty uploadFileList}"> style="display: none" </c:if>>
								  <dt><font color="red">*</font>上传附件： </dt>
								  <dd>
								     <input type="file" class="multi" id="upload" name="upload" size="40" maxlength="1" accept="doc|docx|xls|xlsx|ppt|pptx|rar|zip|ras"/>
								  </dd>
							</dl>
							<c:if test="${!empty uploadFileList}">
								<dl id="uploadFileTr2">
									 <dt>已上传的附件： </dt>
								     <dd>
									    <c:forEach items="${uploadFileList}" var="upfile">
									        <span id="${upfile.id}span">
									            <a href="${ctx}/core/resource_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
									            <a href="javascript:" title="删掉" onclick="deleteUploadFile('${upfile.id}')">[删除]</a>
									            <br/>
									         </span>
									     </c:forEach>
								  	</dd>
								</dl>
							</c:if>
			                <button type="button" class="gerenbtn" id="submitBtn" onclick="">提交</button>
			            </div>
		            </form>
				</div><!--右侧内容结束-->      
		    </div>
		    <div class="contbtm"><img src="${ctx}/js_css_image/front/images/contbt.jpg" width="980" height="26" alt="" title="" /></div>
		</div><!--内容页结束-->
		<!--底部开始-->
		<%@ include file="/front/jsp/include/foot.jsp" %>
		<!--底部结束-->
	</body>
</html>
