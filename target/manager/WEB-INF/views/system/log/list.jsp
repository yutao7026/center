<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>日志管理</title>
<script type="text/javascript">
	$(function() {
		$("#breadcrumb").jBreadCrumb();
	});
	function change(flag){
		setActive(flag);
		if(flag == 1){
			$("#page").attr("src", "${ctx}/system/log/log");
		}else if(flag == 2){
			$("#page").attr("src", "${ctx}/system/log/log");
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
					<li><span style="width: 60px; font-size: 12px;">日志管理</span></li>
				</ul>
			</div>
		</div>
		<br />
		<div style="width: 90%" align="center">
		<ul id="ul1" class="nav nav-tabs">
		  <li id="l1" class="active"><a href="javascript:change(1);">日志1</a></li>
		  <li id="l2"><a href="javascript:change(2);">日志2</a></li>
		</ul>
		<br>
		<iframe id="page" src="${ctx}/system/log/log" width="100%" height="600px" style="border: 0"></iframe>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>