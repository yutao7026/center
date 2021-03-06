<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<jsp:include page="/WEB-INF/layouts/common.jsp" />
	<title>日志管理</title>
	<script type="text/javascript">
		function check(flag){
			if(flag == 'search'){
				form1.action = "${ctx}/system/log";
				if(form1.pageno.options > 0){
					form1.pageno.options[0].selected = true;
				}
				form1.submit();
			}
			
		}
		$(function(){
			$("#breadcrumb").jBreadCrumb();
		});
	</script>
	
</head>

<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
	<div class="breadcrumbholder module" style="width: 90%;">
		<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
			<ul>
				<li><a href="${ctx}/focus"></a></li>
				<li><span style="width: 60px;font-size: 12px;">日志管理</span></li>
			</ul>
		</div>
	</div>
	<br />
	<div style="width: 90%" align="left">
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form name="form1" action="" method="post">
	<fieldset>
		<div class="panel panel-default" style="width: 100%;padding: 10px;">
			<table class="table">
				<tr valign="middle">
					<td class="control-label" width="80px;" align="right" style="vertical-align: middle;">操作员:</td>
					<td width="100px;" style="vertical-align: middle;"><input type="text" name="name" value="${log.name}" class="inputBorder"></td>
					<td class="control-label" width="90px;" align="right" style="vertical-align: middle;">日志内容:</td>
					<td width="100px;" style="vertical-align: middle;"><input type="text" name="text" value="${log.text}" class="inputBorder"></td>
					<td style="vertical-align: middle;padding-left: 100px;"><button type="button" class="btn btn-primary" onclick="javascript:check('search');"><span class="glyphicon glyphicon-search"></span>&nbsp;检索</button></td>
				</tr>
			</table>
		</div>
	</fieldset>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
		<tr style="background-image:linear-gradient(to bottom,#fff 0,#fff 100%);" height="35px">
			<th class="textCenter" style="vertical-align: middle;">操作员</th>
			<th class="textCenter" style="vertical-align: middle;">日志内容</th>
			<th class="textCenter" style="vertical-align: middle;">时间</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.content}" var="content">
			<tr>
				<td class="textCenter">${content.name}</td>
				<td class="textCenter">${content.text}</td>
				<td width="180px" class="textCenter"><fmt:formatDate value="${content.time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/page/page.jsp"/>
	</form>
	</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>
