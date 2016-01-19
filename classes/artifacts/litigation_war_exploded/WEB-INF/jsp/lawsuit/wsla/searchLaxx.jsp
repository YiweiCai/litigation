<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head lhgdialog="true" tree3="true">
    <style type="text/css">.ztree li a:hover {text-decoration:none;}</style>
     <script type="text/javascript">
	     function changeImg(){       
	        $("#authCode").attr("src","${ctx }/lawsuit/laxx_getAuthCode.do?d="+new Date().valueOf());       
	    }  
	
		$(function(){
			
			$("#submitBtn").submitForm({ 
					formId:"userForm",
					onComplete:function(data){
					    //window.location.href="${ctx }/lawsuit/laxx_flist.do";
					    if(!data.msg){ 
					    	alert("验证码不正确");
					    }
					}
				});
			
			//$("#authCode").attr("src","${ctx }/lawsuit/laxx_getAuthCode.do?d="+new Date().valueOf());      
			 $("#sfz").hide();
			 $(":radio[name='search_type']").click(function(){
			
			 	if($(this).val() == '0'){
			 		$('#sjhm').show();
			 		$("#sfz").hide();
			 		$('#isfz').attr('disabled','disabled');
			 		$('#isjhm').removeAttr("disabled");
			 	}else{
			 		$('#sjhm').hide();
			 		$("#sfz").show();
			 		$('#isjhm').attr('disabled','disabled');
			 		$('#isfz').removeAttr("disabled");
			 	}
			 });
		})
	</script>
</my:head>
<body>

<div class="bodybox">
	   <div class="phead">
			<div class="pheadposition"><my:i18n zhText="当前位置" enText="Current Position"/>： <my:i18n zhText="诉讼信息管理" enText="Lawsuit Mgt"/> - <my:i18n zhText="立案审核" enText="立案审核"/> 
			</div>
			<div class="pheadbutton">
			   <!--   <input type="button" class="button orange"  value="刷新" id="refreashButton"/> -->
			   <input type="button" class="button orange"  id="searchButton" value="<my:i18n zhText="查询" enText="Search"/>" />
			   <my:auth fixedValue="W" value="${auth}">
				  
				   <!--
				    <input type="button" class="button orange"  value="<my:i18n zhText="添加用户" enText="Add A New User"/>"  id="addnewButton"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导入用户" enText="Import Users"/>"  id="importExcel"/> 
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出excel" enText="Export Excel"/>"  id="exportExcel"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出word" enText="Export Word"/>"  id="exportWord"/>
				   <input type="button" class="button orange"  value="<my:i18n zhText="导出pdf" enText="Export Pdf"/>"  id="exportPdf"/>
				  -->
			   </my:auth>
			</div>
			<div class="clear"></div>
			</div>
		   <form action="${ctx }/lawsuit/laxx_flist.do" method="post" id="userForm">
			 <input name="search_type" type="radio" value="0" checked="checked"/>手机号码 
			 <input name="search_type" type="radio" value="1" />身份证
	      	
	      	<table class="search">
	      			<tr id="sjhm">
	      				<td>手机号码：</td>
	      				<td><input type="text" name="lsYast.sjhm" id='isjhm' class="reginput" placeholder="请输入验证码" title="请输入验证码" 
		                    		 maxlength="10" rules="[{notNull:true, message:'请输入验证码'}]"/></td>
	      			</tr>
	      			<tr id="sfz">
	      				<td>身份证：</td>
	      				<td><input type="text" name="lsYast.sfz" id='isfz' disabled="disabled" class="reginput" placeholder="请输入验证码" title="请输入验证码" 
		                    		 maxlength="10" rules="[{notNull:true, message:'请输入验证码'}]"/></td>
	      			</tr>
	      			<tr>
	      				<td>验证码：</td>
	      				<td>
	      				<input type="text" name="yzm" id="yzm" class="reginput" placeholder="请输入验证码" title="请输入验证码" 
		                    		 maxlength="10" rules="[{notNull:true, message:'请输入验证码'}]" />
	      				<img src="${ctx }/lawsuit/laxx_getAuthCode.do" alt="验证码" id="authCode" onclick="changeImg()">   
        <a href="#" onclick="changeImg()">看不清，换一张！</a></td>
	      			</tr>
	      			<tr>
	      				<td colspan="2">
	      					<button type="button"  id="submitBtn">提交</button>
	      					<button type="reset"  >清空</button>
	      				</td>
	      			</tr>
	      	</table>
	      	
	       </form>
	       
	     
</div>
</body>
</html>