<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet"
	href="${ctx }/js_css_image/css/main.css" />
<!--åºç¡js-->
<script type="text/javascript"
	src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/js_css_image/js/base/jquery.core.utils-1.0.js"></script>
<script type="text/javascript"
	src="${ctx }/js_css_image/js/base/lang/zh_CN.js"></script>
<!--crud æä½jsï¼ææcrudæä½åéç¨ajaxæ¹å¼-->
<script type="text/javascript"
	src="${ctx }/js_css_image/js/base/jquery.core.crud.init-1.0.js"></script>
<!--date、time js-->
<script type="text/javascript"
	src="${ctx }/js_css_image/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx }/js_css_image/js/base/jquery.core.crud-1.0.js"></script>
<script type="text/javascript"
	src="${ctx }/js_css_image/js/jquery/jquery.easyui.form_1.3.1.js"></script>
<!--dialog js-->
<script type="text/javascript"
	src="${ctx }/js_css_image/js/lhgdialog/lhgdialog/lhgdialog.min.js?skin=mac"></script>
<!--附件上传 js-->
<script type="text/javascript"
	src="${ctx }/js_css_image/js/jquery/jquery.MultiFile.js">
	</>
</script>

<link rel="stylesheet" type="text/css"
	href="${ctx }/js_css_image/css/tab.css" />
<script type="text/javascript">
	$(function() {
		$("#video").hide();
		$("#shiPinLeiXing").click(function() {
			if ($("#shiPinLeiXing").val() == 1) {
				$("#videoSite").show();
				$("#video").hide();
			} else {
				$("#videoSite").hide();
				$("#video").show();
			}
		});
		$(".Wdate").click(function() {
			WdatePicker({
				skin : 'blue',
				dateFmt : 'yyyy-MM-dd'
			});
		});
		var shenFen1 = $("#shenFen1");
		var faGuan1 = $("#faGuan1");
		shenFen1.change(function() {
			faGuan1.removeAttr("name");
			if (shenFen1.val() == '1') {
				faGuan1.attr("name", "uv.firestJudge");
			}
			if (shenFen1.val() == '2') {
				faGuan1.attr("name", "uv.judger");
			}
			if (shenFen1.val() == '3') {
				faGuan1.attr("name", "uv.juror");
			}
			if (shenFen1.val() == '4') {
				faGuan1.attr("name", "uv.agencyJudger");
			}
			if (shenFen1.val() == '5') {
				faGuan1.attr("name", "uv.societyJudger");
			}
		});
		var shenfen2 = $("#shenFen2");
		var faGuan2 = $("#faGuan2");
		shenfen2.change(function() {
			faGuan2.removeAttr("name");
			if (shenfen2.val() == '1') {
				faGuan2.attr("name", "uv.firestJudge");
			}
			if (shenfen2.val() == '2') {
				faGuan2.attr("name", "uv.judger");
			}
			if (shenfen2.val() == '3') {
				faGuan2.attr("name", "uv.juror");
			}
			if (shenfen2.val() == '4') {
				faGuan2.attr("name", "uv.agencyJudger");
			}
			if (shenfen2.val() == '5') {
				faGuan2.attr("name", "uv.societyJudger");
			}
		});
		var shenfen3 = $("#shenFen3");
		var faGuan3 = $("#faGuan3");
		shenfen3.change(function() {
			faGuan3.removeAttr("name");
			if (shenfen3.val() == '1') {
				faGuan3.attr("name", "uv.firestJudge");
			}
			if (shenfen3.val() == '2') {
				faGuan3.attr("name", "uv.judger");
			}
			if (shenfen3.val() == '3') {
				faGuan3.attr("name", "uv.juror");
			}
			if (shenfen3.val() == '4') {
				faGuan3.attr("name", "uv.agencyJudger");
			}
			if (shenfen3.val() == '5') {
				faGuan3.attr("name", "uv.societyJudger");
			}
		});
		var shenfen4 = $("#shenFen4");
		var faGuan4 = $("#faGuan4");
		shenfen4.change(function() {
			faGuan4.removeAttr("name");
			if (shenfen4.val() == '1') {
				faGuan4.attr("name", "uv.firestJudge");
			}
			if (shenfen4.val() == '2') {
				faGuan4.attr("name", "uv.judger");
			}
			if (shenfen4.val() == '3') {
				faGuan4.attr("name", "uv.juror");
			}
			if (shenfen4.val() == '4') {
				faGuan4.attr("name", "uv.agencyJudger");
			}
			if (shenfen4.val() == '5') {
				faGuan4.attr("name", "uv.societyJudger");
			}
		});
		$("#submitBtn").submitForm({
			formId : "channelForm",
			onComplete : function() {
				window.location.href = "${ctx4ej}/lawsuit/uv_listVideo.do";

			}
		});
		
		
		$("#shenFen1").val("1");
		$("#shenFen2").val("2");
		$("#shenFen3").val("3");
		$("#shenFen4").val("4");
		$("#shenFen5").val("5");
	});
</script>
<script type="text/javascript">
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

</head>

