<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
</head>

<body>

  <div class="submitconent"><br />
  <img src="${ctx }/js_css_image/images/dsrtitle.jpg" />
  <span class="personbut01">原告自然人</span>
  <span class="personbut01">原告法人</span>
  <span class="personbut02">原告非法人其他组织</span>
   <div class="comeare"><h2><span><a href="#"><img src="${ctx }/js_css_image/images/editicon.jpg" /></a><a href="#"><img src="${ctx }/js_css_image/images/deleteicon.png" /></a></span>原告法人</h2>
   <label><span class="redfont">*</span>当事人名称：</label>
   <input type="text" name="textfield" id="textfield" class="inputsubmit" />
   <input name="yastList.name" class="short" type="text" value="必填" onfocus="if (this.value==&#39;必填&#39;) this.value=&#39;&#39;;" placeholder="必填">
    <label>国家或地区：</label>
    <select name="select" id="select" class="selectsubmit">
    </select>
    <input name="yastList.gj" class="short" type="text">
    <br /> <label>
      组织机构代码：</label>
   <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
<label>特殊行业：</label>
    <select name="select" id="select" class="selectsubmit">
    </select>
   <br /> <label>单位性质：</label>
    <select name="select" id="select" class="selectsubmit">
    </select>
     <label><span class="redfont">*</span>法定代表人或主要负责人：</label>
   <input type="text" name="textfield" id="textfield" class="inputsubmit" />
      <label>性别：</label>
      <div class="width140"><input name="yastList.sex" type="checkbox" value="boy" disabled="disabled" checked="checked">男
       <input name="yastList.sex" disabled="disabled" type="checkbox" value="girl">女 </div>
        
        <label>联系方式（法定代表人或主要负责人）：</label>
           <input type="text" name="yastList.sjhm" value="必填" onblur="checkMobile(this);" onfocus="if (this.value==&#39;必填&#39;) this.value=&#39;&#39;;" placeholder="必填">
<label>职务：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
       <label>民族：</label>
   <input name="yastList.mz" class="short" type="text">
    <label>出生日期：</label>
        <input name="yastList.csrq" size="11" disabled="disabled" type="text">
        <label>年龄：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
        <label><span class="redfont">*</span>身体证件：</label>
      <span class="width200"><input type="radio" name="radio" id="radio" value="radio" />
        有
        <input type="radio" name="radio" id="radio" value="radio" />
        无</span>
        
        <label>代表人证件类型：</label>
    <select name="select" id="select" class="selectsubmit">
      <option>中华人民共和国居民身份证</option>
    </select> 
    <label>代表人证件号码：</label>
        <input type="text" name="yastList.sfz" value="必填" onblur="checkIdcard(this);" onfocus="if (this.value==&#39;必填&#39;) this.value=&#39;&#39;;" placeholder="必填">
        <label>签发机关：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
        <label>有效期限：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
        <label>电子邮箱：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
        <label>邮政编码：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
          <br /><label><span class="redfont">*</span>联系地址：</label>
        <input type="text" name="textfield" id="textfield"  class="adresssubmit"/>
          <label>联系电话：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
        <label>其他联系方式：</label>
        <input type="text" name="textfield" id="textfield"  class="inputsubmit"/>
       <div class="savesubmit"> <img src="${ctx }/js_css_image/images/savesubmit.jpg" /><img src="${ctx }/js_css_image/images/canclemit.jpg" /></div>
   </div>
   
   <br />
  <img src="${ctx }/js_css_image/images/bgrtitle.jpg" />
  <span class="personbut01">被告自然人</span>
  <span class="personbut01">被告法人</span>
  <span class="personbut02">被告非法人其他组织</span><br />
   <div class="comeare">
     <h2><span><a href="#"><img src="${ctx }/js_css_image/images/editicon.jpg" /></a><a href="#"><img src="${ctx }/js_css_image/images/deleteicon.png" /></a></span>被告法人</h2>
   <label><span class="redfont">*</span>单位名称：</label>
   <input type="text" name="textfield" id="textfield" class="inputsubmit" />
    <label>单位性质：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
    <br /> <label>
      单位地址：</label>
      <input type="text" name="textfield" id="textfield" class="adresssubmit" /> 
      <label>法人姓名：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
       <label>法人职务：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
       <label>法人证件类型：</label>
    <select name="select" id="select" class="selectsubmit">
    </select>
    <label>法人证件号码：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
  <label>*法人手机号码：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
       <label>*法人固定电话：</label>
       <input type="text" name="textfield" id="textfield" class="inputsubmit" />
       <div class="savesubmit"> <img src="${ctx }/js_css_image/images/savesubmit.jpg" /><img src="${ctx }/js_css_image/images/canclemit.jpg" /></div>
   </div>
   
  <br />
  <img src="${ctx }/js_css_image/images/ssqqtitle.jpg" /> <br /><br />
   申请受理法院：<select name="select" id="select" class="selectsubmit">
    </select><br />
   选择案件类型：<select name="select" id="select" class="selectsubmit">
    </select><br />
   选择诉的种类：<select name="select" id="select" class="selectsubmit">
    </select>
   <a href="#" target="_blank" class="redfont">诉讼费计算</a><br />
    
    <span style="vertical-align:top; margin-top:6px; display:inline-block">填写诉讼请求：</span>
    <textarea name="textarea" id="textarea" cols="45" rows="5" class="texteare"></textarea>
    <br />
    <br />
  <img src="image/sccltitle.jpg" width="171" height="39" />  <span class="personbut01">添加材料上传</span>
  
  <div class="material"> <select name="select" id="select" class="materselect">
    <option>请选择材料</option>
    </select>
    <input type="text" name="textfield2" id="textfield2" class="materinput"/>
    <span class="personbut01">选择材料</span><span class="personbut01">删除</span>
  </div>
  
  <div class="material" style="display:none"> <select name="select" id="select" class="materselect">
    <option>请选择材料</option>
    </select>
    <input type="text" name="textfield2" id="textfield2" class="materinput"/>
    <span class="personbut01">选择材料</span><span class="personbut01">删除</span>
  </div>
  
  
  <div class="tips"><span class="red">提示：<br />
  </span>身体识材料，证据材料，诉求材料每种材料都至少需要提交一份。<br />
      每个证据文件大小不能超过2M，总数不能超过10个，限于以下类型：<br />
      身份识别材料：图片(jpg/png/bmp格式)和pdf文件<br />
      诉求材料：图片(jpg/png/bmp格式)、word文档(doc/docx格式)和pdf文件<br />
      证据材料：图片(jpg/png/bmp格式)、word文档(doc/docx格式)和pdf文件<br />
    </div>
  <div class="savesubmit"><img src="${ctx }/js_css_image/images/upbutton.jpg" /><img src="${ctx }/js_css_image/images/submitbut.png" /></div>
  </div>

</body>
</html>
