<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/common/title.jsp" %>
<script type="text/javascript" src="${ctx}/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<link href="${ctx }/js_css_image/css/case.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function isAgree(result){
		if(result=='1'){
			window.location.href='${ctx4ej}/myCenter/register.htm';
		}
	}
</script>
<script type="text/javascript">
      $(function() {
		 $("#navlist").height($("#content").outerHeight()-30) ;
      });
    </script>
</head>

<body>
<div class="bannerbg">
  <div class="layout">
    <h1><img src="${ctx }/js_css_image/images/casestep_${requestNameSpace}.png" /></h1>
   <div class="nav"><a href="${ctx4ej}/index.htm">首页</a>
    <a href="${ctx4ej }/cms/article_detail.do?articleId=118&channelId=4028e30a4d5a9ef3014d5ab165b00000">法院简介</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb5093521c0150936401890007">法官专栏</a>
    <a href="${ctx4ej}/lawsuit/laxx_myCase.htm?op=add" class="choose">诉讼服务</a>
    <a href="http://ws.hncourt.gov.cn/index.php?act=area&court_id=834" target="_">裁判文书</a>
    <a href="http://zhixing.court.gov.cn/search/" target="_">执行信息</a>
    <a href="${ctx4ej }/cms/article_flist.htm?channelId=402881fb50ae10770150ae1f23ee0008">庭审直播</a>
    <a href="${ctx4ej}/cms/article_flist.htm?channelId=402881f7508813af0150887c99020002">精选案例</a></div>
  </div>
</div>
<div class="layout"><%--
  <div class="sidenav"><img src="${ctx }/js_css_image/images/caseitem.png" />
    <div class="navlist" id="navlist">
      <ul>
        <li class="selected"><a href="#"><img src="${ctx }/js_css_image/images/caseicon1.png" />网上立案</a></li>
         <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon2.png" />提交预约申请</a></li>
        <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon3.png" />查询结果</a></li> 
        <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon4.png" />案件进展查询</a></li>
 <div class="line"></div>
        <li><a href="#"><img src="${ctx }/js_css_image/images/caseicon5.png" />判后答疑</a></li>
        <div class="line"></div>
      </ul>
    </div>
  </div>
  --%><div class="content" id="content"> <span>新郑法院在线诉讼服务平台服务协议</span> 第一条　在线诉讼服务平台（以下简称"本平台"）是新郑市人民法院为社会公众、当事人及其代理人提供在线诉讼服务的工作平台。 <br />
    第二条　社会公众可以通过本平台查阅法律法规、诉讼指导内容，下载打印诉讼文书格式，查询江苏法院地址，计算诉讼费用，了解江苏法院在线诉讼服务信息。 <br />
    第三条　当事人及其代理人凭案号和服务密码可以查询案件基本信息、查阅已归档的电子卷宗材料，进行网上立案、网上信访、预约法官、材料转处、网上投诉等活动。 <br />
    第四条　根据当事人在立案时预留的通信方式，法官可以向当事人及其代理人送达案件受理、应诉、出庭、缴费等诉讼文书，上述信息与其原始文书具有同等效力，当事人查看时间即为送达时间。如需书面材料，请与承办法官联系。 <br />
    第五条　社会公众、当事人及其代理人通过本平台提交的诉讼材料、电子信息、网上留言中，不得含有以下内容： 　 <br />
    （一）违反法律或法规，泄露国家秘密，损害国家利益； <br />
    （二）散布谣言，扰乱社会秩序，影响社会稳定； <br />
    （三）侮辱或诽谤他人，进行人身攻击、谩骂、诋毁； <br />
    （四）广告； <br />
    （五）法律、法规禁止的其他内容。 <br />
    第六条　本平台有权删除含有上述内容的诉讼材料、电子信息及网上留言，并视情形对提交者采取警告、停止提供服务、追究相关法律责任等措施。 <br />
    第七条　涉及具体案件的服务事项请使用真实身份，留下准确的联系方式并保持畅通，以便我们与您联系和沟通。 <br />
    第八条　本平台因维护、故障或不可抗力原因不能正常工作时，请另行通过其他方式与承办法官联系。 <br />
    第九条　社会公众、当事人及其代理人点击"我接受"按钮，即表明已充分阅读、理解并接受本规则。 <br />
   <div class="acceptbut" onclick="isAgree(1);"></div> 
  </div>
</div>


<%@include file="/common/static.jsp" %>

</body>
</html>