<body>
	<div class="bodybox">

		<div id="result" align="center" style="color: red;padding-top: 10px"></div>
		<form method="post" action="${ctx4ej }/lawsuit/uv_save.do"
			id="channelForm" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${uv.id}"> <input
				type="hidden" name="parentId" value="">
			<table width="100%" class="ftable" id="ftable">

				<tr>
					<th width="15%"><font color="red">(必填)</font>标题</th>
					<td><input type="text" maxlength="100" id="title"
						name="uv.title" value="${uv.title} " />
						<input type="hidden" name="coid" value="${uv.id} ">
						</td>
				</tr>
				<tr>
					<th width="15%">小标题</th>
					<td><input type="text" maxlength="100" id="smallTitle"
						name="uv.smallTitle" value="${uv.smallTitle} " /></td>
				</tr>
				<tr id="hiddenUrl">
					<th width="15%">关键字</th>
					<td><input type="text" maxlength="100" id="keyword"
						name="uv.keyword" value="${uv.keyword} " />(多关键字用<font
						color="red">“，”</font>分割)</td>
				</tr>
				<tr>
					<th width="15%">法庭</th>
					<td><input type="text" maxlength="100" id="courtroom"
						name="uv.courtroom" value="${uv.courtroom} " /></td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(必填)</font>视频类型</th>
					<td><select>
							<option>案件</option>
					</select> <select name="uv.videoType" value="${uv.videoType }">
							<option value="民事案件">民事案件</option>
					</select></td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(案件必填)</font>审判员</th>
					<td>法官:
							<input type="text" id="faGuan1" value="${uv.firestJudge }"> 
							身份:<select id="shenFen1" value="1">
							<option>----</option>
							<option value="1">审判长</option>
							<option value="2">审判员</option>
							<option value="3">陪审员</option>
							<option value="4">代理审判员</option>
							<option value="5">社会法官</option>
					</select><br>
					 法官:<input type="text" id="faGuan2" value="${uv.judger }"> 
					 身份:<select id="shenFen2">
							<option>----</option>
							<option value="1">审判长</option>
							<option value="2">审判员</option>
							<option value="3">陪审员</option>
							<option value="4">代理审判员</option>
							<option value="5">社会法官</option>
					</select><br> 法官:<input type="text" id="faGuan3" value="${uv.juror }"> 
					 身份:<select id="shenFen3">
							<option>----</option>
							<option value="1">审判长</option>
							<option value="2">审判员</option>
							<option value="3">陪审员</option>
							<option value="4">代理审判员</option>
							<option value="5">社会法官</option>
					</select><br> 法官:<input type="text" id="faGuan4" value="${uv.agencyJudger }">
					 身份:<select id="shenFen4">
							<option>----</option>
							<option value="1">审判长</option>
							<option value="2">审判员</option>
							<option value="3">陪审员</option>
							<option value="4">代理审判员</option>
							<option value="5">社会法官</option>
					</select><br>法官:<input type="text" id="faGuan4" value="${uv.societyJudger }">
					 身份:<select id="shenFen5">
							<option>----</option>
							<option value="1">审判长</option>
							<option value="2">审判员</option>
							<option value="3">陪审员</option>
							<option value="4">代理审判员</option>
							<option value="5">社会法官</option>
					</select>
					</td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(案件必填)</font>案由</th>
					<td><textarea rows="6px" cols="100px" id="brief"
							name="uv.brief">${uv.brief }</textarea></td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(案件必填)</font>案情/视频简介</th>
					<td><textarea rows="6px" cols="100px" name="uv.videoIntro"
							id="videoIntro">${uv.videoIntro }</textarea>
					</td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(必填)</font>地点</th>
					<td><input type="text" maxlength="100" id="site"
						name="uv.site" value="${uv.site }" /></td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(必填)</font>开庭时间</th>
					<td><input type="text" name="uv.time" value="${uv.time }"
						id="time" maxlength="30" readonly="readonly" class="Wdate" /></td>
				</tr>
				<tr id="contentImgTr1" <c:if test="${!empty uf}"> style="display: none" </c:if>>
					<th width="15%">视频缩略图</th>
					<td> 
						<input type="file" class="multi"  id="upload" name="upload" size="30" maxlength="1" accept="gif|jpg|png|bmp|jpeg"/>
					</td>
				</tr>
				<c:if test="${!empty uf }">
				<tr id="contentImgTr2">
					<th width="10%">已上传的缩略图</th>
					<td>
						<span id="${uf.id }span">
							<img alt="" src="${ctx}/${uf.uploadFilePath}"  width="100px" height="68px">
							<a href="javascript:" title="删掉" onclick="deleteUploadFile('${uf.id}')">[删除]</a>
						</span>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<th width="15%">视频直播地址</th>
					<td><select id="shiPinLeiXing">
							<option value="1">输入视频地址</option>
							<option value="2">上传视频文件</option>
					</select><br> <input type="text" maxlength="100" id="videoSite"
						name="uv.videoSite" value="${uv.videoSite }" /><br>
						<input id="video" name="video" type="file" />
						</td>
				</tr>
				<tr>
					<th width="15%"><font color="red">(必填)</font>发布时间</th>
					<td><input type="text" maxlength="100" id="issueTime"
						name="uv.issueTime" value="${uv.issueTime} " class="Wdate"
						readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th width="15%">备注</th>
					<td><textarea rows="6px" cols="100px" name="uv.remark"
							id="remark">${uv.remark }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="ftablebutton"><input type="button"
						class="button orange" value="提交" id="submitBtn" /> &nbsp; <input
						type="reset" class="button orange" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>