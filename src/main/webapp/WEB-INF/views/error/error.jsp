<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>500 - 系统内部错误</title>
<script type="text/javascript">
	function show(){
		document.getElementById('errDiv').style.display = "";
	}
</script>
<link rel="shortcut icon" href="<%=IConstants.imgResPath %>resources/manager/static/images/nslogo-trans.png" type="image/x-icon"/>
<link href="<%=IConstants.imgResPath %>resources/manager/static/js/dist/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="<%=IConstants.imgResPath %>resources/manager/static/style/default.css" type="text/css" rel="stylesheet" />

</head>
<body> 
<% 
	Exception e = (Exception)request.getAttribute("ex"); 
	String msg = (String)request.getAttribute("msg");
%>
<div align="center" id="loginDiv" style="padding-bottom: 0px;">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand"><img alt="" src="<%=IConstants.imgResPath %>resources/manager/static/images/nslogo-trans.png" height="22px" style="float: left;">&nbsp;&nbsp;佑生传媒后台管理系统</a>
		</div>
	</nav>
	<h2 ondblclick="javascript:show();">500 - 系统内部错误</h2>
	<div style="text-align: left;width: 60%;display: none;" id="errDiv">
		<h2><%=msg%></h2>
		<h2><%= e.getClass().getSimpleName()%></h2>
		<hr />
		<p></p>
		<%= e.getMessage()%>
		<p></p>
		<%
			for(StackTraceElement elment :  e.getStackTrace()){
				%><%=elment%><br /><%
			}
		%>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
	</div>
</body>
</html>