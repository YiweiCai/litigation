<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%
	int i = 0;
%>
<my:head fck="true" datePicker="true" multiFile="true">
	<%@include file="/common/title.jsp" %>
	<link rel="stylesheet" type="text/css"
		href="${ctx}/js_css_image/front/css/base.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctx}/js_css_image/css/case.css" />
	<link rel="stylesheet"
		href="${ctx}/js_css_image/css/lawsuit/style_frontend_top.css"
		type="text/css">
	<link rel="stylesheet" href="${ctx}/js_css_image/css/lawsuit/lian.css"
		type="text/css">
	<script src="${ctx }/js_css_image/js/hintTip/hintTip.js" type="text/javascript"></script>
	<link href="${ctx }/js_css_image/css/hintTip/hintTip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		
	    var base = '';
	    if (base == null || base == '')
	        base = '/';
       
		
		function reload(){
		    location.reload();
		}
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		// 二级导航栏
		$('li.wzli').mousemove(function() {
			$(this).find('ul').slideDown();//you can give it a speed
		});
		$('li.wzli').mouseleave(function() {
			$(this).find('ul').slideUp();
		});
		
		// 登录框
		$(".nav li").hover(function() {
			$(this).addClass("hover");
			$(this).find("div.nav_slide").stop(true, true).show();
		}, function() {
			$(this).removeClass("hover");
			$(this).find("div.nav_slide").stop(true, true).hide();
		});
		
		// 登录
		$("#btnLogin").click(function(){
			login();
		});
		
		<c:if test="${empty userSession.id}">
			$("#ulLogin").show();
			$("#ulLogged").hide();
		</c:if>
		<c:if test="${!empty userSession.id}">
			$("#ulLogin").hide();
			$("#ulLogged").show();
		</c:if>
	});
	
	// 登录
	function login(){
		if($.trim($("#loginNameIndex").val()) == ""){
			$("#errorMsg").text("请输入用户名").css("visibility","visible");
			$("#loginNameIndex").focus();
			return false;
		} else if($("#passwordIndex").val() == ""){
			$("#errorMsg").text("请输入密码").css("visibility","visible");
			$("#passwordIndex").focus();
			return false;
		}
		
		$.post("${ctx4ej}/login/login_login.do", 
				{"loginName":$("#loginNameIndex").val(),"password":$("#passwordIndex").val()},function(data){
					if(data.msg == "success"){
						$("#errorMsg").text("登录成功").css("visibility","hidden");
						location = location;
					}else{
						$("#errorMsg").text(data.msg).css("visibility","visible");
					}
				},"json");
	}
	
	// 注销
	function logout(){
		$.post("${ctx4ej}/login/login_logoutAjax.do", function(data){
					location.reload();
				},"json");
	}
	
	
	
	
	
</script>
	<script>
	
	
	$(function(){
		
		/* var list = "${page.list}";
		$.each(list,function(index,value){
			alert(index+"----------"+value);
		}); */
		
		
	
	})
</script>
</my:head>

