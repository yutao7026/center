<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<script type="text/javascript">
		function check(flag){
			if(flag == 'del'){
				if($("input[name='ids']:checked").length == 0){
					showDialog("未选中任何记录！");
				}else{
					bootbox.dialog({
						message: "是否确认删除！",
						title: "<strong>警告</strong>",
							buttons: {
								danger: {
								label: "<span class='glyphicon glyphicon-ok'></span>&nbsp;确定",
								className: "btn-danger",
								callback: function() {
									form1.action = "${ctx}/product/delete";
									form1.submit();
								}
						    },
						    main: {
								label: "<span class='glyphicon glyphicon-remove'></span>&nbsp;取消",
								className: "btn btn-primary",
								callback: function() {}
						    }
						  }
					});
				}
			}
			if(flag == 'search'){
				form1.action = "${ctx}/product";
				form1.submit();
			}
			
		}
		
		$(function(){
			$("#selectAll").click(function(){
				var checked = $(this).attr("checked");
				if(checked && checked == "checked"){
					$("[name='ids']").attr("checked","checked");
				}else{
			   		$("[name='ids']").removeAttr("checked");
				}
			});
			$("#breadcrumb").jBreadCrumb();
		});
	</script>
	
</head>

<body>
	<div align="center" style="width: 100%">
	<div class="breadcrumbholder module" style="width: 90%;">
		<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
			<ul>
				<li><a href="${ctx}/focus"></a></li>
				<li><span style="width: 60px;font-size: 12px;">产品管理</span></li>
			</ul>
		</div>
	</div>
	<br />
	<div style="width: 90%" align="center">
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-${msgType}"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form name="form1" action="" method="post">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
		<tr style="background-image:linear-gradient(to bottom,#fff 0,#fff 100%);" height="35px">
			<th width="25px;" style="vertical-align: middle;"><input id="selectAll" type="checkbox"></th>
			<th class="textCenter" style="vertical-align: middle;" width="200px">图片</th>
			<th class="textCenter" style="vertical-align: middle;">标题</th>
			<th class="textCenter" style="vertical-align: middle;">副标题</th>
			<%	
				if(SessionUtil.checkPurview(session)) {
					%>
					<th class="textCenter" style="vertical-align: middle;">操作</th>
					<%
				}
			%>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${products}" var="product">
			<tr>
				<td style="vertical-align: middle;"><input type="checkbox" name="ids" value="${product.id}" style="margin: 0px;"></td>
				<td class="textCenter"><img src="${ctx}/file/image?fileName=${product.backgroundImageUrl}" width="200px"/></td>
				<td style="vertical-align: middle;" class="textCenter">${product.title}</td>
				<td style="vertical-align: middle;" class="textCenter">${product.secondTitle}</td>
				<%	
					if(SessionUtil.checkPurview(session)) {
						%>
						<td style="vertical-align: middle;" class="textCenter">
							<a href="${ctx}/product/update/${product.id}">编辑</a>
							<a href="${ctx}/product/param/${product.id}">产品参数</a>
						</td>
						<%
					}
				%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 
	<jsp:include page="/page/page.jsp"/>
	 -->
	<%	
		if(SessionUtil.checkPurview(session)) {
			%>
			<div align="center">
				<a href="${ctx}/product/update/0" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;增加</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-danger" onclick="javascript:check('del');"><span class="glyphicon glyphicon-trash"></span>&nbsp;删除</button>
			</div>
			<%
		}
	%>
	
	</form>
	</div>
	</div>
</body>
</html>
