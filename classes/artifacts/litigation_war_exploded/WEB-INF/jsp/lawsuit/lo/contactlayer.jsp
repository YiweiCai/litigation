<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<my:head fck="true" datePicker="true" multiFile="true">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript">
	$(function(){
		$("#submitBtn").submitForm({ 
			formId:"frm",
			onComplete:function(){
			    //window.location.href = tolisturl;
			    
				backUrl();
			}
		});
	
	});
	function backUrl(){
		window.location.href=<c:choose><c:when test="${empty url}">'${ctx }/lawsuit/lo_flist.do?type=${type}'</c:when><c:otherwise>unescape('${url}')</c:otherwise></c:choose>;
	  }

</script>
<link href="${ctx }/js_css_image/css/common.css" rel="stylesheet" type="text/css" />
</my:head>

<body>
<form id="frm" name="frm" action="${ctx }/lawsuit/lo_save.do" method="post">
	<input type="hidden" name="lo.type" value="${type }" />
  <div class="layercontent">
  <c:choose>
  	<c:when test="${type eq '2' }"><h1>代表委员监督</h1></c:when>
  	<c:when test="${type eq '1' }"><h1>咨询律师</h1></c:when>
  	<c:otherwise><h1>答疑</h1></c:otherwise>
  </c:choose>
  <ul>
  <li><label class="labelstyle">标题：</label>
    <input type="text" name="lo.questionTitle" id="questionTitle"  class="inputstyle"/>
  </li>
    <li><label class="labelstyle postion">内容：</label>
      
      <textarea name="lo.questionContext" id="questionContext" cols="45" rows="5" class="selectsyle"></textarea>
    
  </li>
  <div class="tips">以上为公开咨询，如果您的问题不便于公开或涉及隐私，请尽量避免使用真实姓名。</div>
  
  <!-- <li><label class="labelstyle">问题分类：</label>
  
  <div class="typebuteare"> <a href="#" class="typebut">婚姻家庭</a><a href="" class="seltypebut">债权债务</a><a href="#" class="typebut">合同纠纷</a><a href="#" class="typebut">劳动纠纷</a>
  <a href="#" class="typebut">婚姻家庭</a><a href="" class="seltypebut">债权债务</a><a href="#" class="typebut">合同纠纷</a><a href="#" class="typebut">劳动纠纷</a></div> 
  
  </li> -->
  <li><label class="labelstyle">联系方式：</label><input type="text" name="lo.questionerPhone" id="questionerPhone" class="inputstyle"/></li>
  <div class="tips">建议填写真实手机号，可免费得到律师对该问题的电话回访。</div>
   <p class="layerbut" id="submitBtn"></p>
  
  </ul>
   <p class="question"><strong>如何提问：</strong>简明扼要的案情叙述和提问，能使您的问题得到更高效的解决。 <br />
     1、简要叙述案情，包括当事人(不要写真实姓名及地址)、事情经过、证据资料(合同、协议等)，客观描述案情，不包含主观猜测。<br />
2、案件当前进展，如是否达成书面协议、是否报警、是否起诉等。
<br />
3、需要律师提供什么样的帮助。认真对待案件分类和地区选择，准确的案件分类可以吸引专业律师关注，得到更准确的回复。</p>
</div>

</form>
</body>
</html>
