<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>菜单管理</title>
	<script type="text/javascript">
		function check(flag){
			if(flag == 'del'){
				form1.action = "${ctx}/system/menu/delete";
				form1.submit();
			}
		}
	</script>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form name="form1" action="" method="post">
	<fieldset>
		<legend>检索</legend>
		<label>名称：</label><input type="text">
	</fieldset>
	<br>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th width="25px;"></th><th>名称</th><th>管理</th></tr></thead>
		<tbody> 
		<c:forEach items="${menuList}" var="menu">
			<tr>
				<td><input type="checkbox" name="ids" value="${menu.id}"></td>
				<td>${menu.name}</td>
				<td><a href="${ctx}/system/menu/update/${menu.id}">修改</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="${ctx}/page/page.jsp"/>
	<div align="center">
		<a href="${ctx}/system/menu/update/0" class="btn btn-primary">增加</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="javascript:check('del');">删除</button>
	</div>
	</form>
</body>
</html>