<div class="submitconent" id="submitconent">
	<div class="row">

		<!-- <div class="setps setp1">
				<ul class="lead_ul hidden">
					<li>立案申请人资料</li>
					<li>填写原告信息</li>
					<li>填写被告信息</li>
					<li>诉讼请求</li>
					<li>事实理由及证据上传</li>
					<li>提交审查</li>
				</ul>
			</div> -->
		<br>

		<div id="yg_zrr" class="comeare" style="display: none;">
			<h2>
				<span><img src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="yg" /> </span>原告自然人
			</h2>


			<input name="temp.ssdw" value="0" type="hidden"> <input name="temp.type" value="0" type="hidden">
			<label>姓名</label><input name="temp.name" type="text" value="" class="inputsubmit" tempinfo="原告的真实姓名，要与身份证相同；例：张三" /> 
			<label>身份证</label><input type="text" name="temp.sfz" value="" onblur="checkIdcard(this);" class="inputsubmit"><br />

			<!--下面是错误提示的样式-->

			<div class="errortips" style="display:none">
				<div class="errorleft">请正确填写信息！</div>
				<div class="errorright">身份证位数不正确！</div>
			</div>
			<label>出生日期</label><input name="temp.csrq" type="text" class="inputsubmit" tempinfo="填写身份证上的出生日期；例：1999-09-08"> 
			<label>性别</label> <input name="temp.sex" type="checkbox" value="boy">男 <input name="temp.sex" type="checkbox" value="girl">女 <br /> 
			<label>民族</label><input name="temp.mz" type="text" class="inputsubmit" tempinfo="填写身份证上的民族；例:汉族"> 
			<label>手机号码</label><input type="text" name="temp.sjhm" value="" onblur="checkMobile(this);" class="inputsubmit"><br /> 
			<label>联系电话</label><input type="text" name="temp.lxdh" class="inputsubmit"> 
			<label>国籍</label><input name="temp.gj" class="inputsubmit" type="text"><br /> 
			<label>文化程度</label><input type="text" name="temp.whcd" class="inputsubmit" tempinfo="最高受教育程度；例：高中"> 
			<label>邮政编码</label><input type="text" name="temp.yzbm" class="inputsubmit"><br> 
			<label>户籍所在地</label><input type="text" name="temp.hjszd" class="adresssubmit" tempinfo="户口所在地；例：XX派出所或XX村委会"> 
			<label>联系地址</label><input type="text" name="temp.lxdz" value="" class="adresssubmit">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="yg_fr" class="comeare" style="display: none">
			<h2>
				<span><img src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="yg" /> </span>原告法人
			</h2>

			<input name="temp.ssdw" value="0" type="hidden"> <input name="temp.type" value="1" type="hidden"> 
			<label>名称</label><input type="text" name="temp.name" value="" class="inputsubmit" tempinfo="真实姓名，与身份证相同；例：张三"> 
			<label>单位负责人或法定代表人名称</label><input class="inputsubmit" type="text" name="temp.fr" value=""><br />
			<label>邮政编码</label><input type="text" name="temp.yzbm" class="inputsubmit"> 
			<label>手机号码</label><input type="text" name="temp.sjhm" value="" onblur="checkMobile(this);" class="inputsubmit"><br /> 
			<label>联系电话</label><input type="text" name="temp.lxdh" class="inputsubmit"> 
			<label>联系地址</label><input class="adresssubmit" type="text" name="temp.lxdz" value="">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="yg_ffr" class="comeare" style="display: none">
			<h2>
				<span><img src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="yg" /> </span>原告非法人其它组织
			</h2>


			<input name="temp.ssdw" value="0" type="hidden"> <input
				name="temp.type" value="2" type="hidden"> <label>名称</label><input
				type="text" name="temp.name" value="" class="inputsubmit"> <label>单位负责人或法定代表人名称</label><input
				type="text" name="temp.fr" value="" class="inputsubmit"><br />
			<label>邮政编码</label><input type="text" name="temp.yzbm"
				class="inputsubmit"> <label>手机号码</label><input type="text"
				name="temp.sjhm" value="" onblur="checkMobile(this);"
				class="inputsubmit"><br /> <br /> <label>联系电话</label><input
				type="text" name="temp.lxdh" class="inputsubmit"><br /> <label>联系地址</label><input
				class="adresssubmit" type="text" name="temp.lxdz" value="">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="bg_zrr" class="comeare" style="display: none;">

			<h2>
				<span><img src="${ctx}/js_css_image/images/editicon.jpg" /><img
					src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="bg" /> </span>被告自然人
			</h2>

			<input name="temp.ssdw" value="1" type="hidden"> <input
				name="temp.type" value="0" type="hidden"> <label>姓名</label><input
				name="temp.name" class="inputsubmit" type="text" value=""> <label>身份证</label><input
				type="text" onblur="checkIdcard(this);" name="temp.sfz" value=""
				class="inputsubmit"><br /> <label>出生日期</label><input
				name="temp.csrq" size="11" type="text" class="inputsubmit">
			<input name="temp.sex" type="checkbox" value="boy">男 <input
				name="temp.sex" type="checkbox" value="girl">女 <br /> <label>民族</label><input
				name="temp.mz" class="inputsubmit" type="text"> <label>手机号码</label><input
				type="text" name="temp.sjhm" value="" onblur="checkMobile(this);"
				class="inputsubmit"> <br /> <label>联系电话</label><input
				type="text" name="temp.lxdh" class="inputsubmit"> <label>国籍</label><input
				name="temp.gj" type="text" class="inputsubmit"><br /> <label>文化程度</label><input
				type="text" name="temp.whcd" class="inputsubmit"> <label>邮政编码</label><input
				type="text" name="temp.yzbm" class="inputsubmit"> <br>
			<label>户籍所在地</label><input class="adresssubmit" type="text"
				name="temp.hjszd"> <label>联系地址</label><input
				class="adresssubmit" type="text" name="temp.lxdz" value="">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="bg_fr" class="comeare" style="display: none;">
			<h2>
				<span><img src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="bg" /> </span>被告法人
			</h2>

			<input name="temp.ssdw" value="1" type="hidden"> <input
				name="temp.type" value="1" type="hidden"> <label>名称</label><input
				type="text" name="temp.name" value="" class="inputsubmit"> <label>单位负责人或法定代表人名称</label><input
				class="inputsubmit" type="text" name="temp.fr" value=""> <br />
			<label>邮政编码</label><input type="text" name="temp.zybm"
				class="inputsubmit"> <label>手机号码</label><input type="text"
				name="temp.sjhm" value="" onblur="checkMobile(this);"
				class="inputsubmit"> <br /> <label>联系电话</label><input
				type="text" name="temp.lxdh" class="inputsubmit"> <br /> <label>联系地址</label><input
				class="adresssubmit" type="text" name="temp.lxdz" value="">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="bg_ffr" class="comeare" style="display: none;">
			<h2>
				<span><img src="${ctx}/js_css_image/images/deleteicon.png"
					onclick="deleteDiv(this);" tag="bg" /> </span>被告非法人其它组织
			</h2>
			<input name="temp.ssdw" value="1" type="hidden"> <input
				name="temp.type" value="2" type="hidden"> <label>名称</label><input
				type="text" name="temp.name" value="" class="inputsubmit"> <label>单位负责人或法定代表人名称</label><input
				class="inputsubmit" type="text" name="temp.fr" value=""> <br />
			<label>邮政编码</label><input type="text" name="temp.yzbm"
				class="inputsubmit"> <label>手机号码</label><input type="text"
				name="temp.sjhm" value="" onblur="checkMobile(this);"
				class="inputsubmit"> <br /> <label>联系电话</label><input
				type="text" name="temp.lxdh" class="inputsubmit"> <br /> <label>联系地址</label><input
				class="adresssubmit" type="text" name="temp.lxdz" value="">
			<%-- <div class="savesubmit"> <img src="${ctx}/js_css_image/images/savesubmit.jpg" /><img src="${ctx}/js_css_image/images/canclemit.jpg" /></div> --%>
		</div>

		<div id="zhengju" class="zhengju"
			style="width:600px;padding: 10px;position: relative; display: none;">
			<select name="testimonyNote" style="width: 130px; float:left"
				class="testimonyNote">
				<option value="">请选择材料类型</option>
				<option value="身份识别材料">身份识别材料</option>
				<option value="诉求材料">诉求材料</option>
				<option value="证据材料">证据材料</option>
			</select>
			<div style="display: inline;">
				<input type="file" class="multi" style="float:left" id="upload"
					name="upload" size="40" maxlength="1"
					accept="doc|docx|xls|xlsx|ppt|pptx|rar|zip|gif|jpg|png|bmp|jpeg" />

				<input type="button" onclick="deleteUpload(this);"
					class="btn1 smallbut1" value="删除">
			</div>

		</div>

		<form id="dataUpload" name="dataUpload"
			action="${ctx4ej }/lawsuit/laxx_save.do?coid=${coid}" method="post"
			enctype="multipart/form-data" accept-charset="UTF-8">


			<strong>申请受理法院：</strong> <select name="lsLaxx.sqslfy" id="wjFydm">
				<option value="440300">新郑市法院</option>
				<%--<option value="440300">郑州市中级人民法院</option>
					<option value="440300">巩义市法院</option>
					<option value="440300">登封市法院</option>
					<option value="440300">荥阳市法院</option>
					<option value="440300">新密市法院</option>
					<option value="440300">新郑市法院</option>
					<option value="440300">中牟县法院</option>
					<option value="440300">航空港区法院</option>
					<option value="440300">金水区法院</option>
					<option value="440300">二七区法院</option>
					<option value="440300">中原区法院</option>
					<option value="440300">管城区法院</option>
					<option value="440300">惠济区法院</option>
					<option value="440300">上街区法院</option>
					<option value="440300">郑州高新区法院</option>
				--%>
			</select><br> <br>
			<div class="message_add">
				<img src="${ctx}/js_css_image/images/step01.jpg" />
				<button point="yg_zrr|yg_formContent|yg_init" id="ygzrr"
					type="button" class="btn1 small">原告自然人</button>
				<button point="yg_fr|yg_formContent|yg_init" id="ygfr" type="button"
					class="btn1 small">原告法人</button>
				<button point="yg_ffr|yg_formContent|yg_init" id="ygffr"
					type="button" class="btn1 small">原告非法人其他组织</button>
				<br>

				<c:forEach items="${page.list}" var="l" varStatus="p">
					<c:choose>
						<c:when test="${l.type=='0' }">
							<div id="yg_zrr${p.index }" class="comeare">
								<h2>
									<span><img
										src="${ctx}/js_css_image/images/deleteicon.png"
										onclick="deleteDiv(this);" tag="yg" /> </span>原告自然人
								</h2>
								<input name="yastList[${p.index}].id" value="${l.id }"
									type="hidden"> <input name="yastList[${p.index}].ssdw"
									value="0" type="hidden"> <input
									name="yastList[${p.index}].type" value="0" type="hidden">
								<label>姓名</label><input name="yastList[${p.index}].name"
									type="text" value="${l.name }" class="inputsubmit"> <label>身份证</label><input
									type="text" name="yastList[${p.index}].sfz" value="${l.sfz }"
									onblur="checkIdcard(this);" class="inputsubmit"><br />
								<div class="errortips" style="display:none">
									<div class="errorleft">请正确填写信息！</div>
									<div class="errorright">身份证位数不正确！</div>
								</div>
								<label>出生日期</label><input name="yastList[${p.index}].csrq"
									type="text" value="${l.csrq }" class="inputsubmit"> <label>性别</label>
								<c:choose>
									<c:when test="${l.sex=='boy' }">

										<input name="yastList[${p.index}].sex" type="checkbox"
											value="boy" checked="checked">男 
						    		<input name="yastList[${p.index}].sex" type="checkbox"
											value="girl">女 <br />
									</c:when>
									<c:otherwise>
										<input name="yastList[${p.index}].sex" type="checkbox"
											value="boy">男 
						    		<input name="yastList[${p.index}].sex" type="checkbox"
											value="girl" checked="checked">女 <br />
									</c:otherwise>
								</c:choose>

								<label>民族</label><input name="yastList[${p.index}].mz"
									type="text" class="inputsubmit" value="${l.mz }"> <label>手机号码</label><input
									type="text" name="yastList[${p.index}].sjhm" value="${l.sjhm }"
									onblur="checkMobile(this);" class="inputsubmit"><br />
								<label>联系电话</label><input type="text"
									name="yastList[${p.index}].lxdh" value="${l.lxdh }"
									class="inputsubmit"> <label>国籍</label><input
									name="yastList[${p.index}].gj" class="inputsubmit"
									value="${l.gj }" type="text"><br /> <label>文化程度</label><input
									type="text" name="yastList[${p.index}].whcd" value="${l.whcd }"
									class="inputsubmit"> <label>邮政编码</label><input
									type="text" name="yastList[${p.index}].yzbm" value="${l.yzbm }"
									class="inputsubmit"><br> <label>户籍所在地</label><input
									type="text" name="yastList[${p.index}].hjszd"
									value="${l.hjszd }" class="adresssubmit"> <label>联系地址</label><input
									type="text" name="yastList[${p.index}].lxdz" value="${l.lxdz }"
									class="adresssubmit">
							</div>
						</c:when>
						<c:when test="${l.type=='1' }">
							<div id="yg_fr${p.index }" class="comeare">
								<h2>
									<span><img
										src="${ctx}/js_css_image/images/deleteicon.png"
										onclick="deleteDiv(this);" tag="yg" /> </span>原告法人
								</h2>
								<input name="yastList[${p.index}].ssdw" value="0" type="hidden">
								<input name="yastList[${p.index}].type" value="1" type="hidden">
								<input name="yastList[${p.index}].id" value="${l.id }"
									type="hidden"> <label>名称</label><input type="text"
									name="yastList[${p.index}].name" value="${l.name }"
									class="inputsubmit"> <label>单位负责人或法定代表人名称</label><input
									class="inputsubmit" type="text" name="yastList[${p.index}].fr"
									value="${l.fr }"><br /> <label>邮政编码</label><input
									type="text" name="yastList[${p.index}].yzbm" value="${l.yzbm }"
									class="inputsubmit"> <label>手机号码</label><input
									type="text" name="yastList[${p.index}].sjhm" value="${l.sjhm }"
									onblur="checkMobile(this);" class="inputsubmit"><br />
								<label>联系电话</label><input type="text"
									name="yastList[${p.index}].lxdh" value="${l.lxdh }"
									class="inputsubmit"> <label>联系地址</label><input
									class="adresssubmit" type="text"
									name="yastList[${p.index}].lxdz" value="${l.lxdz }">
							</div>
						</c:when>
						<c:when test="${l.type=='2' }">
							<div id="yg_ffr${p.index }" class="comeare" >
								<h2>
									<span><img
										src="${ctx}/js_css_image/images/deleteicon.png"
										onclick="deleteDiv(this);" tag="yg" />
									</span> 原告非法人其它组织
								</h2>
								<input name="yastList[${p.index}].ssdw" value="0" type="hidden">
								<input name="yastList[${p.index}].type" value="2" type="hidden">
								<input name="yastList[${p.index}].id" value="${l.id }"
									type="hidden"> <label>名称</label><input type="text"
									name="yastList[${p.index}].name" value="${l.name }"
									class="inputsubmit"> <label>单位负责人或法定代表人名称</label><input
									type="text" name="yastList[${p.index}].fr" value="${l.fr }"
									class="inputsubmit"><br /> <label>邮政编码</label><input
									type="text" name="yastList[${p.index}].yzbm"
									class="inputsubmit" value="${l.yzbm }"> <label>手机号码</label><input
									type="text" name="yastList[${p.index}].sjhm" value="${l.sjhm }"
									onblur="checkMobile(this);" class="inputsubmit"><br />
								<br /> <label>联系电话</label><input type="text"
									name="yastList[${p.index}].lxdh" class="inputsubmit"
									value="${l.lxdh }"><br /> <label>联系地址</label><input
									class="adresssubmit" type="text"
									name="yastList[${p.index}].lxdz" value="${l.lxdz }">
							</div>
						</c:when>
					</c:choose>
				</c:forEach>

			</div>
			<div id="yg_formContent" style="margin-left:4px;">
				<div id="yg_init"
					style="height: 20px; text-align: center; line-height: 25px; color: red; margin-bottom: 10px;">
					请添加原告当事人！</div>
			</div>
			<input type="hidden" name="modiflsah" value="">
			<div class="lead_btn" style="margin-top: 20px; margin-left:200px;">
				<a class="btn1 btn_reset" href="javascript:void(0)">上一步</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<!--<a class="btn1 btn_yellow" href="javascript:history.go(-1)">下一步</a> -->
				<c:choose>
					<c:when test="${lsLaxx.dqjd>1 }">
						<a class="btn1 btn_yellow"
							href="${ctx4ej }/lawsuit/laxx_goBack.do?goTo=2&coid=${coid}">下一步</a>
					</c:when>
					<c:otherwise>
						<input id="submitBtn" class="btn1 btn_yellow" type="button"
							value=" 下一步 ">
					</c:otherwise>
				</c:choose>

			</div>
		</form>
	</div>
