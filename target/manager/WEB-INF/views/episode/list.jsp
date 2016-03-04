<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<script src="<%=IConstants.imgResPath %>resources/manager/static/js/common.js" type="text/javascript" charset="UTF-8"></script>
<title>视频管理</title>
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
										form1.action = "${ctx}/episode/delete";
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
			form1.action = "${ctx}/episode";
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
		attachTipEvent(getClass('title_hover'),100); 
	});
	
	function move(type, id){
		var url = "${ctx}/episode/" + type + "/" + id;
		$.post(url, function(data){
			if(data && data == "success"){
				check('search');
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div align="center" style="width: 100%">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%; height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><span style="width: 60px; font-size: 12px;">视频管理</span></li>
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
								<td class="control-label" width="100px;" align="right" style="vertical-align: middle;">所属节目:</td>
								<td width="100px;" style="vertical-align: middle;">
									<select name="programId" style="width: 140px;height: 25px;padding-top: 0px;" class="form-control">
										<option value="">全部</option>
										<c:forEach items="${programs}" var="item">
											<option value="${item.id}" <c:if test="${episode.programId == item.id}">selected="selected"</c:if>>${item.pg_cname}</option>
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
							<th class="textCenter" style="vertical-align: middle;">名称</th>
							<th class="textCenter" style="vertical-align: middle;">视频地址</th>
							<th class="textCenter" style="vertical-align: middle;">所属节目</th>
							<c:if test="${episode.programId != null}">
								<th class="textCenter" style="vertical-align: middle;" width="120px">排序</th>
							</c:if>	
							<th class="textCenter" style="vertical-align: middle;" width="80px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.content}" var="content">
							<tr height="30px">
								<td width="25px"><input type="checkbox" name="ids" value="${content.ep_id}"></td>
								<td class="textCenter">${content.name}</td>
								<td style="white-space:nowrap;vertical-align: middle;overflow:hidden;text-overflow:ellipsis;" class="title_hover" title='${content.ep_video}'>
									${content.ep_video}
								</td>
								<td class="textCenter">
									<c:forEach items="${programs}" var="item">
										<c:if test="${content.programId == item.id}">${item.pg_cname}</c:if>
									</c:forEach>
								</td>
								<c:if test="${episode.programId != null}">
									<td class="textCenter">
										<a href="javascript:move('up',${content.ep_id})">上移</a>
										<a href="javascript:move('down',${content.ep_id})">下移</a>
										<a href="javascript:move('top',${content.ep_id})">置顶</a>
									</td>
								</c:if>
								<td width="120px" align="center">
									<a href="${ctx}/episode/update/${content.ep_id}">编辑</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<jsp:include page="/page/page.jsp" />
				<div align="center">
					<a href="${ctx}/episode/update/0" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;增加</a> &nbsp;&nbsp;&nbsp;&nbsp;
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