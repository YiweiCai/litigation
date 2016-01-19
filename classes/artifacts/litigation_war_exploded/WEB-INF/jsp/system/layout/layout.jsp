<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<%@include file="/common/title.jsp"%>
</title>

<my:head easyui="true" lhgdialog="true">
	<!-- 导航菜单 -->
	<link rel="stylesheet" type="text/css"
		href="${ctx}/js_css_image/css/menu.css" media="screen" />
	<link href="${ctx }/js_css_image/css/sys.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="${ctx }/js_css_image/js/jquery/ddaccordion-2.0.js"></script>
	<script type="text/javascript"
		src="${ctx }/js_css_image/js/base/initDdaccordion.js"></script>
	<script type="text/javascript">
		
	<%---
	    function window.onbeforeunload(){  
	    	 if(event.clientX>document.body.clientWidth && event.clientY<0 || event.altKey ){   
                 window.event.returnValue="确定要退出本页吗?";   
                 window.location.href=ctx+"/bm/login/login_logout.do";
             }
        }  
	    --%>
		var ctx = '${ctx}';
		$(function() {

			if ($.browser.msie && ($.browser.version == "6.0")
					&& !$.support.style) {
				$.dialog.notice({
					id : 'msgTip',
					title : $.i18n("dialogMyMessage"),
					content : "您还在使用IE6，建议您升级为IE7/8/9/10，或其他浏览器",
					width : 220,
					height : 55,
					left : '100%',
					top : '100%',
					fixed : true,
					drag : false,
					resize : false
				});
			}
			$("#changeRoleId").change(function() {
				$("#changeRoleForm")[0].submit();
			});
			$("#change_request_locale").change(function() {
				$("#request_locale").val($(this).val());
				$("#changeRoleForm")[0].submit();
			});

			onlineUserCount();
			setInterval(onlineUserCount, 120000);//2分钟检查一次是否用有新用户登录

			newMessgage();

			$("#onlineUser").click(function() {
				//var url = '${ctx }/system/layout_listOnlineUser.do';
				var url = '${ctx4ej }/system/layout_listOnlineUser.do';
				$.dialog({
					id : 'onlineUser',
					title : $.i18n("dialogOnlineUser"),
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					width : '700px',
					height : 450
				});
			});

			$("#onlineChat").click(function() {
				var url = '${ctx4ej }/system/layout_onlineChart.do';
				$.dialog({
					id : 'onlineChat',
					title : $.i18n("dialogOnlineChat"),
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					width : '700px',
					height : 450
				}).max();
			});

			$("#messageBoard").click(function() {
				var url = '${ctx4ej }/oa/messageboard_add.do';
				$.dialog({
					id : 'messageBoard',
					title : $.i18n("dialogMessageBoard"),
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					width : '700px',
					height : 450
				});
			});

			$("#readme").click(function() {
				var url = '${ctx4ej }/readme/index.html';
				var readme = $.dialog({
					id : 'readme',
					title : 'readme',
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					lock : true,
					width : '900px',
					height : 450
				});//.max()
			});

			$("#updatePassword").click(function() {
				var url = '${ctx4ej }/system/user_toUpdatePassword.do';
				var updatePassword = $.dialog({
					id : 'updatePassword',
					title : $.i18n("dialogUpdatePassword"),
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					lock : true,
					width : '700px',
					height : 450
				});//.max()
			});
			$("#deskSet").click(function() {
				var url = '${ctx4ej }/system/user_toSetDesk.do';
				var deskSet = $.dialog({
					id : 'deskSet',
					title : $.i18n("dialogDeskSetting"),
					content : 'url:' + url,
					cancelVal : $.i18n("close"),
					cancel : true,
					lock : true,
					width : '700px',
					height : 450
				});//.max()deskSet
			});

			//setInterval(newMessgage,60000);//1分钟检查一次
			//setInterval(loginUserCount,10000);//1秒 = 1000 毫秒     1分钟=60秒=60000毫秒
		});

		//当前在线人数
		function onlineUserCount() {
			$.post("${ctx4ej}/system/layout_getOnlineUserCount.do", function(ret) {
				$("#loginUserCount").text("").text(ret);
			}, "html");
		}

		var msgTip;
		function newMessgage() {

			$
					.post(
							"${ctx4ej }/oa/intenalMassage_getNewMessage.do",
							function(data) {
								if (data != null && data.msg != "") {
									var td = data.msg.split("|");
									//var msg = '<a href="${ctx}/oa/intenalMassage_update.do?id='+td[0]+'&queryType=2&fromMsgtip=1" '+
									//          'title="'+td[1]+'" name="msgtip" id="msgtip" target="_blank">'+td[1]+'</a>';
									var msg = "<a style=\"cursor: pointer;\" title='"
											+ td[1]
											+ "' name=\"msgtip\" id=\"msgtip\" onclick=\"readMsg('"
											+ td[0] + "')\">" + td[1] + "</a>";
									msgTip = $.dialog.notice({
										id : 'msgTip',
										title : $.i18n("dialogMyMessage"),
										content : msg,
										width : 200,
										height : 50,
										left : '100%',
										top : '100%',
										fixed : true,
										drag : false,
										resize : false
									});
									//$.messager.show({title:'新消息',msg:msg,timeout:10000,showType:'slide'});
								}
							});
		}
		function readMsg(msgId) {
			$.dialog({
				id : 'readMsg',
				title : $.i18n("dialogReadMessage"),
				content : 'url:${ctx4ej}/oa/intenalMassage_read.do?id=' + msgId,
				cancelVal : $.i18n("close"),
				cancel : true,
				width : '700px',
				height : 450
			});
			msgTip.close();
			//msgD.show();
		}

		function reloadIframe() {
			$("#menuIframeId").attr("src", "${ctx4ej }/system/desksetting.do");
		}

		function focusMenu(id) {
			$('li').removeClass('ahover');
			$('#' + id).addClass('ahover');
		}

		$.dialog.notice = function(options) {
			var opts = options || {}, api, aConfig, hide, wrap, top, duration = opts.duration || 800;
			var config = {
				id : 'Notice',
				left : '100%',
				top : '100%',
				fixed : true,
				drag : false,
				resize : false,
				init : function(here) {
					api = this;
					aConfig = api.config;
					wrap = api.DOM.wrap;
					top = parseInt(wrap[0].style.top);
					hide = top + wrap[0].offsetHeight;

					wrap.css('top', hide + 'px').animate({
						top : top + 'px'
					}, duration, function() {
						opts.init && opts.init.call(api, here);
					});
				},
				close : function(here) {
					wrap.animate({
						top : hide + 'px'
					}, duration, function() {
						opts.close && opts.close.call(this, here);
						aConfig.close = $.noop;
						api.close();
					});
					return false;
				}
			};

			for ( var i in opts) {
				if (config[i] === undefined)
					config[i] = opts[i];
			}
			return $.dialog(config);
		};

		//1.倒计定时器：timename=setTimeout("function();",delaytime);   单位是毫秒
		//2.循环定时器：timename=setInterval("function();",delaytime);
	</script>
