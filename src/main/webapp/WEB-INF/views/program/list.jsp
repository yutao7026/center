<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="<%=IConstants.imgResPath %>resources/manager/static/js/common.js" type="text/javascript" charset="UTF-8"></script>
<title>节目管理</title>
<script type="text/javascript">
	function check(flag) {
		if (flag == 'del') {
			if ($("input[name='ids']:checked").length == 0) {
				showDialog("未选中任何记录！");
			} else {
				bootbox
						.dialog({
							message : "是否确认删除，确认将会删除相关的全部信息！",
							title : "<strong>警告</strong>",
							buttons : {
								danger : {
									label : "<span class='glyphicon glyphicon-ok'></span>&nbsp;确定",
									className : "btn-danger",
									callback : function() {
										form1.action = "${ctx}/program/delete";
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
			form1.action = "${ctx}/program";
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
		attachTipEvent(getClass('title_hover'),50); 
	});
	
	function move(type, id, programType){
		var url = "${ctx}/program/"+ type +"/" + id;
		if(programType != undefined){
			url = url + "/" + programType;
		}
		$.post(url, function(data){
			if(data && data == "success"){
				check('search');
			}
		});
	}
	
	function ud(id, type){
		var url = "${ctx}/program/ud/"+ id +"/" + type;
		$.post(url, function(data){
			if(data && data == "success"){
				check('search');
			}
		});
	}
</script>
<style type="text/css">
.vg{
	display: table-cell;
	vertical-align: middle;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">节目管理</span></li>
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
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">类型:</td>
								<td style="vertical-align: middle;" width="100px;">
									<select name="type" style="width: 140px;height: 25px;" class="form-control">
										<option value="">全部</option>
										<c:forEach items="${programType}" var="item">
											<option value="${item.key}" <c:if test="${program.type == item.key}">selected="selected"</c:if>>${item.value}</option>
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
				<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover" style="table-layout: fixed;">
					<thead>
						<tr style="background-image: linear-gradient(to bottom, #fff 0, #fff 100%);" height="35px">
							<th style="vertical-align: middle;" width="25px"><input id="selectAll" type="checkbox"></th>
							<th class="textCenter" style="vertical-align: middle;">节目名称</th>
							<th class="textCenter" style="vertical-align: middle;">简介</th>
							<th class="textCenter" style="vertical-align: middle;" width="120px">类型</th>
							<th class="textCenter" style="vertical-align: middle;" width="60px">状态</th>
							<c:if test="${program.type == null}">
							<th class="textCenter" style="vertical-align: middle;" width="120px">总排行</th>
							</c:if>
							<c:if test="${program.type != null}">
								<th class="textCenter" style="vertical-align: middle;" width="120px">分类排行</th>
							</c:if>
							<th class="textCenter" style="vertical-align: middle;" width="80px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.content}" var="content">
							<tr height="30px">
								<td width="25px" style="vertical-align: middle;"><input type="checkbox" name="ids" value="${content.id}"></td>
								<td class="textCenter" style="vertical-align: middle;">${content.pg_cname}</td>
								<td style="white-space:nowrap;vertical-align: middle;overflow:hidden;  text-overflow:ellipsis;" class="title_hover" title="${fn:replace(fn:replace(content.pg_cintroduction, '\"', '&quot;'), '\'', '&apos;')}">
									${content.pg_cintroduction}
								</td>
								<td class="textCenter" style="vertical-align: middle;">
									<c:forEach items="${programType}" var="item">
										<c:if test="${content.type == item.key}">${item.value}</c:if> 
									</c:forEach>
								</td>
								<td class="textCenter" style="vertical-align: middle;">
									<c:forEach items="${programDUType}" var="item">
										<c:if test="${content.ud == item.key}">
											<span class="label label-<c:if test="${content.ud == 0}">default</c:if><c:if test="${content.ud == 1}">success</c:if>">${item.value}</span>
										</c:if> 
									</c:forEach> 
								</td>
								<c:if test="${program.type == null}">
									<td style="vertical-align: middle;" class="textCenter">
										<a href="javascript:move('up', ${content.id})">上移</a>
										<a href="javascript:move('down', ${content.id})">下移</a>
										<a href="javascript:move('top', ${content.id})">置顶</a>
									</td>
								</c:if>
								<c:if test="${program.type != null}">
									<td class="textCenter" style="vertical-align: middle;">
										<a href="javascript:move('tup', ${content.id})">上移</a>
										<a href="javascript:move('tdown', ${content.id})">下移</a>
										<a href="javascript:move('ttop', ${content.id}, ${program.type})">置顶</a>
									</td>
								</c:if>
								<td align="center" style="vertical-align: middle;">
									<a href="${ctx}/program/update/${content.id}">编辑</a>
									<c:if test="${content.ud == 0}">
										<a href="${ctx}/program/ud/${content.id}/1">上架</a>
									</c:if>
									<c:if test="${content.ud == 1}">
										<a href="${ctx}/program/ud/${content.id}/0">下架</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<jsp:include page="/page/page.jsp" />
				<div align="center">
					<a href="${ctx}/program/update/0" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;增加</a> &nbsp;&nbsp;&nbsp;&nbsp;
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