<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/mytags"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>庭审播放</title>
		
		<link href="${ctx}/js_css_image/css/index.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
body,td,th {
	font-size: 14px;
	line-height: 26px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#a1{
	position:relative;
	z-index: 100;
	width:600px;
	height:400px;
	margin:0 auto;
}
</style>
<script type="text/javascript" src="${ctx}/js_css_image/js/ckplayer/offlights.js"></script>
<script type="text/javascript" src="${ctx }/js_css_image/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
		$(function(){
		
			if ($.browser.msie && parseInt($.browser.version, 10) < 8) {//这里设置版本
				$("#font").show();
			}
		});
	</script>
</head>

<body>
<%@ include file="/front/jsp/include/head.jsp" %>
<!--
上面一行是播放器所在的容器名称，如果只调用flash播放器，可以只用<div id="a1"></div>
-->
<script type="text/javascript" src="${ctx}/js_css_image/js/ckplayer/ckplayer.js" charset="utf-8"></script>



<div class="main">
<h4>${co.courtName }</h4>
<div style="text-align: center;">来源：${co.courtName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 发布时间：${co.startTime }<br />

<div class="source" id="a1" style="text-align: center;"></div>
<font id="font" style="color:red;display: none;">您的浏览器版本过低，视频不兼容或加载时间较长！</font></div>

<%--<div class="detailtext" style="display: none;">
 <p class="titlebg">案情介绍</p>
<p>
<strong>案由：</strong>${sf.pdirFile.summary }<br />
<strong>开庭时间：</strong>${sf.pdirFile.beginTime }<br />
<strong>开庭地点：</strong>${ds.dirName }<br />
<strong>基本案情：</strong>${sf.pdirFile.summary }</p>


<p class="titlebg">合议庭成员</p>
<p>
<strong>审判长：</strong>${sf.pdirFile.judge }<br />
<strong>审判员：</strong>${sf.pdirFile.jurors }
</p>

<p class="titlebg">庭审笔录</p>
<p><strong>·开庭笔录</strong><br>

${sf.pdirFile.recordText }

 </p> 
</div>--%>


</div>


<div class="copyrightbg">
<div class="copyright">服务中心咨询电话：0371-62671216<br />地址：河南省新郑市金城路中段259号<br />版权所有：河南省新郑市人民法院&nbsp;&nbsp;豫ICP备12000402号-1
<br /></div></div>
</body><script type="text/javascript">
	var flashvars = {
		f : '${uv.videoSite}',//视频地址

		a : '',//调用时的参数，只有当s>0的时候有效
		s : '0',//调用方式，0=普通方法（f=视频地址），1=网址形式,2=xml形式，3=swf形式(s>0时f=网址，配合a来完成对地址的组装)
		c : '0',//是否读取文本配置,0不是，1是
		x : '',//调用配置文件路径，只有在c=1时使用。默认为空调用的是ckplayer.xml

		i : '${ctx}/CourtVideo/${sf.swfPath}.jpg',//初始图片地址
		d : '',//暂停时播放的广告，swf/图片,多个用竖线隔开，图片要加链接地址，没有的时候留空就行
		u : '',//暂停时如果是图片的话，加个链接地址
		l : '',//前置广告，swf/图片/视频，多个用竖线隔开，图片和视频要加链接地址
		r : '',//前置广告的链接地址，多个用竖线隔开，没有的留空
		t : '0',//视频开始前播放swf/图片时的时间，多个用竖线隔开
		y : '',//这里是使用网址形式调用广告地址时使用，前提是要设置l的值为空
		z : '',//缓冲广告，只能放一个，swf格式
		e : '3',//视频结束后的动作，0是调用js函数，1是循环播放，2是暂停播放并且不调用广告，3是调用视频推荐列表的插件，4是清除视频流并调用js功能和1差不多，5是暂停播放并且调用暂停广告
		v : '80',//默认音量，0-100之间
		p : '1',//视频默认0是暂停，1是播放，2是不加载视频
		h : '0',//播放http视频流时采用何种拖动方法，=0不使用任意拖动，=1是使用按关键帧，=2是按时间点，=3是自动判断按什么(如果视频格式是.mp4就按关键帧，.flv就按关键时间)，=4也是自动判断(只要包含字符mp4就按mp4来，只要包含字符flv就按flv来)
		q : '',//视频流拖动时参考函数，默认是start
		m : '',//让该参数为一个链接地址时，单击播放器将跳转到该地址
		o : '',//当p=2时，可以设置视频的时间，单位，秒
		w : '',//当p=2时，可以设置视频的总字节数
		g : '',//视频直接g秒开始播放
		j : '',//跳过片尾功能，j>0则从播放多少时间后跳到结束，<0则总总时间-该值的绝对值时跳到结束
		k : '',//提示点时间，如 30|60鼠标经过进度栏30秒，60秒会提示n指定的相应的文字
		n : '这是提示点的功能，如果不需要删除k和n的值|提示点测试60秒',//提示点文字，跟k配合使用，如 提示点1|提示点2
		wh : '',//宽高比，可以自己定义视频的宽高或宽高比如：wh:'4:3',或wh:'1080:720'

		lv : '',//是否是直播流，=1则锁定进度栏

		loaded : '',//当播放器加载完成后发送该js函数loaded
		//调用播放器的所有参数列表结束
		//以下为自定义的播放器参数用来在插件里引用的
		my_url : encodeURIComponent(window.location.href)
	//本页面地址
	//调用自定义播放器参数结束
	};
	var params = {
		bgcolor : '#FFF',
		allowFullScreen : true,
		allowScriptAccess : 'always'
	};//这里定义播放器的其它参数如背景色（跟flashvars中的b不同），是否支持全屏，是否支持交互
	var video = [ '${uv.videoSite}' ];
	CKobject.embed('${ctx }/js_css_image/js/ckplayer/ckplayer.swf', 'a1',
			'ckplayer_a1', '100%', '100%', true, flashvars, video, params);
	/*
		以上代码演示的兼容flash和html5环境的。如果只调用flash播放器或只调用html5请看其它示例
	 */
	function videoLoadJs(s) {
		alert("执行了播放");
	}
	function playerstop() {
		//只有当调用视频播放器时设置e=0或4时会有效果
		alert('播放完成');
	}
	var _nn = 0;//用来计算实时监听的条数的，超过100条记录就要删除，不然会消耗内存

	function getstart() {
		var a = CKobject.getObjectById('ckplayer_a1').getStatus();
		var ss = '';
		for ( var k in a) {
			ss += k + ":" + a[k] + '\n';
		}
		alert(ss);
	}
	function ckadjump() {
		alert('这里演示了点击跳过广告按钮后的执行的动作，如果注册会员可以做成直接跳过的效果。');
	}
	//开关灯
	var box = new LightBox();
	function closelights() {//关灯
		box.Show();
		CKobject._K_('a1').style.width = '940px';
		CKobject._K_('a1').style.height = '550px';
		CKobject.getObjectById('ckplayer_a1').width = 940;
		CKobject.getObjectById('ckplayer_a1').height = 550;
	}
	function openlights() {//开灯
		box.Close();
		CKobject._K_('a1').style.width = '600px';
		CKobject._K_('a1').style.height = '400px';
		CKobject.getObjectById('ckplayer_a1').width = 600;
		CKobject.getObjectById('ckplayer_a1').height = 400;
	}
	function changePrompt() {
		CKobject.getObjectById('ckplayer_a1').promptUnload();//卸载掉目前的
		CKobject.getObjectById('ckplayer_a1').changeFlashvars(
				'{k->10|20|30}{n->重设提示点一|重设提示点二|重设提示点三}');
		CKobject.getObjectById('ckplayer_a1').promptLoad();//重新加载
	}
	function addflash() {
		if (CKobject.Flash()['f']) {
			CKobject._K_('a1').innerHTML = '';
			CKobject.embedSWF('${ctx }/js_css_image/js/ckplayer/ckplayer.swf',
					'a1', 'ckplayer_a1', '600', '400', flashvars, params);
		} else {
			alert('该环境中没有安装flash插件，无法切换');
		}
	}
	function addhtml5() {
		if (CKobject.isHTML5()) {
			support = [ 'all' ];
			CKobject._K_('a1').innerHTML = '';
			CKobject.embedHTML5('a1', 'ckplayer_a1', 600, 400, video,
					flashvars, support);
		} else {
			alert('该环境不支持html5，无法切换');
		}
	}
	function addListener() {
		if (CKobject.getObjectById('ckplayer_a1').getType()) {//说明使用html5播放器
			CKobject.getObjectById('ckplayer_a1').addListener('play',
					playHandler);
		} else {
			CKobject.getObjectById('ckplayer_a1').addListener('play',
					'playHandler');
		}
	}
	function playHandler() {
		alert('因为注册了监听播放，所以弹出此内容，删除监听将不再弹出');
	}
	function removeListener() {//删除监听事件
		if (CKobject.getObjectById('ckplayer_a1').getType()) {//说明使用html5播放器
			CKobject.getObjectById('ckplayer_a1').removeListener('play',
					playHandler);
		} else {
			CKobject.getObjectById('ckplayer_a1').removeListener('play',
					'playHandler');
		}
	}
</script>
</html>
