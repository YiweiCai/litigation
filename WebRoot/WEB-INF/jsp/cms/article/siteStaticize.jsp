<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="/mytags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<my:head>
		<script type="text/javascript">
			$(function() {
				$("#btnStatic").click(function() {
					$.ajax({
						url : "${ctx}/cms/article_siteStaticize.do",
						type : 'POST',
						error : function() {
							alert("静态化失败");
						},
						dataType : 'json',
						success : function(data) {
							//不存在msg时，当作异常处理
							if (data.msg == undefined) {
								$("body").html(data);
								return;
							}
							
							//成功或失败提示信息
							alert(data.msg);
						}
					});
				});
			});
		</script>
	</my:head>
	<body>
		<div>
			<div class="bodybox">
				<div class="phead">
					<div class="pheadposition">
						<my:i18n zhText="当前位置" enText="Current Position" />
						：全站静态化
					</div>
					<div class="pheadbutton">
						<input type="button" class="button orange"
							value="<my:i18n zhText="全站静态化" enText="Static Site"/>"
							id="btnStatic" />
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</body>
</html>