</div>

<script>
	
		 
		 /* $("button[point]").click(function(){
			var tag = $(this).attr("point");
			var s = tag.split("|");
			if(!$("#"+s[2]).is("hidden")){
				$("#"+s[2]).hide();
			}
			var test = document.getElementById(s[0]).cloneNode(true);
			$("#"+s[1]).children(":first").before(test);
			$(test).slideDown(500);
			
		});  */
	
		
	$(document).ready(function(){
		var sm = document.getElementById("sm");
		var sdzl = "";
		if(sdzl== "变更之诉"){
			sm.innerHTML = "说明：变更之诉，是指当事人请求人民法院改变或消灭其与对方当事人之间现存的民事法律关系的诉。例如，要求解除收养关系之诉，要求撤销买卖合同之诉等等。<br>变更之诉具有如下特征：<br>（1）双方当事人对现存的法律关系无争议，只是对这一法律关系是否变更或如何变更有争议。<br>（2）双方当事人只是要求法院对某一法律关系加以变更，而不要求解决权利或义务的承担问题。<br>（3）在法院的变更判决生效以前，当事人之间的法律关系仍然保持不变。";
		}else if(sdzl == "确认之诉"){
			sm.innerHTML = "说明：确认之诉，是指原告请求人民法院确认其与被告间存在或不存在某种民事法律关系的诉。<br>确认之诉具有以下特征： <br>（1）法院只是对双方当事人之间是否存在某种民事法律关系进行确认，而并不判另一方履行一定的民事义务。<br>（2）当事人提起确认之诉的目的是谋求法院对某一民事法律关系是否存在或不存在，以及存在的范围作出肯定或否定的裁判。<br>（3）由于在确认之诉中，当事人之间没有行使权利和履行义务之争，故法院的裁判不存在执行问题。";
		}else if(sdzl == "给付之诉"){
			sm.innerHTML = "说明：给付之诉，是指一方当事人请求法院判令对方当事人履行一定民事义务之诉。给付之诉以请求履行的义务是否到期为标准，分为现在给付之诉和将来给付之诉。<br>给付之诉具有以下特征： <br>（1）当事人提起给付之诉的目的，在于请求法院判令对方当事人履行一定的民事义务。<br>（2）给付之诉具有执行性，即法院作出的给付判决生效后，负有义务的当事人必须按照判决的要求履行义务，否则法院将根据对方当事人的申请强制执行。";
		}
		
		
		
		
	       
		
		
	
		$("a[class='btn']").click(function(e){
			var obj = this;
			e.preventDefault();
			if(confirm('确认需要删除该材料吗？删除后不可恢复'/* +$(this).data('info').tid */)){
				 var url = $(this).attr('href');
				 /*
				$("<form>").attr("method", "POST").attr("action", url).appendTo('body').submit(); */
				$.ajax({
					url:url,
					type:'POST',
					dataType:'json',
					complete:function(){	
						$(obj).parent().parent().remove();
					}
				}); 
			}
		});
		
		
		//添加材料上传的选择框和上传文本框到form里面
		var zhengju = document.getElementById('zhengju').cloneNode(true);
		zhengju.style.display='block';
		//$("#formContent3").children(":first").before(zhengju);
		 var caseUploadTestimonyList = ""; 

		if(caseUploadTestimonyList == null || caseUploadTestimonyList==0){
			addUpload();
			addUpload();
			addUpload(); 
		} 
		
		$("button[point]").click(function(){
			var tag = $(this).attr("point");
			var s = tag.split("|");
			if(!$("#"+s[2]).is("hidden")){
				$("#"+s[2]).hide();
			}
			var test = document.getElementById(s[0]).cloneNode(true);
			$("#"+s[1]).children(":first").before(test);
			$(test).slideDown(500);
			var i=0;
		    $(".comeare:not(:hidden)").each(function(){
		    	$(this).find(":input[type='text'],:input[type='checkbox'],:input[type='radio']:checked,:input[type='hidden'],select:selected").each(function(){
		    		
		    		$(this).attr('name','yastList['+i+'].'+$(this).attr('name').split('.')[1]);
		    		$(this).attr("HintInfo",$(this).attr("tempinfo"));
		    		$(this).blur(function(){
		    			if($(this).val()!=""&&$(this).val()!=null)
		    				$(this).removeAttr("style");
		    		});
		    	});
		    	i++;
		    });
		    hintTip();
		});
		
		$('#submitBtn').submitForm({
				formId:"dataUpload",
				
				onSubmit:function(){
					 var i=0;
					 var comeareNum=0;
					 $(".comeare:not(:hidden)").each(function(){
							
					    	$(this).find(":input[type='text'],:input[type='checkbox']:checked,:input[type='radio']:checked,:input[type='hidden'],:selected").each(function(){
					    		if($(this).val()==""||$(this).val()==null){
					    			$(this).attr("style","border-color: red;");
					    			i++
					    			if(i==1){
					    				$(this).focus();
					    			}
					    		}else{
					    			$(this).removeAttr("style");
					    		}
					    		
					    	});
					    	comeareNum++;
					    });
					 $(".selectsubmit").each(function(){
						
						 if($(this).val()==""||$(this).val()==null){
				    			$(this).attr("style","border-color: red;");
				    			i++
				    			if(i==1){
				    				$(this).focus();
				    			}
				    		}else{
				    			$(this).removeAttr("style");
				    		}
						 $(this).blur(function(){
				    			if($(this).val()!=""&&$(this).val()!=null)
				    				$(this).removeAttr("style");
				    		});
					 });
					 $("#formContent3").find(".testimonyNote,:input[type='file']").each(function(){
						 
						 if($(this).val()==""||$(this).val()==null){
				    			$(this).attr("style","border-color: red;background:red;");
				    			i++
				    			if(i==1){
				    				$(this).focus();
				    			}
				    		}else{
				    			$(this).removeAttr("style");
				    		}
						 $(this).blur(function(){
				    			if($(this).val()!=""&&$(this).val()!=null)
				    				$(this).removeAttr("style");
				    		});
					 });
					 if(comeareNum>0){
						 if(i>0){
				    			alert("请输入必填内容！");
				    			return false;
				    		}
					 }else{
						 alert("请至少添加一个原告和一个被告！");
						 return false;
					 }
					 
				},
				
				onComplete:function(data){//easyui form,server返回json时，contentType需为text/html，否则将提示下载内容
					  //将json字符串转化成json
					  try{
						  data = $.parseJSON(data);
					  }catch(e){
						  //不能解析成json的数据，都当作异常处理
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
				}
		
		});
		
		

	
		
		
			
		});
		
		var curobj = null;
		function clearObj(){
			var target = $(curobj).attr("tag");
			var s1 = target +"_formContent";
			var s2 = target + "_init";
			curobj.parentNode.parentNode.parentNode.removeChild(curobj.parentNode.parentNode);
			if($("#"+s1).children(".comeare").length==0){
				$("#"+s2).slideDown(100);
			}
		}
	
		function deleteDiv(obj){
			//var id = $(obj.parentNode.parentNode).find("input[name='temp.id']").val();
			
			curobj = obj;
			if(confirm("您确定要删除吗？删除后不可恢复")){
				
						$(curobj.parentNode.parentNode.parentNode).slideUp(400);
						//setTimeout("clearObj()",450);
						var target = $(curobj).attr("tag");
						var s1 = target +"_formContent";
						var s2 = target + "_init";
						curobj.parentNode.parentNode.parentNode.parentNode.removeChild(curobj.parentNode.parentNode.parentNode);
						if($("#"+s1).children(".comeare").length==0){
							$("#"+s2).slideDown(100);
						}
				
			}
			
			
			
  			/* var obj = this;			
			e.preventDefault();
			if(confirm('确认需要删除该材料吗？删除后不可恢复')){
				 var url = $(this).attr('href');
				$.ajax({
					url:url,
					type:'POST',
					dataType:'json',
					complete:function(){	
						$(obj).parent().parent().parent().slideUp();
					}
				}); 
			} */
		}
			
		//增加上传
		function addUpload(){
			var testUpload = document.getElementById('zhengju').cloneNode(true);
			testUpload.id = null;
			testUpload.style.display="none";
		//	$(test).children(":last").css("display","inline");
			$(testUpload).find("div").children(":last").css({"float":"left","display":"inline"});
			$("#formContent3").prepend(testUpload);
			$(testUpload).slideDown();
		}
	
		//减少上传
		function deleteUpload(obj){
			$(obj.parentNode.parentNode).slideUp(function(){
				obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
			});
		}
		
		//检查验证身份证号码格式
		function checkIdcard(obj){
			
			var idcard =  $.trim(obj.value);
			var reg = new RegExp("^[0-9]{17}[0-9xX]{1}$");
			var flag = true;
			if(!reg.test(idcard)){
				flag = false;
				alert("您输入的身份证号码格式有误，身份证号码为18位，前17位由数字组成，最后一位由数字或大小写英文字母“x”组成！");
			}
			if(flag == true){
				var year = idcard.substring(6,10);
				var month = idcard.substring(10,12);
				var day = idcard.substring(12,14);
				var csrq = year+"-"+month+"-"+day;
				
				//取得出生日期的input对象，并赋值
				var ns = obj.nextSibling.nextSibling.nextSibling.nextSibling;
				ns.value = csrq;
				
				//判断性别，取出身份证号码的第17位，奇数表示男性，偶数表示女性
				var temp = idcard.substring(16,17);
				if(temp%2 == 1){
					$(obj.parentNode).find("input[value='boy']").attr("checked","checked");
					$(obj.parentNode).find("input[value='girl']").removeAttr("checked").attr("disabled","disabled");
				}else{
					$(obj.parentNode).find("input[value='boy']").removeAttr("checked").attr("disabled","disabled");
					$(obj.parentNode).find("input[value='girl']").attr("checked","checked");
				}
			}else{
				//当前身份证号码格式有误，输入框中的内容被选中，光标移到输入框中
				//obj.select();
				//obj.focus();
			}
		}
		
		//检查验证手机号码格式
		function checkMobile(obj){
			var mobile =  $.trim(obj.value);
			var reg = new RegExp("^[0-9]{11}$");
			if(!reg.test(mobile)){
				alert("您输入的手机号码格式有误，手机号码由11位数字组成！");
			}
		}
		
		function change(obj){
			var sm = document.getElementById("sm");
			if(obj.value == "0"){
				sm.innerHTML = "说明：变更之诉，是指当事人请求人民法院改变或消灭其与对方当事人之间现存的民事法律关系的诉。例如，要求解除收养关系之诉，要求撤销买卖合同之诉等等。<br>变更之诉具有如下特征：<br>（1）双方当事人对现存的法律关系无争议，只是对这一法律关系是否变更或如何变更有争议。<br>（2）双方当事人只是要求法院对某一法律关系加以变更，而不要求解决权利或义务的承担问题。<br>（3）在法院的变更判决生效以前，当事人之间的法律关系仍然保持不变。";
			}else if(obj.value == "1"){
				sm.innerHTML = "说明：确认之诉，是指原告请求人民法院确认其与被告间存在或不存在某种民事法律关系的诉。<br>确认之诉具有以下特征： <br>（1）法院只是对双方当事人之间是否存在某种民事法律关系进行确认，而并不判另一方履行一定的民事义务。<br>（2）当事人提起确认之诉的目的是谋求法院对某一民事法律关系是否存在或不存在，以及存在的范围作出肯定或否定的裁判。<br>（3）由于在确认之诉中，当事人之间没有行使权利和履行义务之争，故法院的裁判不存在执行问题。";
			}else if(obj.value == "2"){
				sm.innerHTML = "说明：给付之诉，是指一方当事人请求法院判令对方当事人履行一定民事义务之诉。给付之诉以请求履行的义务是否到期为标准，分为现在给付之诉和将来给付之诉。<br>给付之诉具有以下特征： <br>（1）当事人提起给付之诉的目的，在于请求法院判令对方当事人履行一定的民事义务。<br>（2）给付之诉具有执行性，即法院作出的给付判决生效后，负有义务的当事人必须按照判决的要求履行义务，否则法院将根据对方当事人的申请强制执行。";
			}
		}
	
</script>
<script>
	$(function(){
	
		var href = window.location.href;
		var fy = href.split("=");
		if(fy[1]=='yantian' || fy[2]=='yantian'){
			$("#wjFydm").val('440306');
			$("#wjFydm").hide();
			document.getElementById("reback").href='/frontend/woyaolian/register/logout?fy=yantian';
			document.getElementById("return").href='/frontend/woyaolian/register/Belong?fy=yantian';
		}else if(fy[1]=='luohu' || fy[2]=='luohu'){
			$("#wjFydm").val('440301');
			//$("#wjFydm").hide();
			document.getElementById("dataUpload").action='/frontend/woyaolian/register/Yuangao?fy=luohu';
			document.getElementById("reback").href='/frontend/woyaolian/register/logout?fy=luohu';
			document.getElementById("return").href='/frontend/woyaolian/register/Belong?fy=luohu';
		}
		
	})
	
</script>

