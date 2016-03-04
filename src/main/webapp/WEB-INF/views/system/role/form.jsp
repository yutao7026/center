<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>角色管理</title> 
</head>

<body> 
	<div style="width: 100%;" align="center">
		<form id="inputForm" action="${ctx}/system/role/${action}" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${role.id}" />
			<fieldset>
				<legend align="left">
					<small>角色管理</small>
				</legend>
				<table class="table table-striped table-bordered table-condensed" style="width: 80%;">
					<tr>
						<td class="control-label" width="30%;">名称:</td>
						<td><input type="text" id="name" name="name" value="${role.name}" class="input-large required"/></td>
					</tr>
					<tr>
						<td class="control-label" width="30%;">类型:</td>
						<td>
							<select name="type">
								<c:forEach items="${types}" var="item">
									<option value="${item.key}" <c:if test="${role.type == item.key}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="control-label" width="30%;">描述:</td>
						<td><input type="text" name="description" value="${role.description}" class="input-large"/></td>
					</tr>
				</table>
				<div class="form-actions">
					<input id="submit_btn" class="btn btn-primary" type="submit" value="提交" />&nbsp; <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()" />
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