</my:head>
<body class="easyui-layout">
	<%--
   <body class="easyui-layout">
		<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	    <div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">west content</div>
	    <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	    <div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	    <div data-options="region:'center',title:'Main Title'"></div>
   </body>
   --%>

	<div data-options="region:'north',border:false">
		<%@include file="head.jsp"%>
	</div>
	<div data-options="region:'west',border:false"
		style="width:196px; padding-top:1px; height:auto; overflow:hidden ">
		<div class="arrowlistmenu">
			<c:forEach items="${menuList}" var="menu">
				<h3 class="menuheader expandable">
					<my:i18n zhText="${menu.menuName}" enText="${menu.enMenuName}" />
				</h3>
				<ul class="categoryitems" style="border: 0">
					<c:forEach items="${menu.subList}" var="subMenu">
						<c:set value="${subMenu.subList}" var="subList"></c:set>
						<%
							List list = (List) pageContext.getAttribute("subList");;
									if (list != null && list.size() > 0) {
						%>
						<li><a style="cursor: pointer;" class="subexpandable"> <img
								src="${ctx }/js_css_image/images/1.gif" alt="1" width="4"
								height="6" />
							<my:i18n zhText="${subMenu.menuName}"
									enText="${subMenu.enMenuName}" /> </a>
							<ul class="subcategoryitems" style="margin-left:5px">
								<c:forEach items="${subMenu.subList}" var="subSubMenu">
									<!-- <li id="${subSubMenu.id }"><a style="cursor: pointer;" onclick="focusMenu('${subSubMenu.id}');$.loadIframe('menuIframeId','${subSubMenu.menuPath}')"> -->
									<li id="${subSubMenu.id }"><a style="cursor: pointer;"	onclick="focusMenu('${subSubMenu.id}');$.loadIframe('menuIframeId','/${rquestNameSpace}${subSubMenu.menuPath}')">
											&nbsp;&nbsp;&nbsp;<img
											src="${ctx }/js_css_image/images/4.gif" alt="1" width="4"
											height="6" />
										<my:i18n zhText="${subSubMenu.menuName}"
												enText="${subSubMenu.enMenuName}" /> </a></li>
								</c:forEach>
							</ul></li>
						<%
							} else {
						%>
						<!-- <li id="${subMenu.id}"><a style="cursor: pointer;" onclick="focusMenu('${subMenu.id}');$.loadIframe('menuIframeId','${subMenu.menuPath}')">-->
						<li id="${subMenu.id}"><a style="cursor: pointer;" onclick="focusMenu('${subMenu.id}');$.loadIframe('menuIframeId','/${requestNameSpace}${subMenu.menuPath}')">
								<img src="${ctx }/js_css_image/images/1.gif" alt="1" width="4"
								height="6" />
							<my:i18n zhText="${subMenu.menuName}"
									enText="${subMenu.enMenuName}" /> </a></li>
						<%
							}
						%>
					</c:forEach>
				</ul>

			</c:forEach>
		</div>
	</div>

	<div data-options="region:'center',border:false" id="deskTitle">
		<iframe id="menuIframeId" name="menuIframeId" frameborder="0"
			src="${ctx4ej }/system/desksetting.do" width="100%" height="99%"></iframe>
	</div>


	<%-- 
	
	<div region="center" border="false">
		<div id="main-center" fit="true">
		     <iframe id="menuIframeId" name="menuIframeId" frameborder="0" src="system/user_list.do" style="width:100%;height:100%;"></iframe>
		 </div>		
	 </div>
	//------------------------------------------------------
	 <div region="center" border="false">
		<div id="main-center" fit="true">
		<%@include file="center.jsp" %>
		 </div>			
	 </div> --%>
