<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%response.setStatus(200);%>

<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
%>

<!DOCTYPE html>
<html>
<head>
	<title>500 - 系统内部错误</title>
	<script type="text/javascript">
		function show(){
			document.getElementById('errDiv').style.display = "";
		}
	</script>
</head>
<body>
	<h2 align="center">50<span ondblclick="javascript:show();">0</span> - 系统发生内部错误.</h2>
	<div style="width: 100%;" align="center">
		<div style="text-align: left;width: 60%;display: none;" id="errDiv">
		<%= ex.getMessage()%><br />
		<%
			for(StackTraceElement e :  ex.getStackTrace()){
				%><%=e%><br /><%
			}
		%>
		</div>
	</div>
</body>
</html>