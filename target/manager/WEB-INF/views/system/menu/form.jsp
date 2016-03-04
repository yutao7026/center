<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>菜单管理</title> 
</head>

<body> 
	<div style="width: 100%;" align="center">
		<form id="inputForm" action="${ctx}/system/menu/${action}" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${menu.id}" />
			<fieldset>
				<legend align="left">
					<small>菜单管理</small>
				</legend>
				<table class="table table-striped table-bordered table-condensed" style="width: 80%;">
					<tr>
						<td class="control-label" width="30%;">名称:</td>
						<td><input type="text" id="name" name="name" value="${menu.name}" class="input-large required"/></td>
					</tr>
					<tr>
						<td class="control-label" width="30%;">父菜单:</td>
						<td>
							<select name="pId">
								<option value="0">顶级</option>
								<c:forEach items="${menuList}" var="menu1">
									<option value="${menu1.id}" <c:if test="${menu.pId == menu1.id}">selected="selected"</c:if>>${menu1.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="control-label" width="30%;">URL:</td>
						<td><input type="text" name="url" value="${menu.url}" class="input-large required"/></td>
					</tr>
				</table>
				<div class="form-actions">
					<input id="submit_btn" class="btn btn-primary" type="submit" value="提交" />&nbsp; <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()" />
				</div>
			</fieldset>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$("#name").focus();
		});
	</script>
</body>
</html>
