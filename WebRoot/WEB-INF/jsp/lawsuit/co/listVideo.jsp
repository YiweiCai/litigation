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
<script type="text/javascript" src="${ctx }/js_css_image/js/jquery/jquery.MultiFile.js"></script>

<link rel="stylesheet" type="text/css"
	href="${ctx }/js_css_image/css/tab.css" />
<script type="text/javascript">
	$(function() {
		$("#upload").hide();
		$("#shiPinLeiXing").click(function() {
			if ($("#shiPinLeiXing").val() == 1) {
				$("#urlDiZhi").show();
				$("#upload").hide();
			} else {
				$("#urlDiZhi").hide();
				$("#upload").show();
			}
		});
		$(".Wdate").click(function() {
			WdatePicker({
				skin : 'blue',
				dateFmt : 'yyyy-MM-dd'
			});
		});
		$("#add").click(function(){
			location.href="${ctx4ej }/lawsuit/co_uploadVideo.do";
		});

	})
</script>

</head>
<body>
	<div class="bodybox">
		<div class="phead">
			<div class="pheadposition">当前位置： 诉讼信息管理 - 视频管理</div>
			<div class="pheadbutton">
				<!--   <input type="button" class="button orange"  value="刷新" id="refreashButton"/> -->
				<input type="button" class="button orange" id="add" value="新增" /> <input
					type="button" class="button orange" id="searchButton" value="查询" />

			</div>w
			<div class="clear"></div>
		</div>
		<form action="${ctx4ej}/lawsuit/uv_listVideo.htm" method="post"
			id="userForm">
			<!-- <div class="psearchhead">
					案件类型：<select   name="lsLaxx.ajlx"><option value="">--</option><option value="0">刑事案件</option><option value="1">民事案件</option><option value="2">行政案件</option></select>&nbsp;&nbsp;
		状态：<select   name="lsLaxx.state"><option value="">--</option><option value="0">未审核</option><option value="1">一级审核</option><option value="2">二级审核</option><option value="3">已预约来院时间</option></select>
			  </div> -->

			<table class="ltable" width="100%">
			            <thead class="ltablehead">
			                <tr>
			                	<th width="4%"><input type="checkbox" name="checkId" id="checkId" value=""></th>
			                  	<th width="4%"><my:i18n zhText="序号" enText="No."/></th>
			                	<th width="10%"><my:i18n zhText="标题" enText="标题"/></th>
			                	<th width="10%"><my:i18n zhText="视频类型" enText="视频类型"/></th>
			                	<th width="10%"><my:i18n zhText="视频链接" enText="视频链接"/></th>
			                	<th width="15%"><my:i18n zhText="创建日期" enText="Create Time"/></th>
			                	<%--<th>入职日期<my:order orderattr="user.registerTime"/></th> --%>
			                	<th style="width: 15%"><my:i18n zhText="操作" enText="Action"/></th>
			                </tr>
			            </thead>
			            <tbody class="ltablebody">
				            <c:if test="${empty page.list}">
					            <tr>
									<td align="center" colspan="7"><font color="red"><my:i18n zhText="当前没有法庭信息" enText="No Lawsuit"/></font> </td>
							    </tr>
				           </c:if>
				           <c:forEach items="${page.list}" var="uv" varStatus="status">
				              <tr id="${uv.id }">
									<td align="center"><input type="checkbox" name="ids" value="${uv.id}"/></td>
									<td align="center"><my:rowNum page="${page}" rowIndex="${status.index}"/></td>
									<td align="center">${uv.title }</td>
									<td align="center">${uv.videoType }</td>
									<td align="center">${uv.videoSite } </td>
									<td align="center">${uv.createTime} </td>
									<td align="center">
									<a href="${ctx4ej }/lawsuit/uv_edit.do?coid=${uv.id}"><my:i18n zhText="编辑" enText="edit"/></a>
									
									   <%--<a href="javascript:" title="resetpassword" onclick="resetPassword('<my:i18n zhText="${user.userName}" enText="${user.enUserName}"/>','${user.id}')"><my:i18n zhText="重置密码" enText="Reset Password"/></a>	 --%>
									</td>
								</tr>
				              </c:forEach>
			            </tbody>
		         </table>
			<div class="ltablebottom">

				<div class="lpage"><my:page page="${page}"/></div>
			</div>
		</form>


	</div>
</body>

</html>