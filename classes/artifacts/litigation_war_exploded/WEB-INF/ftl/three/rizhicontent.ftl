<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/ftl/includes/js_css.html">
    <title>coree-叶书俊的个人网站 </title>
    <meta name="keywords" content="coree，yeshujun，个人工作室 " />
    <meta name="description" content="叶书俊的个人工作室 ，旨在开发更好的web软件，oa，网站等等，热线QQ：372566232" />
</head>
<body>
   <#--头部开始-->
   <#include "/WEB-INF/ftl/includes/head.html">
   <#--头部结束-->

   <div class="breadcrumb">
     您当前的位置：<a href="/">首页</a> > 
       <a href="${ctx}/${article.cmsChannel.path}/index_1.html">
       ${article.cmsChannel.channelName}</a> >
       正文
   </div>
   <div class="content">
      <div class="bd">
	    <h4>
	        <span class="title">${article.title}</span>	 
                <span  style="margin-left: 30px">               
                  ${article.releaseDate} 
                  阅读(<span id="visitQuarter">${article.visitQuarter}</span>)
                </span>
	      </h4>
	      <p>${content}</p>
     </div>     

     <#--分页开始-->
     <#include "/WEB-INF/ftl/includes/contentpage.flt">
     <#--分页结束-->
  </div>

   <#--底部开始-->
   <#include "/WEB-INF/ftl/includes/footer.html">
   <#--底部结束-->

  <#--访问次数开始 -->
    <script type="text/javascript">
	   $(function(){	        
	        //浏览次数
                  var articleId = '${article.id}';
		var pagebox_num_nonce = $(".pagebox_num_nonce").text();
		if(pagebox_num_nonce=='1'){
	            var url = "${ctx}/front/front_visitQuarter.do?";
	            $.post(url,"articleId="+articleId,function(data){
	               $("#visitQuarter").text(data.msg);
	            });
		}
	    });
	</script>
	<#--访问次数结束-->
</body>
</html>
