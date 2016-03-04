<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>推荐管理</title>
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
										form1.action = "${ctx}/recommend/delete";
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
			form1.action = "${ctx}/recommend";
			if (form1.pageno.options > 0) {
				form1.pageno.options[0].selected = true;
			}
			form1.submit();
		}
	}
	$(function() {
		$("#selectAll").click(function() {
			var checked = $(this).is(":checked");
			if (checked) {
				$("[name='ids']").prop("checked", true);
			} else {
				$("[name='ids']").prop("checked", false);
			}
		});
		$("#breadcrumb").jBreadCrumb();
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">推荐管理</span></li>
				</ul>
			</div>
		</div>
		<br />
		<div style="width: 90%" align="center">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form name="form1" action="" method="post">
				<fieldset>
					<div class="panel panel-default" style="width: 100%; padding: 10px;">
						<table class="table">
							<tr>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">节目名称:</td>
								<td width="100px;" style="vertical-align: middle;"><input type="text" name="program.pg_cname" value="${recommend.program.pg_cname}" style="width: 140px;height: 25px;" class="form-control"></td>
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">所在页面:</td>
								<td style="vertical-align: middle;" width="100px;">
									<select name="pageLevel.id" style="width: 140px;height: 25px;padding-top: 0px;" class="form-control">
									<option value="">全部</option>
									<c:forEach items="${pageLevels}" var="item">
										<option value="${item.id}" <c:if test="${recommend.pageLevel.id == item.id}">selected="selected"</c:if>>${item.name}</option>
									</c:forEach>
									</select>
								</td>
								<td style="vertical-align: middle; padding-left: 100px;" width="100px;"><button type="button" class="btn btn-primary" onclick="javascript:check('search');">
										<span class="glyphicon glyphicon-search"></span>&nbsp;检索
									</button></td>
								<td></td>
							</tr>
						</table>
					</div>
				</fieldset>
				<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr style="background-image: linear-gradient(to bottom, #fff 0, #fff 100%);" height="35px">
							<th style="vertical-align: middle;" width="25px"><input id="selectAll" type="checkbox"></th>
							<th class="textCenter" style="vertical-align: middle;">节目名称</th>
							<th class="textCenter" style="vertical-align: middle;">所在页面</th>
							<th class="textCenter" style="vertical-align: middle;">位置</th>
							<!-- 
							<th class="textCenter" style="vertical-align: middle;">显示类型</th>
							 -->
							<th class="textCenter" style="vertical-align: middle;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.content}" var="content">
							<tr height="30px">
								<td width="25px"><input type="checkbox" name="ids" value="${content.re_id}"></td>
								<td class="textCenter">${content.program.pg_cname}</td>
								<td class="textCenter">${content.pageLevel.name}</td>
								<td class="textCenter">
									<c:forEach items="${locationType}" var="item">
										<c:if test="${content.location == item.key}">${item.value}</c:if> 
									</c:forEach>
								</td>
								<!-- 
								<td class="textCenter">
									<c:if test="${content.type == 0}">图片</c:if>
									<c:if test="${content.type == 1}">视频</c:if>
								</td>
								 -->
								<td width="120px" align="center">
									<a href="${ctx}/recommend/update/${content.re_id}">编辑</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<jsp:include page="/page/page.jsp" />
				<div align="center">
					<a href="${ctx}/recommend/update/0" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;增加</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" onclick="javascript:check('del');">
						<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
					</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>