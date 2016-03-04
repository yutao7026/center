<%@page import="com.novel.osp.manager.util.IConstants"%>
<%@page import="com.novel.osp.manager.util.SessionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="/WEB-INF/layouts/common.jsp" />
<title>节目管理</title>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formID:"inputForm",theme:"SolidBox",submitOnce:true,
		onError:function(msg,obj,errorlist){},ajaxPrompt : '正在验证，请稍等...', wideWord:false
	});
	$("#name").formValidator({onShow:"",onFocus:"长度1-15"}).inputValidator({min:1,max:15,onError:"长度1-15",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#ep_video").formValidator({onShow:"",onFocus:"长度1-300"}).inputValidator({min:1,max:300,onError:"长度1-300",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#playTime").formValidator({onShow:"",onFocus:"范围10-30000 单位 秒"}).inputValidator({min:10,max:30000,type:"number",onError:"范围10-30000 单位 秒",empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"}});
	$("#breadcrumb").jBreadCrumb();
});
</script> 
</head>

<body> 
	<jsp:include page="/WEB-INF/layouts/header.jsp" />
	<div style="width: 100%;" align="center">
		<div class="breadcrumbholder module" style="width: 90%;">
			<div id="breadcrumb" class="breadcrumb module" style="width: 100%;height: 33px;">
				<ul>
					<li><a href="${ctx}/<%=(String)session.getAttribute(IConstants.HOME)%>"></a></li>
					<li><a href="${ctx}/episode" style="width: 60px;font-size: 12px;">视频管理</a></li>
					<li><span style="width: 30px;font-size: 12px;"><c:if test="${episode.ep_id == null}">增加</c:if><c:if test="${episode.ep_id != null}">编辑</c:if></span></li>
				</ul>
			</div>
		</div>
		<br />
		<form id="inputForm" action="${ctx}/episode/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="ep_id" value="${episode.ep_id}" />
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-danger" style="width: 90%"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<div class="panel panel-default" style="width:90%;">
			  <div class="panel-heading"><strong>视频</strong></div>
			  <table class="table">
			  		<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">节目:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
						<select name="programId" style="width: 340px;height: 26px;padding-top: 0px;" class="form-control">
								<c:forEach items="${programs}" var="item">
									<option value="${item.id}" <c:if test="${episode.programId == item.id}">selected="selected"</c:if>>${item.pg_cname}</option>
								</c:forEach>
							</select>
						</td>
						<td></td>
					</tr>
			  		<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">名称:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="name" name="name" maxlength="15" value="${episode.name}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="nameTip"></span></td>
					</tr>  
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">地址:</td>
						<td style="width: 140px;padding-right: 0px;" align="right">
							<input type="text" id="ep_video" name="ep_video" value="${episode.ep_video}" maxlength="300" style="width: 340px;height: 26px;" class="form-control"/>
							<input type="hidden" id="num" name="num" value="${episode.num}" style="width: 140px;height: 25px;" class="form-control"/>
							<input type="hidden" id="ep_status" name="ep_status" value="${episode.ep_status}" style="width: 140px;height: 25px;" class="form-control"/>
						</td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="ep_videoTip"></span></td>
					</tr> 
					<tr>
						<td class="control-label" width="35%;" style="vertical-align: middle;">时长:</td>
						<td style="width: 140px;padding-right: 0px;" align="right"><input type="text" id="playTime" name="playTime" maxlength="5" value="${episode.playTime}" style="width: 340px;height: 26px;" class="form-control"/></td>
						<td class="control-label" style="text-align: left;vertical-align: middle;padding-left: 0px;" width="*"><font color="red" style="vertical-align: middle;">&nbsp;*</font><span id="playTimeTip"></span></td>
					</tr>  
			  </table>
			  </div>
			  	<%	
					if(SessionUtil.checkPurview(session)) {
						%>
						<div class="form-actions">
							<button id="submit_btn" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-save"></span>&nbsp;保存</button>&nbsp; <button id="cancel_btn" class="btn btn-primary" type="button" onclick="history.back()"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;返回</button>
						</div>
						<%
					}
				%>
		</form>
	</div>
	<jsp:include page="/WEB-INF/layouts/footer.jsp" />
</body>
</html>
