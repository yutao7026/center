<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="${ctx}/static/js/ajaxfileupload.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){
			//$("#errorlist").empty();
			//$.map(errorlist,function(msg){
			//	$("#errorlist").append("<li>" + msg + "</li>")
			//});
		},
		ajaxPrompt : '正在验证，请稍等...'
	});
	
	$("#title").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#secondTitle").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#description").formValidator({onShow:"",onFocus:"长度1-256"}).inputValidator({min:1,max:256,onError:"长度1-256",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#titleEn").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#secondTitleEn").formValidator({onShow:"",onFocus:"长度1-128"}).inputValidator({min:1,max:128,onError:"长度1-128",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#descriptionEn").formValidator({onShow:"",onFocus:"长度1-256"}).inputValidator({min:1,max:256,onError:"长度1-256",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	
	$("#breadcrumb").jBreadCrumb();
});


function add(){
	}
</script> 
</head>

<body>
	<div style="width: 100%;" align="center">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
				<ul>
					<li><a href="${ctx}/focus"></a></li>
					<li><a href="${ctx}/product" style="width: 60px;font-size: 12px;">产品参数</a></li>
					<li><span style="width: 30px;font-size: 12px;">编辑</span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" name="inputForm" action="${ctx}/product/param/update" method="post" class="form-horizontal">
		<c:if test="${not empty message}">
			<div id="message" class="alert alert-${msgType}" style="width: 90%;"><button data-dismiss="alert" class="close">×</button>${message}</div>
			
		</c:if>
		<div id="message" style="width: 90%;display: none;"><a class="close" href="#">×</a><span id="msgText"></span></div>
			<div class="panel panel-default" style="width: 90%;">
				<input type="hidden" id="productId" name="productId" value="${productId}"/>
				
				<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
					<tr>
						<td class="control-label" style="vertical-align: middle;">参数分类</td>
						<td class="control-label" style="vertical-align: middle;">参数名称</td>
						<td class="control-label" style="vertical-align: middle;">参数内容</td>
						<td class="control-label" style="vertical-align: middle;">参数分类英文</td>
						<td class="control-label" style="vertical-align: middle;">参数名称英文</td>
						<td class="control-label" style="vertical-align: middle;">参数内容英文</td>
						<td class="control-label" style="vertical-align: middle;">操作</td>
					</tr>
					<c:forEach items="${params}" var="item">
						<tr>
							<td class="control-label" style="vertical-align: middle;">${item.classify}</td>
							<td class="control-label" style="vertical-align: middle;">${item.name}</td>
							<td class="control-label" style="vertical-align: middle;">${item.content}</td>
							<td class="control-label" style="vertical-align: middle;">${item.classifyEn}</td>
							<td class="control-label" style="vertical-align: middle;">${item.nameEn}</td>
							<td class="control-label" style="vertical-align: middle;">${item.contentEn}</td>
							<td class="control-label" style="vertical-align: middle;"><a href="${ctx}/product/param/edt/${productId}/${item.id}">编辑</a>&nbsp;<a href="${ctx}/product/param/del/${productId}/${item.id}">删除</a></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				<div class="panel panel-default" style="width: 90%;">
				<div class="panel-heading"><strong>产品参数</strong></div>
				<input type="hidden" id="id" name="id" value="${param1.id}">
				<table class="table" id="cTable"> 
					<tr>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数分类:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="classify" name="classify" value="${param1.classify}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数名称:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="name" name="name" value="${param1.name}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数内容:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="content" name="content" value="${param1.content}" style="width: 200px;height: 25px;" class="form-control"/></td>
					</tr>
					<tr>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数分类英文:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="classifyEn" name="classifyEn" value="${param1.classifyEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数名称英文:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="nameEn" name="nameEn" value="${param1.nameEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
						<td class="control-label" width="10%;" style="vertical-align: middle;">参数内容英文:</td>
						<td width="130px" style="padding-right: 0px;" align="left"><input type="text" id="contentEn" name="contentEn" value="${param1.contentEn}" style="width: 200px;height: 25px;" class="form-control"/></td>
					</tr>
				</table>
				
			</div>
			<%	
				if(SessionUtil.checkPurview(session)) {
					%>
					<div class="form-actions">
						<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <a id="cancel_btn" class="btn btn-primary" href="${ctx}/product"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</a>
					</div>
					<%
				}
			%>
			
		</form>
	</div>
</body>
</html>