</body>
<script type="text/javascript">
	var content = "";
	function workRemind() {
		/* 扩展窗口外部方法 */
		$.dialog.notice = function(options) {
			var opts = options || {}, api, aConfig, hide, wrap, top, duration = opts.duration || 800;

			var config = {
				id : 'Notice',
				left : '100%',
				top : '100%',
				fixed : true,
				drag : false,
				resize : false,
				init : function(here) {
					api = this;
					aConfig = api.config;
					wrap = api.DOM.wrap;
					top = parseInt(wrap[0].style.top);
					hide = top + wrap[0].offsetHeight;

					wrap.css('top', hide + 'px').animate({
						top : top + 'px'
					}, duration, function() {
						opts.init && opts.init.call(api, here);
					});
				},
				close : function(here) {
					wrap.animate({
						top : hide + 'px'
					}, duration, function() {
						opts.close && opts.close.call(this, here);
						aConfig.close = $.noop;
						api.close();
					});

					return false;
				}
			};

			for ( var i in opts) {
				if (config[i] === undefined)
					config[i] = opts[i];
			}

			return $.dialog(config);
		};

		/* 调用示例 */
		$.dialog.notice({
			title : '待办工作',
			width : 300, /*必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致lhgDialog收缩 */
			content : content,
			time : 20
		});

	}

	$(function() {

		$.post("${ctx4ej }/oa/intenalMassage_getNewMessage.do", function(data) {
			if (data != null && data.msg != "") {
				var td = data.msg.split("|");
				//var msg = '<a href="${ctx}/oa/intenalMassage_update.do?id='+td[0]+'&queryType=2&fromMsgtip=1" '+
				//          'title="'+td[1]+'" name="msgtip" id="msgtip" target="_blank">'+td[1]+'</a>';
				var msg = "<a style=\"cursor: pointer; \" title='" + td[1]+ "' name=\"msgtip\" id=\"msgtip\" onclick=\"readMsg('"+ td[0] + "')\">" + td[1] + "</a>";
				msgTip = $.dialog.notice({
					id : 'msgTip',
					title : $.i18n("dialogMyMessage"),
					content : msg,
					width : 200,
					height : 50,
					left : '100%',
					top : '100%',
					fixed : true,
					drag : false,
					resize : false
				});
				//$.messager.show({title:'新消息',msg:msg,timeout:10000,showType:'slide'});
			}
		});
		findWork();
		//setInterval(findWork,120000);

	});

	function findWork() {
		content = "";
		$.ajax({
					type : 'post',
					data : '',
					dataType : 'json',
					async : false,
					url : "${ctx4ej}/system/layout_daiBan.do",
					success : function(msg) {
                        var countNum = 0;
                        for(var key in msg){
                            if(msg[key]){
                                countNum = countNum+msg[key].num;
                            }
                        }
							var yjsh = "";
							var ejsh = "";
							var yyly = "";
							var phdy = "";
							if (countNum != 0
									|| msg != null) {
								if (msg.yjsh == null) {
									yjsh = "";
								} else {
									yjsh = "<a style=\"cursor: pointer;\" onclick=\"focusMenu('"
											+ msg.yjsh.mid
											+ "');$.loadIframe('menuIframeId','"
											+ msg.yjsh.mpath + "')\">";
									if (msg.yjsh.num > 0) {
										yjsh += "<font style=\"color:red;\">"
												+ msg.yjsh.num + "</font>";
									} else {
										yjsh += msg.yjsh.num;
									}
									yjsh += "</a>";
								}
								if (msg.ejsh == null) {
									ejsh = "";
								} else {
									ejsh = "<a style=\"cursor: pointer;\" onclick=\"focusMenu('"+ msg.ejsh.mid+ "');$.loadIframe('menuIframeId','"+ msg.ejsh.mpath + "')\">";
									if (msg.ejsh.num > 0) {
										ejsh += "<font style=\"color:red;\">"
												+ msg.ejsh.num + "</font>";
									} else {
										ejsh += msg.ejsh.num;
									}
									ejsh += "</a>";
								}
								if (msg.yyly == null) {
									yyly = "";
								} else {
									yyly = "<a style=\"cursor: pointer;\" onclick=\"focusMenu('"
											+ msg.yyly.mid
											+ "');$.loadIframe('menuIframeId','"
											+ msg.yyly.mpath + "')\">";
									if (msg.yyly.num > 0) {
										yyly += "<font style=\"color:red;\">"
												+ msg.yyly.num + "</font>";
									} else {
										yyly += msg.yyly.num;
									}
									yyly += "</a>";
								}
								if (msg.phdy == null) {
									phdy == "";
								} else {
									phdy = "<a style=\"cursor: pointer;\" onclick=\"focusMenu('"
											+ msg.phdy.mid
											+ "');$.loadIframe('menuIframeId','"
											+ msg.phdy.mpath + "')\">";
									if (msg.phdy.num > 0) {
										phdy += "<font style=\"color:red;\">"
												+ msg.phdy.num + "</font>";
									} else {
										phdy += msg.phdy.num;
									}
									phdy += "</a>";
								}
								content += "<table border='0' cellpadding='0' cellspacing='1' bgcolor='#daf2fc' width='300px'>";
								content += "<tr><td align='center' bgcolor='#f2fbff' height='32'>一级审核</td><td align='center' bgcolor='#f2fbff'>二级审核</td><td align='center' bgcolor='#f2fbff'>预约来院时间</td><td align='center' bgcolor='#f2fbff'>判后答疑</td></tr>";
								content += "<tr><td align='center' height='32' bgcolor='#FFFFFF'>"
										+ yjsh
										+ "</td><td align='center' bgcolor='#FFFFFF'>"
										+ ejsh
										+ "</td><td align='center' bgcolor='#FFFFFF'>"
										+ yyly
										+ "</td><td align='center' bgcolor='#FFFFFF'>"
										+ phdy + "</td></tr>";
								content += "<table>";
								workRemind();
							}

					}

				});
	}
</script>
</html>