<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>报表管理</title>
<script type="text/javascript">
	function check(flag) {
		if (flag == 'del') {
			if ($("input[name='ids']:checked").length == 0) {
				showDialog("未选中任何记录！");
			} else {
				bootbox
						.dialog({
							message : "是否确认删除！",
							title : "<strong>警告</strong>",
							buttons : {
								danger : {
									label : "<span class='glyphicon glyphicon-ok'></span>&nbsp;确定",
									className : "btn-danger",
									callback : function() {
										form1.action = "${ctx}/episode/delete";
										form1.submit();
									}
								},
								main : {
									label : "<span class='glyphicon glyphicon-remove'></span>&nbsp;取消",
									className : "btn btn-primary",
									callback : function() {
									}
								}
							}
						});
			}
		}
		if (flag == 'search') {
			form1.action = "${ctx}/episode";
			if (form1.pageno.options > 0) {
				form1.pageno.options[0].selected = true;
			}
			form1.submit();
		}
	}
	$(function() {
		$("#selectAll").click(function() {
			var checked = $(this).attr("checked");
			if (checked && checked == "checked") {
				$("[name='ids']").attr("checked", "checked");
			} else {
				$("[name='ids']").removeAttr("checked");
			}
		});
		$("#breadcrumb").jBreadCrumb();
	});
	function change(flag){
		setActive(flag);
		if(flag == 1){
			$("#page").attr("src", "${ctx}/report/global");
		}else if(flag == 3){
			$("#page").attr("src", "${ctx}/report/user");
		}else if(flag == 4){
			$("#page").attr("src", "${ctx}/report/access");
		}
	}
	
	function setActive(flag){
		for(var i = 0; i < $("#ul1").children().length; i ++){
			$("#ul1").children()[i].className = "";
		}
		$("#l" + flag).attr("class", "active");
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">报表管理</span></li>
				</ul>
			</div>
		</div>
		<br />
		<div style="width: 90%" align="center">
		<ul id="ul1" class="nav nav-tabs">
		  <li id="l1" class="active"><a href="javascript:change(1);">节目报表</a></li>
		  <li id="l3"><a href="javascript:change(3);">用户报表</a></li>
		  <li id="l4"><a href="javascript:change(4);">访问报表</a></li>
		</ul>
		<br>
		<iframe id="page" src="${ctx}/report/global" width="100%" height="600px" style="border: 0"></iframe>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>