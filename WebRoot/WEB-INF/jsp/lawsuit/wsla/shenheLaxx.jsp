<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<script type="text/javascript">
		var addordetail = true;
		<%--var tolisturl = "${ctx }/lawsuit/laxx_list.do";--%>
		<%--var shurl="${ctx }/lawsuit/laxx_update.do";--%>
		var tolisturl = "${ctx4ej }/lawsuit/laxx_list.do";
		var shurl="${ctx4ej }/lawsuit/laxx_update.do";
		$(function() {
			$(".Wdate").click(function(){WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',lang:$.i18n("lang")});});
			if("${isDraft}"==""){$(":radio[value='N']").attr("checked","checked");}
			$("#submitBtn").submitForm({
				formId:"articleForm",
				onComplete:function(){
				    window.location.href = tolisturl;
				}
			});
			$("#tolistButton").click(function(){window.location.href=tolisturl;});
		});
		
		function shResult(state,shResult){
			var remark=$("#remark").val();
			$.post("${ctx4ej }/lawsuit/laxx_update.do",{id:'${lsLaxx.id}','state':state,'shResult':shResult,'remark':remark},
				function(data){
					  //不存在msg时，当作异常处理
					  if(data.msg==undefined){
						   $("body").html(data);
						   return;
					   }
					       
					  //data.code不是0时，后台操作失败
					  if(data.code!="0"){
						   var msgtemp = "";
						   if(data.msg!=""){
							   msgtemp = data.msg;
						   }
						   if(data.msgs!=null){
							   msgtemp += data.msgs;
						   }
						   alert(msgtemp);
					  }else{
					       //json主信息
					        alert(data.msg);
					        
						    $(":button,:submit,:reset").removeAttr("disabled");
				      
					       
					  }
					  window.location.href = tolisturl;
			},'json');
		}
		
		function yyTime(state,shResult){
			var remark=$("#remark").val();
			var yyrq=$("#yyrq").val();
			if(yyrq==""||yyrq=="undefind"){
				alert("请设置来院时间！");
				return;
			}
			$.post("${ctx4ej }/lawsuit/laxx_yyly.do",{id:'${lsLaxx.id}','yyrq':yyrq,'remark':remark},
				function(data){
					  //不存在msg时，当作异常处理
					  if(data.msg==undefined){
						   $("body").html(data);
						   return;
					   }
					       
					  //data.code不是0时，后台操作失败
					  if(data.code!="0"){
						   var msgtemp = "";
						   if(data.msg!=""){
							   msgtemp = data.msg;
						   }
						   if(data.msgs!=null){
							   msgtemp += data.msgs;
						   }
						   alert(msgtemp);
					  }else{
					       //json主信息
					        alert(data.msg);
					        
						    $(":button,:submit,:reset").removeAttr("disabled");
				      
					       
					  }
					  window.location.href = tolisturl;
			},'json');
		}
		
		
		 
	</script>
</my:head>
<body>
<div>
<div class="bodybox">
<div class="phead">
	<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>：<my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - <my:i18n zhText="立案审核" enText="立案审核"/> </div>
	<div class="pheadbutton" >
		   <input type="button" class="button orange"  value="<my:i18n zhText="返回列表" enText="Return To List Page"/>" id="tolistButton"/>
	</div>
	<div class="clear"></div>
</div>
  <div id="result" align="center" style="color: red;padding-top: 10px"></div>
<form method="post" action="${ctx4ej }/lawsuit/laxx_update.do" id="articleForm" enctype="multipart/form-data">
     <table width="100%" class="ftable">
		
		<c:forEach items="${yastList}" var="yast" varStatus="status">
			<tr>
			 	<th colspan="4" style="text-align:left;padding-left:20px;"><my:view pvalue="ssdw" value="${yast.ssdw}"/><my:view pvalue="dsrlx" value="${yast.type}"/>：</th>
			</tr>
			
			<c:choose>
				<c:when test="${yast.type eq '0'}">
					<tr>
						<th width="10%" >姓名：</th>
						  <td>
						    ${yast.name}
						  </td>
						  <th width="10%" >身份证：</th>
						  <td>
						    ${yast.sfz}
						  </td>
					</tr>
					<tr>
						<th width="10%" >出生日期：</th>
						  <td>
						    ${yast.csrq}
						  </td>
						  <th width="10%" >性别：</th>
						  <td>
						    <my:view pvalue="sex" value="${yast.sex}"/>
						  </td>
					</tr>
					<tr>
						<th width="10%" >民族：</th>
						  <td>
						    ${yast.mz}
						  </td>
						  <th width="10%" >手机号码：</th>
						  <td>
						    ${yast.sjhm}
						  </td>
					</tr>
					<tr>
						<th width="10%" >联系电话：</th>
						  <td>
						    ${yast.lxdh}
						  </td>
						  <th width="10%" >国籍：</th>
						  <td>
						    ${yast.gj}
						  </td>
					</tr>
					<tr>
						<th width="10%" >文化程度：</th>
						  <td>
						    ${yast.whcd}
						  </td>
						  <th width="10%" >邮政编码：</th>
						  <td>
						    ${yast.yzbm}
						  </td>
					</tr>
					<tr>
						<th width="10%" >户籍所在地：</th>
						  <td colspan="3">
						    ${yast.hjszd}
						  </td>
					</tr>
					<tr>
						<th width="10%" >联系地址：</th>
						  <td colspan="3">
						    ${yast.lxdz}
						  </td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th width="10%" >姓名：</th>
						  <td>
						    ${yast.name}
						  </td>
						  <th width="10%" >单位负责人或法定代表人名称：</th>
						  <td>
						    ${yast.fr}
						  </td>
					</tr>
					<tr>
						<th width="10%" >邮政编码：</th>
						  <td>
						    ${yast.yzbm}
						  </td>
						  <th width="10%" >手机号码：</th>
						  <td>
						    ${yast.sjhm}
						  </td>
					</tr>
					<tr>
						<th width="10%" >联系电话：</th>
						  <td>
						    ${yast.lxdh}
						  </td>
						  <th width="10%" >联系地址：</th>
						  <td>
						    ${yast.lxdz}
						  </td>
					</tr>
					
				</c:otherwise>
			</c:choose>
				
			
		</c:forEach>
		
		<tr>
			 	<th colspan="4" style="text-align:left;padding-left:20px;">诉讼请求：</th>
		</tr>
		<tr>
		  <th width="10%" >案件类型：</th>
		  <td>
		    <my:view pvalue="ajlx" value="${lsLaxx.ajlx}"/>
		  </td>
		  <th width="10%" >诉的种类：</th>
		  <td>
		    <my:view pvalue="sdzl" value="${lsLaxx.sdzl}"/>
		  </td>
		</tr>
		 <tr>
		  <th width="10%" >诉讼请求：</th>
		  <td>
		      ${lsLaxx.ssqq }
		  </td>
		  <th width="10%" >预约来院时间：</th>
		  <td>
		  	<c:if test="${!empty lsLaxx.yyrq}">${lsLaxx.yyrq}</c:if>
		    <c:if test="${empty lsLaxx.yyrq&&lsLaxx.state=='2'}"><input type="text" id="yyrq" name="yyrq" value="" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd'})"></c:if>
		  </td>
		</tr>
		<tr>
		<table class="ftable" style="width:100%">
			<tr>
				<td align="center" style="background-color: #f2f2f2">序号</td>
				<td align="center" style="background-color: #f2f2f2">案件进展</td>
				<td align="center" style="background-color: #f2f2f2">创建人</td>
				<td align="center" style="background-color: #f2f2f2">创建时间</td>
				<td align="center" style="background-color: #f2f2f2">审核意见</td>
				<td align="center" style="background-color: #f2f2f2">备注</td>
			</tr>
		<c:forEach items="${listHis }" var="his" varStatus="i">
			<tr>
				<td align="center">${i.count}</td>
				<td align="center">
				<c:choose>
				<c:when test="${his.laxxStatus=='0' }">
					申请立案
				</c:when>
				<c:when test="${his.laxxStatus=='1' }">
					一级审核
				</c:when>
				<c:when test="${his.laxxStatus=='2' }">
					二级审核
				</c:when>
				<c:when test="${his.laxxStatus=='3' }">
					预约来院时间
				</c:when>
				</c:choose>
				</td>
				<td align="center">${his.createUserName }</td>
				<td align="center">${his.createTime }</td>
				<td align="center">${his.opinion }</td>
				<td align="center">${his.remark }</td>
			</tr>
		</c:forEach>
			<tr>
			<td><span>备注：</span></td>
			<td align="left" colspan="5">
				
				<textarea id="remark" name="remark" style="width: 90%"></textarea>
			</td>
			</tr>
		</table>
		<br/>
		<br/>
		<br/>
		</tr>
		
		<%-- <tr id="contentImgTr1" <c:if test="${!empty uploadFileList}"> style="display: none" </c:if>>
			  <th width="10%" >上传附件： </th>
			  <td colspan="3" width="35%">
			     <input type="file" class="multi" id="upload" name="upload" size="40" maxlength="1" accept="doc|docx|xls|xlsx|ppt|pptx|rar|zip|gif|jpg|png|bmp|jpeg"/>
			  </td>
		</tr> --%>
		<c:if test="${!empty uploadFileList}">
			<tr id="contentImgTr2">
			 <th width="10%" >附件下载： </th>
			 <br>
		     <td colspan="3" width="35%">
			    <c:forEach items="${uploadFileList}" var="upfile">
			        <span id="${upfile.id}span">
			            <a href="${ctx4ej}/lawsuit/laxx_download.do?id=${id}&uploadFileId=${upfile.id}" title="下载">${upfile.uploadFileName }[${upfile.uploadFileSize}]</a>
			            <!-- 
			            <a href="javascript:" title="删掉" onclick="deleteUploadFile('${upfile.id}')">[删除]</a>
			             -->
			            <br/>
			         </span>
			     </c:forEach>
		  	</td>
			</tr>
		</c:if>
	  <tr style="text-align: center;">
		<td colspan="4" class="ftablebutton" >
			<c:choose>
				<c:when test="${lsLaxx.state=='3'}">
				<input type="button" class="button orange"  value="返回"  onclick="javascript:window.location.href='${ctx4ej }/lawsuit/laxx_list.do'" />
				</c:when>
				<c:when test="${lsLaxx.state=='2'}">
				<input type="button" class="button orange"  value="提交预约来院时间"  onclick="yyTime();" /> 
				</c:when>
				<c:when test="${lsLaxx.state=='1'}">
				<input type="button" class="button orange"  value="审核通过"  onclick="shResult('2','1');" /> &nbsp; <input type="button" class="button orange" onclick="shResult('2','0');" value="审核不通过"/>
				</c:when>
				<c:otherwise>
				<input type="button" class="button orange"  value="审核通过"  onclick="shResult('1','1');" /> &nbsp; <input type="button" class="button orange" onclick="shResult('1','0');" value="审核不通过"/>
				</c:otherwise>
			</c:choose>
			
			
		</td>
	 </tr>
	</table>
</form>
</div>
</div>
</body>
</html>