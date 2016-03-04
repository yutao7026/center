<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
	<link rel="shortcut icon" href="<%=IConstants.imgResPath %>resources/manager/static/images/nslogo-trans.png" type="image/x-icon"/>
	<link href="<%=IConstants.imgResPath %>resources/manager/static/js/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<link href="<%=IConstants.imgResPath %>resources/manager/static/style/default.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div align="center" id="loginDiv" style="padding-bottom: 0px;">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand"><img alt="" src="<%=IConstants.imgResPath %>resources/manager/static/images/nslogo-trans.png" height="22px" style="float: left;">&nbsp;&nbsp;佑生传媒后台管理系统</a>
		</div>
	</nav>
	<h2>404 - 页面不存在.</h2>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
	</div>
</body>
</html>