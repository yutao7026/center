<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>字典管理</title> 
</head>

<body> 
	<div style="width: 100%;" align="center">
		<form id="inputForm" action="${ctx}/system/dictionary/${action}" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${role.id}" />
			<fieldset>
				<legend align="left">
					<small>字典管理</small>
				</legend>
				<table class="table table-striped table-bordered table-condensed" style="width: 80%;">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td class="control-label" width="30%;">标识:</td>
							<td><input type="text" id="name" name="flag" value="${dictionary.flag}" class="input-large required"/></td>
						</tr>
						<tr>
							<td class="control-label" width="30%;">KEY:</td>
							<td><input type="text" name="key" value="${dictionary.key}" class="input-large required digits"/></td>
						</tr>
						<tr>
							<td class="control-label" width="30%;">VALUE:</td>
							<td><input type="text" name="value" value="${dictionary.value}" class="input-large required"/></td>
						</tr>
					</tbody>
				</table>
				<div class="form-actions">
					<input id="submit_btn" class="btn btn-primary" type="submit" value="提交" />&nbsp; <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()" />
				</div>
			</fieldset>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$("#flag").focus();
		});
	</script>
</body>
</html>
