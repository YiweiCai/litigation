<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<my:head fck="true" datePicker="true" multiFile="true">
	<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		var list=true;
		var save = "";
		var tolisturl = "${ctx }/lawsuit/laxx_flist.do";
		$(function() {
			$("#submitBtn").submitForm({
				formId:"userForm",
				onComplete:function(){
				    window.location.href = "${ctx}/lawsuit/xf_flist.htm";
				}
			});
			
		});
	</script>
</my:head>
<body>
<form action="${ctx }/lawsuit/xf_save.do" method="post" id="userForm">
 <div class="regcontent">
    <div class="regtitle">信息填写</div>
    <ul>
      <li>
        <label class="length">提出人的姓名：</label>
        <input type="text" name="lsXf.name"  class="inputstyle" placeholder="请输入姓名" title="请输入姓名" 
		                    		 maxlength="100" rules="[{notNull:true, message:'请输入姓名'}]"/>
      </li>
      <li>
        <label class="length">提出人手机号：</label>
        <input type="text" name="lsXf.sjhm" class="inputstyle" placeholder="请输入手机号码" title="请输入手机号码" 
		                    		 maxlength="20" rules="[{notNull:true, message:'请输入手机号码'}]"/>
      </li>
      <li>
        <label class="length">提出人证件号码：</label>
        <input type="text" name="lsXf.zjhm" class="inputstyle" placeholder="请输入证件号码" title="请输入证件号码" 
		                    		 maxlength="50" rules="[{notNull:true, message:'请输入证件号码'}]"/>
      </li>
      <li>
        <label class="length">邮件地址：</label>
        <input type="text" name="lsXf.yjdz" class="inputstyle" maxlength="255"/>
      </li>
      <li>
        <label class="length">与案件关系：</label>
        <input type="text" name="lsXf.yagx" class="inputstyle" maxlength="255"/>
      </li>
      <li>
        <label class="length">案号：</label>
        <input type="text" name="lsXf.ah" class="inputstyle" maxlength="255"/>
      </li>
      <li>
        <label class="length">咨询内容：</label>
        <textarea name="lsXf.zxnr"  class="reginput" placeholder="请输入咨询内容" title="请输入咨询内容" 
		                    		 maxlength="255" rules="[{notNull:true, message:'请输入咨询内容'}]"></textarea>
        <br />
        <input id="submitBtn" class="submitbut"/><input  class="undobut"/>
      </li>
    </ul>
  </div>
</div>

</form>
</body>
</html>